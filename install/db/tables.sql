-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
CREATE TABLE IF NOT EXISTS `aws_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  `recommend` tinyint(1) DEFAULT '0',
  `sort` tinyint(2) DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `redirect_id` int(11) DEFAULT '0',
  `title` varchar(240) DEFAULT NULL,
  `message` text,
  `title_fulltext` text,
  `answer_count` int(11) DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `category_id` (`category_id`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `view_count` (`view_count`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`),
  KEY `lock` (`lock`),
  KEY `recommend` (`recommend`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`),
  KEY `answer_count` (`answer_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='问题列表';

--


--
CREATE TABLE IF NOT EXISTS `aws_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答id',
  `question_id` int(11) DEFAULT '0' COMMENT '问题id',
  `message` text COMMENT '回答内容',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `agree_count` int(11) DEFAULT '0' COMMENT '支持人数',
  `reputation` float DEFAULT '0',
  `uid` int(11) DEFAULT '0' COMMENT '回答问题用户ID',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论总数',
  `fold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`),
  KEY `add_time` (`add_time`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='回答';

--


--
CREATE TABLE IF NOT EXISTS `aws_question_discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `add_time` int(11) DEFAULT '0',
  `at_uid` int(11) DEFAULT NULL,
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `fold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  KEY `add_time` (`add_time`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_answer_discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `add_time` int(11) DEFAULT '0',
  `at_uid` int(11) DEFAULT NULL,
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `fold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  KEY `add_time` (`add_time`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  `recommend` tinyint(1) DEFAULT '0',
  `sort` tinyint(2) DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `redirect_id` int(11) DEFAULT '0',
  `title` varchar(240) DEFAULT NULL,
  `message` text,
  `title_fulltext` text,
  `comments` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `category_id` (`category_id`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `view_count` (`view_count`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`),
  KEY `lock` (`lock`),
  KEY `recommend` (`recommend`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_article_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `article_id` int(11) DEFAULT '0',
  `message` text,
  `add_time` int(11) DEFAULT '0',
  `at_uid` int(11) DEFAULT NULL,
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `fold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `article_id` (`article_id`),
  KEY `add_time` (`add_time`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  `recommend` tinyint(1) DEFAULT '0',
  `sort` tinyint(2) DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `redirect_id` int(11) DEFAULT '0',
  `title` varchar(240) DEFAULT NULL,
  `message` text,
  `title_fulltext` text,
  `comment_count` int(11) DEFAULT '0',
  `source_type` varchar(32) DEFAULT NULL,
  `source` text,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `category_id` (`category_id`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `view_count` (`view_count`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`),
  KEY `lock` (`lock`),
  KEY `recommend` (`recommend`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`),
  KEY `comment_count` (`comment_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_video_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `video_id` int(11) DEFAULT '0',
  `message` text,
  `add_time` int(11) DEFAULT '0',
  `at_uid` int(11) DEFAULT NULL,
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `fold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `video_id` (`video_id`),
  KEY `add_time` (`add_time`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--

CREATE TABLE IF NOT EXISTS `aws_voting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `lock` tinyint(1) DEFAULT '0',
  `recommend` tinyint(1) DEFAULT '0',
  `sort` tinyint(2) DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `redirect_id` int(11) DEFAULT '0',
  `title` varchar(240) DEFAULT NULL,
  `message` text,
  `message_count` text,
  `message_vote` text,
  `title_fulltext` text,
  `comments` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `category_id` (`category_id`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `view_count` (`view_count`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`),
  KEY `lock` (`lock`),
  KEY `recommend` (`recommend`),
  KEY `sort` (`sort`),
  FULLTEXT KEY `title_fulltext` (`title_fulltext`),
  KEY `comments` (`comments`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `aws_voting_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `voting_id` int(11) DEFAULT '0',
  `message` text,
  `add_time` int(11) DEFAULT '0',
  `at_uid` int(11) DEFAULT NULL,
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0',
  `fold` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `voting_id` (`voting_id`),
  KEY `add_time` (`add_time`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
CREATE TABLE IF NOT EXISTS `aws_posts_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT '0' ,
  `post_type` varchar(16) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  `view_count` int(11) DEFAULT '0',
  `agree_count` int(11) DEFAULT '0',
  `reputation` float DEFAULT '0' COMMENT '回复所获声望总和',
  `lock` tinyint(1) DEFAULT '0',
  `recommend` tinyint(1) DEFAULT '0',
  `sort` tinyint(2) DEFAULT '0',
  `answer_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `post_type` (`post_type`),
  KEY `uid` (`uid`),
  KEY `category_id` (`category_id`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`),
  KEY `view_count` (`view_count`),
  KEY `agree_count` (`agree_count`),
  KEY `reputation` (`reputation`),
  KEY `lock` (`lock`),
  KEY `recommend` (`recommend`),
  KEY `sort` (`sort`),
  KEY `answer_count` (`answer_count`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(240) DEFAULT NULL,
  `group_id` int(11) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `skip` TINYINT(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `time` (`time`),
  KEY `item_id` (`item_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '专题标题',
  `link` text COMMENT '自定义链接',
  `enabled` tinyint(1) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enabled` (`enabled`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '发送者 ID',
  `dialog_id` int(11) DEFAULT '0' COMMENT '对话id',
  `message` text COMMENT '内容',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `sender_remove` tinyint(1) DEFAULT '0',
  `recipient_remove` tinyint(1) DEFAULT '0',
  `receipt` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `dialog_id` (`dialog_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`),
  KEY `sender_remove` (`sender_remove`),
  KEY `recipient_remove` (`recipient_remove`),
  KEY `sender_receipt` (`receipt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_inbox_dialog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对话ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者UID',
  `sender_unread` int(11) DEFAULT NULL COMMENT '发送者未读',
  `recipient_uid` int(11) DEFAULT NULL COMMENT '接收者UID',
  `recipient_unread` int(11) DEFAULT NULL COMMENT '接收者未读',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT '0' COMMENT '最后更新时间',
  `sender_count` int(11) DEFAULT NULL COMMENT '发送者显示对话条数',
  `recipient_count` int(11) DEFAULT NULL COMMENT '接收者显示对话条数',
  PRIMARY KEY (`id`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `sender_uid` (`sender_uid`),
  KEY `update_time` (`update_time`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_currency_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `action` varchar(64) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `item_type` varchar(32) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `action` (`action`),
  KEY `time` (`time`),
  KEY `currency` (`currency`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(240) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `type_id` int(11) DEFAULT '0',
  `link` varchar(240) DEFAULT NULL COMMENT '链接',
  `icon` varchar(240) DEFAULT NULL COMMENT '图标',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`link`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者ID',
  `recipient_uid` int(11) DEFAULT '0' COMMENT '接收者ID',
  `action` varchar(64) DEFAULT NULL,
  `thread_type` varchar(32) DEFAULT NULL,
  `thread_id` int(11) DEFAULT '0',
  `item_type` varchar(32) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `read_flag` tinyint(1) DEFAULT '0' COMMENT '阅读状态',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `read_flag` (`read_flag`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='系统通知';

--


--
CREATE TABLE IF NOT EXISTS `aws_question_invite` (
  `question_invite_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `question_id` int(11) DEFAULT '0' COMMENT '问题ID',
  `sender_uid` int(11) DEFAULT '0',
  `recipients_uid` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`question_invite_id`),
  KEY `question_id` (`question_id`),
  KEY `sender_uid` (`sender_uid`),
  KEY `recipients_uid` (`recipients_uid`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='邀请问答';

--


--
CREATE TABLE IF NOT EXISTS `aws_post_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` varchar(16) DEFAULT NULL,
  `post_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_type` (`post_type`),
  KEY `post_id` (`post_id`),
  KEY `uid` (`uid`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='主题关注表';

--


--
CREATE TABLE IF NOT EXISTS `aws_related_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT '0' COMMENT '话题 ID',
  `related_id` int(11) DEFAULT '0' COMMENT '相关话题 ID',
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `related_id` (`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_search_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) NOT NULL,
  `data` mediumtext NOT NULL,
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_system_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `varname` varchar(240) NOT NULL COMMENT '字段名',
  `value` text COMMENT '变量值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `varname` (`varname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='系统设置';

--


--
CREATE TABLE IF NOT EXISTS `aws_topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',
  `topic_title` varchar(64) DEFAULT NULL COMMENT '话题标题',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `discuss_count` int(11) DEFAULT '0' COMMENT '讨论计数',
  `topic_description` text COMMENT '话题描述',
  `topic_pic` varchar(240) DEFAULT NULL COMMENT '话题图片',
  `topic_lock` tinyint(2) DEFAULT '0' COMMENT '话题是否锁定 1 锁定 0 未锁定',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注计数',
  `user_related` tinyint(1) DEFAULT '0' COMMENT '是否被用户关联',
  `merged_id` int(11) DEFAULT '0',
  `discuss_count_last_week` int(11) DEFAULT '0',
  `discuss_count_last_month` int(11) DEFAULT '0',
  `discuss_count_update` int(11) DEFAULT '0',
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic_title` (`topic_title`),
  KEY `merged_id` (`merged_id`),
  KEY `discuss_count` (`discuss_count`),
  KEY `add_time` (`add_time`),
  KEY `user_related` (`user_related`),
  KEY `focus_count` (`focus_count`),
  KEY `topic_lock` (`topic_lock`),
  KEY `discuss_count_last_week` (`discuss_count_last_week`),
  KEY `discuss_count_last_month` (`discuss_count_last_month`),
  KEY `discuss_count_update` (`discuss_count_update`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='话题';

--


--
CREATE TABLE IF NOT EXISTS `aws_topic_focus` (
  `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户UID',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`focus_id`),
  KEY `uid` (`uid`),
  KEY `topic_id` (`topic_id`),
  KEY `topic_uid` (`topic_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='话题关注表';

--


--
CREATE TABLE IF NOT EXISTS `aws_topic_merge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) DEFAULT '0',
  `target_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `source_id` (`source_id`),
  KEY `target_id` (`target_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_topic_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增 ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题id',
  `item_id` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `type` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户的 UID',
  `user_name` varchar(240) DEFAULT NULL COMMENT '用户名',
  `password` varchar(60) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(60) DEFAULT NULL COMMENT '用户附加混淆码',
  `password_version` tinyint(1) DEFAULT '0',
  `avatar_file` varchar(128) DEFAULT NULL COMMENT '头像文件',
  `sex` tinyint(1) DEFAULT '0' COMMENT '性别',
  `reg_time` int(11) DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `notification_unread` int(11) DEFAULT '0' COMMENT '未读系统通知',
  `inbox_unread` int(11) DEFAULT '0' COMMENT '未读短信息',
  `inbox_recv` tinyint(1) DEFAULT '0' COMMENT '0-所有人可以发给我,1-我关注的人',
  `fans_count` int(11) DEFAULT '0' COMMENT '粉丝数',
  `friend_count` int(11) DEFAULT '0' COMMENT '观众数',
  `invite_count` int(11) DEFAULT '0' COMMENT '邀请我回答数量',
  `topic_focus_count` int(11) DEFAULT '0' COMMENT '关注话题数量',
  `group_id` int(11) DEFAULT '0' COMMENT '用户组',
  `forbidden` tinyint(1) DEFAULT '0' COMMENT '是否禁止用户',
  `flagged` int(11) DEFAULT '0',
  `agree_count` int(11) DEFAULT '0' COMMENT '赞同数量',
  `reputation` float DEFAULT '0' COMMENT '声望',
  `currency` int(11) DEFAULT '0',
  `user_update_time` int(11) DEFAULT '0',
  `verified` varchar(32) DEFAULT NULL,
  `recent_topics` text,
  `signature` varchar(140) DEFAULT NULL COMMENT '个人签名',
  `settings` text,
  `extra_data` text COMMENT '额外数据',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `user_name` (`user_name`) USING BTREE,
  KEY `reputation` (`reputation`),
  KEY `group_id` (`group_id`),
  KEY `agree_count` (`agree_count`),
  KEY `forbidden` (`forbidden`),
  KEY `flagged` (`flagged`),
  KEY `currency` (`currency`),
  KEY `verified` (`verified`),
  KEY `last_login` (`last_login`),
  KEY `user_update_time` (`user_update_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_users_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) DEFAULT '0' COMMENT '0-系统组 1-声望组 2-特殊组',
  `group_name` text,
  `reputation_lower` int(11) DEFAULT '0',
  `reputation_higer` int(11) DEFAULT '0',
  `reputation_factor` float DEFAULT '0' COMMENT '声望系数',
  `reputation_factor_receive` float NULL DEFAULT NULL COMMENT '接收声望系数 留空则使用普通声望系数',
  `content_reputation_factor` float NULL DEFAULT NULL COMMENT '內容声望系数 留空则使用普通声望系数',
  `permission` text COMMENT '权限设置',
  PRIMARY KEY (`group_id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='用户组';

--


--
CREATE TABLE IF NOT EXISTS `aws_users_notification_setting` (
  `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) DEFAULT '0',
  `data` text COMMENT '设置数据',
  PRIMARY KEY (`notice_setting_id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='通知设定';

--


--
CREATE TABLE IF NOT EXISTS `aws_user_follow` (
  `follow_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `fans_uid` int(11) DEFAULT '0' COMMENT '关注人的UID',
  `friend_uid` int(11) DEFAULT '0' COMMENT '被关注人的uid',
  `add_time` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`follow_id`),
  KEY `fans_uid` (`fans_uid`),
  KEY `friend_uid` (`friend_uid`),
  KEY `user_follow` (`fans_uid`,`friend_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='用户关注表';

--


--
CREATE TABLE IF NOT EXISTS `aws_scheduled_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `uid` int(11) DEFAULT '0',
  `parent_id` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  `data` text,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `parent_id` (`parent_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_content_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `thread_type` varchar(32) DEFAULT NULL,
  `thread_id` int(11) DEFAULT '0',
  `item_type` varchar(32) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `child_type` varchar(32) DEFAULT NULL,
  `child_id` int(11) DEFAULT '0',
  `note` varchar(128) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `thread_type` (`thread_type`),
  KEY `thread_id` (`thread_id`),
  KEY `item_type` (`item_type`),
  KEY `item_id` (`item_id`),
  KEY `child_type` (`child_type`),
  KEY `child_id` (`child_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `recipient_uid` int(11) DEFAULT '0',
  `type` varchar(32) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `value` tinyint(1) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `recipient_uid` (`recipient_uid`),
  KEY `type` (`type`),
  KEY `item_id` (`item_id`),
  KEY `value` (`value`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `item_type` varchar(32) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `thread_type` varchar(32) DEFAULT NULL,
  `thread_id` int(11) DEFAULT '0',
  `category_id` int(11) DEFAULT '0',
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `item_type` (`item_type`),
  KEY `item_id` (`item_id`),
  KEY `thread_type` (`thread_type`),
  KEY `thread_id` (`thread_id`),
  KEY `category_id` (`category_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_failed_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `type` varchar(32) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(240) DEFAULT NULL,
  `message` text,
  `remarks` text,
  `uid` int(11) DEFAULT '0',
  `last_uid` int(11) DEFAULT '0',
  `add_time` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `last_uid` (`last_uid`),
  KEY `add_time` (`add_time`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


--
CREATE TABLE IF NOT EXISTS `aws_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0',
  `admin_uid` int(11) DEFAULT '0',
  `type` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `detail` text,
  `add_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `admin_uid` (`admin_uid`),
  KEY `type` (`type`),
  KEY `status` (`status`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
