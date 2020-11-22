<?php
/*
+--------------------------------------------------------------------------
|   WeCenter [#RELEASE_VERSION#]
|   ========================================
|   by WeCenter Software
|   © 2011 - 2014 WeCenter. All Rights Reserved
|   http://www.wecenter.com
|   ========================================
|   Support: WeCenter@qq.com
|
+---------------------------------------------------------------------------
*/


if (!defined('IN_ANWSION'))
{
	die;
}

class posts_class extends AWS_MODEL
{
	// 得到最后一次发帖/回复时间
	public function get_last_update_time()
	{
		$result = $this->fetch_row('posts_index', null, 'update_time DESC');
		if (!$result)
		{
			return 0;
		}
		return intval($result['update_time']);
	}

	// set_posts_index 现在仅在发帖/回复时调用
	public function set_posts_index($post_id, $post_type, $post_data = null)
	{
		if ($post_data)
		{
			$result = $post_data;
		}
		else
		{
			switch ($post_type)
			{
				case 'question':
					$result = $this->fetch_row('question', ['id', 'eq', $post_id, 'i']);
					break;

				case 'article':
					$result = $this->fetch_row('article', ['id', 'eq', $post_id, 'i']);
					break;

				case 'video':
					$result = $this->fetch_row('video', ['id', 'eq', $post_id, 'i']);
					break;
                    
                case 'voting':
					$result = $this->fetch_row('voting', ['id', 'eq', $post_id, 'i']);
					break;
			}

			if (!$result)
			{
				return false;
			}
		}

		switch ($post_type)
		{
			// TODO: 统一字段名称
			case 'question':
				$data = array(
					'add_time' => $result['add_time'],
					'update_time' => $result['update_time'],
					'category_id' => $result['category_id'],
					'view_count' => $result['view_count'],
					'uid' => $result['uid'],
					'agree_count' => $result['agree_count'],
					'answer_count' => $result['answer_count'],
					'lock' => $result['lock'],
					'recommend' => $result['recommend'],
				);
				break;

			case 'article':
				$data = array(
					'add_time' => $result['add_time'],
					'update_time' => $result['update_time'],
					'category_id' => $result['category_id'],
					'view_count' => $result['view_count'],
					'uid' => $result['uid'],
					'agree_count' => $result['agree_count'],
					'answer_count' => $result['comments'],
					'lock' => $result['lock'],
					'recommend' => $result['recommend'],
				);
				break;

			case 'video':
				$data = array(
					'add_time' => $result['add_time'],
					'update_time' => $result['update_time'],
					'category_id' => $result['category_id'],
					'view_count' => $result['view_count'],
					'uid' => $result['uid'],
					'agree_count' => $result['agree_count'],
					'answer_count' => $result['comment_count'],
					'lock' => $result['lock'],
					'recommend' => $result['recommend'],
				);
				break;
            case 'voting':
				$data = array(
					'add_time' => $result['add_time'],
					'update_time' => $result['update_time'],
					'category_id' => $result['category_id'],
					'view_count' => $result['view_count'],
					'uid' => $result['uid'],
					'agree_count' => $result['agree_count'],
					'answer_count' => $result['comments'],
					'lock' => $result['lock'],
					'recommend' => $result['recommend'],
				);
				break;

			default:
				return false;
		}

		if (!$post_data AND S::get('time_blurring') != 'N')
		{
			// 用于模糊时间的排序
			$last_update_time = $this->get_last_update_time();
			$update_time = intval($data['update_time']);
			if ($last_update_time >= $update_time AND $last_update_time < $update_time + 36 * 3600) // 如果模糊的 $last_update_time 超出36小时则放弃
			{
				$data['update_time'] = $last_update_time + 1;
			}
		}

		if ($posts_index = $this->fetch_all('posts_index', [['post_id', 'eq', $post_id, 'i'], ['post_type', 'eq', $post_type]]))
		{
			$post_index = end($posts_index);

			$this->update('posts_index', $data, ['id', 'eq', $post_index['id'], 'i']);

			if (sizeof($posts_index) > 1)
			{
				$this->delete('posts_index', [['post_id', 'eq', $post_id, 'i'], ['post_type', 'eq', $post_type], ['id', 'notEq', $post_index['id'], 'i']]);
			}
		}
		else
		{
			$data = array_merge($data, array(
				'post_id' => intval($post_id),
				'post_type' => $post_type
			));

			$this->remove_posts_index($post_id, $post_type);

			$this->insert('posts_index', $data);
		}
	}

	public function remove_posts_index($post_id, $post_type)
	{
		return $this->delete('posts_index', [['post_id', 'eq', $post_id, 'i'], ['post_type', 'eq', $post_type]]);
	}

	// 得到在首页显示的分类
	public function get_default_category_ids()
	{
		static $ids;
		if ($ids)
		{
			return $ids;
		}

		$categories = $this->model('category')->get_category_list();
		foreach ($categories AS $key => $val)
		{
			if (!$val['skip'])
			{
				$ids[] = $val['id'];
			}
		}

		if (!$ids)
		{
			$ids = array(0);
		}
		return $ids;
	}

	public function get_posts_list_total()
	{
		return $this->posts_list_total;
	}

	public function process_explore_list_data($posts_index)
	{
		if (!$posts_index)
		{
			return false;
		}

		foreach ($posts_index as $key => $data)
		{
			switch ($data['post_type'])
			{
				case 'question':
					$question_ids[] = $data['post_id'];
					break;

				case 'article':
					$article_ids[] = $data['post_id'];
					break;

				case 'video':
					$video_ids[] = $data['post_id'];
					break;
                case 'voting':
					$voting_ids[] = $data['post_id'];
					break;

			}

			$data_list_uids[$data['uid']] = $data['uid'];
		}

		if ($question_ids)
		{
			$topic_infos['question'] = $this->model('topic')->get_topics_by_item_ids($question_ids, 'question');

			$question_infos = $this->model('content')->get_posts_by_ids('question', $question_ids);
			foreach ($question_infos as $key => $val)
			{
				$data_list_uids[$val['last_uid']] = $val['last_uid'];
			}
		}

		if ($article_ids)
		{
			$topic_infos['article'] = $this->model('topic')->get_topics_by_item_ids($article_ids, 'article');

			$article_infos = $this->model('content')->get_posts_by_ids('article', $article_ids);
			foreach ($article_infos as $key => $val)
			{
				$data_list_uids[$val['last_uid']] = $val['last_uid'];
			}
		}

		if ($video_ids)
		{
			$topic_infos['video'] = $this->model('topic')->get_topics_by_item_ids($video_ids, 'video');

			$video_infos = $this->model('content')->get_posts_by_ids('video', $video_ids);
			foreach ($video_infos as $key => $val)
			{
				$data_list_uids[$val['last_uid']] = $val['last_uid'];
			}
		}
        
        if ($voting_ids)
		{
			$topic_infos['voting'] = $this->model('topic')->get_topics_by_item_ids($voting_ids, 'voting');

			$voting_infos = $this->model('content')->get_posts_by_ids('voting', $voting_ids);
			foreach ($voting_infos as $key => $val)
			{
				$data_list_uids[$val['last_uid']] = $val['last_uid'];
			}
		}


		$users_info = $this->model('account')->get_user_info_by_uids($data_list_uids);

		$push_reputation = S::get('push_reputation');

		foreach ($posts_index as $key => $data)
		{
			switch ($data['post_type'])
			{
				case 'question':
					$explore_list_data[$key] = $question_infos[$data['post_id']];
					break;

				case 'article':
					$explore_list_data[$key] = $article_infos[$data['post_id']];
					break;

				case 'video':
					$explore_list_data[$key] = $video_infos[$data['post_id']];
					break;
                    
                case 'voting':
					$explore_list_data[$key] = $voting_infos[$data['post_id']];
					break;
			}
			$explore_list_data[$key]['last_user_info'] = $users_info[$explore_list_data[$key]['last_uid']];

			$explore_list_data[$key]['user_info'] = $users_info[$data['uid']];

			$explore_list_data[$key]['post_type'] = $data['post_type'];

			$explore_list_data[$key]['children_reputation'] = $data['reputation'];

			$explore_list_data[$key]['hot'] = intval(is_numeric($push_reputation) AND $explore_list_data[$key]['reputation'] >= $push_reputation);

			if (S::get('category_enable') != 'N')
			{
				$explore_list_data[$key]['category_info'] = $this->model('category')->get_category_info($data['category_id']);
			}

			$explore_list_data[$key]['topics'] = $topic_infos[$data['post_type']][$data['post_id']];
		}

		return $explore_list_data;
	}

	public function get_posts_list($post_type, $page = 1, $per_page = 10, $order_key = null, $category_id = null, $answer_count = null, $recommend = false)
	{
		if (!$order_key)
		{
			$order_key = 'sort DESC, update_time DESC';
		}

		if (isset($answer_count))
		{
			$answer_count = intval($answer_count);

			if ($answer_count == 0)
			{
				$where[] = ['answer_count', 'eq', 0];
			}
			else if ($answer_count > 0)
			{
				$where[] = ['answer_count', 'gte', $answer_count];
			}
		}

		if ($recommend)
		{
			$where[] = ['recommend', 'eq', 1];
		}

		if ($category_id)
		{
			$where[] = ['category_id', 'eq', $category_id, 'i'];
		}
		else
		{
			$where[] = ['category_id', 'in', $this->get_default_category_ids(), 'i'];
		}

		if ($post_type AND $this->model('content')->check_thread_type($post_type))
		{
			$where[] = ['post_type', 'eq', $post_type];
		}

		$posts_index = $this->fetch_page('posts_index', $where, $order_key, $page, $per_page);

		$this->posts_list_total = $this->total_rows();

		return $this->process_explore_list_data($posts_index);
	}

	public function get_hot_posts($post_type, $category_id = 0, $day = 30, $page = 1, $per_page = 10)
	{
		if ($day)
		{
			$add_time = strtotime('-' . $day . ' Day');
			$where[] = ['add_time', 'gt', $add_time, 'i'];
		}

		if ($post_type AND $this->model('content')->check_thread_type($post_type))
		{
			$where[] = ['post_type', 'eq', $post_type];
		}

		if ($category_id)
		{
			$where[] = ['category_id', 'eq', $category_id, 'i'];
		}

		$posts_index = $this->fetch_page('posts_index', $where, 'reputation DESC', $page, $per_page);

		$this->posts_list_total = $this->total_rows();

		return $this->process_explore_list_data($posts_index);
	}

	public function get_posts_list_by_topic_ids($post_type, $topic_ids, $page = 1, $per_page = 10)
	{
		if (!is_array($topic_ids) OR count($topic_ids) < 1)
		{
			return false;
		}

		if (count($topic_ids) > 50)
		{
			$topic_ids = array_slice($topic_ids, 0, 50);
		}

		//array_walk_recursive($topic_ids, 'intval_string');

		$topic_relation_where[] = ['topic_id', 'in', $topic_ids, 'i'];

		if ($post_type AND $this->model('content')->check_thread_type($post_type))
		{
			$topic_relation_where[] = ['type', 'eq', $post_type];
		}

		$topic_relation_query = $this->fetch_page('topic_relation', $topic_relation_where, 'id DESC', $page, $per_page);
		if ($topic_relation_query)
		{
			foreach ($topic_relation_query AS $key => $val)
			{
				$post_ids[$val['type']][$val['item_id']] = $val['item_id'];
			}

			$this->posts_list_total = $this->total_rows();
		}

		if (!$post_ids)
		{
			return false;
		}

		foreach ($post_ids AS $key => $val)
		{
			$where[] = 'or';
			$where[] = [['post_id', 'in', $val, 'i'], ['post_type', 'eq', $key]];
		}

		$result = $this->fetch_all('posts_index', $where, 'update_time DESC', $per_page);

		return $this->process_explore_list_data($result);
	}

	public function get_recommend_posts_by_topic_ids($topic_ids)
	{
		if (!$topic_ids OR !is_array($topic_ids))
		{
			return false;
		}

		$related_topic_ids = array();

		foreach ($topic_ids AS $topic_id)
		{
			$related_topic_ids = array_merge($related_topic_ids, $this->model('topic')->get_related_topic_ids_by_id($topic_id));
		}

		if ($related_topic_ids)
		{
			$recommend_posts = $this->model('posts')->get_posts_list_by_topic_ids(null, $related_topic_ids);
		}

		return $recommend_posts;
	}

	public function bring_to_top($post_id, $post_type)
	{
		$post_id = intval($post_id);

		$where = [['post_id', 'eq', $post_id, 'i'], ['post_type', 'eq', $post_type]];

		$this->update('posts_index', array(
			'update_time' => $this->get_last_update_time() + 1
		), $where);

		return true;
	}

}