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

class H
{
	public static function get_file_ext($file_name, $merge_type = true)
	{
		$file_ext = end(explode('.', $file_name));

		if ($merge_type)
		{
			if ($file_ext == 'jpeg' or $file_ext == 'jpe')
			{
				$file_ext = 'jpg';
			}

			if ($file_ext == 'htm')
			{
				$file_ext = 'html';
			}
		}

		return $file_ext;
	}

	/**
	 * 数组JSON返回
	 *
	 * @param  $array
	 */
	public static function ajax_json_output($array)
	{
		//HTTP::no_cache_header('text/javascript');

		echo str_replace(array("\r", "\n", "\t"), '', json_encode($array));
		exit;
	}

	public static function redirect_msg($message, $url = NULL, $interval = 5)
	{
		TPL::assign('message', $message);
		if ($url)
		{
			TPL::assign('url_bit', HTTP::parse_redirect_url($url));
		}
		TPL::assign('interval', $interval);

		echo TPL::render('global/show_message');
		exit;
	}

	/** 生成 Options **/
	public static function display_options($param, $default = '_DEFAULT_', $default_key = 'key')
	{
		if (is_array($param))
		{
			$keyindex = 0;

			foreach ($param as $key => $value)
			{
				if ($default_key == 'value')
				{
					$output .= '<option value="' . $key . '"' . (($value == $default) ? '  selected' : '') . '>' . $value . '</option>';
				}
				else
				{
					$output .= '<option value="' . $key . '"' . (($key == $default) ? '  selected' : '') . '>' . $value . '</option>';
				}
			}

		}

		return $output;
	}



	public static function content_replace(&$content, &$replacing_list)
	{
		if (!$content OR !$replacing_list)
		{
			return;
		}

		foreach($replacing_list AS $word => $replacement)
		{
			if (!isset($replacement))
			{
				$replacement = '';
			}

			if (substr($word, 0, 1) == '{' AND substr($word, -1, 1) == '}')
			{
				$content = preg_replace(substr($word, 1, -1), $replacement, $content);
			}
			else
			{
				$content = str_ireplace($word, $replacement, $content);
			}
		}
	}



	// 命中返回 true, 未命中返回 false
	public static function content_url_whitelist_check($content_url)
	{
		return S::content_contains('content_url_whitelist', $content_url);
	}

	// 命中返回 true, 未命中返回 false
	public static function hyperlink_blacklist_check($hyperlink)
	{
		return S::content_contains('hyperlink_blacklist', $hyperlink);
	}

	// 命中返回 true, 未命中返回 false
	public static function hyperlink_whitelist_check($hyperlink)
	{
		return S::content_contains('hyperlink_whitelist', $hyperlink);
	}

}
