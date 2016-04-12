-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-10-29 16:56:00
-- 服务器版本： 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `jbglxt`
--

-- --------------------------------------------------------

--
-- 表的结构 `jb_action`
--

CREATE TABLE IF NOT EXISTS `jb_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `jb_action`
--

INSERT INTO `jb_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', 1, 1, 1387181220),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765);

-- --------------------------------------------------------

--
-- 表的结构 `jb_action_log`
--

CREATE TABLE IF NOT EXISTS `jb_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表' AUTO_INCREMENT=133 ;

--
-- 转存表中的数据 `jb_action_log`
--

INSERT INTO `jb_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-19 11:07登录了后台', 1, 1445224079),
(2, 7, 1, 2130706433, 'model', 3, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445233907),
(3, 7, 1, 2130706433, 'model', 3, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445233984),
(4, 7, 1, 2130706433, 'model', 3, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445234045),
(5, 7, 1, 2130706433, 'model', 3, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445234857),
(6, 11, 1, 2130706433, 'category', 39, '操作url：/wwwroot/admin.php?s=/Category/add.html', 1, 1445235043),
(7, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445235141),
(8, 8, 1, 2130706433, 'attribute', 33, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445235188),
(9, 11, 1, 2130706433, 'category', 40, '操作url：/wwwroot/admin.php?s=/Category/add.html', 1, 1445235231),
(10, 11, 1, 2130706433, 'category', 1, '操作url：/wwwroot/admin.php?s=/Category/edit.html', 1, 1445236047),
(11, 11, 1, 2130706433, 'category', 40, '操作url：/wwwroot/admin.php?s=/Category/remove/id/40.html', 1, 1445236048),
(12, 11, 1, 2130706433, 'category', 2, '操作url：/wwwroot/admin.php?s=/Category/edit.html', 1, 1445236089),
(13, 11, 1, 2130706433, 'category', 1, '操作url：/wwwroot/admin.php?s=/Category/edit.html', 1, 1445236196),
(14, 11, 1, 2130706433, 'category', 1, '操作url：/wwwroot/admin.php?s=/Category/edit.html', 1, 1445236205),
(15, 11, 1, 2130706433, 'category', 1, '操作url：/wwwroot/admin.php?s=/Category/edit.html', 1, 1445236222),
(16, 11, 1, 2130706433, 'category', 2, '操作url：/wwwroot/admin.php?s=/Category/edit.html', 1, 1445236239),
(17, 11, 1, 2130706433, 'category', 41, '操作url：/wwwroot/admin.php?s=/Category/add.html', 1, 1445236497),
(18, 7, 1, 2130706433, 'model', 3, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445237520),
(19, 7, 1, 2130706433, 'model', 3, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445237583),
(20, 7, 1, 2130706433, 'model', 3, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445237677),
(21, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445237744),
(22, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445237795),
(23, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445237822),
(24, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445238070),
(25, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445238378),
(26, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445238730),
(27, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445238920),
(28, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445238954),
(29, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445238986),
(30, 7, 1, 2130706433, 'model', 2, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239149),
(31, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239348),
(32, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239396),
(33, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239433),
(34, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239498),
(35, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239518),
(36, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239536),
(37, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239614),
(38, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239632),
(39, 8, 1, 2130706433, 'attribute', 34, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445239773),
(40, 7, 1, 2130706433, 'model', 5, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445239811),
(41, 11, 1, 2130706433, 'category', 2, '操作url：/wwwroot/admin.php?s=/Category/edit.html', 1, 1445239850),
(42, 8, 1, 2130706433, 'attribute', 35, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445240088),
(43, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240127),
(44, 8, 1, 2130706433, 'attribute', 36, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445240238),
(45, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240281),
(46, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240302),
(47, 8, 1, 2130706433, 'attribute', 37, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445240396),
(48, 8, 1, 2130706433, 'attribute', 38, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445240425),
(49, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240468),
(50, 8, 1, 2130706433, 'attribute', 38, '操作url：/wwwroot/admin.php?s=/Attribute/remove/id/38.html', 1, 1445240497),
(51, 8, 1, 2130706433, 'attribute', 39, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445240523),
(52, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240560),
(53, 8, 1, 2130706433, 'attribute', 36, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445240645),
(54, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240670),
(55, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240688),
(56, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240886),
(57, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445240898),
(58, 1, 1, 2130706433, 'member', 1, 'admin在2015-10-20 09:05登录了后台', 1, 1445303130),
(59, 8, 1, 2130706433, 'attribute', 37, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445304054),
(60, 8, 1, 2130706433, 'attribute', 40, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445306640),
(61, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445306656),
(62, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445306681),
(63, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445306739),
(64, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445306763),
(65, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445307063),
(66, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445307073),
(67, 7, 1, 2130706433, 'model', 6, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445308224),
(68, 8, 1, 2130706433, 'attribute', 41, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445308470),
(69, 8, 1, 2130706433, 'attribute', 42, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445308535),
(70, 7, 1, 2130706433, 'model', 6, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445308604),
(71, 7, 1, 2130706433, 'model', 6, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445308634),
(72, 8, 1, 2130706433, 'attribute', 43, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445309058),
(73, 7, 1, 2130706433, 'model', 6, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445309106),
(74, 7, 1, 2130706433, 'model', 6, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445309115),
(75, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445309230),
(76, 7, 1, 2130706433, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445309240),
(77, 8, 1, 2130706433, 'attribute', 44, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1445310057),
(78, 7, 1, 2130706433, 'model', 6, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445310066),
(79, 7, 1, 2130706433, 'model', 6, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1445310085),
(80, 1, 2, 0, 'member', 2, 'chen在2015-10-27 11:04登录了后台', 1, 1445915085),
(81, 1, 5, 0, 'member', 5, '约约约在2015-10-28 12:42登录了后台', 1, 1446007349),
(82, 1, 5, 0, 'member', 5, '约约约在2015-10-28 12:42登录了后台', 1, 1446007356),
(83, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:07登录了后台', 1, 1446008863),
(84, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:08登录了后台', 1, 1446008887),
(85, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:08登录了后台', 1, 1446008904),
(86, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:08登录了后台', 1, 1446008924),
(87, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:08登录了后台', 1, 1446008928),
(88, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:08登录了后台', 1, 1446008932),
(89, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:08登录了后台', 1, 1446008936),
(90, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:09登录了后台', 1, 1446008941),
(91, 1, 5, 0, 'member', 5, '约约约在2015-10-28 13:19登录了后台', 1, 1446009572),
(92, 1, 7, 0, 'member', 7, '灌灌灌灌灌在2015-10-28 13:26登录了后台', 1, 1446010018),
(93, 1, 1, 0, 'member', 1, 'admin在2015-10-28 13:37登录了后台', 1, 1446010636),
(94, 8, 1, 0, 'attribute', 44, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446010657),
(95, 8, 1, 0, 'attribute', 42, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446010669),
(96, 8, 1, 0, 'attribute', 45, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446010704),
(97, 8, 1, 0, 'attribute', 46, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446019915),
(98, 8, 1, 0, 'attribute', 35, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446021996),
(99, 8, 1, 0, 'attribute', 42, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446023360),
(100, 11, 1, 0, 'category', 41, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html', 1, 1446023543),
(101, 11, 1, 0, 'category', 39, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/remove/id/39.html', 1, 1446023554),
(102, 11, 1, 0, 'category', 41, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html', 1, 1446023624),
(103, 11, 1, 0, 'category', 42, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/add.html', 1, 1446023639),
(104, 11, 1, 0, 'category', 43, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/add.html', 1, 1446023666),
(105, 11, 1, 0, 'category', 41, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html', 1, 1446023680),
(106, 11, 1, 0, 'category', 42, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html', 1, 1446023703),
(107, 11, 1, 0, 'category', 43, '操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html', 1, 1446023713),
(108, 7, 1, 0, 'model', 6, '操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html', 1, 1446025160),
(109, 7, 1, 0, 'model', 6, '操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html', 1, 1446025196),
(110, 7, 1, 0, 'model', 6, '操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html', 1, 1446025342),
(111, 7, 1, 0, 'model', 6, '操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html', 1, 1446025373),
(112, 8, 1, 0, 'attribute', 45, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446025404),
(113, 8, 1, 0, 'attribute', 45, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446025456),
(114, 8, 1, 0, 'attribute', 45, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446025480),
(115, 8, 1, 0, 'attribute', 43, '操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/remove/id/43.html', 1, 1446025516),
(116, 1, 5, 0, 'member', 5, '约约约在2015-10-28 18:11登录了后台', 1, 1446027076),
(117, 1, 5, 0, 'member', 5, '约约约在2015-10-28 18:11登录了后台', 1, 1446027095),
(118, 1, 5, 0, 'member', 5, '约约约在2015-10-28 18:14登录了后台', 1, 1446027295),
(119, 1, 3, 0, 'member', 3, 'asd在2015-10-29 09:56登录了后台', 1, 1446083764),
(120, 7, 1, 0, 'model', 4, '操作url：/wwwroot/admin.php?s=/Model/update.html', 1, 1446084830),
(121, 1, 8, 0, 'member', 8, '刘奇在2015-10-29 10:33登录了后台', 1, 1446086001),
(122, 1, 8, 0, 'member', 8, '刘奇在2015-10-29 10:36登录了后台', 1, 1446086174),
(123, 1, 8, 0, 'member', 8, '刘奇在2015-10-29 11:10登录了后台', 1, 1446088256),
(124, 8, 1, 0, 'attribute', 37, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446091194),
(125, 8, 1, 0, 'attribute', 35, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446091216),
(126, 8, 1, 0, 'attribute', 36, '操作url：/wwwroot/admin.php?s=/Attribute/update.html', 1, 1446091239),
(127, 8, 1, 0, 'attribute', 40, '操作url：/wwwroot/admin.php?s=/Attribute/remove/id/40.html', 1, 1446091246),
(128, 1, 9, 0, 'member', 9, '丹揍揍在2015-10-29 14:43登录了后台', 1, 1446101038),
(129, 1, 9, 0, 'member', 9, '丹揍揍在2015-10-29 14:48登录了后台', 1, 1446101286),
(130, 11, 1, 0, 'category', 44, '操作url：/wwwroot/admin.php?s=/Category/add.html', 1, 1446108522),
(131, 11, 1, 0, 'category', 45, '操作url：/wwwroot/admin.php?s=/Category/add.html', 1, 1446108594),
(132, 1, 10, 0, 'member', 10, '朱针对在2015-10-29 16:54登录了后台', 1, 1446108884);

-- --------------------------------------------------------

--
-- 表的结构 `jb_addons`
--

CREATE TABLE IF NOT EXISTS `jb_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `jb_addons`
--

INSERT INTO `jb_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"1","display":"1","status":"0"}', 'thinkphp', '0.1', 1379512015, 0),
(3, 'DevTeam', '开发团队信息', '开发团队成员信息', 1, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512022, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"","comment_short_name_duoshuo":"","comment_data_list_duoshuo":""}', 'thinkphp', '0.1', 1380273962, 0);

-- --------------------------------------------------------

--
-- 表的结构 `jb_attachment`
--

CREATE TABLE IF NOT EXISTS `jb_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jb_attribute`
--

CREATE TABLE IF NOT EXISTS `jb_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=47 ;

--
-- 转存表中的数据 `jb_attribute`
--

INSERT INTO `jb_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '[DOCUMENT_POSITION]', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(33, 'open_time', '开始时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 4, 1, 1, 1445235188, 1445235188, '', 3, '', 'regex', '', 3, 'function'),
(35, 'address', '地点', 'varchar(120) NOT NULL', 'string', '', '', 1, '', 4, 0, 1, 1446091216, 1445240088, '', 3, '', 'regex', '', 3, 'function'),
(36, 'lianxifangshi', '联系方式', 'varchar(30) NOT NULL', 'string', '', '', 1, '', 4, 1, 1, 1446091239, 1445240238, '', 3, '', 'regex', '', 3, 'function'),
(37, 'xingming', '姓名', 'varchar(30) NOT NULL', 'string', '', '', 1, '', 4, 1, 1, 1446091194, 1445240396, '', 3, '', 'regex', '', 3, 'function'),
(39, 'jianjie', '简介', 'text NOT NULL', 'editor', '', '', 1, '', 4, 1, 1, 1445240523, 1445240523, '', 3, '', 'regex', '', 3, 'function'),
(41, 'name', '姓名', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 6, 1, 1, 1445308470, 1445308470, '', 3, '', 'regex', '', 3, 'function'),
(42, 'mobile', '联系方式', 'varchar(12)', 'string', '', '', 1, '', 6, 1, 1, 1446023360, 1445308535, '', 3, '', 'regex', '', 3, 'function'),
(44, 'create_time', '报名时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 6, 0, 1, 1446010657, 1445310057, '', 3, '', 'regex', '', 3, 'function'),
(45, 'huiyi_id', '报名会议id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 6, 0, 1, 1446025480, 1446010704, '', 3, '', 'regex', '', 3, 'function'),
(46, 'uid', '用户id', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 6, 0, 1, 1446019915, 1446019915, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `jb_auth_extend`
--

CREATE TABLE IF NOT EXISTS `jb_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `jb_auth_extend`
--

INSERT INTO `jb_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jb_auth_group`
--

CREATE TABLE IF NOT EXISTS `jb_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `jb_auth_group`
--

INSERT INTO `jb_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `jb_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `jb_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `jb_auth_rule`
--

CREATE TABLE IF NOT EXISTS `jb_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=217 ;

--
-- 转存表中的数据 `jb_auth_rule`
--

INSERT INTO `jb_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/index', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', 1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/examine', '审核列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `jb_category`
--

CREATE TABLE IF NOT EXISTS `jb_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=46 ;

--
-- 转存表中的数据 `jb_category`
--

INSERT INTO `jb_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `model_sub`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`, `groups`) VALUES
(1, 'blog', '博客', 0, 0, 10, '', '', '', '', '', '', '', '2,3', '2', '2,1', 0, 0, 1, 0, 0, '1', '', 1379474947, 1445236222, 1, 0, ''),
(2, 'default_blog', '默认分类', 1, 1, 10, '', '', '', '', '', '', '', '2,3,4,5', '2,3,4,5', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1445239850, 1, 0, ''),
(42, 'huiyi', '会议', 41, 0, 10, '', '', '', '', '', '', '', '2,3,4', '2,3,4', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1446023639, 1446023703, 1, 0, ''),
(41, 'all_huiyi', '所有会议', 0, 0, 10, '', '', '', '', '', '', '', '2,3,4', '2,3,4', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1445236497, 1446023680, 1, 0, ''),
(43, 'match', '比赛', 41, 0, 10, '', '', '', '', '', '', '', '2,3,4', '2,3,4', '2,1,3', 0, 1, 1, 0, 0, '', NULL, 1446023666, 1446023713, 1, 0, ''),
(44, 'get', 'g', 1, 0, 10, '', '', '', '', '', '', '', '4', '4', '2', 0, 1, 1, 0, 0, '', NULL, 1446108522, 1446108522, 1, 0, ''),
(45, 'h', 'h', 2, 0, 10, '', '', '', '', '', '', '', '4', '4', '2', 0, 1, 1, 0, 0, '', NULL, 1446108594, 1446108594, 1, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `jb_channel`
--

CREATE TABLE IF NOT EXISTS `jb_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `jb_channel`
--

INSERT INTO `jb_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(1, 0, '首页', 'Index/index', 1, 1379475111, 1379923177, 1, 0),
(2, 0, '博客', 'Article/index?category=blog', 2, 1379475131, 1379483713, 1, 0),
(3, 0, '官网', 'http://www.onethink.cn', 3, 1379475154, 1387163458, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `jb_config`
--

CREATE TABLE IF NOT EXISTS `jb_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `jb_config`
--

INSERT INTO `jb_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '智博会嘉宾网上报名系统', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '宁波市智慧城市博览会是我国最早面向智慧城市领域的博览会，该博览会的组成采用的是1+N的形式，即一个高峰论坛和若干个行业论坛，如教育论坛、工业论坛、互联网论坛、医疗论坛等等', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1379235859, 1, '', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', 1379122533, 1379235904, 1, 'default_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 2, '', '后台数据每页显示记录数', 1379503896, 1380427745, 1, '10', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '1', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '1', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '10', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jb_document`
--

CREATE TABLE IF NOT EXISTS `jb_document` (
  `id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

--
-- 转存表中的数据 `jb_document`
--

INSERT INTO `jb_document` (`id`, `uid`, `name`, `title`, `category_id`, `group_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(1, 1, '', '宁波工程学院高端会议', 42, 0, '期待已久的OneThink最新版发布', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 13, 0, 0, 0, 1446108828, 1446108828, 1),
(2, 1, '', '学术会议', 2, 0, '晓之队', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1445224080, 1445236357, -1),
(5, 1, '', '我是会议', 2, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445236140, 1445236140, -1),
(6, 1, '', '智慧城市发展高峰论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 5, 1, 0, 0, 32, 0, 0, 0, 1446085766, 1446085766, 1),
(7, 1, '', '智慧健康高层论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 7, 1, 0, 0, 5, 0, 0, 0, 1446085926, 1446085926, 1),
(8, 1, '', '全国智慧教育高层论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 6, 1, 0, 0, 2, 0, 0, 0, 1446085868, 1446085868, 1),
(9, 1, '', '第三届智慧城市建设创新交流大会', 42, 0, '', 0, 0, 4, 2, 0, 0, 4, 1, 0, 0, 3, 0, 0, 0, 1446085623, 1446085623, 1),
(10, 1, '', '中国（宁波）创客创业大赛决赛', 43, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 1445305980, 1445305980, 1),
(11, 1, '', '健康类智能可穿戴设备国际论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1445305846, 1445305846, 1),
(12, 1, '', '物联网智能化应用与服务高层论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 2, 0, 0, 0, 1445305681, 1445305681, 1),
(13, 1, '', '数字文化产业发展高层论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445305607, 1445305607, 1),
(14, 1, '', '甬港澳台青年华商创业创新合作论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445305445, 1445305445, 1),
(15, 1, '', '智能制造2025高层论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445927721, 1445927721, 1),
(16, 1, 'ss', '两岸物联网与智慧服务产业发展论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445927416, 1445927416, 1),
(17, 1, 'zhyqfzlt', '智慧园区发展论坛', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445926284, 1445926284, 1),
(22, 1, '', '孤鸿寡鹄', 41, 0, '', 0, 0, 4, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445238302, 1445238302, -1),
(23, 1, '', '不搞虚的', 2, 0, '哼哼哈嘿', 0, 0, 5, 2, 0, 0, 0, 1, 0, 0, 4, 0, 0, 0, 1445239907, 1445239907, -1),
(24, 1, '', '智慧园区发展论坛', 2, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1445240987, 1445240987, -1),
(0, 1, '', 'huiyi', 42, 0, '', 0, 0, 4, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1446108799, 1446108799, 3);

-- --------------------------------------------------------

--
-- 表的结构 `jb_document_article`
--

CREATE TABLE IF NOT EXISTS `jb_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `jb_document_article`
--

INSERT INTO `jb_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(1, 0, '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href="http://www.onethink.cn/download.html" target="_blank">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href="http://document.onethink.cn/" target="_blank">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', 0),
(2, 0, '并没有哟', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `jb_document_download`
--

CREATE TABLE IF NOT EXISTS `jb_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `jb_document_huiyi`
--

CREATE TABLE IF NOT EXISTS `jb_document_huiyi` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `open_time` int(10) NOT NULL COMMENT '开始时间',
  `address` varchar(120) NOT NULL COMMENT '地点',
  `lianxifangshi` varchar(30) NOT NULL COMMENT '联系方式',
  `xingming` varchar(30) NOT NULL COMMENT '姓名',
  `jianjie` text NOT NULL COMMENT '简介'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `jb_document_huiyi`
--

INSERT INTO `jb_document_huiyi` (`id`, `open_time`, `address`, `lianxifangshi`, `xingming`, `jianjie`) VALUES
(5, 1444890480, '', '', '', ''),
(6, 1443681300, '宇宙中心枫桥镇', '667622', '朱不眠', '<h2>\r\n	<strong><span style="font-family:''Microsoft YaHei'';font-size:18px;">专题摘要</span></strong><span style="font-family:''Microsoft YaHei'';font-size:18px;">&nbsp;</span> \r\n</h2>\r\n<p>\r\n	<span style="font-family:''Microsoft YaHei'';font-size:14px;"><span style="font-family:''Microsoft YaHei'';font-size:14px;line-height:21px;">　　</span>为推动中国智慧城市有序建设及健康发展，由商务部、国家发改委、工信部、科学技术部等十大部委以及深圳市政府主办、由国家信息中心和IDG国际数据集团联合承办的“高交会2014中国智慧城市专馆”将于11月在深圳会展中心隆重举行。</span> \r\n</p>\r\n<p style="text-align:center;">\r\n	<span style="font-family:''Microsoft YaHei'';font-size:14px;"><img src="/wwwroot/Uploads/Editor/2015-10-29/563184811e542.jpg" alt="" /><br />\r\n</span>\r\n</p>\r\n<h2>\r\n	<strong><span style="font-family:''Microsoft YaHei'';font-size:18px;">往届回顾</span></strong> \r\n</h2>\r\n<p>\r\n	<span style="font-family:''Microsoft YaHei'';font-size:14px;"><span style="font-family:''Microsoft YaHei'';font-size:14px;line-height:21px;">　　</span>2014年11月17日，一年一度的高交会“2014中国智慧城市发展高峰论坛” 在深圳会展中心如期拉开帷幕。此次大会由国家信息中心和IDG国际数据集团主办，公安部第一研究所、民政部国家减灾中心、北京大学数字中国研究院、北京航空航天大学及国际数据公司(IDC)联合协办，IDG承办。会议围绕“智慧发展，智能未来”主题，通过主题演讲、平行论坛、高峰对话、专题报告等多种形式，针对中国智慧城市的现状及趋势、智慧城市试点进展、创新应用、城市运营和管理的智慧化、第三平台与智慧城市发展等话题进行深度交流与研讨。今年参会的中外演讲嘉宾及各领域技术专家达到600多位，创历史新高，他们共同分享了智慧城市领域的重大机遇和变革。深圳市政府、国家信息中心、工信部、住房和城乡建设部、公安部等重要领导莅临论坛开幕式并致辞。</span><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　</span><strong><span style="font-family:''Microsoft YaHei'';font-size:14px;">业界领袖脑力激荡 共图智慧城市发展大业</span></strong><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　上午的主会场精彩纷呈，演讲各方观点表述清楚、解析权威，其中智慧城市发展趋势与发展政策、评价指标、中国特色、海外经验以及城市安全等关键词引人瞩目。演讲嘉宾涵盖政府、行业企业、咨询机构、院校等智慧城市产业链各环节的领袖级人物，包括深圳市人民政府副市长唐杰、工信部软件服务业司李颖司长、国家信息中心常务副主任杜平、IDG全球常务副总裁兼大中华区董事长熊晓鸽、国家信息中心信息化研究部副主任单志广、住建部中国城市科学研究会数字城市工程研究中心主任丁有良 、工信部电子工业标准化研究院副院长高林、中兴副总裁徐明、中国安防高级副总裁曹国辉、公安部第一研究所研究员余兵、巴塞罗那市政府Xavier Mayo以及微软、IBM等企业高管。</span> \r\n</p>\r\n<div style="text-align:center;">\r\n	<img src="/wwwroot/Uploads/Editor/2015-10-20/56259f9af2335.jpg" alt="" /><span style="line-height:1.5;"></span> \r\n</div>\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　主题演讲结束后的高峰对话环节，在IDC 副总裁武连峰主持下，国家信息中心电子政务中心副主任徐枫、中兴智慧城市解决方案总经理刘丰、长城计算机总裁周庚申和中国安防曹国辉，就“如何助力城市运营和管理的智慧化”这一议题展开了热烈讨论，他们结合实践经验，充分阐述各自的观点，互动交流，点评妙语连珠，会场气氛十分活跃。</span><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　下午进行的两场平等论坛也颇具看点。来自国家信息中心软件评测中心、辽源市智慧城市办公室、智慧城市系统服务公司、软通动力、北京启创卓越、新加坡咨询通信发展管理局、方正国际软件、亚洲数据中心联盟、微软、北京司法鉴定业协会、长城计算机、富士康宇宙、赞云软件、七牛等知名企业和政府机构代表，围绕“智慧城市创新应用平台”和“第三平台与智慧城市发展”话题同台论道，他们提问题、出方案，享经验、谈应用，谋求城市发展动力，给现场观众带来了一场智慧新思潮的饕餮盛宴。</span><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　</span><strong><span style="font-family:''Microsoft YaHei'';font-size:14px;">同期活动为论坛倍增价值</span></strong><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　论坛举办同期特别开设了近万平方米的展览专区——“高交会智慧城市专馆”(6号馆)，这是在高交会历史上，首次以一个主题专馆的形式突出展示智慧城市的优秀成果、创新技术和智能解决方案，九个各具特色的主题专区汇集了城市规划设计、信息网络、智慧能源、智慧交通、智慧通信、绿色建筑、智慧医疗、智慧广场、城市应急、地理信息和智能家居等领域的众多国内外企业和机构，他们将以不同的形式参与到展览、智慧城市和方案的评选活动中。专馆预计接待超过20万名来自世界各地的相关政商代表和专业观众。充分调动了观众和展商互相交流的积极性和能动性，不仅能通过论坛让大家对智慧城市建设有一个更全面、更深刻的认识，而且让所有参会人员在展会现场感受到信息技术带来的巨大的变革。</span><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　为了表彰诸多在智慧城市发展中做出创新贡献的城市和企业，还在会议现场揭晓了由IDC承办的“中国智慧城市标杆企业”、“中国领军智慧城市TOP 100”以及“智慧城市创新方案”的评选结果，并举行盛大的颁奖活动。杭州、成都、武汉、南京、济南、沈阳、苏州、青岛、合肥、福州、上海、郑州、石家庄、西安、深圳、昆明、无锡、南昌、银川和长沙这20个城市获得“2014 中国领军智慧城市TOP 20”称号；银川、辽源、兰州三个百强智慧城市还分别获得了商业模式创新奖、市民卡工程示范奖及优秀解决方案推进奖，成为颁奖盛典上耀眼的明星。IBM、安防投资、东软集团、万达信息、中国电子信息产业集团以及微软成功入选“2014年度中国智慧城市标杆企业”，“2014年度中国智慧城市创新方案”奖则花落中兴通讯、安防投资、北京启创卓越、软通动力和公安部第一研究所。</span><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　在IDC智慧城市白皮书中，领军智慧城市百强的评选总结了100 个城市的经济与人口基础、城市建设进程、发展特点、未来投入、产业格局等因素后，根据城市信息化成熟度、区域特性，创建了中国智慧城市评价指标体系。评选指标主要从经济和人口基数(GDP总量、社会消费品零售总额、总人口数)、建设预算(IT机会总额、智慧城市专项占比、IT机会增长率)、国家试点(国家专项试点、国家统筹试点)、产业发展格局(市场竞争激烈程度、政策开放程度)四个维度展开，入选城市成功的要素还包括智慧城市的建设水平和后续发展机会。此次获奖城市从数量、质量上均创历史新高，向世界充分展示了中国智慧城市的风采，他们的城市发展经验和前沿思想，将会帮助城市管理者更好地探索智慧城市建设路径，并为相关行业厂商直面用户需求、调整自身定位与发展策略提供有益参考。</span><br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"></span><br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　智慧城市项目对接环节为政府和企业提供一个项目落地的平台， “中国领军智慧城市TOP 20”的政府代表会莅临现场，与企业代表共同讨论，积极促进政府对智慧城市规划的落实和企业解决方案的实现。</span><br />\r\n<br />\r\n<span style="font-family:''Microsoft YaHei'';font-size:14px;"> 　　国家对智慧城市规划政策陆续出台，各地政府纷纷启动智慧城市试点活动，智慧城市建设投资日益高涨，创新应用和技术更是层出不穷。此次“中国智慧城市发展高峰论坛”的举办，很好地促进了政府、企业、科研以及金融界之间的对接，分享到国内外智慧城市实施过程中所取得的丰富和宝贵经验，推动新技术方案在城市建设中的快速广泛应用，为全国城市的可持续发展带来更多的启迪和收获。</span> \r\n<p>\r\n	<br />\r\n</p>\r\n<p style="text-align:center;">\r\n	<iframe src="/wwwroot/Public/static/kindeditor/plugins/baidumap/index.html?center=121.601192%2C29.875618&zoom=14&width=558&height=360&markers=121.601192%2C29.875618&markerStyles=l%2CA" frameborder="0" style="width:560px;height:362px;">\r\n	</iframe>\r\n</p>'),
(7, 1443767880, '人马座驻宁工院7号楼2楼231室大使馆', '88744', '朱炒肝', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能左拥右抱</span> \r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259f69ea6f9.jpg" alt="" /><br />\r\n</span> \r\n</p>'),
(8, 1443854280, '人马座驻宁工院7号楼2楼大使馆', '665565', '朱屁股', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能笑傲八方</span> \r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259f29e17c2.jpg" alt="" /><br />\r\n</span> \r\n</p>'),
(9, 1443940740, '人马座驻宁工院7号楼大使馆', '8864646', '朱艾斯', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能驰骋疆场</span> \r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259efc727fa.jpg" alt="" /><br />\r\n</span> \r\n</p>'),
(10, 1444027200, '人马座驻宁工院理学院信科专业大使馆', '898989', '朱大头', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能冲锋陷阵</span>\r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259e7239e18.jpg" alt="" /><br />\r\n</span>\r\n</p>'),
(11, 1444113660, '人马座驻宁工理学院大使馆', '363636', '朱鼻子', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能神清气爽</span>\r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259df03ea85.jpg" alt="" /><br />\r\n</span>\r\n</p>'),
(12, 1444200060, '人马座驻宁工院大使馆', '8989898', '朱耳朵', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能光彩照人</span>\r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259d4e59b1a.jpg" alt="" /><br />\r\n</span>\r\n</p>'),
(13, 1444286520, '人马座驻江北区大使馆', '55656', '朱血', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能停不下来</span>\r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259d0459261.jpg" alt="" /><br />\r\n</span>\r\n</p>'),
(14, 1444372980, '人马座驻宁波大使馆', '+565656', '朱小肚', '<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能脉动回来</span>\r\n</p>\r\n<p>\r\n	<span style="color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;"><img src="/wwwroot/Uploads/Editor/2015-10-20/56259c63b2f25.jpg" alt="" /><br />\r\n</span>\r\n</p>'),
(15, 1444459440, '人马座驻浙江大使馆', '2333', '朱以巴', '<p>\r\n	<span style="color:#000000;font-family:SimSun;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能容光焕发</span><span style="color:#000000;"></span> \r\n</p>\r\n<p>\r\n	<img src="/wwwroot/Uploads/Editor/2015-10-20/56259c0c37690.jpg" alt="" /><span style="background-color:#000000;"></span> \r\n</p>\r\n<p>\r\n	<span style="background-color:#000000;">\r\n	<p style="font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:2em;">\r\n		本报讯（记者黄程杭州湾新区报道组卓松磊）作为第五届中国智慧城市技术与应用产品博览会的重要组成部分，昨天，“智能制造２０２５”发展高层论坛在杭州湾新区举行，来自中国科学院、北京航空航天大学机器人研究院等科研院所的多名专家学者与全国百余家企业代表分享业界前沿知识和学术动态。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:2em;">\r\n		此次论坛以“互联网＋智能制造，打造工业转型升级新动力”为主题，致力于深化项目对接与产业合作，构建智慧城市建设、信息经济发展、“两化”深度融合交流与合作的大平台。\r\n	</p>\r\n	<p style="font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:2em;">\r\n		论坛上，中国科学院院士姚建铨作了“从工业互联网到智慧工厂”专题演讲，ｐｌｃｏｐｅｎ中国区主席严义、航天二院信息化副总师柴旭东等与会专家学者和企业精英代表分别围绕“ｐｌｃｏｐｅｎ规范与技术”“工业４．０时代的工业软件”“服务机器人发展机遇”等主题进行演讲。\r\n	</p>\r\n<img src="/wwwroot/Uploads/Editor/2015-10-27/562f1ab90d847.jpg" alt="" /><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style="background-color:#000000;">\r\n	<p style="font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;">\r\n		中国证券网讯 由中国工程院、工业和信息化部、中国科学院主办的中国工程科技论坛“2015智能制造国际会议”将于13日举行。据主办方介绍，本次会议的主题是当下最热门的“工业4.0与中国制造2025”。\r\n	</p>\r\n	<p style="font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;">\r\n		　　据京华时报5月12日消息，主办方透露，届时，中德两国政府高官、技术专家及企业家将围绕主题作报告交流并展开深入研讨。其中，工业和信息化部部长苗圩将就合作共创中德制造业做主旨报告。\r\n	</p>\r\n	<p style="font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;">\r\n		　　德国联邦经济与能源事务部(BMWi)工业政策司司长WolfgangScheremet博士将分享“工业4.0——德国制造经济的数字化”主题报告。此外，中国工程院院长、中国机械工程学会理事长周济院士将就“智能制造——中国制造2025的主攻方向”做主旨报告。\r\n	</p>\r\n	<p style="font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;">\r\n		　　分析人士指出，智能制造是“中国制造2025”的重要抓手，智能制造或者工业4.0，是实现互联网和传统工业行业融合的制高点。“中国制造2025”大幕即将开启，以智能制造为代表的工业4.0概念料将重回资金风口。\r\n	</p>\r\n	<p style="font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;">\r\n		<img src="/wwwroot/Uploads/Editor/2015-10-27/562f1aed54126.jpg" alt="" />\r\n	</p>\r\n	<p style="font-size:14px;font-family:宋体;background-color:#FFFFFF;">\r\n		<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n			《关于开展2015年智能制造试点示范专项行动的通知》明确了以智能工厂为代表的流程制造试点，以数字化车间为代表的离散制造试点，以信息技术深度嵌入为代表的智能装备和产品试点，以个性化定制、网络协同开发、电子商务委代表的智能制造新业态试点，以物流信息化、能源管理智慧化为代表的智能化管理试点，以在线检测，远程诊断和云服务为代表的智能服务试点等6大试点推进专项行动，基本涵盖我国工业制造各大传统和优势行业，拉开了中国制造2025工业强国新篇章的大幕。此外。通知提出重点任务组织召开2015年世界机器人大会，风口上的机器人行业逻辑持续强化。\r\n		</p>\r\n		<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n			　　在“中国制造2025”的浪潮下，智能制造的巨大风口将带来巨大的投资机会，产业链包含高端数控机床，工业机器人，传感物联，自动化（数字化）工厂，个性化制造新业态等，其中智能化机器人、自动化装备方向值得投资者重点关注。\r\n		</p>\r\n		<p style="font-family:宋体;font-size:14px;">\r\n			<span style="color:#333333;">　　东吴证券指出，从核心零部件国产化看，控制器、伺服电机和减速器是机器人的三大核心零部件。过去核心零部件过度依赖进口，严重制约着行业发展。目前国内大部分本体制造企业</span><span>，均实现控制器自主生产，在核心零部件上取得了突破。只要实现关键零部件产品的升级跨越，就可以支撑机器人整机发展，未来替代进口的效应也会逐步释放。从政策落实看，在十二五规划中，国家已经把工业机器人作为智能制造装备的重要部分。机器人产业的发展与国家从“制造业大国”向“制造业强国”的转型相契合。</span>\r\n		</p>\r\n<span></span>\r\n	</p>\r\n<br />\r\n</span>\r\n</p>'),
(16, 1444545840, '人马座驻地球大使馆', '258258', '朱大肠', '<p>\r\n	<span style="color:#000000;font-family:SimSun;font-size:32px;line-height:48px;">教你如何不吃饭不睡觉还能神采飞扬</span> \r\n</p>\r\n<p>\r\n	<img src="/wwwroot/Uploads/Editor/2015-10-20/56259b7453519.jpg" alt="" /> \r\n</p>\r\n<p>\r\n	<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n		<span><strong>CNII网讯</strong>&nbsp;4月21日，由台湾物联网联盟、南京邮电大学物联网科技园共同主办，台湾物联网联盟、南京邮电大学物联网科技园共同发起成立的海峡两岸智慧服务产业发展研究院（筹）承办的海峡两岸物联网与智慧服务产业发展（金陵）论坛在南邮召开。</span>\r\n	</p>\r\n	<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n		<span>南京市副市长罗群，中国国民党副主席蒋孝严，台湾新党主席郁慕明，国际电信联盟（ITU）副秘书长赵厚麟，江苏省台办副主任王少邦，南京市副秘书长张新年，南京市鼓楼区委书记、南京邮电大学物联网科技园管委会主任陆平贵，中华两岸工商事务交流暨永续发展协会理事长郑永金，台湾物联网联盟理事长梁宾先，南京市鼓楼区区长、南京邮电大学物联网科技园管委会常务副主任杨学鹏，南京邮电大学党委书记、物联网科技园管委会主任闵春发等出席论坛开幕式并共同见证海峡两岸签署合作项目。南京市副市长罗群、中国国民党副主席蒋孝严、台湾新党主席郁慕明一同为海峡两岸智慧服务产业发展研究院揭牌。南京邮电大学副校长、物联网科技园董事长朱洪波主持论坛开幕式。</span>\r\n	</p>\r\n	<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n		<span>南京市副市长罗群表示，南京市政府高度重视物联网产业，专门成立了物联网学院、南京物联网应用研究院，出台了支持物联网产业等新兴产业发展的《关于促进南京市新兴产业发展的政策措施》。南京有丰富的人才资源，有悠久的IT行业历史，是中国电子信息技术发展的摇篮。他希望通过此次论坛，海峡两岸强强联合，加速推动物联网产业的发展，为两岸科技与经济的发展做出贡献。</span><img src="/wwwroot/Uploads/Editor/2015-10-27/562f19868e4b6.jpg" alt="" />\r\n	</p>\r\n	<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span>中国国民党副主席蒋孝严致辞时引用芝加哥大学的教授Rachel Fulton的预测指出，在30年后中国大陆GDP将达123兆美元，居世界第一，而包括南京邮电大学在内中国大陆众多高校是促成这一结果的重要因素之一。他为两岸现在的合作态势、尤其为两岸在尖端科技领域的合作逐步加强感到高兴，希望两岸各取所长，求同存异，并争取在更多领域深化合作交流。</span>\r\n		</p>\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span>台湾新党主席郁慕明以手机由大变小、由厚变薄、由重变轻、由功能少变为功能多为例向大家形象解释了什么是智慧服务产业的发展。他进一步指出，发展除了有技术科技的支撑，还需要有智慧的领导人的重视和支持，这样才能促进行业的连续性发展。他希望台北能够成为下一次海峡两岸物联网与智慧服务产业发展论坛的举办地，并欢迎大家到台湾合作交流，共同促进物联网产业的发展。</span>\r\n		</p>\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span>国际电信联盟副秘书长（ITU）赵厚麟在致辞中向大家介绍了国际物联网产业的发展现状，尤其以自己的亲身经历，重点介绍了海峡两岸物联网产业的蓬勃发展。他希望此次合作，能进一步推动两岸物联网领域相关技术产业的研究、发展和应用，推动两岸共同合作，共创双赢，让两岸的物联网产业在世界物联网产业中占有重要地位。</span>\r\n		</p>\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span>南京市鼓楼区委书记、南京邮电大学物联网科技园管委会主任陆平贵表示，此次论坛的召开定会为园区和鼓楼科技的发展增添智慧和力量，鼓楼区委区政府也将竭诚为入住鼓楼区的企业、科技人才提供全方位服务。</span>\r\n		</p>\r\n<img src="/wwwroot/Uploads/Editor/2015-10-27/562f19c72bd4d.jpg" alt="" />\r\n	</p>\r\n	<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span>台湾物联网联盟理事长梁宾先在致辞中感谢两岸领导对物联网产业的重视。他希望海峡两岸能够充分利用双方的资讯、通讯、终端设备优势，利用市场空间、良好的政策支持，在物联网产业上大有作为。</span>\r\n		</p>\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span>南京邮电大学党委书记闵春发指出，此次论坛的举行、海峡两岸智慧服务产业发展研究院的成立，是两岸物联网发展的大事和喜事，它开启了海峡两岸在物联网等新型产业合作的新篇章，必将对两岸物联网产业的发展产生重大影响。他希望通过这次论坛的举办两岸实现良性互动，使论坛能够成为中国物联网与智慧服务产业的推动者，为两岸各行各业物联网应用的发展架起一座互动的桥梁。</span>\r\n		</p>\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span>台湾物联网联盟理事长梁宾先，南京邮电大学副校长、物联网科技园董事长朱洪波担任海峡两岸智慧服务产业发展研究院院长。台湾全人资通股份有限公司董事长郑朝钟出任研究院秘书长。南京邮电大学物联网科技园有限公司总经理张登银，南京邮电大学通信与信息工程学院副院长、通信技术研究所所长杨龙祥出任研究院副秘书长。</span>\r\n		</p>\r\n		<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n			<span style="line-height:26px;">出席论坛的领导人还共同见证了项目合作签约仪式。海峡两岸共同签署了“宁台海峡两岸文创交流暨秦淮士林人文饮食智慧旅游服务”、“植物逆境与物联网农业远程监控”、“BPM企业流程管理系统”、“物联网智能居家与节能方案”等多个合作项目。</span><span style="font-size:12pt;line-height:1.5;"></span>\r\n		</p>\r\n	</p>\r\n	<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n		<br />\r\n	</p>\r\n	<p style="font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;">\r\n		<span><br />\r\n</span>\r\n	</p>\r\n</p>'),
(17, 1444632300, '人马座驻太阳系大使馆', '438438438', '朱蒸蛋', '<p>\r\n	<span style="font-family:KaiTi_GB2312;font-size:32px;color:#006600;"><span style="font-family:SimSun;color:#000000;">教你如何不吃饭不睡觉还能精神奕奕</span><img src="/wwwroot/Uploads/Editor/2015-10-20/56259aee41554.jpg" alt="" /></span>\r\n</p>\r\n<p>\r\n	<span style="font-family:KaiTi_GB2312;font-size:32px;color:#006600;">\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		&nbsp; &nbsp; 为了更好地贯彻“智慧浙江”建设的重大战略举措，由省发改委、省经信委、省科技厅、省商务厅等省政府相关部门指导，浙江日报报业集团主办，富春硅谷协办的以“建设智慧园区，共赢城市未来”为主题的首届浙江智慧园区发展高峰论坛近日在杭举行。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　在本次论坛上，中国工程院原常务副院长潘云鹤院士做了题为《智慧城市的三个理念》的主题演讲。“浙江省的智慧城市建设在全国是走在前列的，很多城市都产生了自己独特的想法，比如杭州现在提出主要以智慧经济为主，瞄准的方向非常明确。”他表示，中国城市更适合智能化发展：不仅是云计算、大数据、物联网等技术的集成运用，还是工业化、信息化、城镇化以及农业现代化的四化融合。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　园区既是承担着区域经济和产业的主要集聚区，又是智慧城市的缩影。在“四化融合”语境下的今天，以机器换人、电商换市、信息化应用等效率驱动的发展新模式，正在浙江各家园区全面探索并进行着，“智慧园区”建设已经成为地方政府和园区管理层最为关注和深度思考的新课题。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　浙江省科技厅厅长周国辉认为，智慧园区是城市化、工业化、信息化、生态化融合发展的重要示范区。浙江省作为全国首个工业化与信息化融合发展示范区，在这方面作了一些探索，取得了一定的成效。如“四换三名”工作，特别是“四换”这一块，都与信息产业发展密切相关，尤其是“机器换人”和“电商换市”。我省把高新园区建设作为智慧园区的重中之重，目前全省已有5家国家级高新区、25家省级高新区。杭州高新区正在积极创建网络信息技术自主创新示范区，已经成为智慧产业发展的主阵地。下一步，要充分利用好物联网、云计算、大数据、移动互联网技术，大力发展智慧产业和智慧服务，为打造浙江经济升级版提供有力支撑。\r\n	</p>\r\n<img src="/wwwroot/Uploads/Editor/2015-10-27/562f149f6bad8.jpg" alt="" /><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style="font-family:KaiTi_GB2312;font-size:32px;color:#006600;">\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		&nbsp; &nbsp; 浙江省目前正在做十几个专项的智慧城市试点，比如杭州的智慧交通、智慧医疗，宁波的智慧医疗，舟山的智慧民生等……全省从上到下，正在形成智慧城市、智慧园区建设的氛围。而且实际工作中，企业、园区、产业等各个方面都呈现良好态势。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　2013年，浙江已先后启动了20个智慧城市建设示范试点项目。7月初，浙江智慧园区最佳案例推选活动一推出，就引起了强烈反响。7月23日的论坛现场，榜单终于公布，杭州国家高新技术产业开发区、衢州国家高新技术产业开发区、杭州富阳经济技术开发区、湖州现代物流装备高新园区、富春硅谷等5个园区成为首届浙江智慧园区建设最佳案例，各家园区的代表接受了颁奖。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　当其他地方的信息经济发展还是星星之火，杭州高新区已是灿若星辰，在智慧安防、智慧商务、智慧交通、智慧医疗、智慧环境、智慧制造等领域，形成了一条较为完整的智慧经济产业链，信息经济的比重占到了全区工业总产值的七成。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　在杭州高新区，信息经济不仅扮演了新经济发展的主动力角色，还正在为这个滨江新城、工业强区带来更加智能便利的美好生活。在杭州高新区的西大门，一块曾经的老工业区，一个名叫智慧新天地的大平台正在抓紧建设，今后这里不仅将形成智慧产业区、总部区、商业服务区以及智慧社区，还将成为信息技术应用的实验区，区域内的购物、出行都实现智能控制，为杭州甚至浙江省智慧城市建设提供模板。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　东部软件园也是智慧园区较早的践行者。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　杭州东部软件园有限公司董事长宋小春说，“智慧园区的建设包括两个方面。一个是培育信息产业，另一个是打造信息化园区的升级版。信息化解决的是准和快，它其实是带动了园区的发展。以我们为例，信息化给我们园区带来了三种改变：更聪明、更年轻、反应速度更快了。”\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　东部软件园早就提出了服务智慧化。杭州市现在城市化率已经达到了73%，现代服务业已经是这个城市的基本业态了。而园区就是现代服务业的一种形态，通过现代服务业带动科技产业和科技企业的发展。“对园区来说，目前已经到了转型升级的节点。我觉得园区还是要发挥产业功能区的作用，推动产业提升，转型升级。但是如何做，这还是一个需要再研究的课题。”\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　总规划建筑面积60万平方米的富春硅谷，作为杭州首个大型城市产业综合体，既是我省重点引进的科技产业建设项目，也是富阳银湖科技城的核心引擎项目。富春硅谷围绕“智慧思维、智慧产品、智慧服务、智慧经济”，以提供适度提前的智能化服务、前置性资源整合平台，为企业发展打造高效成长空间，加速浙江经济产业转型升级、聚集智慧产业集群。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　“富春硅谷有三个理念，就是服务企业、服务企业家、服务企业的人。服务将基于企业人才发展展开，并以人为核心建设城市产业综合体，构建微型城市链，打造企业与人才的关联社区。富春硅谷的目标是，能够服务创业，服务中小微企业的发展，能够打造企业面向世界竞争的平台，以及促进城市向更高的目标发展，促进产城融合。”富春硅谷执行副总经理左世昌如是说。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　富春硅谷将打造一个“产业集聚、人才集聚、资本集聚、创新集聚”的杭州新兴产业集聚区，建成后可入驻500家企业。据悉，目前已有多家企业与该园区建立了战略合作伙伴关系，最终将实现“推动自身商业模式、服务模式、运营模式不断进化，推动成长型企业优质快速成长，推动城市经济与社会的发展转型”。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		<img src="/wwwroot/Uploads/Editor/2015-10-27/562f1550b4775.jpg" alt="" />\r\n	</p>\r\n</span><span><span style="line-height:48px;">&nbsp;&nbsp;</span></span><span style="color:#333333;font-family:宋体;font-size:14px;line-height:1.5;">目前，浙江省经国家升级批准和公告的各类开发区(园区)数量已达到了117个，加上15个省级产业集聚区以及各地涌现出来的创新型园区，在全省基本形成了布局合理、层次分明、种类齐全、相互支撑的区域开放发展格局，并积极发挥着“三大作用”：即在实施我省四大国家战略中的支撑促进作用、加快浙江经济转型升级中的示范引领作用和促进区域经济发展中的辐射带动作用。</span><span style="font-family:KaiTi_GB2312;font-size:32px;color:#006600;">\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　“大力促进各级各类园区的智慧化改造，既是浙江经济传统产业改造提升的重要途径，园区升级的重要途径，更是园区转型的重要切入点。园区创新发展既是有形的产品和服务，更是政府园区管理模式的创新和改变。政府管理部门要习惯于从网络经济、大数据时代、移动互联网时代等新的转变，服务于园区的转型升级。同时，也是各级园区管理部门、营运部门，改变原有路径的重要突破口。”浙江省工业经济研究所所长兰建平博士提出了自己的见解。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　当天，兰博士作为嘉宾也出席了论坛。会后他谈到，如果工业园区仅仅是依靠卖土地的优惠政策、税收减免等方式来运营，在新时期一定不可持续。所以园区的直接管理运营者必须创新管理模式、服务模式，必须转型。而智慧化转型，正是顺应第三次工业革命趋势的主要路径。各级各类开发区，要再创产业发展的新优势，必须在园区的智慧化下功夫。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　这个观点和浙江省商务厅开发区处处长梁志良不谋而合。梁处长认为，智慧园区虽然还是个新生事物，但这一定是一种发展趋势。至于要怎么落地，大家都在探索，有人先行了，必然也有人在观望。论坛把大家的注意力都吸引过来，共同来探讨智慧园区规划、运营和建设中的核心问题，很接地气而且效果显著。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　更让他欣喜的是，“智慧园区”事实上把开发区现阶段的“产城融合”又提升到了一个新的境界。“开发区先有产，后有城，虽然已经在谈产城融合了，但两者之间还是存在缝隙，需要磨合。而‘智慧园区’是开发区走到一定历史阶段必然要推进的新境界——这是一种‘大象无形’的境界，产就是城，城就是产，是一种犹如美国硅谷一样的绿色、低碳、智能化发展模式。”他表示，毋庸置疑，浙江智慧园区的春天已经到来了。但智慧城市建设要有顶层设计和新的载体，对未来的发展还需要有总体的规划。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　尤其值得一提的是，在此次高峰论坛上，还发起成立了“浙江智慧园区联盟”。该联盟旨在通过打造一个具有创新精神和价值创造的交流平台，不断汇聚新的思想与能量，长期且持续地推动浙江“智慧园区”的发展，营造知识经济时代共享资源、共同成长的良好氛围。\r\n	</p>\r\n	<p style="color:#333333;font-family:宋体;font-size:14px;">\r\n		　　在浙江，智慧园区这一崭新命题在未来将结出怎样的累累硕果？让我们拭目以待吧。\r\n	</p>\r\n<br />\r\n</span>\r\n</p>'),
(22, 1445238240, '', '', '', ''),
(23, 1, '1', '1', '1', '55'),
(1, 1446108720, '宁波工程学院', '717162', 'qq', 'huiyi');

-- --------------------------------------------------------

--
-- 表的结构 `jb_file`
--

CREATE TABLE IF NOT EXISTS `jb_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jb_hooks`
--

CREATE TABLE IF NOT EXISTS `jb_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `jb_hooks`
--

INSERT INTO `jb_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`, `status`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, '', 1),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop', 1),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment', 1),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment', 1),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, '', 1),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment', 1),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor', 1),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin', 1),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam', 1),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor', 1),
(16, 'app_begin', '应用开始', 2, 1384481614, '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `jb_huiyibaoming`
--

CREATE TABLE IF NOT EXISTS `jb_huiyibaoming` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `mobile` varchar(12) DEFAULT NULL COMMENT '联系方式',
  `create_time` int(10) NOT NULL COMMENT '报名时间',
  `huiyi_id` int(10) unsigned NOT NULL COMMENT '报名会议id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `jb_huiyibaoming`
--

INSERT INTO `jb_huiyibaoming` (`id`, `name`, `mobile`, `create_time`, `huiyi_id`, `uid`) VALUES
(1, '灌灌灌灌灌', '13442322311', 1446024643, 11, 7),
(2, '灌灌灌灌灌', '15727138023', 1446027313, 14, 5),
(3, '刘奇', '15757857599', 1446100736, 6, 8),
(4, '刘奇', '15757857599', 1446100753, 7, 8),
(5, '刘奇', '15757857599', 1446100766, 8, 8),
(6, '卢子跃', '15757857598', 1446100797, 9, 8),
(7, '丹揍揍', '15757857589', 1446101357, 6, 9),
(8, 'cspx', '15757857581', 1446102470, 6, 9);

-- --------------------------------------------------------

--
-- 表的结构 `jb_member`
--

CREATE TABLE IF NOT EXISTS `jb_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(11) NOT NULL COMMENT '手机号码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `jb_member`
--

INSERT INTO `jb_member` (`uid`, `nickname`, `mobile`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`) VALUES
(1, 'admin', '', 0, '0000-00-00', '', 20, 4, 0, 1445223881, 0, 1446010636, 1),
(2, 'chen', '', 0, '0000-00-00', '', 10, 1, 0, 1445915085, 0, 1445915085, 1),
(5, '约约约', '', 0, '0000-00-00', '', 10, 14, 0, 1446007349, 0, 1446027295, 1),
(7, '灌灌灌灌灌', '13442324344', 0, '0000-00-00', '', 10, 1, 0, 1446010018, 0, 1446010018, 1),
(3, 'asd', '15757857594', 0, '0000-00-00', '', 10, 1, 0, 1446083764, 0, 1446083764, 1),
(8, '刘奇', '15757857599', 0, '0000-00-00', '', 10, 3, 0, 1446086001, 0, 1446088256, 1),
(9, '丹揍揍', '15757857589', 0, '0000-00-00', '', 10, 2, 0, 1446101038, 0, 1446101286, 1),
(10, '朱针对', '15757857622', 0, '0000-00-00', '', 10, 1, 0, 1446108884, 0, 1446108884, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jb_menu`
--

CREATE TABLE IF NOT EXISTS `jb_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

--
-- 转存表中的数据 `jb_menu`
--

INSERT INTO `jb_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`, `status`) VALUES
(1, '首页', 0, 1, 'Index/index', 0, '', '', 0, 1),
(2, '内容', 0, 2, 'Article/index', 0, '', '', 0, 1),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0, 1),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0, 1),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0, 1),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0, 1),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0, 1),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0, 1),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0, 1),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0, 1),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0, 1),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0, 1),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0, 1),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0, 1),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0, 1),
(16, '用户', 0, 3, 'User/index', 0, '', '', 0, 1),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0, 1),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0, 1),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0, 1),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0, 1),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0, 1),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0, 1),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0, 1),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0, 1),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0, 1),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0, 1),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0, 1),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0, 1),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0, 1),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0, 1),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0, 1),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0, 1),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0, 1),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0, 1),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0, 1),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0, 1),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0, 1),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0, 1),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0, 1),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0, 1),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0, 1),
(43, '扩展', 0, 7, 'Addons/index', 0, '', '', 0, 1),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0, 1),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0, 1),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0, 1),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0, 1),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0, 1),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0, 1),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0, 1),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0, 1),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0, 1),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0, 1),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0, 1),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0, 1),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0, 1),
(57, '钩子管理', 43, 2, 'Addons/hooks', 0, '', '扩展', 0, 1),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0, 1),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0, 1),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0, 1),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0, 1),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0, 1),
(63, '属性管理', 68, 0, 'Attribute/index', 1, '网站属性配置。', '', 0, 1),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0, 1),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0, 1),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0, 1),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0, 1),
(68, '系统', 0, 4, 'Config/group', 0, '', '', 0, 1),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0, 1),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0, 1),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0, 1),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0, 1),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0, 1),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0, 1),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0, 1),
(76, '导航管理', 68, 6, 'Channel/index', 0, '', '系统设置', 0, 1),
(77, '新增', 76, 0, 'Channel/add', 0, '', '', 0, 1),
(78, '编辑', 76, 0, 'Channel/edit', 0, '', '', 0, 1),
(79, '删除', 76, 0, 'Channel/del', 0, '', '', 0, 1),
(80, '分类管理', 68, 2, 'Category/index', 0, '', '系统设置', 0, 1),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0, 1),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0, 1),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0, 1),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0, 1),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0, 1),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0, 1),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0, 1),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0, 1),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0, 1),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0, 1),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0, 1),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0, 1),
(93, '其他', 0, 5, 'other', 1, '', '', 0, 1),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0, 1),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0, 1),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0, 1),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0, 1),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0, 1),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0, 1),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0, 1),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0, 1),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0, 1),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0, 1),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0, 1),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0, 1),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0, 1),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0, 1),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0, 1),
(121, '排序', 76, 0, 'Channel/sort', 1, '', '', 0, 1),
(122, '数据列表', 58, 0, 'think/lists', 1, '', '', 0, 1),
(123, '审核列表', 3, 0, 'Article/examine', 1, '', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jb_model`
--

CREATE TABLE IF NOT EXISTS `jb_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `jb_model`
--

INSERT INTO `jb_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `attribute_alias`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":["3","24","5","2"],"2":["13","19","12","14","26","25","11","9","16","17","10","20"]}', '1:基础,2:扩展', '', '', '', '', '', '', 0, '', '', 1383891243, 1445239149, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":["5","3"]}', '1:基础,2:扩展', '5,3', '', '', '', '', '', 0, '', '', 1383891252, 1445237677, 1, 'MyISAM'),
(4, 'huiyi', '会议', 1, '', 1, '{"1":["3","39","33","35","37","36"],"2":["2"]}', '1:基础,2:扩展', '12,3,2,39,33,35,37,36', '', '', '', '', '', 10, '', '', 1445235141, 1446084830, 1, 'MyISAM'),
(6, 'huiyibaoming', '会议报名', 0, '', 1, '{"1":["41","42","43"]}', '1:基础', '45,44,41,42,43', '', '', '', '', 'id:编号\r\nhuiyi_id|get_huiyi_title:会议名称\r\nname:姓名\r\nmobile:联系电话\r\ncreate_time|date:报名时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, '', '', 1445308224, 1446025373, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `jb_picture`
--

CREATE TABLE IF NOT EXISTS `jb_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `jb_picture`
--

INSERT INTO `jb_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(1, '/Uploads/Picture/2015-10-29/5631811509457.jpg', '', '9198330e918f7685373229d4626a2615', '97b3a7595abba2af5827d6de0c01bdc94bf42bcb', 1, 1446084884),
(2, '/Uploads/Picture/2015-10-29/563182e856bd9.png', '', '318080d8689bf61f0ec394eb3e5f057a', 'ea3c030a8ee763089b44b3ad94b06909d85a7849', 1, 1446085352),
(3, '/Uploads/Picture/2015-10-29/563183b92eaed.jpg', '', '31e05e3580b60c04339ec3414ffa504e', '987ba8296a528d39ad5e93654fc7633ac62798b9', 1, 1446085561),
(4, '/Uploads/Picture/2015-10-29/563183f688e90.jpg', '', 'ac363af083d8d1f547868de42288f38b', '3954f65929ebc1b98db20fe8fc7e8ea37d35637a', 1, 1446085622),
(5, '/Uploads/Picture/2015-10-29/5631841e80f2b.jpg', '', 'e2a93cb222c53382b0fffb05f18f0e46', '2de0136086b5911a96d3a7613910f06c4c640db7', 1, 1446085662),
(6, '/Uploads/Picture/2015-10-29/563184eb689fd.jpg', '', '86fa2d49e0b8f6a4d1315a3bda17989d', '83c7cb72b731b6bf9c77cc6bf38b49bea020166b', 1, 1446085867),
(7, '/Uploads/Picture/2015-10-29/5631852546ce5.jpg', '', 'fac90aae0bfda6189b3f1b8303ef04a6', 'e42f425c1b929fc1f808b4f77252c0cf2e905dda', 1, 1446085925);

-- --------------------------------------------------------

--
-- 表的结构 `jb_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `jb_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jb_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `jb_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jb_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `jb_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `jb_ucenter_member`
--

INSERT INTO `jb_ucenter_member` (`id`, `username`, `password`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', 'eaf6e523292ebe8e8c4b5b9b111b2aae', '', 1445223881, 2130706433, 1446010636, 0, 1445223881, 1),
(2, 'chen', '2967d792b099004c0e05685c4ca118d1', '16767', 1445915074, 0, 1445915085, 0, 1445915074, 1),
(3, 'asd', '2967d792b099004c0e05685c4ca118d1', '15757857594', 1445918422, 0, 1446083764, 0, 1445918422, 1),
(4, 'qweqwe', '2967d792b099004c0e05685c4ca118d1', '13599999999', 1445918540, 0, 0, 0, 1445918540, 1),
(5, '约约约', '2967d792b099004c0e05685c4ca118d1', '15727138723', 1446007180, 0, 1446027295, 0, 1446007180, 1),
(6, '撒臭小子', '2967d792b099004c0e05685c4ca118d1', '13333333333', 1446009547, 0, 0, 0, 1446009547, 1),
(7, '灌灌灌灌灌', '2967d792b099004c0e05685c4ca118d1', '13442324344', 1446010018, 0, 1446010018, 0, 1446010018, 1),
(8, '刘奇', '2967d792b099004c0e05685c4ca118d1', '15757857599', 1446086001, 0, 1446088256, 0, 1446086001, 1),
(9, '丹揍揍', '43617ff1bd1d388e6440c317d64051f4', '15757857589', 1446101038, 0, 1446101286, 0, 1446101038, 1),
(10, '朱针对', 'e7b8966339f40cad55090958b3d24642', '15757857622', 1446108884, 0, 1446108884, 0, 1446108884, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jb_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `jb_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jb_url`
--

CREATE TABLE IF NOT EXISTS `jb_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jb_userdata`
--

CREATE TABLE IF NOT EXISTS `jb_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
