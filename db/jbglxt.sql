-- MySQL dump 10.13  Distrib 5.7.10, for osx10.11 (x86_64)
--
-- Host: localhost    Database: jbglxt
-- ------------------------------------------------------
-- Server version	5.7.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `jb_action`
--

DROP TABLE IF EXISTS `jb_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_action` (
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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_action`
--

LOCK TABLES `jb_action` WRITE;
/*!40000 ALTER TABLE `jb_action` DISABLE KEYS */;
INSERT INTO `jb_action` VALUES (1,'user_login','用户登录','积分+10，每天一次','table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;','[user|get_nickname]在[time|time_format]登录了后台',1,1,1387181220),(2,'add_article','发布文章','积分+5，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5','',2,0,1380173180),(3,'review','评论','评论积分+1，无限制','table:member|field:score|condition:uid={$self}|rule:score+1','',2,1,1383285646),(4,'add_document','发表文档','积分+10，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5','[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。',2,0,1386139726),(5,'add_document_topic','发表讨论','积分+5，每天上限10次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10','',2,0,1383285551),(6,'update_config','更新配置','新增或修改或删除配置','','',1,1,1383294988),(7,'update_model','更新模型','新增或修改模型','','',1,1,1383295057),(8,'update_attribute','更新属性','新增或更新或删除属性','','',1,1,1383295963),(9,'update_channel','更新导航','新增或修改或删除导航','','',1,1,1383296301),(10,'update_menu','更新菜单','新增或修改或删除菜单','','',1,1,1383296392),(11,'update_category','更新分类','新增或修改或删除分类','','',1,1,1383296765);
/*!40000 ALTER TABLE `jb_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_action_log`
--

DROP TABLE IF EXISTS `jb_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_action_log` (
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
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_action_log`
--

LOCK TABLES `jb_action_log` WRITE;
/*!40000 ALTER TABLE `jb_action_log` DISABLE KEYS */;
INSERT INTO `jb_action_log` VALUES (1,1,1,2130706433,'member',1,'admin在2015-10-19 11:07登录了后台',1,1445224079),(2,7,1,2130706433,'model',3,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445233907),(3,7,1,2130706433,'model',3,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445233984),(4,7,1,2130706433,'model',3,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445234045),(5,7,1,2130706433,'model',3,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445234857),(6,11,1,2130706433,'category',39,'操作url：/wwwroot/admin.php?s=/Category/add.html',1,1445235043),(7,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445235141),(8,8,1,2130706433,'attribute',33,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445235188),(9,11,1,2130706433,'category',40,'操作url：/wwwroot/admin.php?s=/Category/add.html',1,1445235231),(10,11,1,2130706433,'category',1,'操作url：/wwwroot/admin.php?s=/Category/edit.html',1,1445236047),(11,11,1,2130706433,'category',40,'操作url：/wwwroot/admin.php?s=/Category/remove/id/40.html',1,1445236048),(12,11,1,2130706433,'category',2,'操作url：/wwwroot/admin.php?s=/Category/edit.html',1,1445236089),(13,11,1,2130706433,'category',1,'操作url：/wwwroot/admin.php?s=/Category/edit.html',1,1445236196),(14,11,1,2130706433,'category',1,'操作url：/wwwroot/admin.php?s=/Category/edit.html',1,1445236205),(15,11,1,2130706433,'category',1,'操作url：/wwwroot/admin.php?s=/Category/edit.html',1,1445236222),(16,11,1,2130706433,'category',2,'操作url：/wwwroot/admin.php?s=/Category/edit.html',1,1445236239),(17,11,1,2130706433,'category',41,'操作url：/wwwroot/admin.php?s=/Category/add.html',1,1445236497),(18,7,1,2130706433,'model',3,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445237520),(19,7,1,2130706433,'model',3,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445237583),(20,7,1,2130706433,'model',3,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445237677),(21,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445237744),(22,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445237795),(23,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445237822),(24,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445238070),(25,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445238378),(26,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445238730),(27,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445238920),(28,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445238954),(29,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445238986),(30,7,1,2130706433,'model',2,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239149),(31,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239348),(32,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239396),(33,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239433),(34,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239498),(35,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239518),(36,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239536),(37,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239614),(38,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239632),(39,8,1,2130706433,'attribute',34,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445239773),(40,7,1,2130706433,'model',5,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445239811),(41,11,1,2130706433,'category',2,'操作url：/wwwroot/admin.php?s=/Category/edit.html',1,1445239850),(42,8,1,2130706433,'attribute',35,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445240088),(43,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240127),(44,8,1,2130706433,'attribute',36,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445240238),(45,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240281),(46,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240302),(47,8,1,2130706433,'attribute',37,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445240396),(48,8,1,2130706433,'attribute',38,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445240425),(49,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240468),(50,8,1,2130706433,'attribute',38,'操作url：/wwwroot/admin.php?s=/Attribute/remove/id/38.html',1,1445240497),(51,8,1,2130706433,'attribute',39,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445240523),(52,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240560),(53,8,1,2130706433,'attribute',36,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445240645),(54,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240670),(55,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240688),(56,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240886),(57,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445240898),(58,1,1,2130706433,'member',1,'admin在2015-10-20 09:05登录了后台',1,1445303130),(59,8,1,2130706433,'attribute',37,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445304054),(60,8,1,2130706433,'attribute',40,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445306640),(61,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445306656),(62,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445306681),(63,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445306739),(64,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445306763),(65,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445307063),(66,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445307073),(67,7,1,2130706433,'model',6,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445308224),(68,8,1,2130706433,'attribute',41,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445308470),(69,8,1,2130706433,'attribute',42,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445308535),(70,7,1,2130706433,'model',6,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445308604),(71,7,1,2130706433,'model',6,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445308634),(72,8,1,2130706433,'attribute',43,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445309058),(73,7,1,2130706433,'model',6,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445309106),(74,7,1,2130706433,'model',6,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445309115),(75,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445309230),(76,7,1,2130706433,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445309240),(77,8,1,2130706433,'attribute',44,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1445310057),(78,7,1,2130706433,'model',6,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445310066),(79,7,1,2130706433,'model',6,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1445310085),(80,1,2,0,'member',2,'chen在2015-10-27 11:04登录了后台',1,1445915085),(81,1,5,0,'member',5,'约约约在2015-10-28 12:42登录了后台',1,1446007349),(82,1,5,0,'member',5,'约约约在2015-10-28 12:42登录了后台',1,1446007356),(83,1,5,0,'member',5,'约约约在2015-10-28 13:07登录了后台',1,1446008863),(84,1,5,0,'member',5,'约约约在2015-10-28 13:08登录了后台',1,1446008887),(85,1,5,0,'member',5,'约约约在2015-10-28 13:08登录了后台',1,1446008904),(86,1,5,0,'member',5,'约约约在2015-10-28 13:08登录了后台',1,1446008924),(87,1,5,0,'member',5,'约约约在2015-10-28 13:08登录了后台',1,1446008928),(88,1,5,0,'member',5,'约约约在2015-10-28 13:08登录了后台',1,1446008932),(89,1,5,0,'member',5,'约约约在2015-10-28 13:08登录了后台',1,1446008936),(90,1,5,0,'member',5,'约约约在2015-10-28 13:09登录了后台',1,1446008941),(91,1,5,0,'member',5,'约约约在2015-10-28 13:19登录了后台',1,1446009572),(92,1,7,0,'member',7,'灌灌灌灌灌在2015-10-28 13:26登录了后台',1,1446010018),(93,1,1,0,'member',1,'admin在2015-10-28 13:37登录了后台',1,1446010636),(94,8,1,0,'attribute',44,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446010657),(95,8,1,0,'attribute',42,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446010669),(96,8,1,0,'attribute',45,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446010704),(97,8,1,0,'attribute',46,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446019915),(98,8,1,0,'attribute',35,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446021996),(99,8,1,0,'attribute',42,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446023360),(100,11,1,0,'category',41,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1446023543),(101,11,1,0,'category',39,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/remove/id/39.html',1,1446023554),(102,11,1,0,'category',41,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1446023624),(103,11,1,0,'category',42,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/add.html',1,1446023639),(104,11,1,0,'category',43,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/add.html',1,1446023666),(105,11,1,0,'category',41,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1446023680),(106,11,1,0,'category',42,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1446023703),(107,11,1,0,'category',43,'操作url：/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1446023713),(108,7,1,0,'model',6,'操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1446025160),(109,7,1,0,'model',6,'操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1446025196),(110,7,1,0,'model',6,'操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1446025342),(111,7,1,0,'model',6,'操作url：/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1446025373),(112,8,1,0,'attribute',45,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446025404),(113,8,1,0,'attribute',45,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446025456),(114,8,1,0,'attribute',45,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1446025480),(115,8,1,0,'attribute',43,'操作url：/jbglxt/wwwroot/admin.php?s=/Attribute/remove/id/43.html',1,1446025516),(116,1,5,0,'member',5,'约约约在2015-10-28 18:11登录了后台',1,1446027076),(117,1,5,0,'member',5,'约约约在2015-10-28 18:11登录了后台',1,1446027095),(118,1,5,0,'member',5,'约约约在2015-10-28 18:14登录了后台',1,1446027295),(119,1,3,0,'member',3,'asd在2015-10-29 09:56登录了后台',1,1446083764),(120,7,1,0,'model',4,'操作url：/wwwroot/admin.php?s=/Model/update.html',1,1446084830),(121,1,8,0,'member',8,'刘奇在2015-10-29 10:33登录了后台',1,1446086001),(122,1,8,0,'member',8,'刘奇在2015-10-29 10:36登录了后台',1,1446086174),(123,1,8,0,'member',8,'刘奇在2015-10-29 11:10登录了后台',1,1446088256),(124,8,1,0,'attribute',37,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1446091194),(125,8,1,0,'attribute',35,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1446091216),(126,8,1,0,'attribute',36,'操作url：/wwwroot/admin.php?s=/Attribute/update.html',1,1446091239),(127,8,1,0,'attribute',40,'操作url：/wwwroot/admin.php?s=/Attribute/remove/id/40.html',1,1446091246),(128,1,9,0,'member',9,'丹揍揍在2015-10-29 14:43登录了后台',1,1446101038),(129,1,9,0,'member',9,'丹揍揍在2015-10-29 14:48登录了后台',1,1446101286),(130,11,1,0,'category',44,'操作url：/wwwroot/admin.php?s=/Category/add.html',1,1446108522),(131,11,1,0,'category',45,'操作url：/wwwroot/admin.php?s=/Category/add.html',1,1446108594),(132,1,10,0,'member',10,'朱针对在2015-10-29 16:54登录了后台',1,1446108884),(133,1,3,2130706433,'member',3,'asd在2016-04-11 23:19登录了后台',1,1460387953),(134,1,3,2130706433,'member',3,'asd在2016-04-11 23:19登录了后台',1,1460387964),(135,1,3,2130706433,'member',3,'asd在2016-04-11 23:19登录了后台',1,1460387970),(136,1,3,2130706433,'member',3,'asd在2016-04-11 23:19登录了后台',1,1460387976),(137,1,1,2130706433,'member',1,'admin在2016-04-11 23:37登录了后台',1,1460389074),(138,1,1,2130706433,'member',1,'admin在2016-04-17 16:22登录了后台',1,1460881346),(139,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460881467),(140,8,1,2130706433,'attribute',47,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460881803),(141,8,1,2130706433,'attribute',48,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460882109),(142,7,1,2130706433,'model',8,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460883116),(143,8,1,2130706433,'attribute',49,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460883271),(144,8,1,2130706433,'attribute',50,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460883589),(145,11,1,2130706433,'category',46,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/add.html',1,1460883704),(146,11,1,2130706433,'category',47,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/add.html',1,1460883746),(147,11,1,2130706433,'category',48,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/add.html',1,1460883788),(148,11,1,2130706433,'category',47,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1460884090),(149,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884318),(150,7,1,2130706433,'model',8,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884358),(151,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884391),(152,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884469),(153,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884500),(154,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884545),(155,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884587),(156,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884608),(157,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884635),(158,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884637),(159,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460884642),(160,11,1,2130706433,'category',47,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1460885581),(161,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460885615),(162,11,1,2130706433,'category',47,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1460885660),(163,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460885748),(164,11,1,2130706433,'category',45,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/remove/id/45.html',1,1460886095),(165,11,1,2130706433,'category',44,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/remove/id/44.html',1,1460886097),(166,11,1,2130706433,'category',2,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/remove/id/2.html',1,1460886104),(167,11,1,2130706433,'category',1,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/remove/id/1.html',1,1460886106),(168,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886158),(169,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886221),(170,8,1,2130706433,'attribute',39,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460886247),(171,8,1,2130706433,'attribute',51,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460886297),(172,8,1,2130706433,'attribute',37,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460886316),(173,8,1,2130706433,'attribute',37,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460886323),(174,8,1,2130706433,'attribute',36,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460886358),(175,8,1,2130706433,'attribute',35,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460886370),(176,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886402),(177,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886424),(178,8,1,2130706433,'attribute',36,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460886442),(179,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886563),(180,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886576),(181,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886794),(182,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460886819),(183,11,1,2130706433,'category',47,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/edit.html',1,1460886869),(184,7,1,2130706433,'model',1,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460887064),(185,7,1,2130706433,'model',1,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460887311),(186,7,1,2130706433,'model',2,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460887401),(187,7,1,2130706433,'model',1,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460887465),(188,7,1,2130706433,'model',1,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460887498),(189,8,1,2130706433,'attribute',52,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460896751),(190,8,1,2130706433,'attribute',53,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460896899),(191,8,1,2130706433,'attribute',54,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460896966),(192,8,1,2130706433,'attribute',48,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/remove/id/48.html',1,1460900365),(193,8,1,2130706433,'attribute',52,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/remove/id/52.html',1,1460900371),(194,11,1,2130706433,'category',49,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Category/add.html',1,1460900538),(195,9,1,2130706433,'channel',2,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Channel/edit.html',1,1460902911),(196,9,1,2130706433,'channel',0,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Channel/del/id/4.html',1,1460902965),(197,9,1,2130706433,'channel',0,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Channel/del/id/3.html',1,1460903231),(198,9,1,2130706433,'channel',1,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Channel/edit.html',1,1460903258),(199,9,1,2130706433,'channel',2,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Channel/edit.html',1,1460903436),(200,7,1,2130706433,'model',8,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460903734),(201,7,1,2130706433,'model',8,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460903803),(202,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460905765),(203,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460911575),(204,7,1,2130706433,'model',4,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460911598),(205,8,1,2130706433,'attribute',55,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460912510),(206,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460912549),(207,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460912569),(208,8,1,2130706433,'attribute',56,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460912735),(209,8,1,2130706433,'attribute',57,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460912750),(210,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460912944),(211,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460912956),(212,7,1,2130706433,'model',7,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Model/update.html',1,1460912970),(213,8,1,2130706433,'attribute',33,'操作url：/php/jbglxt/wwwroot/admin.php?s=/Attribute/update.html',1,1460913240);
/*!40000 ALTER TABLE `jb_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_addons`
--

DROP TABLE IF EXISTS `jb_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_addons` (
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_addons`
--

LOCK TABLES `jb_addons` WRITE;
/*!40000 ALTER TABLE `jb_addons` DISABLE KEYS */;
INSERT INTO `jb_addons` VALUES (15,'EditorForAdmin','后台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1383126253,0),(2,'SiteStat','站点统计信息','统计站点的基础信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}','thinkphp','0.1',1379512015,0),(3,'DevTeam','开发团队信息','开发团队成员信息',1,'{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1379512022,0),(4,'SystemInfo','系统环境信息','用于显示一些服务器的信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1379512036,0),(5,'Editor','前台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1379830910,0),(6,'Attachment','附件','用于文档模型上传附件',1,'null','thinkphp','0.1',1379842319,1),(9,'SocialComment','通用社交化评论','集成了各种社交化评论插件，轻松集成到系统中。',1,'{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}','thinkphp','0.1',1380273962,0);
/*!40000 ALTER TABLE `jb_addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_attachment`
--

DROP TABLE IF EXISTS `jb_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_attachment` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_attachment`
--

LOCK TABLES `jb_attachment` WRITE;
/*!40000 ALTER TABLE `jb_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_attribute`
--

DROP TABLE IF EXISTS `jb_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_attribute` (
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
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='模型属性表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_attribute`
--

LOCK TABLES `jb_attribute` WRITE;
/*!40000 ALTER TABLE `jb_attribute` DISABLE KEYS */;
INSERT INTO `jb_attribute` VALUES (1,'uid','用户ID','int(10) unsigned NOT NULL ','num','0','',0,'',1,0,1,1384508362,1383891233,'',0,'','','',0,''),(2,'name','标识','char(40) NOT NULL ','string','','同一根节点下标识不重复',1,'',1,0,1,1383894743,1383891233,'',0,'','','',0,''),(3,'title','标题','char(80) NOT NULL ','string','','文档标题',1,'',1,0,1,1383894778,1383891233,'',0,'','','',0,''),(4,'category_id','所属分类','int(10) unsigned NOT NULL ','string','','',0,'',1,0,1,1384508336,1383891233,'',0,'','','',0,''),(5,'description','描述','char(140) NOT NULL ','textarea','','',1,'',1,0,1,1383894927,1383891233,'',0,'','','',0,''),(6,'root','根节点','int(10) unsigned NOT NULL ','num','0','该文档的顶级文档编号',0,'',1,0,1,1384508323,1383891233,'',0,'','','',0,''),(7,'pid','所属ID','int(10) unsigned NOT NULL ','num','0','父文档编号',0,'',1,0,1,1384508543,1383891233,'',0,'','','',0,''),(8,'model_id','内容模型ID','tinyint(3) unsigned NOT NULL ','num','0','该文档所对应的模型',0,'',1,0,1,1384508350,1383891233,'',0,'','','',0,''),(9,'type','内容类型','tinyint(3) unsigned NOT NULL ','select','2','',1,'1:目录\r\n2:主题\r\n3:段落',1,0,1,1384511157,1383891233,'',0,'','','',0,''),(10,'position','推荐位','smallint(5) unsigned NOT NULL ','checkbox','0','多个推荐则将其推荐值相加',1,'[DOCUMENT_POSITION]',1,0,1,1383895640,1383891233,'',0,'','','',0,''),(11,'link_id','外链','int(10) unsigned NOT NULL ','num','0','0-非外链，大于0-外链ID,需要函数进行链接与编号的转换',1,'',1,0,1,1383895757,1383891233,'',0,'','','',0,''),(12,'cover_id','封面','int(10) unsigned NOT NULL ','picture','0','0-无封面，大于0-封面图片ID，需要函数处理',1,'',1,0,1,1384147827,1383891233,'',0,'','','',0,''),(13,'display','可见性','tinyint(3) unsigned NOT NULL ','radio','1','',1,'0:不可见\r\n1:所有人可见',1,0,1,1386662271,1383891233,'',0,'','regex','',0,'function'),(14,'deadline','截至时间','int(10) unsigned NOT NULL ','datetime','0','0-永久有效',1,'',1,0,1,1387163248,1383891233,'',0,'','regex','',0,'function'),(15,'attach','附件数量','tinyint(3) unsigned NOT NULL ','num','0','',0,'',1,0,1,1387260355,1383891233,'',0,'','regex','',0,'function'),(16,'view','浏览量','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895835,1383891233,'',0,'','','',0,''),(17,'comment','评论数','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895846,1383891233,'',0,'','','',0,''),(18,'extend','扩展统计字段','int(10) unsigned NOT NULL ','num','0','根据需求自行使用',0,'',1,0,1,1384508264,1383891233,'',0,'','','',0,''),(19,'level','优先级','int(10) unsigned NOT NULL ','num','0','越高排序越靠前',1,'',1,0,1,1383895894,1383891233,'',0,'','','',0,''),(20,'create_time','创建时间','int(10) unsigned NOT NULL ','datetime','0','',1,'',1,0,1,1383895903,1383891233,'',0,'','','',0,''),(21,'update_time','更新时间','int(10) unsigned NOT NULL ','datetime','0','',0,'',1,0,1,1384508277,1383891233,'',0,'','','',0,''),(22,'status','数据状态','tinyint(4) NOT NULL ','radio','0','',0,'-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿',1,0,1,1384508496,1383891233,'',0,'','','',0,''),(23,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',2,0,1,1384511049,1383891243,'',0,'','','',0,''),(24,'content','文章内容','text NOT NULL ','editor','','',1,'',2,0,1,1383896225,1383891243,'',0,'','','',0,''),(25,'template','详情页显示模板','varchar(100) NOT NULL ','string','','参照display方法参数的定义',1,'',2,0,1,1383896190,1383891243,'',0,'','','',0,''),(26,'bookmark','收藏数','int(10) unsigned NOT NULL ','num','0','',1,'',2,0,1,1383896103,1383891243,'',0,'','','',0,''),(27,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',3,0,1,1387260461,1383891252,'',0,'','regex','',0,'function'),(28,'content','下载详细描述','text NOT NULL ','editor','','',1,'',3,0,1,1383896438,1383891252,'',0,'','','',0,''),(29,'template','详情页显示模板','varchar(100) NOT NULL ','string','','',1,'',3,0,1,1383896429,1383891252,'',0,'','','',0,''),(30,'file_id','文件ID','int(10) unsigned NOT NULL ','file','0','需要函数处理',1,'',3,0,1,1383896415,1383891252,'',0,'','','',0,''),(31,'download','下载次数','int(10) unsigned NOT NULL ','num','0','',1,'',3,0,1,1383896380,1383891252,'',0,'','','',0,''),(32,'size','文件大小','bigint(20) unsigned NOT NULL ','num','0','单位bit',1,'',3,0,1,1383896371,1383891252,'',0,'','','',0,''),(33,'open_time','开始时间','int(10) NOT NULL','datetime','','',1,'',4,1,1,1460913240,1445235188,'',3,'','regex','',3,'function'),(35,'address','会议地点','varchar(120) NOT NULL','string','','',1,'',4,0,1,1460886370,1445240088,'',3,'','regex','',3,'function'),(36,'phone','报名电话','varchar(30) NOT NULL','string','','',1,'',4,0,1,1460886442,1445240238,'',3,'','regex','',3,'function'),(37,'jiabin_name','嘉宾姓名','varchar(30) NOT NULL','string','','',1,'',4,0,1,1460886323,1445240396,'',3,'','regex','',3,'function'),(39,'content','详细介绍','text NOT NULL','editor','','',1,'',4,1,1,1460886247,1445240523,'',3,'','regex','',3,'function'),(41,'name','姓名','varchar(255) NOT NULL','string','','',1,'',6,1,1,1445308470,1445308470,'',3,'','regex','',3,'function'),(42,'mobile','联系方式','varchar(12)','string','','',1,'',6,1,1,1446023360,1445308535,'',3,'','regex','',3,'function'),(44,'create_time','报名时间','int(10) NOT NULL','datetime','','',0,'',6,0,1,1446010657,1445310057,'',3,'','regex','',3,'function'),(45,'huiyi_id','报名会议id','int(10) UNSIGNED NOT NULL','num','','',1,'',6,0,1,1446025480,1446010704,'',3,'','regex','',3,'function'),(46,'uid','用户id','int(10) UNSIGNED NOT NULL','num','','',1,'',6,0,1,1446019915,1446019915,'',3,'','regex','',3,'function'),(47,'address','论坛主要地点','varchar(255) NOT NULL','string','','',1,'',7,0,1,1460881803,1460881803,'',3,'','regex','',3,'function'),(56,'open_time','论坛开始时间','int(10) NOT NULL','datetime','','',1,'',7,0,1,1460912735,1460912735,'',3,'','regex','',3,'function'),(49,'name','嘉宾名称','varchar(255) NOT NULL','string','','',1,'',8,0,1,1460883271,1460883271,'',3,'','regex','',3,'function'),(50,'job_title','头衔','varchar(255) NOT NULL','string','无','',1,'',8,0,1,1460883589,1460883589,'',3,'','regex','',3,'function'),(51,'jiabin_id','嘉宾id','int(10) UNSIGNED NOT NULL','num','0','',1,'',4,0,1,1460886297,1460886297,'',3,'','regex','',3,'function'),(55,'content','详情','text NOT NULL','editor','','',1,'',7,0,1,1460912510,1460912510,'',3,'','regex','',3,'function'),(53,'sign_up_requirements','报名要求','varchar(255) NOT NULL','string','','多个条件「;」隔开',1,'',4,0,1,1460896899,1460896899,'',3,'','regex','',3,'function'),(54,'sign_up_stop_time','报名截止时间','int(10) NOT NULL','datetime','','',1,'',4,0,1,1460896966,1460896966,'',3,'','regex','',3,'function'),(57,'end_time','论坛结束时间','int(10) NOT NULL','datetime','','',1,'',7,0,1,1460912750,1460912750,'',3,'','regex','',3,'function');
/*!40000 ALTER TABLE `jb_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_auth_extend`
--

DROP TABLE IF EXISTS `jb_auth_extend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_auth_extend`
--

LOCK TABLES `jb_auth_extend` WRITE;
/*!40000 ALTER TABLE `jb_auth_extend` DISABLE KEYS */;
INSERT INTO `jb_auth_extend` VALUES (1,1,1),(1,1,2),(1,2,1),(1,2,2),(1,3,1),(1,3,2),(1,4,1),(1,37,1);
/*!40000 ALTER TABLE `jb_auth_extend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_auth_group`
--

DROP TABLE IF EXISTS `jb_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_auth_group`
--

LOCK TABLES `jb_auth_group` WRITE;
/*!40000 ALTER TABLE `jb_auth_group` DISABLE KEYS */;
INSERT INTO `jb_auth_group` VALUES (1,'admin',1,'默认用户组','',1,'1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),(2,'admin',1,'测试用户','测试用户',1,'1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');
/*!40000 ALTER TABLE `jb_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_auth_group_access`
--

DROP TABLE IF EXISTS `jb_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_auth_group_access`
--

LOCK TABLES `jb_auth_group_access` WRITE;
/*!40000 ALTER TABLE `jb_auth_group_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_auth_rule`
--

DROP TABLE IF EXISTS `jb_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_auth_rule`
--

LOCK TABLES `jb_auth_rule` WRITE;
/*!40000 ALTER TABLE `jb_auth_rule` DISABLE KEYS */;
INSERT INTO `jb_auth_rule` VALUES (1,'admin',2,'Admin/Index/index','首页',1,''),(2,'admin',2,'Admin/Article/index','内容',1,''),(3,'admin',2,'Admin/User/index','用户',1,''),(4,'admin',2,'Admin/Addons/index','扩展',1,''),(5,'admin',2,'Admin/Config/group','系统',1,''),(7,'admin',1,'Admin/article/add','新增',1,''),(8,'admin',1,'Admin/article/edit','编辑',1,''),(9,'admin',1,'Admin/article/setStatus','改变状态',1,''),(10,'admin',1,'Admin/article/update','保存',1,''),(11,'admin',1,'Admin/article/autoSave','保存草稿',1,''),(12,'admin',1,'Admin/article/move','移动',1,''),(13,'admin',1,'Admin/article/copy','复制',1,''),(14,'admin',1,'Admin/article/paste','粘贴',1,''),(15,'admin',1,'Admin/article/permit','还原',1,''),(16,'admin',1,'Admin/article/clear','清空',1,''),(17,'admin',1,'Admin/article/examine','审核列表',1,''),(18,'admin',1,'Admin/article/recycle','回收站',1,''),(19,'admin',1,'Admin/User/addaction','新增用户行为',1,''),(20,'admin',1,'Admin/User/editaction','编辑用户行为',1,''),(21,'admin',1,'Admin/User/saveAction','保存用户行为',1,''),(22,'admin',1,'Admin/User/setStatus','变更行为状态',1,''),(23,'admin',1,'Admin/User/changeStatus?method=forbidUser','禁用会员',1,''),(24,'admin',1,'Admin/User/changeStatus?method=resumeUser','启用会员',1,''),(25,'admin',1,'Admin/User/changeStatus?method=deleteUser','删除会员',1,''),(26,'admin',1,'Admin/User/index','用户信息',1,''),(27,'admin',1,'Admin/User/action','用户行为',1,''),(28,'admin',1,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',1,''),(29,'admin',1,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',1,''),(30,'admin',1,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',1,''),(31,'admin',1,'Admin/AuthManager/createGroup','新增',1,''),(32,'admin',1,'Admin/AuthManager/editGroup','编辑',1,''),(33,'admin',1,'Admin/AuthManager/writeGroup','保存用户组',1,''),(34,'admin',1,'Admin/AuthManager/group','授权',1,''),(35,'admin',1,'Admin/AuthManager/access','访问授权',1,''),(36,'admin',1,'Admin/AuthManager/user','成员授权',1,''),(37,'admin',1,'Admin/AuthManager/removeFromGroup','解除授权',1,''),(38,'admin',1,'Admin/AuthManager/addToGroup','保存成员授权',1,''),(39,'admin',1,'Admin/AuthManager/category','分类授权',1,''),(40,'admin',1,'Admin/AuthManager/addToCategory','保存分类授权',1,''),(41,'admin',1,'Admin/AuthManager/index','权限管理',1,''),(42,'admin',1,'Admin/Addons/create','创建',1,''),(43,'admin',1,'Admin/Addons/checkForm','检测创建',1,''),(44,'admin',1,'Admin/Addons/preview','预览',1,''),(45,'admin',1,'Admin/Addons/build','快速生成插件',1,''),(46,'admin',1,'Admin/Addons/config','设置',1,''),(47,'admin',1,'Admin/Addons/disable','禁用',1,''),(48,'admin',1,'Admin/Addons/enable','启用',1,''),(49,'admin',1,'Admin/Addons/install','安装',1,''),(50,'admin',1,'Admin/Addons/uninstall','卸载',1,''),(51,'admin',1,'Admin/Addons/saveconfig','更新配置',1,''),(52,'admin',1,'Admin/Addons/adminList','插件后台列表',1,''),(53,'admin',1,'Admin/Addons/execute','URL方式访问插件',1,''),(54,'admin',1,'Admin/Addons/index','插件管理',1,''),(55,'admin',1,'Admin/Addons/hooks','钩子管理',1,''),(56,'admin',1,'Admin/model/add','新增',1,''),(57,'admin',1,'Admin/model/edit','编辑',1,''),(58,'admin',1,'Admin/model/setStatus','改变状态',1,''),(59,'admin',1,'Admin/model/update','保存数据',1,''),(60,'admin',1,'Admin/Model/index','模型管理',1,''),(61,'admin',1,'Admin/Config/edit','编辑',1,''),(62,'admin',1,'Admin/Config/del','删除',1,''),(63,'admin',1,'Admin/Config/add','新增',1,''),(64,'admin',1,'Admin/Config/save','保存',1,''),(65,'admin',1,'Admin/Config/group','网站设置',1,''),(66,'admin',1,'Admin/Config/index','配置管理',1,''),(67,'admin',1,'Admin/Channel/add','新增',1,''),(68,'admin',1,'Admin/Channel/edit','编辑',1,''),(69,'admin',1,'Admin/Channel/del','删除',1,''),(70,'admin',1,'Admin/Channel/index','导航管理',1,''),(71,'admin',1,'Admin/Category/edit','编辑',1,''),(72,'admin',1,'Admin/Category/add','新增',1,''),(73,'admin',1,'Admin/Category/remove','删除',1,''),(74,'admin',1,'Admin/Category/index','分类管理',1,''),(75,'admin',1,'Admin/file/upload','上传控件',-1,''),(76,'admin',1,'Admin/file/uploadPicture','上传图片',-1,''),(77,'admin',1,'Admin/file/download','下载',-1,''),(94,'admin',1,'Admin/AuthManager/modelauth','模型授权',1,''),(79,'admin',1,'Admin/article/batchOperate','导入',1,''),(80,'admin',1,'Admin/Database/index?type=export','备份数据库',1,''),(81,'admin',1,'Admin/Database/index?type=import','还原数据库',1,''),(82,'admin',1,'Admin/Database/export','备份',1,''),(83,'admin',1,'Admin/Database/optimize','优化表',1,''),(84,'admin',1,'Admin/Database/repair','修复表',1,''),(86,'admin',1,'Admin/Database/import','恢复',1,''),(87,'admin',1,'Admin/Database/del','删除',1,''),(88,'admin',1,'Admin/User/add','新增用户',1,''),(89,'admin',1,'Admin/Attribute/index','属性管理',1,''),(90,'admin',1,'Admin/Attribute/add','新增',1,''),(91,'admin',1,'Admin/Attribute/edit','编辑',1,''),(92,'admin',1,'Admin/Attribute/setStatus','改变状态',1,''),(93,'admin',1,'Admin/Attribute/update','保存数据',1,''),(95,'admin',1,'Admin/AuthManager/addToModel','保存模型授权',1,''),(96,'admin',1,'Admin/Category/move','移动',-1,''),(97,'admin',1,'Admin/Category/merge','合并',-1,''),(98,'admin',1,'Admin/Config/menu','后台菜单管理',-1,''),(99,'admin',1,'Admin/Article/mydocument','内容',-1,''),(100,'admin',1,'Admin/Menu/index','菜单管理',1,''),(101,'admin',1,'Admin/other','其他',-1,''),(102,'admin',1,'Admin/Menu/add','新增',1,''),(103,'admin',1,'Admin/Menu/edit','编辑',1,''),(104,'admin',1,'Admin/Think/lists?model=article','文章管理',-1,''),(105,'admin',1,'Admin/Think/lists?model=download','下载管理',1,''),(106,'admin',1,'Admin/Think/lists?model=config','配置管理',1,''),(107,'admin',1,'Admin/Action/actionlog','行为日志',1,''),(108,'admin',1,'Admin/User/updatePassword','修改密码',1,''),(109,'admin',1,'Admin/User/updateNickname','修改昵称',1,''),(110,'admin',1,'Admin/action/edit','查看行为日志',1,''),(205,'admin',1,'Admin/think/add','新增数据',1,''),(111,'admin',2,'Admin/article/index','文档列表',-1,''),(112,'admin',2,'Admin/article/add','新增',-1,''),(113,'admin',2,'Admin/article/edit','编辑',-1,''),(114,'admin',2,'Admin/article/setStatus','改变状态',-1,''),(115,'admin',2,'Admin/article/update','保存',-1,''),(116,'admin',2,'Admin/article/autoSave','保存草稿',-1,''),(117,'admin',2,'Admin/article/move','移动',-1,''),(118,'admin',2,'Admin/article/copy','复制',-1,''),(119,'admin',2,'Admin/article/paste','粘贴',-1,''),(120,'admin',2,'Admin/article/batchOperate','导入',-1,''),(121,'admin',2,'Admin/article/recycle','回收站',-1,''),(122,'admin',2,'Admin/article/permit','还原',-1,''),(123,'admin',2,'Admin/article/clear','清空',-1,''),(124,'admin',2,'Admin/User/add','新增用户',-1,''),(125,'admin',2,'Admin/User/action','用户行为',-1,''),(126,'admin',2,'Admin/User/addAction','新增用户行为',-1,''),(127,'admin',2,'Admin/User/editAction','编辑用户行为',-1,''),(128,'admin',2,'Admin/User/saveAction','保存用户行为',-1,''),(129,'admin',2,'Admin/User/setStatus','变更行为状态',-1,''),(130,'admin',2,'Admin/User/changeStatus?method=forbidUser','禁用会员',-1,''),(131,'admin',2,'Admin/User/changeStatus?method=resumeUser','启用会员',-1,''),(132,'admin',2,'Admin/User/changeStatus?method=deleteUser','删除会员',-1,''),(133,'admin',2,'Admin/AuthManager/index','权限管理',-1,''),(134,'admin',2,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',-1,''),(135,'admin',2,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',-1,''),(136,'admin',2,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',-1,''),(137,'admin',2,'Admin/AuthManager/createGroup','新增',-1,''),(138,'admin',2,'Admin/AuthManager/editGroup','编辑',-1,''),(139,'admin',2,'Admin/AuthManager/writeGroup','保存用户组',-1,''),(140,'admin',2,'Admin/AuthManager/group','授权',-1,''),(141,'admin',2,'Admin/AuthManager/access','访问授权',-1,''),(142,'admin',2,'Admin/AuthManager/user','成员授权',-1,''),(143,'admin',2,'Admin/AuthManager/removeFromGroup','解除授权',-1,''),(144,'admin',2,'Admin/AuthManager/addToGroup','保存成员授权',-1,''),(145,'admin',2,'Admin/AuthManager/category','分类授权',-1,''),(146,'admin',2,'Admin/AuthManager/addToCategory','保存分类授权',-1,''),(147,'admin',2,'Admin/AuthManager/modelauth','模型授权',-1,''),(148,'admin',2,'Admin/AuthManager/addToModel','保存模型授权',-1,''),(149,'admin',2,'Admin/Addons/create','创建',-1,''),(150,'admin',2,'Admin/Addons/checkForm','检测创建',-1,''),(151,'admin',2,'Admin/Addons/preview','预览',-1,''),(152,'admin',2,'Admin/Addons/build','快速生成插件',-1,''),(153,'admin',2,'Admin/Addons/config','设置',-1,''),(154,'admin',2,'Admin/Addons/disable','禁用',-1,''),(155,'admin',2,'Admin/Addons/enable','启用',-1,''),(156,'admin',2,'Admin/Addons/install','安装',-1,''),(157,'admin',2,'Admin/Addons/uninstall','卸载',-1,''),(158,'admin',2,'Admin/Addons/saveconfig','更新配置',-1,''),(159,'admin',2,'Admin/Addons/adminList','插件后台列表',-1,''),(160,'admin',2,'Admin/Addons/execute','URL方式访问插件',-1,''),(161,'admin',2,'Admin/Addons/hooks','钩子管理',-1,''),(162,'admin',2,'Admin/Model/index','模型管理',-1,''),(163,'admin',2,'Admin/model/add','新增',-1,''),(164,'admin',2,'Admin/model/edit','编辑',-1,''),(165,'admin',2,'Admin/model/setStatus','改变状态',-1,''),(166,'admin',2,'Admin/model/update','保存数据',-1,''),(167,'admin',2,'Admin/Attribute/index','属性管理',-1,''),(168,'admin',2,'Admin/Attribute/add','新增',-1,''),(169,'admin',2,'Admin/Attribute/edit','编辑',-1,''),(170,'admin',2,'Admin/Attribute/setStatus','改变状态',-1,''),(171,'admin',2,'Admin/Attribute/update','保存数据',-1,''),(172,'admin',2,'Admin/Config/index','配置管理',-1,''),(173,'admin',2,'Admin/Config/edit','编辑',-1,''),(174,'admin',2,'Admin/Config/del','删除',-1,''),(175,'admin',2,'Admin/Config/add','新增',-1,''),(176,'admin',2,'Admin/Config/save','保存',-1,''),(177,'admin',2,'Admin/Menu/index','菜单管理',-1,''),(178,'admin',2,'Admin/Channel/index','导航管理',-1,''),(179,'admin',2,'Admin/Channel/add','新增',-1,''),(180,'admin',2,'Admin/Channel/edit','编辑',-1,''),(181,'admin',2,'Admin/Channel/del','删除',-1,''),(182,'admin',2,'Admin/Category/index','分类管理',-1,''),(183,'admin',2,'Admin/Category/edit','编辑',-1,''),(184,'admin',2,'Admin/Category/add','新增',-1,''),(185,'admin',2,'Admin/Category/remove','删除',-1,''),(186,'admin',2,'Admin/Category/move','移动',-1,''),(187,'admin',2,'Admin/Category/merge','合并',-1,''),(188,'admin',2,'Admin/Database/index?type=export','备份数据库',-1,''),(189,'admin',2,'Admin/Database/export','备份',-1,''),(190,'admin',2,'Admin/Database/optimize','优化表',-1,''),(191,'admin',2,'Admin/Database/repair','修复表',-1,''),(192,'admin',2,'Admin/Database/index?type=import','还原数据库',-1,''),(193,'admin',2,'Admin/Database/import','恢复',-1,''),(194,'admin',2,'Admin/Database/del','删除',-1,''),(195,'admin',2,'Admin/other','其他',1,''),(196,'admin',2,'Admin/Menu/add','新增',-1,''),(197,'admin',2,'Admin/Menu/edit','编辑',-1,''),(198,'admin',2,'Admin/Think/lists?model=article','应用',-1,''),(199,'admin',2,'Admin/Think/lists?model=download','下载管理',-1,''),(200,'admin',2,'Admin/Think/lists?model=config','应用',-1,''),(201,'admin',2,'Admin/Action/actionlog','行为日志',-1,''),(202,'admin',2,'Admin/User/updatePassword','修改密码',-1,''),(203,'admin',2,'Admin/User/updateNickname','修改昵称',-1,''),(204,'admin',2,'Admin/action/edit','查看行为日志',-1,''),(206,'admin',1,'Admin/think/edit','编辑数据',1,''),(207,'admin',1,'Admin/Menu/import','导入',1,''),(208,'admin',1,'Admin/Model/generate','生成',1,''),(209,'admin',1,'Admin/Addons/addHook','新增钩子',1,''),(210,'admin',1,'Admin/Addons/edithook','编辑钩子',1,''),(211,'admin',1,'Admin/Article/sort','文档排序',1,''),(212,'admin',1,'Admin/Config/sort','排序',1,''),(213,'admin',1,'Admin/Menu/sort','排序',1,''),(214,'admin',1,'Admin/Channel/sort','排序',1,''),(215,'admin',1,'Admin/Category/operate/type/move','移动',1,''),(216,'admin',1,'Admin/Category/operate/type/merge','合并',1,'');
/*!40000 ALTER TABLE `jb_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_category`
--

DROP TABLE IF EXISTS `jb_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_category` (
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
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_category`
--

LOCK TABLES `jb_category` WRITE;
/*!40000 ALTER TABLE `jb_category` DISABLE KEYS */;
INSERT INTO `jb_category` VALUES (49,'about','资料',0,0,10,'','','','','','','','2,3','2,3','2,1,3',0,1,1,0,0,'',NULL,1460900538,1460900538,1,0,''),(42,'huiyi','会议',41,0,10,'','','','','','','','2,3,4','2,3,4','2,1,3',0,1,1,0,0,'',NULL,1446023639,1446023703,1,0,''),(41,'all_huiyi','所有会议',0,0,10,'','','','','','','','2,3,4','2,3,4','2,1,3',0,1,1,0,0,'',NULL,1445236497,1446023680,1,0,''),(43,'match','比赛',41,0,10,'','','','','','','','2,3,4','2,3,4','2,1,3',0,1,1,0,0,'',NULL,1446023666,1446023713,1,0,''),(46,'jiabin','嘉宾',0,0,10,'','','','','','','','8','8','2,1,3',0,1,1,0,0,'',NULL,1460883704,1460883704,1,0,''),(47,'luntan','论坛',0,0,10,'','','','','','','','7','2,4','2,1,3',0,1,1,0,0,'',NULL,1460883746,1460886869,1,0,''),(48,'news','新闻',0,0,10,'','','','','','','','2','2,3','2',0,1,1,0,0,'',NULL,1460883788,1460883788,1,0,'');
/*!40000 ALTER TABLE `jb_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_channel`
--

DROP TABLE IF EXISTS `jb_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_channel` (
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_channel`
--

LOCK TABLES `jb_channel` WRITE;
/*!40000 ALTER TABLE `jb_channel` DISABLE KEYS */;
INSERT INTO `jb_channel` VALUES (1,0,'智博会官网','Index/index',1,1379475111,1460903258,1,0),(2,0,'论坛活动','Article/index?category=luntan',2,1379475131,1460903436,1,0),(7,0,'展会介绍','Article/detail?id=43',4,1460903367,1460903367,1,1),(5,0,'组织机构','Article/detail?id=42',3,1460903175,1460903175,1,0),(6,0,'联系我们','Article/detail?id=41',5,1460903216,1460903216,1,0);
/*!40000 ALTER TABLE `jb_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_config`
--

DROP TABLE IF EXISTS `jb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_config` (
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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_config`
--

LOCK TABLES `jb_config` WRITE;
/*!40000 ALTER TABLE `jb_config` DISABLE KEYS */;
INSERT INTO `jb_config` VALUES (1,'WEB_SITE_TITLE',1,'网站标题',1,'','网站标题前台显示标题',1378898976,1379235274,1,'智博会嘉宾网上报名系统',0),(2,'WEB_SITE_DESCRIPTION',2,'网站描述',1,'','网站搜索引擎描述',1378898976,1379235841,1,'宁波市智慧城市博览会是我国最早面向智慧城市领域的博览会，该博览会的组成采用的是1+N的形式，即一个高峰论坛和若干个行业论坛，如教育论坛、工业论坛、互联网论坛、医疗论坛等等',1),(3,'WEB_SITE_KEYWORD',2,'网站关键字',1,'','网站搜索引擎关键字',1378898976,1381390100,1,'',8),(4,'WEB_SITE_CLOSE',4,'关闭站点',1,'0:关闭,1:开启','站点关闭后其他用户不能访问，管理员可以正常访问',1378898976,1379235296,1,'1',1),(9,'CONFIG_TYPE_LIST',3,'配置类型列表',4,'','主要用于数据解析和页面表单的生成',1378898976,1379235348,1,'0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举',2),(10,'WEB_SITE_ICP',1,'网站备案号',1,'','设置在网站底部显示的备案号，如“沪ICP备12007941号-2',1378900335,1379235859,1,'',9),(11,'DOCUMENT_POSITION',3,'文档推荐位',2,'','文档推荐位，推荐到多个位置KEY值相加即可',1379053380,1379235329,1,'1:列表推荐\r\n2:频道推荐\r\n4:首页推荐',3),(12,'DOCUMENT_DISPLAY',3,'文档可见性',2,'','文章可见性仅影响前台显示，后台不收影响',1379056370,1379235322,1,'0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见',4),(13,'COLOR_STYLE',4,'后台色系',1,'default_color:默认\r\nblue_color:紫罗兰','后台颜色风格',1379122533,1379235904,1,'default_color',10),(20,'CONFIG_GROUP_LIST',3,'配置分组',4,'','配置分组',1379228036,1384418383,1,'1:基本\r\n2:内容\r\n3:用户\r\n4:系统',4),(21,'HOOKS_TYPE',3,'钩子的类型',4,'','类型 1-用于扩展显示内容，2-用于扩展业务处理',1379313397,1379313407,1,'1:视图\r\n2:控制器',6),(22,'AUTH_CONFIG',3,'Auth配置',4,'','自定义Auth.class.php类配置',1379409310,1379409564,1,'AUTH_ON:1\r\nAUTH_TYPE:2',8),(23,'OPEN_DRAFTBOX',4,'是否开启草稿功能',2,'0:关闭草稿功能\r\n1:开启草稿功能\r\n','新增文章时的草稿功能配置',1379484332,1379484591,1,'1',1),(24,'DRAFT_AOTOSAVE_INTERVAL',0,'自动保存草稿时间',2,'','自动保存草稿的时间间隔，单位：秒',1379484574,1386143323,1,'60',2),(25,'LIST_ROWS',0,'后台每页记录数',2,'','后台数据每页显示记录数',1379503896,1380427745,1,'10',10),(26,'USER_ALLOW_REGISTER',4,'是否允许用户注册',3,'0:关闭注册\r\n1:允许注册','是否开放用户注册',1379504487,1379504580,1,'1',3),(27,'CODEMIRROR_THEME',4,'预览插件的CodeMirror主题',4,'3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight','详情见CodeMirror官网',1379814385,1384740813,1,'ambiance',3),(28,'DATA_BACKUP_PATH',1,'数据库备份根路径',4,'','路径必须以 / 结尾',1381482411,1381482411,1,'./Data/',5),(29,'DATA_BACKUP_PART_SIZE',0,'数据库备份卷大小',4,'','该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M',1381482488,1381729564,1,'20971520',7),(30,'DATA_BACKUP_COMPRESS',4,'数据库备份文件是否启用压缩',4,'0:不压缩\r\n1:启用压缩','压缩备份文件需要PHP环境支持gzopen,gzwrite函数',1381713345,1381729544,1,'1',9),(31,'DATA_BACKUP_COMPRESS_LEVEL',4,'数据库备份文件压缩级别',4,'1:普通\r\n4:一般\r\n9:最高','数据库备份文件的压缩级别，该配置在开启压缩时生效',1381713408,1381713408,1,'9',10),(32,'DEVELOP_MODE',4,'开启开发者模式',4,'0:关闭\r\n1:开启','是否开启开发者模式',1383105995,1383291877,1,'1',11),(33,'ALLOW_VISIT',3,'不受限控制器方法',0,'','',1386644047,1386644741,1,'0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture',0),(34,'DENY_VISIT',3,'超管专限控制器方法',0,'','仅超级管理员可访问的控制器方法',1386644141,1386644659,1,'0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree',0),(35,'REPLY_LIST_ROWS',0,'回复列表每页条数',2,'','',1386645376,1387178083,1,'10',0),(36,'ADMIN_ALLOW_IP',2,'后台允许访问IP',4,'','多个用逗号分隔，如果不配置表示不限制IP访问',1387165454,1387165553,1,'',12),(37,'SHOW_PAGE_TRACE',4,'是否显示页面Trace',4,'0:关闭\r\n1:开启','是否显示页面Trace信息',1387165685,1387165685,1,'1',1);
/*!40000 ALTER TABLE `jb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_document`
--

DROP TABLE IF EXISTS `jb_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
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
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_document`
--

LOCK TABLES `jb_document` WRITE;
/*!40000 ALTER TABLE `jb_document` DISABLE KEYS */;
INSERT INTO `jb_document` VALUES (1,1,'','宁波工程学院高端会议',42,0,'期待已久的OneThink最新版发布',0,0,4,2,0,0,0,1,0,0,16,0,0,0,1446108828,1446108828,1),(43,1,'','展会介绍',49,0,'展会介绍',0,0,2,1,0,0,0,1,0,0,3,0,0,0,1460902468,1460902468,1),(38,1,'','高交会2014中国智慧城市专馆',47,0,'为推动中国智慧城市有序建设及健康发展，由商务部、国家发改委、工信部、科学技术部等十大部委以及深圳市政府主办、由国家信息中心和IDG国际数据集团联合承办的“高交会2014中国智慧城市专馆”将于11月在深圳会展中心隆重举行。\r\n',28,28,4,2,4,0,11,1,0,0,88,0,0,0,1460911944,1460911944,1),(6,1,'','智慧城市发展高峰论坛',42,0,'',0,0,4,2,0,0,5,1,0,0,91,0,0,0,1446085766,1446085766,1),(7,1,'','智慧健康高层论坛',42,0,'',0,0,4,2,0,0,7,1,0,0,5,0,0,0,1446085926,1446085926,1),(8,1,'','全国智慧教育高层论坛',42,0,'',0,0,4,2,0,0,6,1,0,0,4,0,0,0,1446085868,1446085868,1),(9,1,'','第三届智慧城市建设创新交流大会',42,0,'',0,0,4,2,0,0,4,1,0,0,5,0,0,0,1446085623,1446085623,1),(10,1,'','中国（宁波）创客创业大赛决赛',43,0,'',0,0,4,2,0,0,0,1,0,0,5,0,0,0,1445305980,1445305980,1),(11,1,'','健康类智能可穿戴设备国际论坛',42,0,'',0,0,4,2,0,0,0,1,0,0,6,0,0,0,1445305846,1445305846,1),(12,1,'','物联网智能化应用与服务高层论坛',42,0,'',0,0,4,2,0,0,0,1,0,0,6,0,0,0,1445305681,1445305681,1),(13,1,'','数字文化产业发展高层论坛',42,0,'',0,0,4,2,0,0,0,1,0,0,2,0,0,0,1445305607,1445305607,1),(14,1,'','甬港澳台青年华商创业创新合作论坛',42,0,'',0,0,4,2,0,0,0,1,0,0,9,0,0,0,1445305445,1445305445,1),(15,1,'','智能制造2025高层论坛',42,0,'',0,0,4,2,0,0,0,1,0,0,6,0,0,0,1445927721,1445927721,1),(16,1,'ss','两岸物联网与智慧服务产业发展论坛',42,0,'',0,0,4,2,0,0,0,1,0,0,6,0,0,0,1445927416,1445927416,1),(17,1,'zhyqfzlt','智慧园区发展论坛',42,0,'',0,0,4,2,0,0,0,1,0,0,20,0,0,0,1460389109,1460389109,1),(39,1,'','中国智慧城市发展指数推动智慧城市标准建设',47,0,'由钱学森先生倡导创办的中国智慧工程研究会８月２８日在北京发布中国智慧城市（镇）发展指数',28,28,2,2,0,0,0,1,0,0,1,0,0,0,1460887380,1460914631,1),(36,1,'','会议',47,0,'qweqwe',28,28,4,2,0,0,0,1,0,0,0,0,0,0,1460886876,1460886876,3),(40,1,'','智慧城市发展高峰论坛表情-杨学山',47,0,'智慧城市发展高峰论坛表情-杨学山',28,28,2,2,0,0,14,1,0,0,3,0,0,0,1460887560,1460914512,1),(41,1,'contact_us','联系我们',49,0,'报名说明',0,0,2,2,0,0,0,1,0,0,40,0,0,0,1460900640,1460901605,1),(42,1,'','组织机构',49,0,'',0,0,2,2,0,0,0,1,0,0,9,0,0,0,1460902339,1460902339,1),(28,1,'zhcsfzgflt','智慧城市发展高峰论坛',47,0,'为推动中国智慧城市有序建设及健康发展，由商务部、国家发改委、工信部、科学技术部等十大部委以及深圳市政府主办、由国家信息中心和IDG国际数据集团联合承办的“高交会2014中国智慧城市专馆”将于11月在深圳会展中心隆重举行。\r\n\r\n\r\n',0,0,7,1,0,0,9,1,0,0,29,0,0,0,1460914053,1460914053,1),(44,1,'','展会概要',49,0,'',43,43,2,2,0,0,0,1,0,0,0,0,0,0,1460902508,1460902508,1),(45,1,'','姚上天',46,0,'1990年被国家科委选聘为国家智能计算机研究开发中心主任，1999年12月至今担任中国科学院计算技术研究所所长。2004年5月兼任中国科学技术大学计算机科学技术系主任。',0,0,8,2,0,0,12,1,0,0,2,0,0,0,1460903820,1460911411,1),(46,1,'','',47,0,'',28,28,4,2,0,0,13,1,0,0,0,0,0,0,1460912430,1460912430,3),(47,1,'zhjkgclt','智慧健康高层论坛',47,0,'论坛时间\r\n\r\n2014年9月11日上午9:00-12:00\r\n\r\n论坛地点\r\n\r\n宁波泛太平洋酒店\r\n\r\n论坛嘉宾\r\n\r\n（待定中……）',0,0,7,1,0,0,13,1,0,0,10,0,0,0,1460912990,1460912990,1),(48,1,'','宁波云医院的探索与实践',47,0,'宁波云医院的探索与实践',47,47,4,2,0,0,0,1,0,0,1,0,0,0,1460915711,1460915711,1),(49,1,'zhyqfzlt','智慧园区发展论坛',47,0,'为了更好地贯彻“智慧浙江”建设的重大战略举措，由省发改委、省经信委、省科技厅、省商务厅等省政府相关部门指导，浙江日报报业集团主办，富春硅谷协办的以“建设智慧园区，共赢城市未来”为主题的首届浙江智慧园区发展高峰论坛7月23日在杭举行。',0,0,7,1,0,0,13,1,0,0,2,0,0,0,1460913924,1460913924,1),(50,1,'','智慧城市发展指数出台',47,0,'用于评估城市经营、服务信息化水平的“中国智慧城市（镇）发展指数”，28日正式发布，成为我国第一套有关智慧城市建设的指标体系。',28,28,2,2,0,0,0,1,0,0,0,0,0,0,1460914710,1460914710,1),(51,1,'','全国首个可刷银行卡的菜市场在我市诞生',47,0,' “菜市场买菜也可以刷卡支付啦！”昨天早上7点，正提着菜篮子在南苑菜市场张罗采购的“马大嫂”们一听说这消息，都新奇地围上来：只见市民陈先生挑完3条新鲜的马面鱼，过秤后，便从容地从口袋里掏出一张金融IC卡，在经营户手中的M-POS机上“嘀”地刷了一下，支付便成功了',49,49,2,2,0,0,0,1,0,0,0,0,0,0,1460914788,1460914788,1),(52,1,'','智慧城市：未来城镇发展的方向',47,0,'2011年8月28日，由中国智慧工程研究会举办的中国智慧城市（镇）发展指数新闻发布会在钓鱼台国宾馆举行。国家发改委、工信部、科技部、中国科学院、中国社会科学院等有关部门官员、专家共100多人出席，全国人大常委会副委员长周铁农、第十届全国政协副主席李蒙出席发布会。',28,28,2,2,0,0,0,1,0,0,0,0,0,0,1460914918,1460914918,1),(53,1,'','建智慧城市5年要投407亿元',47,0,'“十二五”期间，宁波智慧城市建设总投资４０７亿元，建设共３０项工程８７个项目。',28,28,2,2,0,0,14,1,0,0,1,0,0,0,1460914980,1460917905,1),(54,1,'','平安城市建设是智能家居市场势起催化剂',47,0,'智能家居有可能成为炙手可热的产品，但由于其自身存在的价格、技术、标准等诸多瓶颈，普及面临严峻考验。智能小区的出现无疑是“柳暗花明又一村”，住宅智能化成为小区发展的新趋势。',28,28,2,2,0,0,14,1,0,0,1,0,0,0,1460914980,1460917826,1),(55,1,'','卢朝霞',46,0,'1993年获政府特殊津贴，1995年晋升为教授。曾多次被评为东北大学科研先进个人、沈阳市优秀教师、辽宁省优秀科研工作者，获2000年全国“杰出创业女性”等荣誉称号。',0,0,8,2,0,0,15,1,0,0,0,0,0,0,1460915416,1460915416,1),(56,1,'','互联网医疗重构医疗服务模式',47,0,'互联网在医疗方面发挥的作用可以用这句诗来描述：“忽如一夜春风来，千树万树梨花开。”近来，“未来医院”“智慧医疗”“微信医院”“空中医院”“云医院”等词汇频频出现，一场以信息化技术为支撑的互联网医疗大戏正在上演。',47,47,4,2,4,0,16,1,0,0,0,0,0,0,1460915697,1460915697,1),(57,1,'','科技助力提升智慧城市竞争力',47,0,'这是一个知识经济的时代，无数创意火花让世界更加生动。',28,28,4,2,4,0,13,1,0,0,23,0,0,0,1460916220,1460916220,1),(58,1,'','王阳',46,0,'王阳，1998年，加入IBM公司，后成为IBM全球服务部高级项目总监。并于2008年，IBM高级副总裁兼IBM中国开发中心总经理。\r\n2016年3月1日，官方发布消息，原IBM全球副总裁兼中国开发中心总经理王阳正式加盟了赛伯乐投资集团',0,0,8,2,0,0,19,1,0,0,0,0,0,0,1460916060,1460916383,1),(59,1,'','第五届智博会落幕项目总投资逾70亿',47,0,'第五届智博会落幕项目总投资逾70亿',28,28,2,2,0,0,20,1,0,0,0,0,0,0,1460918130,1460918130,1);
/*!40000 ALTER TABLE `jb_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_document_article`
--

DROP TABLE IF EXISTS `jb_document_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_document_article`
--

LOCK TABLES `jb_document_article` WRITE;
/*!40000 ALTER TABLE `jb_document_article` DISABLE KEYS */;
INSERT INTO `jb_document_article` VALUES (1,0,'<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>','',0),(39,0,'<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:21px;background-color:#FFFFFF;\">　　</span>由钱学森先生倡导创办的中国智慧工程研究会８月２８日在北京发布中国智慧城市（镇）发展指数，首次提出用幸福指数、管理指数、社会责任指数等三个指标推动中国智慧城市标准建设、促进以人为本的智慧城市创建，中国智慧城市（镇）发展指数评估体系包含３个一级指标，就业和收入、医疗卫生、社会安全等２３项二级指标以及信息和网络化水平等８６项三级指标和３６２项四级细分指标。目前我国已有上百个地区提出建设智慧城市，２８个省市将物联网作为产业发展重点，８０％以上城市将物联网列为主导产业。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　随着信息网络技术日新月异发展，各国高度重视国家创新体系建设。2009年1月28日，奥巴马就任美国总统后，与美国工商业领袖举行了一次“圆桌会议”，作为仅有的两名代表之一，IBM 首席执行官彭明盛首次提出“智慧地球”这一概念，建议新政府投资新一代的智慧型基础设施。智慧地球也称为智能地球，就是把感应器嵌入和装备到电网、铁路、桥梁、隧道、公路、建筑、供水系统、大坝、油气管道等各种物体中，并且被普遍连接，形成所谓“物联网”，然后将“物联网”与现有的互联网整合起来，实现人类社会与物理系统的整合。2004年3月，韩国政府提出“U-KOREA”发展战略，希望将韩国提前进入智能社会。2006年6月，新加坡政府启动“智慧国际化”iN2015计划，主要探讨未来十年内包括感应技术、生物识别、纳米科技等技术发展趋势。2009年7月，日本政府IT战略本部制订《i-Japan 2015战略》，拟在2015年实现以人为本“安心却充满活力的数字化社会”。2010年9月，瑞典斯德哥尔摩开始实施“智慧城市”发展战略。我国上海、南京、台湾等城市纷纷提出建设智慧城市战略。中国台湾在2008年将“智慧台湾”作为发展政策主轴的重点，在安全防灾、医疗照护、节能永续、智慧便捷、舒适便利、农业休闲等六大领域开展智慧生活科技创新应用的服务示范。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　中国智慧工程研究会联合中国科学院、中国社科院、中国工程院、清华大学、北京大学等专家参照美国、欧盟、日本、新加坡、中国台湾等发达国家和地区的智慧城市实践经验，结合我国国情及国家十二五规划，提出我国第一套有关智慧城市建设的指标体系，大力开展中国智慧城市建设，将信息技术与先进的城市经营服务理念进行有效融合，通过对城市的地理、资源、环境、经济等进行数字网络化管理，为城市提供更便捷、高效、灵活的公共管理的创新服务模式，将是“十二五”提高城镇化质量、推进城市生产、生活和管理方式创新的重要举措。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　专家认为，科学编制中国智慧城市建设的指标体系、推动发展中国智慧城市，是提高城镇化质量、推进内涵型城镇化建设的重要举措，有助于提高市民的生活幸福感，推进城市生产、生活和管理方式创新，构建“便捷、舒适、高效、安全”生活方式。\r\n</p>','',0),(40,0,'<p align=\"center\" style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<img src=\"http://www.cnsce.net/js/kindedit/attached/image/20120526/20120526062154_20395.jpg\" alt=\"智慧城市发展高峰论坛表情-杨学山 \" />\r\n</p>\r\n<div style=\"border:0px;color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;text-align:center;background-color:#FFFFFF;\">\r\n	工业和信息化部副部长 杨学山\r\n</div>','',0),(41,0,'<h1 style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;text-align:-webkit-center;font-size:22px;background-color:#FFFFFF;\">\r\n	<h3 style=\"text-align:left;font-size:14px;\">\r\n		<strong><span style=\"font-size:14px;\">智博会组委会</span></strong>\r\n	</h3>\r\n	<p style=\"text-align:left;\">\r\n		<span style=\"font-weight:normal;line-height:1.5;\"><span style=\"font-size:14px;\">招展热线：0574-87011807</span><br />\r\n</span><span style=\"font-weight:normal;line-height:1.5;\"><span style=\"font-size:14px;\">招商热线：0574-87011820</span><br />\r\n</span><span style=\"font-weight:normal;line-height:1.5;\"><span style=\"font-size:14px;\">公司传真：0574-87011805&nbsp;</span><br />\r\n</span><span style=\"font-weight:normal;line-height:1.5;\"><span style=\"font-size:14px;\">官方网址：www.cnsce.net</span><br />\r\n</span><span style=\"font-weight:normal;line-height:1.5;\"><span style=\"font-size:14px;\">电子邮箱：info@cnsce.net</span><br />\r\n</span><span style=\"font-weight:normal;line-height:1.5;\"><span style=\"font-size:14px;\">邮政编码：315040&nbsp;</span><br />\r\n</span><span style=\"font-weight:normal;line-height:1.5;font-size:14px;\">详细地址：浙江省宁波市江东区会展路181号宁波国际会展中心行政楼A3楼</span> \r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n</h1>','',0),(42,0,'<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong>主办单位</strong>：\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	工业和信息化部&nbsp;&nbsp; 国家新闻出版广电总局&nbsp; 中国科学院&nbsp; 中国工程院&nbsp;&nbsp;中国电信集团公司&nbsp; 中国移动通信集团公司&nbsp; 中国联合网络通信集团有限公司&nbsp; 浙江省人民政府\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n<strong>支持单位</strong>：\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	中国航天科工集团公司&nbsp; 中国电子科技集团公司\r\n</p>\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"></span><span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"></span>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n<strong>承办单位</strong>：\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	宁波市人民政府\r\n</p>\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"></span><span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"></span>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n<strong>执行承办</strong>：\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	宁波市智慧城市建设工作领导小组办公室&nbsp;&nbsp;宁波市文化广电新闻出版局&nbsp;&nbsp; 宁波市科学技术局 宁波杭州湾新区管委会&nbsp; 宁波国家高新区管委会\r\n</p>\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"></span><span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"></span>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n<strong>展览执行承办</strong>：\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	宁波市国际贸易投资发展有限公司\r\n</p>','',0),(43,0,'','',0),(44,0,'<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;text-indent:24pt;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12pt;font-family:仿宋;\">中国智慧城市技术与应用产品博览会（以下简称“智博会”）是由工业和信息化部、国家新闻出版广电总局、中国科学院、中国工程院、中国电信集团公司、中国移动通信集团公司、中国联合网络通信集团有限公司、浙江省人民政府等八大省部级单位共同主办，是中国首个以“智慧城市”为主题的国家级重点展会，也是“十二五“规划期间重点培育的展会之一。智博会始创于2011年，一年一届，宁波是智博会的永久举办地。</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;text-indent:24pt;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12pt;font-family:仿宋;\">智博会在成功举办四届的基础上，对推动国内智慧城市建设、发展信息经济、智慧化、促进两化融合等方面发挥了重要作用。智博会已然成为目前国内智慧城市领域最高规格、最大规模、最具实效、最具业界影响力的行业盛会。</span>\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;text-indent:24pt;background-color:#FFFFFF;\">\r\n	<span style=\"font-size:12pt;font-family:仿宋;\">第五届智博会将充分发挥各主办单位的优势，进行智慧城市、信息经济、两化融合展览展示、主题论坛、项目签约等活动。展览部分以展示新技术、新案例为导向，以智慧城市建设解决方案和两化融合前沿技术为载体，以供需对接为手段，紧贴行业需求，展示智慧城市建设的前沿技术和实际应用成果；同时</span><span style=\"font-size:12pt;font-family:仿宋;\">推动移动互联网、云计算、大数据、物联网等与现代制造业结合，促进智能制造、工业互联网和互联网金融等产业的健康发展。主题论坛将更好地汇集智慧城市建设和两化融合领域行业精英，重点引入“智慧城市”、“互联网+”、“工业4.0”、“智能硬件”、“可穿戴设备”等主题，共同探讨新理念、新模式、新经验。&nbsp;</span>\r\n</p>','',0),(50,0,'<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;记者 叶静宇</strong>&nbsp;用于评估城市经营、服务信息化水平的“中国智慧城市（镇）发展指数”，28日正式发布，成为我国第一套有关智慧城市建设的指标体系。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　所谓“智慧城市”，与IBM首席执行官彭明盛首次提出“智慧地球”这一概念类似，是指把感应器嵌入和装备到电网、铁路、桥梁、隧道、公路、建筑、供水系统、大坝、油气管道等各种物体中，并且被普遍连接，形成所谓“物联网”，然后将“物联网”与现有的互联网整合起来，为城市提供更便捷、高效、灵活的公共管理的创新服务模式，实现人类社会与物理系统的整合。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　从2004年起，韩国、新加坡、美国、日本、瑞典等国先后开始实施“智慧城市”发展战略。目前我国也已有上百个地区提出建设智慧城市，28个省市将物联网作为产业发展重点，80%以上城市将物联网列为主导产业。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　中国智慧工程研究会联合中国科学院、中国社科院、中国工程院、清华大学、北京大学等专家，参照美国、欧盟、日本、新加坡、中国台湾等发达国家和地区的智慧城市实践经验，结合我国国情及国家十二五规划，提出我国第一套有关智慧城市建设的指标体系。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　据中国智慧工程研究会副会长兼秘书长隆晨介绍，“中国智慧城市（镇）发展指数”提出智慧城市发展指标体系的三大方面，即智慧城市幸福指数、智慧城市管理指数、智慧城市社会责任指数。该套指数体系包含３个一级指标，就业和收入、医疗卫生、社会安全等２３项二级指标以及信息和网络化水平等８６项三级指标和３６２项四级细分指标。\r\n</p>','',0),(51,0,'<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“菜市场买菜也可以刷卡支付啦！”昨天早上7点，正提着菜篮子在南苑菜市场张罗采购的“马大嫂”们一听说这消息，都新奇地围上来：只见市民陈先生挑完3条新鲜的马面鱼，过秤后，便从容地从口袋里掏出一张金融IC卡，在经营户手中的M-POS机上“嘀”地刷了一下，支付便成功了。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　昨天，全国首个可刷金融IC卡的菜市场在我市诞生，让逛南苑菜市场的居民激动了一番。“以后上菜市场不仅不用担心找零的麻烦，甚至连现金都不需要带了，真是不错。”市民李女士称。而菜贩们也纷纷表示，如果这种买菜支付方式能够普及，也可以省去点钱、算账的麻烦。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　据悉，利用我市先行推出的金融IC卡(市民卡)其中的电子钱包功能，人行市中心支行联合宁波市商贸集团公司、发卡银行、银联、银联商务等单位，在海曙区南苑菜市场率先推出了小额便民支付试点，选择10个商户作为金融IC卡(市民卡)的受理点。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　市民在菜市场购物消费时，只要持卡在市场摊位受理设备上进行刷卡，交易数据便直接保存在受理设备上。营业结束后，商户业主将该设备连接电话线，传送刷卡数据到银行卡业务清算系统，商户将在下一工作日便能收到前日营业款项。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　记者在现场看到，先行设点的摊位涵盖了水产、肉类、蔬菜、禽蛋、副食品等不同食品类型，边上纷纷挂上了明显的“银联”标识，供市民辨识。已经持有市民卡的，闻讯忙拿出卡片体验一把。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　人行市中心支行会计财务处有关负责人孙震向记者介绍，“这样的小额便民支付主要利用了市民卡电子钱包所具有的多重特性，使顾客在支付过程中避免找零，带来方便、快捷和卫生等诸多便利。”\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	　　来自宁波银联的最新统计数据显示，截至今年2月底，我市辖内金融IC卡发行量已突破82万张，受理IC卡商户数量超过2万户。“金融IC卡在南苑菜市场的推广应用，让市民逛菜市场有逛超市卖场的感觉。目前，高塘、中心、咏归等大型菜市场也已开始了相关业务的洽谈和筹备。”宁波银联市场部副总经理谢斌称。业内人士还进一步向记者透露，下阶段，金融IC卡小额便民支付方式还将在小型便利店、快餐店、流动早餐点进一步推广。\r\n</p>','',0),(52,0,'<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:21px;background-color:#FFFFFF;\">　　</span>2011年8月28日，由中国智慧工程研究会举办的中国智慧城市（镇）发展指数新闻发布会在钓鱼台国宾馆举行。国家发改委、工信部、科技部、中国科学院、中国社会科学院等有关部门官员、专家共100多人出席，全国人大常委会副委员长周铁农、第十届全国政协副主席李蒙出席发布会。<br />\r\n　　智慧城市是继数字城市和智能城市之后出现的一个新概念，是信息化、工业化与城镇化建设的一个深度融合，是城市信息化的高级形态。发展智慧城市是提高城镇化质量、推进城镇现代化建设的重要步骤，也是城市经济增长的倍增器和社区和谐发展的转换器。同时，智慧城市建设内涵非常广泛，包括城市经济信息化、城市社会管理智能化、环境维护自动化和居民生活便捷化等多方面的内容。\r\n</p>\r\n<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n　　智慧城市这一概念出现时间不长，一般认为，2009年1月28日IBM首席执行官彭明盛首次正式提出“智慧城市”这一概念。但智慧城市、智慧社会建设要早于这个时间，如韩国政府在2004年3月就推出了U-Korea发展战略，力求将韩国城市乃至全国提前推入智能社会；欧盟2005年7月开始实施“2010战略”，致力发展最新通信技术、网络技术、新媒体、新服务，并在2007年提出和开始推行一整套智慧城市建设方案；2009年9月IBM与美国迪比克市也共同宣布启动了美国第一个智慧城市建设。此外，奥巴马政府已将智能电网项目作为其绿色振兴经济计划的关键性支撑之一。<br />\r\n　　智慧城市概念引入国内之后，引起广泛关注和响应。目前，已经有上百个地区提出要开展智慧城市建设，一些省、市将其作为“十二五”时期加快经济发展和经济发展转型的战略导向和重要抓手，80%以上的城市将物联网列为智慧城市建设的主导产业。当前，中国正处于城市化加速发展阶段，推进信息化、现代化、幸福化、和谐化是“十二五”时期中国城镇建设转型与发展的核心内容之一。建设幸福城市、智慧城市、和谐城市是提高城镇经济发展效率、管理水平，构建便捷、舒适、高效、安全、环境美好和居民幸福的原本之义。<br />\r\n　　鉴于国内外建设智慧城市的热潮已经蔚然成风，创建、发展智慧城市成为目前及未来城镇发展不可避免的方向选择，建设智慧城市是转变城市外延型发展模式与生活消费模式、保障社会可持续发展、促进传统产业升级、培育战略性新兴产业、节能减排、推动整个经济发展模式转变和促进社会和谐发展的重要推手。<br />\r\n　　为引导、促进智慧城市创建，中国智慧工程研究会经过一年多的调研和筹备，结合发达国家和地区建设智慧城市的经验以及中国国情和“十二五”规划，制定了迄今为止我国第一套智慧城市建设的评价指标体系。该指标体系分设幸福指数、管理指数和社会责任指数等一级指标3项，就业与收入、医疗卫生、社会安全、科技创新等二级指标23项，信息与网络化水平等三级指标86项，以及社区心理援助、志愿文化等四级细分指标362项，形成了一个囊括宽领域、多层面、广含义的智慧城市指标体系。\r\n</p>','',0),(53,0,'<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"><span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　</span>智慧城市建设汇人之慧，赋物以智。即将出台的《宁波市加快创建智慧城市行动纲要（２０１１—２０１５）》定下了新目标——到２０１５年，宁波信息化水平继续保持全国领先，智慧城市智慧应用体系、智慧产业基地、智慧基础设施和居民信息应用能力建设取得明显成效。建成一批智慧城市示范工程，智慧城市应用商业模式创建和标准化建设走在全国前列，力争在优势领域形成对智慧城市建设的引领能力，为建成智慧城市奠定基础。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　“十二五”期间，宁波智慧城市建设总投资４０７亿元，建设共３０项工程８７个项目。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　十大应用体系让市民享受智慧服务</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧物流体系。加快宁波港智慧港口建设，进一步完善第四方物流市场、电子口岸等服务平台，加快推进智慧口岸和宁波梅山保税港区、镇海大宗货物海铁联运物流枢纽港、宁波“三位一体”港航物流服务体系等现代物流服务系统建设，形成高水平、个性化的现代物流体系。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧制造体系。在机械装备、精细化工、生物医药、电工电器、纺织服装等重点制造行业，推广适用的信息化辅助设计系统和制造系统，推动制造过程逐步向信息化制造的高级阶段发展。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧贸易体系。建设国际国内贸易服务网络和信息平台，促进贸易体系内外对接。以宁波国际贸易示范区为龙头，建设集贸易、物流、金融和口岸服务于一体的专业国际贸易服务平台，打造一批智慧型进出口专业市场。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧能源应用体系。发展风能、太阳能等可再生能源和新能源产业，优化能源供给结构，实现能源产业的可持续发展。重点推进智慧电能建设，加快智慧技术在发电、输电、配电、供电、用电服务等环节广泛应用。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧公共服务体系。全面推进面向市民的住房、教育、就业、文化、社会保障、供电、供水、供气、防灾减灾等公共服务智慧应用系统建设；大力推进面向企业的行政审批、公共资源交易、投资融资、科技信息、产品供销等公共服务信息平台建设；推进８１８９０市民呼叫服务中心建设，提升服务功能。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧社会管理体系。推进社会治安监控、灾难预警、应急处置、安全生产监管、食品药品安全监管、环境监测、口岸疫情预警等信息系统建设，完善公共安全事件应急处置机制。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧交通体系。推进综合交通服务和管理系统、交通诱导系统、交通应急指挥系统、数字公路综合信息服务系统、出租车与公交车及轨道车辆智能服务管理系统、电子收费系统、港口信息管理系统、港航信息监控中心等智慧交通应用系统建设。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧健康保障体系。建设覆盖城乡各类卫生医疗机构的信息化网络体系，重点建设医疗急救系统、远程挂号系统、电子收费系统、电子健康档案、数字化图文体检诊断查询系统、数字远程医疗系统等智慧医疗系统。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧安居服务体系。研究制定智慧社区安居标准规范，加快智慧家居系统、智慧楼宇、智慧社区建设，为市民提供更加便利、更加舒适、更加放心的家庭服务、养老服务和社区服务。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　构建智慧文化服务体系。加强新闻出版、广播影视、文学艺术等行业的信息化建设，整合文化信息资源，开发文化娱乐产品，促进数字电视、电子娱乐、电子书刊、数字图书馆发展。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　目标：到２０１５年，实现智慧物流、智慧健康保障和智慧社会管理三大应用体系建设，力争达到国内先进水平。在全国率先进入示范性智慧物流节点城市行列，全市８０％规模以上物流企业实现物流业务网络化，先进物流技术、设备在港口物流领域普遍应用，集装箱智能化应用达到１００％。网上就诊预约、网上诊疗信息查询、网上医疗咨询、远程医疗等服务更加普及，医疗卫生机构诊疗信息共享基本实现。机动车、非机动车电子车牌上牌率达到１００％。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　六大产业基地建设 实现产业智能化</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　如何形成现代产业体系，未来五年，宁波将引领产业智能化，重点培育智慧产业基地。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　建设网络数据基地。着力提升政府数据中心、互联网交换中心和数据灾备中心的建设水平，加快培育和建设物联网公共服务平台，加快引进移动通信数据中心、金融数据处理中心等一批面向重点行业应用的数据中心项目，大力推动云计算中心。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　建设软件研发推广产业基地。大力推进智慧城市十大智慧应用系统软件研发与推广应用。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　建设智慧装备和产品研发与制造基地。加快制造企业的转型升级。依托宁波杭州湾新区、宁波保税区等重点功能区域及各县（市）区，推动现代装备制造产业基地建设，培育发展各类新兴制造产业集群。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　建设智慧服务业示范推广基地。加快传统服务企业向智能化现代服务企业转型。重点培育和提升现代物流、高端商务、旅游休闲、文化创意等服务业发展。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　建设智慧农业示范推广基地。重点依托余姚滨海、宁波杭州湾和宁海浙东10万亩农业循环经济示范区等现代农业综合开发区以及各县（市）区的特色农业产业基地、都市农业园区，推广应用信息化管理系统、农业专家咨询服务系统和农业电子商务，逐步实现农产品生产、加工、储藏、运输和市场营销等领域和环节的科学化和智能化。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　建设智慧企业总部基地。鼓励总体实力较强、管理基础较好的装备制造、石化、新材料、纺织服装、文具模具等总部企业，加快智慧技术在研发、制造、管理和营销等环节的应用，培育形成一批智慧型的企业总部。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　目标：到２０１５年，实现５０％以上规模企业生产经营全面实现自动化、集成化、网络化、智能化和协同化。实现新一代信息技术产业销售收入超１４２０亿元，年均增长１７％，在全市国民经济和社会发展中发挥更加重要的支撑和带动作用。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　新一代信息基础建设：打造随时随地随需的泛在网络</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　智慧应用体系和智慧产业基地的构建都离不开信息基础设施的建设，宁波将坚持基础先行的原则，大力推进城市信息基础设施。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　着力构建新一代信息网络基础设施。加快物联网试点推广，加快推进光纤到户、下一代互联网、下一代广播电视网和第三代移动通信网络的建设，开展第四代移动通信网络试点，努力构建“随时随地随需”的泛在网络。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　推进互联网、电信网、广电网“三网融合”，加大内容资源开发和业务创新，并且先在杭州湾新区进行试点，再逐步向全市推广。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　推进信息资源开发利用和整合共享，全面发挥信息资源开发利用在智慧城市建设中的作用。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　加强信息安全基础建设。强化互联网安全管理，建立网上身份认证（实名）制，强化互联网运营商和联网单位的信息安全的管理职责。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　推进城市基础设施感知化建设。推进电力、煤气、天然气、航空、防灾等感知化建设。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　目标：到２０１５年，实现无线城市和网络融合建设水平走在全国前列，互联网城域出口带宽达到２０００Ｇ以上，互联网宽带接入率达到９６％以上，无线宽带网络覆盖率达到９８％以上，全市有线广电网络基本完成双向数字化改造。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　从“智能”到“智慧” 需要人人参与</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　智慧城市是大众的智慧城市，需要人人应用和参与。大力推进居民信息应用能力建设，是目前智慧城市创建的重要内容。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　推进智慧城市知识普及化。统筹教学资源，利用各种载体，采取多种方式，深入开展智慧城市科普工作，提升居民的信息化素养、知识学习能力和信息消费水平。制定系统培训计划，落实培训措施，抓好各级领导、机关干部和企业家的培训。在学校和社区积极开展居民信息技能教育和培训。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　推进“数字乡村”建设，为农村居民提供信息查询、远程教育、文化娱乐、村务管理、电子政务和网上交易等服务，提升新农村建设水平。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　目标：到２０１５年，全市公民具备基本科学素质的比例达到１０％左右，走在浙江省前列。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　“十二五”期间，宁波将引进创建智慧城市的各类拔尖人才１００人、海外高层次留学人才２５００人、急需紧缺专门人才５０００人以上，柔性引进外国专家（海外工程师）２０００人以上。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　见习记者 彭莹&nbsp;</span>','',0),(54,0,'<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\"><span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　</span>随着我国国力的不断发展，人民的生活水平日益提高，居住环境在日新月异的科学发展中不断改善，21世纪人类社会进入城市数字化，对住宅的安全性和舒适性提出了更高的要求。智能家居有可能成为炙手可热的产品，但由于其自身存在的价格、技术、标准等诸多瓶颈，普及面临严峻考验。智能小区的出现无疑是“柳暗花明又一村”，住宅智能化成为小区发展的新趋势。智能小区提供了方便快捷的信息通道，安保系统、楼控系统，为小区居民创造了安全舒适的居住环境，高效便利的物业管理、信息服务系统，这些都为智能家居的发展奠定了基础。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　在我国，城市住宅的主要结构是小区。目前，城市周边农村的居住模式也在向小区发展。智能小区的智能化系统功能设置，一般有综合布线、安防监控、门禁管理、防盗报警、楼宇对讲、三表抄送、宽带接入、紧急求助、设备控制、计算机物业管理等智能化子系统，笔者认为其中宽带接入、安防监控、综合布线是主要构建系统。智能小区所提供的是商品化住宅产品，是面向社会的个人家庭销售。据业内人士分析表示，智能小区的建设必须坚持“经济性”、“可靠性”、“开放性”和“可持续发展性”4项原则。其中“经济性”是关键。我国是发展中国家，有能力购买智能家居产品的家庭毕竟在少数，而智能小区则不同，它由开发商通过2次销售给居民，具有兼容性强，包含范围广，造价较低的特点。智能小区的服务范围是整个小区，小区的所有住户都能享受到智能化住宅带来的方便快捷。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　目前，智能家居的门槛较高，发展始终举步维艰，而智能小区的崛起却如雨后春笋一般，借助三网融合和物联网的推进，平安城市建设的发展，智能小区已逐渐走向成熟。现如今，我国已有不少小区达到较高的智能化标准，智能生活已惠及千家万户，智能小区的内涵也在不断地丰富。家居要实现智能化必须要有配套的通信条件，智能家居的安保系统、信息服务系统、楼宇设备自控系统也往往不可能独立存在，小区智能化的实现为智能家居的发展奠定了基础。智能化的最终发展趋势就是高度系统集成，用一个智能平台实现整个小区智能化并与家庭联网会减少很多硬件成本的投资，同时也能实现真正的从城市智能化到小区智能化再到家庭智能化的信息互通与资源共享。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　随着我国3111工程的推进，创建平安城市和建设和谐社会的深入，无疑对智能小区的发展起到催化的作用。据相关资料统计，预计未来5年中国的智能化小区将以30%的速度增长。国家对智能小区的建设十分重视，建设部早在1999年4月和12月两次下发《全国住宅小区智能化技术示范工程工作大纲》和《全国住宅小区智能化系统示范工程建设要点与技术导则》，对智能小区建设进行规范指导。</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">&nbsp;</span><br />\r\n<span style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">　　推进小区智能化的发展符合我国的基本国情，它不仅可以使人们的居住水平提高，还能节约资源，方便城市的规划和管理，同时也为智能家居发展奠定坚实的基础。</span>','',0),(59,0,'<h1 style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;text-align:-webkit-center;font-size:22px;background-color:#FFFFFF;\">\r\n	<span id=\"__kindeditor_bookmark_start_4__\"></span>\r\n	<p style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n		<img src=\"http://www.cnsce.net/js/kindedit/attached/image/20150917/20150917161547_71045.jpg\" alt=\"第五届智博会落幕项目总投资逾70亿 \" />\r\n	</p>\r\n	<p align=\"left\" style=\"font-size:16px;font-family:微软雅黑;text-align:center;color:#666666;vertical-align:baseline;background-color:#FFFFFF;\">\r\n		&nbsp;\r\n	</p>\r\n	<p align=\"left\" style=\"font-size:16px;font-family:微软雅黑;text-align:center;color:#666666;vertical-align:baseline;background-color:#FFFFFF;\">\r\n		智博会期间，在宁波国际会展中心1号馆，一款智能家用晾衣架吸引了众多市民。本次智博会，智能眼镜、智能运动手环、智能食品打印机等多款贴近百姓生活的智能产品受到欢迎。(记者徐能摄)\r\n	</p>\r\n	<p align=\"left\" style=\"font-size:16px;font-family:微软雅黑;color:#666666;vertical-align:baseline;background-color:#FFFFFF;\">\r\n		　　昨天下午，历时3天的第五届中国智慧城市技术与应用产品博览会落下帷幕。来自智博会组委会的统计显示，本届智博会吸引参观者约6.6万人次，工信部CSIP“国家互联网＋智能制造创新服务平台”、腾讯“互联网＋智慧城市”、东软“智能可穿戴设备产业基地”等28个智慧项目现场签约，总投资逾70亿元，涉及智能制造、可穿戴设备、云计算、大数据、众创空间等领域。\r\n	</p>\r\n	<p align=\"left\" style=\"font-size:16px;font-family:微软雅黑;color:#666666;vertical-align:baseline;background-color:#FFFFFF;\">\r\n		　　在本届智博会上，包括IBM、阿里、腾讯、网易等10余家世界500强企业、50余家上市企业、近40家软件百强企业在内的近300家中外企业参展。围绕“互联网＋产业创新发展”等议题，“1＋10”主题论坛召开。\r\n	</p>\r\n	<p align=\"left\" style=\"font-size:16px;font-family:微软雅黑;color:#666666;vertical-align:baseline;background-color:#FFFFFF;\">\r\n		　　创客的加盟使得智博会的创业氛围更加浓厚。在中国(宁波)创客创业大赛全国总决赛中，17支队伍从全国200个创客团队中脱颖而出。由行业专家、创业达人、企业高管等组成的导师团，为参赛团队带来了产业辅导、创业培训、项目融资等辅导。\r\n	</p>\r\n	<p align=\"left\" style=\"font-size:16px;font-family:微软雅黑;color:#666666;vertical-align:baseline;background-color:#FFFFFF;\">\r\n		　　同时，智博会的科普效应进一步显现。在国际会展中心，各项“高大上”又“接地气”的应用和有趣的互动项目使展馆人气爆棚，吸引观众2.7万余人次。\r\n	</p>\r\n	<p>\r\n	</p>\r\n</h1>','',0);
/*!40000 ALTER TABLE `jb_document_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_document_download`
--

DROP TABLE IF EXISTS `jb_document_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_document_download`
--

LOCK TABLES `jb_document_download` WRITE;
/*!40000 ALTER TABLE `jb_document_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_document_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_document_huiyi`
--

DROP TABLE IF EXISTS `jb_document_huiyi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_document_huiyi` (
  `id` int(10) unsigned NOT NULL COMMENT '主键',
  `open_time` int(10) NOT NULL COMMENT '开始时间',
  `address` varchar(120) NOT NULL COMMENT '会议地点',
  `phone` varchar(30) NOT NULL COMMENT '报名电话',
  `jiabin_name` varchar(30) NOT NULL COMMENT '嘉宾姓名',
  `content` text NOT NULL COMMENT '详细介绍',
  `jiabin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '嘉宾id',
  `sign_up_requirements` varchar(255) NOT NULL COMMENT '报名要求',
  `sign_up_stop_time` int(10) NOT NULL COMMENT '报名截止时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_document_huiyi`
--

LOCK TABLES `jb_document_huiyi` WRITE;
/*!40000 ALTER TABLE `jb_document_huiyi` DISABLE KEYS */;
INSERT INTO `jb_document_huiyi` VALUES (6,1443681300,'宇宙中心枫桥镇','667622','朱不眠','<h2>\r\n	<strong><span style=\"font-family:\'Microsoft YaHei\';font-size:18px;\">专题摘要</span></strong><span style=\"font-family:\'Microsoft YaHei\';font-size:18px;\">&nbsp;</span> \r\n</h2>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:21px;\">　　</span>为推动中国智慧城市有序建设及健康发展，由商务部、国家发改委、工信部、科学技术部等十大部委以及深圳市政府主办、由国家信息中心和IDG国际数据集团联合承办的“高交会2014中国智慧城市专馆”将于11月在深圳会展中心隆重举行。</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-29/563184811e542.jpg\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<h2>\r\n	<strong><span style=\"font-family:\'Microsoft YaHei\';font-size:18px;\">往届回顾</span></strong> \r\n</h2>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;line-height:21px;\">　　</span>2014年11月17日，一年一度的高交会“2014中国智慧城市发展高峰论坛” 在深圳会展中心如期拉开帷幕。此次大会由国家信息中心和IDG国际数据集团主办，公安部第一研究所、民政部国家减灾中心、北京大学数字中国研究院、北京航空航天大学及国际数据公司(IDC)联合协办，IDG承办。会议围绕“智慧发展，智能未来”主题，通过主题演讲、平行论坛、高峰对话、专题报告等多种形式，针对中国智慧城市的现状及趋势、智慧城市试点进展、创新应用、城市运营和管理的智慧化、第三平台与智慧城市发展等话题进行深度交流与研讨。今年参会的中外演讲嘉宾及各领域技术专家达到600多位，创历史新高，他们共同分享了智慧城市领域的重大机遇和变革。深圳市政府、国家信息中心、工信部、住房和城乡建设部、公安部等重要领导莅临论坛开幕式并致辞。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　</span><strong><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">业界领袖脑力激荡 共图智慧城市发展大业</span></strong><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　上午的主会场精彩纷呈，演讲各方观点表述清楚、解析权威，其中智慧城市发展趋势与发展政策、评价指标、中国特色、海外经验以及城市安全等关键词引人瞩目。演讲嘉宾涵盖政府、行业企业、咨询机构、院校等智慧城市产业链各环节的领袖级人物，包括深圳市人民政府副市长唐杰、工信部软件服务业司李颖司长、国家信息中心常务副主任杜平、IDG全球常务副总裁兼大中华区董事长熊晓鸽、国家信息中心信息化研究部副主任单志广、住建部中国城市科学研究会数字城市工程研究中心主任丁有良 、工信部电子工业标准化研究院副院长高林、中兴副总裁徐明、中国安防高级副总裁曹国辉、公安部第一研究所研究员余兵、巴塞罗那市政府Xavier Mayo以及微软、IBM等企业高管。</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259f9af2335.jpg\" alt=\"\" /><span style=\"line-height:1.5;\"></span> \r\n</div>\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　主题演讲结束后的高峰对话环节，在IDC 副总裁武连峰主持下，国家信息中心电子政务中心副主任徐枫、中兴智慧城市解决方案总经理刘丰、长城计算机总裁周庚申和中国安防曹国辉，就“如何助力城市运营和管理的智慧化”这一议题展开了热烈讨论，他们结合实践经验，充分阐述各自的观点，互动交流，点评妙语连珠，会场气氛十分活跃。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　下午进行的两场平等论坛也颇具看点。来自国家信息中心软件评测中心、辽源市智慧城市办公室、智慧城市系统服务公司、软通动力、北京启创卓越、新加坡咨询通信发展管理局、方正国际软件、亚洲数据中心联盟、微软、北京司法鉴定业协会、长城计算机、富士康宇宙、赞云软件、七牛等知名企业和政府机构代表，围绕“智慧城市创新应用平台”和“第三平台与智慧城市发展”话题同台论道，他们提问题、出方案，享经验、谈应用，谋求城市发展动力，给现场观众带来了一场智慧新思潮的饕餮盛宴。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　</span><strong><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">同期活动为论坛倍增价值</span></strong><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　论坛举办同期特别开设了近万平方米的展览专区——“高交会智慧城市专馆”(6号馆)，这是在高交会历史上，首次以一个主题专馆的形式突出展示智慧城市的优秀成果、创新技术和智能解决方案，九个各具特色的主题专区汇集了城市规划设计、信息网络、智慧能源、智慧交通、智慧通信、绿色建筑、智慧医疗、智慧广场、城市应急、地理信息和智能家居等领域的众多国内外企业和机构，他们将以不同的形式参与到展览、智慧城市和方案的评选活动中。专馆预计接待超过20万名来自世界各地的相关政商代表和专业观众。充分调动了观众和展商互相交流的积极性和能动性，不仅能通过论坛让大家对智慧城市建设有一个更全面、更深刻的认识，而且让所有参会人员在展会现场感受到信息技术带来的巨大的变革。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　为了表彰诸多在智慧城市发展中做出创新贡献的城市和企业，还在会议现场揭晓了由IDC承办的“中国智慧城市标杆企业”、“中国领军智慧城市TOP 100”以及“智慧城市创新方案”的评选结果，并举行盛大的颁奖活动。杭州、成都、武汉、南京、济南、沈阳、苏州、青岛、合肥、福州、上海、郑州、石家庄、西安、深圳、昆明、无锡、南昌、银川和长沙这20个城市获得“2014 中国领军智慧城市TOP 20”称号；银川、辽源、兰州三个百强智慧城市还分别获得了商业模式创新奖、市民卡工程示范奖及优秀解决方案推进奖，成为颁奖盛典上耀眼的明星。IBM、安防投资、东软集团、万达信息、中国电子信息产业集团以及微软成功入选“2014年度中国智慧城市标杆企业”，“2014年度中国智慧城市创新方案”奖则花落中兴通讯、安防投资、北京启创卓越、软通动力和公安部第一研究所。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　在IDC智慧城市白皮书中，领军智慧城市百强的评选总结了100 个城市的经济与人口基础、城市建设进程、发展特点、未来投入、产业格局等因素后，根据城市信息化成熟度、区域特性，创建了中国智慧城市评价指标体系。评选指标主要从经济和人口基数(GDP总量、社会消费品零售总额、总人口数)、建设预算(IT机会总额、智慧城市专项占比、IT机会增长率)、国家试点(国家专项试点、国家统筹试点)、产业发展格局(市场竞争激烈程度、政策开放程度)四个维度展开，入选城市成功的要素还包括智慧城市的建设水平和后续发展机会。此次获奖城市从数量、质量上均创历史新高，向世界充分展示了中国智慧城市的风采，他们的城市发展经验和前沿思想，将会帮助城市管理者更好地探索智慧城市建设路径，并为相关行业厂商直面用户需求、调整自身定位与发展策略提供有益参考。</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　智慧城市项目对接环节为政府和企业提供一个项目落地的平台， “中国领军智慧城市TOP 20”的政府代表会莅临现场，与企业代表共同讨论，积极促进政府对智慧城市规划的落实和企业解决方案的实现。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"> 　　国家对智慧城市规划政策陆续出台，各地政府纷纷启动智慧城市试点活动，智慧城市建设投资日益高涨，创新应用和技术更是层出不穷。此次“中国智慧城市发展高峰论坛”的举办，很好地促进了政府、企业、科研以及金融界之间的对接，分享到国内外智慧城市实施过程中所取得的丰富和宝贵经验，推动新技术方案在城市建设中的快速广泛应用，为全国城市的可持续发展带来更多的启迪和收获。</span> \r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<iframe src=\"/wwwroot/Public/static/kindeditor/plugins/baidumap/index.html?center=121.601192%2C29.875618&zoom=14&width=558&height=360&markers=121.601192%2C29.875618&markerStyles=l%2CA\" frameborder=\"0\" style=\"width:560px;height:362px;\">\r\n	</iframe>\r\n</p>',0,'',0),(7,1443767880,'人马座驻宁工院7号楼2楼231室大使馆','88744','朱炒肝','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能左拥右抱</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259f69ea6f9.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>',0,'',0),(8,1443854280,'人马座驻宁工院7号楼2楼大使馆','665565','朱屁股','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能笑傲八方</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259f29e17c2.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>',0,'',0),(9,1443940740,'人马座驻宁工院7号楼大使馆','8864646','朱艾斯','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能驰骋疆场</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259efc727fa.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>',0,'',0),(10,1444027200,'人马座驻宁工院理学院信科专业大使馆','898989','朱大头','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能冲锋陷阵</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259e7239e18.jpg\" alt=\"\" /><br />\r\n</span>\r\n</p>',0,'',0),(11,1444113660,'人马座驻宁工理学院大使馆','363636','朱鼻子','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能神清气爽</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259df03ea85.jpg\" alt=\"\" /><br />\r\n</span>\r\n</p>',0,'',0),(12,1444200060,'人马座驻宁工院大使馆','8989898','朱耳朵','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能光彩照人</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259d4e59b1a.jpg\" alt=\"\" /><br />\r\n</span>\r\n</p>',0,'',0),(13,1444286520,'人马座驻江北区大使馆','55656','朱血','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能停不下来</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259d0459261.jpg\" alt=\"\" /><br />\r\n</span>\r\n</p>',0,'',0),(14,1444372980,'人马座驻宁波大使馆','+565656','朱小肚','<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能脉动回来</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#006600;font-family:KaiTi_GB2312;font-size:32px;line-height:48px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259c63b2f25.jpg\" alt=\"\" /><br />\r\n</span>\r\n</p>',0,'',0),(15,1444459440,'人马座驻浙江大使馆','2333','朱以巴','<p>\r\n	<span style=\"color:#000000;font-family:SimSun;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能容光焕发</span><span style=\"color:#000000;\"></span> \r\n</p>\r\n<p>\r\n	<img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259c0c37690.jpg\" alt=\"\" /><span style=\"background-color:#000000;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"background-color:#000000;\">\r\n	<p style=\"font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n		本报讯（记者黄程杭州湾新区报道组卓松磊）作为第五届中国智慧城市技术与应用产品博览会的重要组成部分，昨天，“智能制造２０２５”发展高层论坛在杭州湾新区举行，来自中国科学院、北京航空航天大学机器人研究院等科研院所的多名专家学者与全国百余家企业代表分享业界前沿知识和学术动态。\r\n	</p>\r\n	<p style=\"font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n		此次论坛以“互联网＋智能制造，打造工业转型升级新动力”为主题，致力于深化项目对接与产业合作，构建智慧城市建设、信息经济发展、“两化”深度融合交流与合作的大平台。\r\n	</p>\r\n	<p style=\"font-family:微软雅黑;font-size:16px;background-color:#FFFFFF;text-indent:2em;\">\r\n		论坛上，中国科学院院士姚建铨作了“从工业互联网到智慧工厂”专题演讲，ｐｌｃｏｐｅｎ中国区主席严义、航天二院信息化副总师柴旭东等与会专家学者和企业精英代表分别围绕“ｐｌｃｏｐｅｎ规范与技术”“工业４．０时代的工业软件”“服务机器人发展机遇”等主题进行演讲。\r\n	</p>\r\n<img src=\"/wwwroot/Uploads/Editor/2015-10-27/562f1ab90d847.jpg\" alt=\"\" /><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"background-color:#000000;\">\r\n	<p style=\"font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;\">\r\n		中国证券网讯 由中国工程院、工业和信息化部、中国科学院主办的中国工程科技论坛“2015智能制造国际会议”将于13日举行。据主办方介绍，本次会议的主题是当下最热门的“工业4.0与中国制造2025”。\r\n	</p>\r\n	<p style=\"font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;\">\r\n		　　据京华时报5月12日消息，主办方透露，届时，中德两国政府高官、技术专家及企业家将围绕主题作报告交流并展开深入研讨。其中，工业和信息化部部长苗圩将就合作共创中德制造业做主旨报告。\r\n	</p>\r\n	<p style=\"font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;\">\r\n		　　德国联邦经济与能源事务部(BMWi)工业政策司司长WolfgangScheremet博士将分享“工业4.0——德国制造经济的数字化”主题报告。此外，中国工程院院长、中国机械工程学会理事长周济院士将就“智能制造——中国制造2025的主攻方向”做主旨报告。\r\n	</p>\r\n	<p style=\"font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;\">\r\n		　　分析人士指出，智能制造是“中国制造2025”的重要抓手，智能制造或者工业4.0，是实现互联网和传统工业行业融合的制高点。“中国制造2025”大幕即将开启，以智能制造为代表的工业4.0概念料将重回资金风口。\r\n	</p>\r\n	<p style=\"font-size:14px;color:#333333;font-family:宋体;background-color:#FFFFFF;\">\r\n		<img src=\"/wwwroot/Uploads/Editor/2015-10-27/562f1aed54126.jpg\" alt=\"\" />\r\n	</p>\r\n	<p style=\"font-size:14px;font-family:宋体;background-color:#FFFFFF;\">\r\n		<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n			《关于开展2015年智能制造试点示范专项行动的通知》明确了以智能工厂为代表的流程制造试点，以数字化车间为代表的离散制造试点，以信息技术深度嵌入为代表的智能装备和产品试点，以个性化定制、网络协同开发、电子商务委代表的智能制造新业态试点，以物流信息化、能源管理智慧化为代表的智能化管理试点，以在线检测，远程诊断和云服务为代表的智能服务试点等6大试点推进专项行动，基本涵盖我国工业制造各大传统和优势行业，拉开了中国制造2025工业强国新篇章的大幕。此外。通知提出重点任务组织召开2015年世界机器人大会，风口上的机器人行业逻辑持续强化。\r\n		</p>\r\n		<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n			　　在“中国制造2025”的浪潮下，智能制造的巨大风口将带来巨大的投资机会，产业链包含高端数控机床，工业机器人，传感物联，自动化（数字化）工厂，个性化制造新业态等，其中智能化机器人、自动化装备方向值得投资者重点关注。\r\n		</p>\r\n		<p style=\"font-family:宋体;font-size:14px;\">\r\n			<span style=\"color:#333333;\">　　东吴证券指出，从核心零部件国产化看，控制器、伺服电机和减速器是机器人的三大核心零部件。过去核心零部件过度依赖进口，严重制约着行业发展。目前国内大部分本体制造企业</span><span>，均实现控制器自主生产，在核心零部件上取得了突破。只要实现关键零部件产品的升级跨越，就可以支撑机器人整机发展，未来替代进口的效应也会逐步释放。从政策落实看，在十二五规划中，国家已经把工业机器人作为智能制造装备的重要部分。机器人产业的发展与国家从“制造业大国”向“制造业强国”的转型相契合。</span>\r\n		</p>\r\n<span></span>\r\n	</p>\r\n<br />\r\n</span>\r\n</p>',0,'',0),(16,1444545840,'人马座驻地球大使馆','258258','朱大肠','<p>\r\n	<span style=\"color:#000000;font-family:SimSun;font-size:32px;line-height:48px;\">教你如何不吃饭不睡觉还能神采飞扬</span> \r\n</p>\r\n<p>\r\n	<img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259b7453519.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n		<span><strong>CNII网讯</strong>&nbsp;4月21日，由台湾物联网联盟、南京邮电大学物联网科技园共同主办，台湾物联网联盟、南京邮电大学物联网科技园共同发起成立的海峡两岸智慧服务产业发展研究院（筹）承办的海峡两岸物联网与智慧服务产业发展（金陵）论坛在南邮召开。</span>\r\n	</p>\r\n	<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n		<span>南京市副市长罗群，中国国民党副主席蒋孝严，台湾新党主席郁慕明，国际电信联盟（ITU）副秘书长赵厚麟，江苏省台办副主任王少邦，南京市副秘书长张新年，南京市鼓楼区委书记、南京邮电大学物联网科技园管委会主任陆平贵，中华两岸工商事务交流暨永续发展协会理事长郑永金，台湾物联网联盟理事长梁宾先，南京市鼓楼区区长、南京邮电大学物联网科技园管委会常务副主任杨学鹏，南京邮电大学党委书记、物联网科技园管委会主任闵春发等出席论坛开幕式并共同见证海峡两岸签署合作项目。南京市副市长罗群、中国国民党副主席蒋孝严、台湾新党主席郁慕明一同为海峡两岸智慧服务产业发展研究院揭牌。南京邮电大学副校长、物联网科技园董事长朱洪波主持论坛开幕式。</span>\r\n	</p>\r\n	<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n		<span>南京市副市长罗群表示，南京市政府高度重视物联网产业，专门成立了物联网学院、南京物联网应用研究院，出台了支持物联网产业等新兴产业发展的《关于促进南京市新兴产业发展的政策措施》。南京有丰富的人才资源，有悠久的IT行业历史，是中国电子信息技术发展的摇篮。他希望通过此次论坛，海峡两岸强强联合，加速推动物联网产业的发展，为两岸科技与经济的发展做出贡献。</span><img src=\"/wwwroot/Uploads/Editor/2015-10-27/562f19868e4b6.jpg\" alt=\"\" />\r\n	</p>\r\n	<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span>中国国民党副主席蒋孝严致辞时引用芝加哥大学的教授Rachel Fulton的预测指出，在30年后中国大陆GDP将达123兆美元，居世界第一，而包括南京邮电大学在内中国大陆众多高校是促成这一结果的重要因素之一。他为两岸现在的合作态势、尤其为两岸在尖端科技领域的合作逐步加强感到高兴，希望两岸各取所长，求同存异，并争取在更多领域深化合作交流。</span>\r\n		</p>\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span>台湾新党主席郁慕明以手机由大变小、由厚变薄、由重变轻、由功能少变为功能多为例向大家形象解释了什么是智慧服务产业的发展。他进一步指出，发展除了有技术科技的支撑，还需要有智慧的领导人的重视和支持，这样才能促进行业的连续性发展。他希望台北能够成为下一次海峡两岸物联网与智慧服务产业发展论坛的举办地，并欢迎大家到台湾合作交流，共同促进物联网产业的发展。</span>\r\n		</p>\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span>国际电信联盟副秘书长（ITU）赵厚麟在致辞中向大家介绍了国际物联网产业的发展现状，尤其以自己的亲身经历，重点介绍了海峡两岸物联网产业的蓬勃发展。他希望此次合作，能进一步推动两岸物联网领域相关技术产业的研究、发展和应用，推动两岸共同合作，共创双赢，让两岸的物联网产业在世界物联网产业中占有重要地位。</span>\r\n		</p>\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span>南京市鼓楼区委书记、南京邮电大学物联网科技园管委会主任陆平贵表示，此次论坛的召开定会为园区和鼓楼科技的发展增添智慧和力量，鼓楼区委区政府也将竭诚为入住鼓楼区的企业、科技人才提供全方位服务。</span>\r\n		</p>\r\n<img src=\"/wwwroot/Uploads/Editor/2015-10-27/562f19c72bd4d.jpg\" alt=\"\" />\r\n	</p>\r\n	<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span>台湾物联网联盟理事长梁宾先在致辞中感谢两岸领导对物联网产业的重视。他希望海峡两岸能够充分利用双方的资讯、通讯、终端设备优势，利用市场空间、良好的政策支持，在物联网产业上大有作为。</span>\r\n		</p>\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span>南京邮电大学党委书记闵春发指出，此次论坛的举行、海峡两岸智慧服务产业发展研究院的成立，是两岸物联网发展的大事和喜事，它开启了海峡两岸在物联网等新型产业合作的新篇章，必将对两岸物联网产业的发展产生重大影响。他希望通过这次论坛的举办两岸实现良性互动，使论坛能够成为中国物联网与智慧服务产业的推动者，为两岸各行各业物联网应用的发展架起一座互动的桥梁。</span>\r\n		</p>\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span>台湾物联网联盟理事长梁宾先，南京邮电大学副校长、物联网科技园董事长朱洪波担任海峡两岸智慧服务产业发展研究院院长。台湾全人资通股份有限公司董事长郑朝钟出任研究院秘书长。南京邮电大学物联网科技园有限公司总经理张登银，南京邮电大学通信与信息工程学院副院长、通信技术研究所所长杨龙祥出任研究院副秘书长。</span>\r\n		</p>\r\n		<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n			<span style=\"line-height:26px;\">出席论坛的领导人还共同见证了项目合作签约仪式。海峡两岸共同签署了“宁台海峡两岸文创交流暨秦淮士林人文饮食智慧旅游服务”、“植物逆境与物联网农业远程监控”、“BPM企业流程管理系统”、“物联网智能居家与节能方案”等多个合作项目。</span><span style=\"font-size:12pt;line-height:1.5;\"></span>\r\n		</p>\r\n	</p>\r\n	<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n		<br />\r\n	</p>\r\n	<p style=\"font-size:12pt;text-indent:30px;background-color:#FFFFFF;font-family:华文细黑;\">\r\n		<span><br />\r\n</span>\r\n	</p>\r\n</p>',0,'',0),(17,1444632300,'人马座驻太阳系大使馆','438438438','朱蒸蛋','<p>\r\n	<span style=\"font-family:KaiTi_GB2312;font-size:32px;color:#006600;\"><span style=\"font-family:SimSun;color:#000000;\">教你如何不吃饭不睡觉还能精神奕奕</span><img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259aee41554.jpg\" alt=\"\" /></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:KaiTi_GB2312;font-size:32px;color:#006600;\"> </span>\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	&nbsp; &nbsp; 为了更好地贯彻“智慧浙江”建设的重大战略举措，由省发改委、省经信委、省科技厅、省商务厅等省政府相关部门指导，浙江日报报业集团主办，富春硅谷协办的以“建设智慧园区，共赢城市未来”为主题的首届浙江智慧园区发展高峰论坛近日在杭举行。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　在本次论坛上，中国工程院原常务副院长潘云鹤院士做了题为《智慧城市的三个理念》的主题演讲。“浙江省的智慧城市建设在全国是走在前列的，很多城市都产生了自己独特的想法，比如杭州现在提出主要以智慧经济为主，瞄准的方向非常明确。”他表示，中国城市更适合智能化发展：不仅是云计算、大数据、物联网等技术的集成运用，还是工业化、信息化、城镇化以及农业现代化的四化融合。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　园区既是承担着区域经济和产业的主要集聚区，又是智慧城市的缩影。在“四化融合”语境下的今天，以机器换人、电商换市、信息化应用等效率驱动的发展新模式，正在浙江各家园区全面探索并进行着，“智慧园区”建设已经成为地方政府和园区管理层最为关注和深度思考的新课题。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　浙江省科技厅厅长周国辉认为，智慧园区是城市化、工业化、信息化、生态化融合发展的重要示范区。浙江省作为全国首个工业化与信息化融合发展示范区，在这方面作了一些探索，取得了一定的成效。如“四换三名”工作，特别是“四换”这一块，都与信息产业发展密切相关，尤其是“机器换人”和“电商换市”。我省把高新园区建设作为智慧园区的重中之重，目前全省已有5家国家级高新区、25家省级高新区。杭州高新区正在积极创建网络信息技术自主创新示范区，已经成为智慧产业发展的主阵地。下一步，要充分利用好物联网、云计算、大数据、移动互联网技术，大力发展智慧产业和智慧服务，为打造浙江经济升级版提供有力支撑。\r\n</p>\r\n<img src=\"/wwwroot/Uploads/Editor/2015-10-27/562f149f6bad8.jpg\" alt=\"\" /><br />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-family:KaiTi_GB2312;font-size:32px;color:#006600;\"> </span>\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	&nbsp; &nbsp; 浙江省目前正在做十几个专项的智慧城市试点，比如杭州的智慧交通、智慧医疗，宁波的智慧医疗，舟山的智慧民生等……全省从上到下，正在形成智慧城市、智慧园区建设的氛围。而且实际工作中，企业、园区、产业等各个方面都呈现良好态势。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　2013年，浙江已先后启动了20个智慧城市建设示范试点项目。7月初，浙江智慧园区最佳案例推选活动一推出，就引起了强烈反响。7月23日的论坛现场，榜单终于公布，杭州国家高新技术产业开发区、衢州国家高新技术产业开发区、杭州富阳经济技术开发区、湖州现代物流装备高新园区、富春硅谷等5个园区成为首届浙江智慧园区建设最佳案例，各家园区的代表接受了颁奖。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　当其他地方的信息经济发展还是星星之火，杭州高新区已是灿若星辰，在智慧安防、智慧商务、智慧交通、智慧医疗、智慧环境、智慧制造等领域，形成了一条较为完整的智慧经济产业链，信息经济的比重占到了全区工业总产值的七成。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　在杭州高新区，信息经济不仅扮演了新经济发展的主动力角色，还正在为这个滨江新城、工业强区带来更加智能便利的美好生活。在杭州高新区的西大门，一块曾经的老工业区，一个名叫智慧新天地的大平台正在抓紧建设，今后这里不仅将形成智慧产业区、总部区、商业服务区以及智慧社区，还将成为信息技术应用的实验区，区域内的购物、出行都实现智能控制，为杭州甚至浙江省智慧城市建设提供模板。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　东部软件园也是智慧园区较早的践行者。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　杭州东部软件园有限公司董事长宋小春说，“智慧园区的建设包括两个方面。一个是培育信息产业，另一个是打造信息化园区的升级版。信息化解决的是准和快，它其实是带动了园区的发展。以我们为例，信息化给我们园区带来了三种改变：更聪明、更年轻、反应速度更快了。”\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　东部软件园早就提出了服务智慧化。杭州市现在城市化率已经达到了73%，现代服务业已经是这个城市的基本业态了。而园区就是现代服务业的一种形态，通过现代服务业带动科技产业和科技企业的发展。“对园区来说，目前已经到了转型升级的节点。我觉得园区还是要发挥产业功能区的作用，推动产业提升，转型升级。但是如何做，这还是一个需要再研究的课题。”\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　总规划建筑面积60万平方米的富春硅谷，作为杭州首个大型城市产业综合体，既是我省重点引进的科技产业建设项目，也是富阳银湖科技城的核心引擎项目。富春硅谷围绕“智慧思维、智慧产品、智慧服务、智慧经济”，以提供适度提前的智能化服务、前置性资源整合平台，为企业发展打造高效成长空间，加速浙江经济产业转型升级、聚集智慧产业集群。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　“富春硅谷有三个理念，就是服务企业、服务企业家、服务企业的人。服务将基于企业人才发展展开，并以人为核心建设城市产业综合体，构建微型城市链，打造企业与人才的关联社区。富春硅谷的目标是，能够服务创业，服务中小微企业的发展，能够打造企业面向世界竞争的平台，以及促进城市向更高的目标发展，促进产城融合。”富春硅谷执行副总经理左世昌如是说。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　富春硅谷将打造一个“产业集聚、人才集聚、资本集聚、创新集聚”的杭州新兴产业集聚区，建成后可入驻500家企业。据悉，目前已有多家企业与该园区建立了战略合作伙伴关系，最终将实现“推动自身商业模式、服务模式、运营模式不断进化，推动成长型企业优质快速成长，推动城市经济与社会的发展转型”。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	<img src=\"/wwwroot/Uploads/Editor/2015-10-27/562f1550b4775.jpg\" alt=\"\" /> \r\n</p>\r\n<span><span style=\"line-height:48px;\">&nbsp;&nbsp;</span></span><span style=\"color:#333333;font-family:宋体;font-size:14px;line-height:1.5;\">目前，浙江省经国家升级批准和公告的各类开发区(园区)数量已达到了117个，加上15个省级产业集聚区以及各地涌现出来的创新型园区，在全省基本形成了布局合理、层次分明、种类齐全、相互支撑的区域开放发展格局，并积极发挥着“三大作用”：即在实施我省四大国家战略中的支撑促进作用、加快浙江经济转型升级中的示范引领作用和促进区域经济发展中的辐射带动作用。</span><span style=\"font-family:KaiTi_GB2312;font-size:32px;color:#006600;\"> \r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　“大力促进各级各类园区的智慧化改造，既是浙江经济传统产业改造提升的重要途径，园区升级的重要途径，更是园区转型的重要切入点。园区创新发展既是有形的产品和服务，更是政府园区管理模式的创新和改变。政府管理部门要习惯于从网络经济、大数据时代、移动互联网时代等新的转变，服务于园区的转型升级。同时，也是各级园区管理部门、营运部门，改变原有路径的重要突破口。”浙江省工业经济研究所所长兰建平博士提出了自己的见解。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　当天，兰博士作为嘉宾也出席了论坛。会后他谈到，如果工业园区仅仅是依靠卖土地的优惠政策、税收减免等方式来运营，在新时期一定不可持续。所以园区的直接管理运营者必须创新管理模式、服务模式，必须转型。而智慧化转型，正是顺应第三次工业革命趋势的主要路径。各级各类开发区，要再创产业发展的新优势，必须在园区的智慧化下功夫。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　这个观点和浙江省商务厅开发区处处长梁志良不谋而合。梁处长认为，智慧园区虽然还是个新生事物，但这一定是一种发展趋势。至于要怎么落地，大家都在探索，有人先行了，必然也有人在观望。论坛把大家的注意力都吸引过来，共同来探讨智慧园区规划、运营和建设中的核心问题，很接地气而且效果显著。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　更让他欣喜的是，“智慧园区”事实上把开发区现阶段的“产城融合”又提升到了一个新的境界。“开发区先有产，后有城，虽然已经在谈产城融合了，但两者之间还是存在缝隙，需要磨合。而‘智慧园区’是开发区走到一定历史阶段必然要推进的新境界——这是一种‘大象无形’的境界，产就是城，城就是产，是一种犹如美国硅谷一样的绿色、低碳、智能化发展模式。”他表示，毋庸置疑，浙江智慧园区的春天已经到来了。但智慧城市建设要有顶层设计和新的载体，对未来的发展还需要有总体的规划。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　尤其值得一提的是，在此次高峰论坛上，还发起成立了“浙江智慧园区联盟”。该联盟旨在通过打造一个具有创新精神和价值创造的交流平台，不断汇聚新的思想与能量，长期且持续地推动浙江“智慧园区”的发展，营造知识经济时代共享资源、共同成长的良好氛围。\r\n</p>\r\n<p style=\"color:#333333;font-family:宋体;font-size:14px;\">\r\n	　　在浙江，智慧园区这一崭新命题在未来将结出怎样的累累硕果？让我们拭目以待吧。\r\n</p>\r\n<img src=\"http://api.map.baidu.com/staticimage?center=121.480603%2C31.220017&zoom=13&width=558&height=360&markers=121.480603%2C31.220017&markerStyles=l%2CA\" alt=\"\" /><br />\r\n</span> \r\n<p>\r\n	<br />\r\n</p>',0,'',0),(23,1,'1','1','1','55',0,'',0),(1,1446108720,'宁波工程学院','717162','qq','huiyi',0,'',0),(38,1468456380,'宁波泛太平洋大酒店','86-64123456','','<h2>\r\n	<strong><span style=\"font-family:\'Microsoft YaHei\';\">专题摘要</span></strong><span style=\"font-family:\'Microsoft YaHei\';\">&nbsp;</span> \r\n</h2>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　为推动中国智慧城市有序建设及健康发展，由商务部、国家发改委、工信部、科学技术部等十大部委以及深圳市政府主办、由国家信息中心和IDG国际数据集团联合承办的“高交会2014中国智慧城市专馆”将于11月在深圳会展中心隆重举行。</span> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"><img src=\"/wwwroot/Uploads/Editor/2015-10-29/563184811e542.jpg\" alt=\"\" /><br />\r\n</span> \r\n</p>\r\n<h2>\r\n	<strong><span style=\"font-family:\'Microsoft YaHei\';\">往届回顾</span></strong> \r\n</h2>\r\n<p>\r\n	<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　2014年11月17日，一年一度的高交会“2014中国智慧城市发展高峰论坛” 在深圳会展中心如期拉开帷幕。此次大会由国家信息中心和IDG国际数据集团主办，公安部第一研究所、民政部国家减灾中心、北京大学数字中国研究院、北京航空航天大学及国际数据公司(IDC)联合协办，IDG承办。会议围绕“智慧发展，智能未来”主题，通过主题演讲、平行论坛、高峰对话、专题报告等多种形式，针对中国智慧城市的现状及趋势、智慧城市试点进展、创新应用、城市运营和管理的智慧化、第三平台与智慧城市发展等话题进行深度交流与研讨。今年参会的中外演讲嘉宾及各领域技术专家达到600多位，创历史新高，他们共同分享了智慧城市领域的重大机遇和变革。深圳市政府、国家信息中心、工信部、住房和城乡建设部、公安部等重要领导莅临论坛开幕式并致辞。</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　</span><strong><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">业界领袖脑力激荡 共图智慧城市发展大业</span></strong><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　上午的主会场精彩纷呈，演讲各方观点表述清楚、解析权威，其中智慧城市发展趋势与发展政策、评价指标、中国特色、海外经验以及城市安全等关键词引人瞩目。演讲嘉宾涵盖政府、行业企业、咨询机构、院校等智慧城市产业链各环节的领袖级人物，包括深圳市人民政府副市长唐杰、工信部软件服务业司李颖司长、国家信息中心常务副主任杜平、IDG全球常务副总裁兼大中华区董事长熊晓鸽、国家信息中心信息化研究部副主任单志广、住建部中国城市科学研究会数字城市工程研究中心主任丁有良 、工信部电子工业标准化研究院副院长高林、中兴副总裁徐明、中国安防高级副总裁曹国辉、公安部第一研究所研究员余兵、巴塞罗那市政府Xavier Mayo以及微软、IBM等企业高管。</span> \r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/wwwroot/Uploads/Editor/2015-10-20/56259f9af2335.jpg\" alt=\"\" /><span style=\"line-height:1.5;\"></span> \r\n</div>\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　主题演讲结束后的高峰对话环节，在IDC 副总裁武连峰主持下，国家信息中心电子政务中心副主任徐枫、中兴智慧城市解决方案总经理刘丰、长城计算机总裁周庚申和中国安防曹国辉，就“如何助力城市运营和管理的智慧化”这一议题展开了热烈讨论，他们结合实践经验，充分阐述各自的观点，互动交流，点评妙语连珠，会场气氛十分活跃。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　下午进行的两场平等论坛也颇具看点。来自国家信息中心软件评测中心、辽源市智慧城市办公室、智慧城市系统服务公司、软通动力、北京启创卓越、新加坡咨询通信发展管理局、方正国际软件、亚洲数据中心联盟、微软、北京司法鉴定业协会、长城计算机、富士康宇宙、赞云软件、七牛等知名企业和政府机构代表，围绕“智慧城市创新应用平台”和“第三平台与智慧城市发展”话题同台论道，他们提问题、出方案，享经验、谈应用，谋求城市发展动力，给现场观众带来了一场智慧新思潮的饕餮盛宴。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　</span><strong><span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">同期活动为论坛倍增价值</span></strong><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　论坛举办同期特别开设了近万平方米的展览专区——“高交会智慧城市专馆”(6号馆)，这是在高交会历史上，首次以一个主题专馆的形式突出展示智慧城市的优秀成果、创新技术和智能解决方案，九个各具特色的主题专区汇集了城市规划设计、信息网络、智慧能源、智慧交通、智慧通信、绿色建筑、智慧医疗、智慧广场、城市应急、地理信息和智能家居等领域的众多国内外企业和机构，他们将以不同的形式参与到展览、智慧城市和方案的评选活动中。专馆预计接待超过20万名来自世界各地的相关政商代表和专业观众。充分调动了观众和展商互相交流的积极性和能动性，不仅能通过论坛让大家对智慧城市建设有一个更全面、更深刻的认识，而且让所有参会人员在展会现场感受到信息技术带来的巨大的变革。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　为了表彰诸多在智慧城市发展中做出创新贡献的城市和企业，还在会议现场揭晓了由IDC承办的“中国智慧城市标杆企业”、“中国领军智慧城市TOP 100”以及“智慧城市创新方案”的评选结果，并举行盛大的颁奖活动。杭州、成都、武汉、南京、济南、沈阳、苏州、青岛、合肥、福州、上海、郑州、石家庄、西安、深圳、昆明、无锡、南昌、银川和长沙这20个城市获得“2014 中国领军智慧城市TOP 20”称号；银川、辽源、兰州三个百强智慧城市还分别获得了商业模式创新奖、市民卡工程示范奖及优秀解决方案推进奖，成为颁奖盛典上耀眼的明星。IBM、安防投资、东软集团、万达信息、中国电子信息产业集团以及微软成功入选“2014年度中国智慧城市标杆企业”，“2014年度中国智慧城市创新方案”奖则花落中兴通讯、安防投资、北京启创卓越、软通动力和公安部第一研究所。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　在IDC智慧城市白皮书中，领军智慧城市百强的评选总结了100 个城市的经济与人口基础、城市建设进程、发展特点、未来投入、产业格局等因素后，根据城市信息化成熟度、区域特性，创建了中国智慧城市评价指标体系。评选指标主要从经济和人口基数(GDP总量、社会消费品零售总额、总人口数)、建设预算(IT机会总额、智慧城市专项占比、IT机会增长率)、国家试点(国家专项试点、国家统筹试点)、产业发展格局(市场竞争激烈程度、政策开放程度)四个维度展开，入选城市成功的要素还包括智慧城市的建设水平和后续发展机会。此次获奖城市从数量、质量上均创历史新高，向世界充分展示了中国智慧城市的风采，他们的城市发展经验和前沿思想，将会帮助城市管理者更好地探索智慧城市建设路径，并为相关行业厂商直面用户需求、调整自身定位与发展策略提供有益参考。</span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\"></span><br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　智慧城市项目对接环节为政府和企业提供一个项目落地的平台， “中国领军智慧城市TOP 20”的政府代表会莅临现场，与企业代表共同讨论，积极促进政府对智慧城市规划的落实和企业解决方案的实现。</span><br />\r\n<br />\r\n<span style=\"font-family:\'Microsoft YaHei\';font-size:14px;\">　　国家对智慧城市规划政策陆续出台，各地政府纷纷启动智慧城市试点活动，智慧城市建设投资日益高涨，创新应用和技术更是层出不穷。此次“中国智慧城市发展高峰论坛”的举办，很好地促进了政府、企业、科研以及金融界之间的对接，分享到国内外智慧城市实施过程中所取得的丰富和宝贵经验，推动新技术方案在城市建设中的快速广泛应用，为全国城市的可持续发展带来更多的启迪和收获。</span><span></span> \r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"http://api.map.baidu.com/staticimage?center=121.473704%2C31.230393&zoom=11&width=558&height=360&markers=121.473704%2C31.230393&markerStyles=l%2CA\" width=\"558\" height=\"360\" alt=\"\" /> \r\n</p>',45,'年龄大于16周岁;门票20元',1467331200),(46,0,'','','','',0,'',0),(48,1473527460,'宁波泛太平洋酒店','18302160268','','<span style=\"font-weight:700;color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;line-height:20px;background-color:#FFFFFF;\">宁波云医院的探索与实践</span>',0,'',1464714660),(56,1461001800,'宁波洲际大酒店三楼明州Ⅱ厅','18302160268','','<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;互联网在医疗方面发挥的作用可以用这句诗来描述：“忽如一夜春风来，千树万树梨花开。”近来，“未来医院”“智慧医疗”“微信医院”“空<a href=\"http://www.xsjk.net/zhongyi/\" target=\"_blank\">中医</a>院”“云医院”等词汇频频出现，一场以信息化技术为支撑的互联网医疗大戏正在上演。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　<strong>小试牛刀</strong> \r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　云医院搭平台需政府主导\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　作为中国第一家城市云医院，宁波云医院一个月前宣布上线。近日，在重庆市召开的互联网重构医疗体系论坛上，宁波市的经验介绍吸引了大批听众。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　宁波市卫生局信息中心主任孙向东说，云医院是利用云计算、物联网、移动互联网以及传感器技术、大数据技术，实现网上诊疗、<a href=\"http://www.xsjk.net/\" target=\"_blank\">健康</a>咨询、健康<a href=\"http://www.xsjk.net/psy/zcxl/gl/\" target=\"_blank\">管理</a>和健康教育功能的远程医疗服务和协同平台。宁波云医院是国内首家由政府主导、市场化运作的云医院。云医院有3个特点：特定的人群、特定的诊疗、特定的病情。云医院既有家庭医生，又有专科医生，居民注册后系统会自动关联其健康档案。医生被预约后，可以看到预约者的健康档案。云医院可以看做是互联网医联体。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　宁波云医院建设之所以“底气很足”，前期的铺垫工作功不可没。据了解，宁波市2010年在国内率先提出建设“智慧城市”。孙向东介绍，宁波市已建立700万份电子健康档案，在三甲医院、社区卫生服务中心都已实现信息共享。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　重庆市渝中区也对云医院平台建设项目跃跃欲试。该区卫生局局长刘平认为，云医院应将为老百姓提供优质服务作为重点，各项服务要落地；起步阶段需要政府主导，把机制建立好，最终还是要走向市场。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　<strong>资源集结</strong> \r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　网上“联姻”促进分级诊疗\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　“希望通过云医院，把大专家、专科医院、家庭医生全部打通，形成基于信任和协同的平台，打造互联网上的医联体、健康服务领域的‘天猫商城’、大数据时代的教研平台。”东软集团高级副总裁、东软熙康健康科技有限公司董事长兼CEO卢朝霞说。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　优质医疗资源集中在大城市的大医院，分级诊疗体系尚未建成，这是目前我国医疗系统面临的挑战。卢朝霞提出，云医院是通过线上线下结合，构建一个协同医疗和健康服务的社区平台。“过去是到医院等待，现在通过技术手段，把被动医疗变成主动医疗，通过云医院、云诊室等模式，为患者提供云服务。”\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　卢朝霞介绍，云医院的目的是让消费者可以跨地域获得医疗服务，让基层医院拥有和三甲医院一样的管理流程，基层医生与优秀的专科医生通过远程沟通完成医疗，基层医生可以拥有或者享用综合型大医院的资源。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　<strong>“云端漫步”</strong> \r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　还有诸多壁垒待突破\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　无论是云医院平台建设，还是互联网医疗或者移动健康平台，要实现“云端漫步”，还需要突破很多壁垒。其中，如何保证医患权益尤其是患者权益，是互联网医疗面临的重要问题。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　孙向东说，要建立网络医生准入资质管理机制，除了需要职称门槛外，还要根据执业记录对医生进行评分。通过医患双方签约式服务规避风险，患者授权医生调阅电子健康档案。为了保护医患双方权益不受侵犯，诊疗过程会全程录像、录音。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　卢朝霞建议对个人健康档案信息进行分级管理。例如，家庭医生可以看患者家族史，而专科医生只能看到健康档案的专科相关部分。\r\n</p>\r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　　也有专家提出，可穿戴设备的使用是远程医疗未来的发展趋势，如何确保可穿戴设备的数据校验结果与医疗机构的检查检验结果匹配，能否作为健康指标的参考，都需要进一步研究和验证。\r\n</p>\r\n<span style=\"color:#030000;font-family:宋体, Arial;font-size:14px;line-height:28px;background-color:#FFFFFF;\"></span> \r\n<p style=\"color:#030000;font-family:宋体, Arial;font-size:14px;\">\r\n	　互联网医疗面临的最大瓶颈，还是政策的壁垒”，卢朝霞这么说，例如，目前还未放开网上诊疗，医生没有网上执业行医权，电子处方是否合法还没有明确说法。一些地方也在尝试突破，比如利用远程视频的方式或者借助家庭医生，协助大医院医生完成网上诊疗的线下延伸。但是患者就医习惯的改变、健康档案共享的实现、医保报销政策的跟进、处方药品的配送、医疗事故认定及处置等，都是亟待解决的问题。\r\n</p>',55,'',1462989000),(57,1467827940,'宁波泛太平洋酒店','18302160268','','<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;这是一个知识经济的时代，无数创意火花让世界更加生动。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　这几天，在宁波举行的第五届中国智慧城市技术与应用产品博览会，掀起阵阵智慧浪潮。智博会上，一批智能项目的签约，将加快传统产业转型升级，也让我们的生活更加智能。签约的28个项目总投资72亿元，涉及到智慧云、跨境电商云中心、工业机器人、互联网+、物联网等多个领域。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　<strong>新松机器人落户宁波</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　均胜普瑞研发的一款工业机器人，输入一定程序后，机械臂可将无规则的产品按一定逻辑拼接，还会与人进行掷骰子游戏；自动焊接装料机器人能展开长臂，完成各种不同类型部件的焊接作业，多适用于汽车零部件、造船等企业……智博会上，各种发挥神奇功能的工业机器人让人大开眼界。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　在新松展位上，3个可爱的机器人来回移动端茶送水。机器人采用激光自动导航，不仅灵活自如，还可自动避让行人。“不久后，这些激光自动导航智能服务机器人也将出现在宁波的餐馆里。”新松展位负责人薛晓亮说。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　展位上，两个长臂六轴工业机器人挥舞机械手，伸缩自如。专注于工业机器人，新松呈现一幅未来无人工厂的图景。“无人工厂将成为今后工业发展的终极形式。”薛晓亮说。去年新松在宁波市场的销售额达到3000万元，预计3至5年内，在宁波市场的产值将达到1.5亿元。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　在这次智博会上，新松签约落地宁波，根据协议，新松将在宁波注册成立宁波新松机器人自动化科技有限公司；组建宁波机器人与智能制造技术研究院；建设运营机器人产业技术创新战略联盟网络平台；合作共建宁波机器人展示厅。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　沈阳新松机器人自动化股份有限公司总裁曲道奎认为，处在大的转折点上，制造业变革已成为一种趋势和方向。迈向工业4.0终极目标的序幕已经拉开，互联网与机器人已经成为变革的主要技术支撑力量。市场倒逼、人力和环境因素，在加速整个变革的进程。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　随着工业智能化步伐的加快，宁波越来越多的企业开始选择“机器换人”。宁波本土企业柏同科技展示一条完整的生产流水线。四五个打磨机器人协同工作，上下料、加工、检测，全部由机器人来完成，在大大提高生产效率的同时，降低了生产成本。目前，这家企业已经为宁波企业定制了无人化智能生产工厂，力争成为宁波智能制造示范线。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　车间里，机器人操作，通过通讯技术实现万物相连，实现智能工厂。眼下，“均胜”的数字化车间初具规模：生产主管通过ERP系统下达订单后，电脑就会自动生成原料配方指令；根据指令，智能仓储系统只需花费15分钟，就能从3层楼高的大仓库中挑选出400多原料，自动运输到车间，并导入生产货架；工人们只要将这些原料按电脑排定的次序，放到自动化流水线上，操作系统将自动完成所有生产工序。同时，生产环节的所有数据信息，都能被实施跟踪、监测、调控，生产效率由此提高了五六倍。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　<strong>新一代存储技术现身</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　点开手机，实时路况叠加虚拟信息，附近的餐饮、厕所、便利店等一目了然，一款“智慧宁波民生V4.0手机客户端”打开智慧城市新图景。民生应用客户端，实现了生活服务“一屏打尽”的便利。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　在城市日益庞大、系统越来越复杂的今天，城市如何更加宜居？解决的方案似乎就是建设智慧城市。在智博会上，IBM高级副总裁王阳就智慧城市发表了观点，科技助力提升智慧城市竞争力，在互联网趋向于产业化的大背景下，利用科技将城市生活智能化已经成为发展趋势，数据科技将引领智慧城市的转型。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　IBM在宁波打造的智慧物流平台成为智慧城市的一个亮点。通过“互联网＋物流平台”的组合拳，所有的物流信息都可以在系统内进行交互和整理，商品的运输过程可见、可控、可管，提高效率和安全性。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　阿里巴巴集团副总裁刘冰认为，智慧城市不是一个简单的服务，未来将成为一个新的产业链和产业生态。做好智慧民生的顶层设计，坚持集约的建设理念，把信息更全面地和市民的衣食住行联系起来，用创新驱动建设，实现低成本见实效的目标，这就是智慧城市的现在和未来。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　智慧城市的建设离不开大数据，基于大数据才能有更好的智慧城市。面对海量的数据，怎么来存储？全球搜索巨头谷歌的庞大数据信息，存储在美国面积达3个足球场大小的存储器里。而用宁波时代全芯科技有限公司开发的新一代存储技术——相变存储技术，只需要20平方米的存储器就可以搞定。“全芯科技”是中国第一家拥有相变存储技术自主知识产权的企业。此前，只有美国美光和韩国三星两家企业将这项技术投入量产。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　展位上，公司副总经理张家璜介绍，相变存储，是继内存、闪存之后的新一代数据存储技术，可广泛应用于移动设备、大数据存储及云存储平台。根据建设进度，“全芯科技”将于明年建成投产，形成一套研发、生产具有完整知识产权的芯片产品。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　<strong>可穿戴设备成新热点</strong>\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　医院里输液，一旦疏于看护，可能造成更为严重的“空气针”事故。在智博会上，杭州法瑞尔科技有限公司研发的一款移动输液监护管理设备解决了这个“痛点”。设备由监护终端、接收器、中央监护平台和移动监护设备四部分组成。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　监护终端卡在输液瓶的滴管部分，设备便开机工作，通过红外线扫射滴管记录下当前的“动态滴速”，通过接收器传到中央监护平台上或移动监护设备上。护士只要查看电脑端或移动端的平台，就能实时掌控患者的输液情况。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　智博会上，像“智慧输液”一样的智慧产品和智能化生活场景扑面而来，智慧技术的应用也是渗透到了生活中的每一个细节。未来，机器人当管家，家居智能化已经不再是科幻小说的情节。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　寻找“痛点”，就是找到创新的机遇。台湾盖德科技带来一款适合老年人的健康手表。工作人员介绍，健康手表装有SIM卡，可以直接通话，待机时间100个小时。而且“易操作、可呼救、够智能”。手表通过精准的计算语言，一旦判断老人跌倒，如果5秒内没有感知到老人移动，就会自动拨打电话联系后台工作人员。后台人员会向老人进行确认，若无回应，将联系当地看护中心，看护中心将根据手表发送的定位找到老人。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　在智博会健康穿戴国际论坛上，东软集团董事长刘积仁提出，现代医疗模式正由“重疾病治疗”向“重疾病预防”转变。而在这个过程中，有“大脑”的健康穿戴设备成为强力助推剂。\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:14px;\">\r\n	　　“互联网＋”时代，智能可穿戴设备产业是新兴产业，具有广阔的发展前景。智博会上，宁波与东软集团签署战略合作协议，计划通过三至五年的努力，在宁波高新区建成智能可穿戴设备产业基地。\r\n</p>',58,'',1465408740);
/*!40000 ALTER TABLE `jb_document_huiyi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_document_jiabin`
--

DROP TABLE IF EXISTS `jb_document_jiabin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_document_jiabin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '嘉宾名称',
  `job_title` varchar(255) NOT NULL DEFAULT '无' COMMENT '头衔',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_document_jiabin`
--

LOCK TABLES `jb_document_jiabin` WRITE;
/*!40000 ALTER TABLE `jb_document_jiabin` DISABLE KEYS */;
INSERT INTO `jb_document_jiabin` VALUES (45,'','中国科学院计算技术研究所所长'),(55,'','东软集团股份有限公司高级副总裁、东软熙康健康科技有限公司董事长兼CEO。'),(58,'','原IBM全球副总裁兼中国开发中心总经理、赛伯乐投资集团');
/*!40000 ALTER TABLE `jb_document_jiabin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_document_luntan`
--

DROP TABLE IF EXISTS `jb_document_luntan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_document_luntan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `address` varchar(255) NOT NULL COMMENT '论坛主要地点',
  `content` text NOT NULL COMMENT '详情',
  `open_time` int(10) NOT NULL COMMENT '论坛开始时间',
  `end_time` int(10) NOT NULL COMMENT '论坛结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_document_luntan`
--

LOCK TABLES `jb_document_luntan` WRITE;
/*!40000 ALTER TABLE `jb_document_luntan` DISABLE KEYS */;
INSERT INTO `jb_document_luntan` VALUES (28,'宁波泛太平洋大酒店','<p align=\"center\" style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<h2 style=\"text-align:left;\">\r\n		<strong>智慧城市高峰论坛议程&nbsp;</strong>\r\n	</h2>\r\n<strong>\r\n	<div style=\"text-align:left;\">\r\n		<strong>（2015年9月11日下午•宁波泛太平洋大酒店）</strong>\r\n	</div>\r\n</strong>\r\n</p>\r\n<table width=\"612\" align=\"left\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>时间</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>内容</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"center\">\r\n					<strong>演讲人</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>13</strong><strong>：30-14：00</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>签到及播放宣传片</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"center\">\r\n					<strong>&nbsp;</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>14</strong><strong>：00-14：05</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>主持人介绍嘉宾</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"center\">\r\n					<strong>张新红 国家信息中心信息化研究部主任</strong><strong></strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>14</strong><strong>：05-14：20</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"511\" colspan=\"2\">\r\n				<p align=\"center\">\r\n					<strong>工信部领导致辞</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>14</strong><strong>：20-15：05</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>中国城市基础设施的&nbsp;</strong><br />\r\n<strong>挑战</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>潘云鹤&nbsp; 中国工程院院士、原常务副院长</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>15</strong><strong>：05-15：30</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>“互联网+”创新方向&nbsp;</strong><br />\r\n<strong>和重点</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>高新民</strong><strong>&nbsp;&nbsp;</strong><strong>中国互联网协会副理事长</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>15</strong><strong>：30-15：45</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"511\" colspan=\"2\">\r\n				<p align=\"center\">\r\n					<strong>茶 歇</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>15</strong><strong>：45-16：05</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>机器人与智能制造</strong><strong></strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>曲道奎&nbsp; 沈阳新松机器人自动化股&nbsp;</strong><br />\r\n<strong>份有限公司总裁</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>16</strong><strong>：05-16：25</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>科技助力提升智慧城市竞争力</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>王&nbsp; 阳&nbsp; IBM全球高级副总裁</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>16</strong><strong>：25-16：45</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>“互联网+”智慧城市</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>刘&nbsp; 冰</strong><strong>&nbsp;&nbsp;</strong><strong>阿里巴巴集团副总裁</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>16</strong><strong>：45-17：05</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>基于“互联网+”支撑平台小组织产品创新模式</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>陈&nbsp; 刚&nbsp; 网易研究院院长</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>17</strong><strong>：05-17：25</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>“互联网+”时代：新机遇、新挑战、新纪元</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>刘&nbsp; 勇&nbsp;&nbsp;</strong><strong>腾讯北京公司总经理</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>17</strong><strong>：25-17：45</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"249\">\r\n				<p align=\"center\">\r\n					<strong>协同创新是“互联网+”&nbsp;</strong><br />\r\n<strong>发展的关键途径</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"262\">\r\n				<p align=\"left\">\r\n					<strong>林耀钦&nbsp; 台湾创新育成中心主任</strong><strong></strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"101\">\r\n				<p align=\"center\">\r\n					<strong>17</strong><strong>：45-18：00</strong>\r\n				</p>\r\n			</td>\r\n			<td width=\"511\" colspan=\"2\">\r\n				<p align=\"center\">\r\n					<strong>主持人小结</strong>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p align=\"center\" style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<strong>&nbsp;</strong>\r\n</p>',1465430400,0),(47,'宁波泛太平洋大酒店','<p align=\"center\" style=\"color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<h2 style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;\">智慧健康高层论坛议程&nbsp;</span> \r\n</h2>\r\n<div style=\"text-align:left;\">\r\n	<span style=\"line-height:1.5;\">（2015年9月11日上午•宁波洲际大酒店三楼明州Ⅱ厅）</span> \r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<table width=\"584\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" style=\"text-align:center;color:#333333;font-family:Arial, Helvetica, sans-serif;font-size:14px;background-color:#FFFFFF;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>时间</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>内容</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>演讲嘉宾</strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>9:00-9:10</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>宁波市政府领导致辞</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>宁波市政府领导</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>9:10-9:20</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>浙江省卫生计生委领导致辞</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>浙江省卫生计生委领导</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>9:20-9:50</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>国家卫生计生委统计信息中心领导讲话</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>国家卫生计生委统计信息中心主任&nbsp;</strong><br />\r\n<strong>孟群</strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>9:50-10:20</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>宁波云医院的探索与实践</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>宁波市卫生计生委主任&nbsp;</strong><br />\r\n<strong>王仁元</strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>10:20-10:50</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>互联网医疗重构医疗服务模式</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>东软集团股份有限公司高级副总裁&nbsp;</strong><br />\r\n<strong>卢朝霞</strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>10:50-11:20</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>新常态下中国医药卫生产业的改革与发展</strong><strong></strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>北京大学教授&nbsp;</strong><br />\r\n<strong>刘国恩</strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>11:20-11:40</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>移动互联网促进医疗业务变革</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>南京军区福州总医院教授陈金雄</strong> \r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td width=\"130\">\r\n				<p align=\"center\">\r\n					<strong>11:40-12:00</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"198\">\r\n				<p align=\"center\">\r\n					<strong>台湾“互联网+健康”的应用实践和商务模式</strong> \r\n				</p>\r\n			</td>\r\n			<td width=\"255\">\r\n				<p align=\"center\">\r\n					<strong>台北医学大学陆伟辉</strong> \r\n				</p>\r\n				<div>\r\n					<strong><br />\r\n</strong> \r\n				</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>',1467763200,0),(49,'宁波泛太平洋大酒店','<p style=\"color:#333333;font-family:宋体;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:16px;\">\r\n	<span style=\"color:#333333;font-family:\'Microsoft Yahei\', 微软雅黑, Tahoma, SimSun;font-size:16px;line-height:24px;background-color:#FFFFFF;\">　　</span>为了更好地贯彻“智慧浙江”建设的重大战略举措，由省发改委、省经信委、省科技厅、省商务厅等省政府相关部门指导，浙江日报报业集团主办，富春硅谷协办的以“建设智慧园区，共赢城市未来”为主题的首届浙江智慧园区发展高峰论坛7月23日在杭举行。<br />\r\n　　智慧园区作为智慧城市和两化深度融合的重要载体，既承担着智慧经济和智慧产业的集聚发展重任，又是智慧城市发展建设的缩影。<br />\r\n　　在“新四化融合发展，互促共进”的背景下，以机器换人、电商换市、信息化应用等“效率驱动”的发展新模式，正在浙江园区全面探索并进行着，“智慧园区”建设成为地方政府和园区管理层关注和思考的新课题。<br />\r\n　　在本次论坛上，中国工程院原常务副院长、潘云鹤院士做了题为《智慧城市的三个理念》的主题演讲。在现场，相关专家和园区及企业代表共同进行圆桌对话，探讨智慧园区规划、运营和建设中的核心问题。国家开发银行杭州分行、浙江省杭电智慧城市研究中心、富春硅谷、中兴通讯和IBM大中华区等企业、学者、园区代表在论坛上介绍了智慧园区解决方案和建设经验，就“智慧园区规划、建设与运营”等核心问题展开了探讨。<br />\r\n　　在富春硅谷执行副总经理左世昌看来，智慧园区的规划与建设，是一项业务及数据整合的系统性工程。它将以服务招商运营为目标，以云计算和互联网为服务工具，以产业数据为核心构筑产业增值服务运营体系，打造产业生态圈。<br />\r\n　　同时，首届浙江智慧园区建设最佳案例推选首批入选榜单也在现场公布，杭州国家高新技术产业开发区、衢州国家高新技术产业开发区、杭州富阳经济技术开发区、湖州现代物流装备高新园区、富春硅谷等园区代表接受了颁奖。<br />\r\n　　浙江日报报业集团、浙江省物联网产业协会、富春硅谷等单位还在本次高峰论坛上发起成立了“浙江智慧园区联盟”。该联盟旨在集产、经、学、研、媒之力，共同打造一个具有创新精神和价值创造的交流平台，不断汇聚新的思想与能量，长期且持续地推动浙江“智慧园区”发展。<br />\r\n　　目前，全省经国家、省级批准和公告的各类开发区(园区)数量已达到117个，加上15个省级产业集聚区以及各地涌现出来的创新型园区，在全省基本形成了布局合理、层次分明、种类齐全、相互支撑的区域开放发展格局，并积极发挥着“三大作用”：即在实施我省四大国家战略中的支撑促进作用、加快浙江经济转型升级中的示范引领作用和促进区域经济发展中的辐射带动作用。<br />\r\n　　本次论坛为政府、企业及投资机构等提供了良好的交流沟通合作平台，将推进我省园区的健康发展。\r\n</p>\r\n<div>\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>',1461000060,1462382460);
/*!40000 ALTER TABLE `jb_document_luntan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_file`
--

DROP TABLE IF EXISTS `jb_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_file` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_file`
--

LOCK TABLES `jb_file` WRITE;
/*!40000 ALTER TABLE `jb_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_hooks`
--

DROP TABLE IF EXISTS `jb_hooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_hooks`
--

LOCK TABLES `jb_hooks` WRITE;
/*!40000 ALTER TABLE `jb_hooks` DISABLE KEYS */;
INSERT INTO `jb_hooks` VALUES (1,'pageHeader','页面header钩子，一般用于加载插件CSS文件和代码',1,0,'',1),(2,'pageFooter','页面footer钩子，一般用于加载插件JS文件和JS代码',1,0,'ReturnTop',1),(3,'documentEditForm','添加编辑表单的 扩展内容钩子',1,0,'Attachment',1),(4,'documentDetailAfter','文档末尾显示',1,0,'Attachment,SocialComment',1),(5,'documentDetailBefore','页面内容前显示用钩子',1,0,'',1),(6,'documentSaveComplete','保存文档数据后的扩展钩子',2,0,'Attachment',1),(7,'documentEditFormContent','添加编辑表单的内容显示钩子',1,0,'Editor',1),(8,'adminArticleEdit','后台内容编辑页编辑器',1,1378982734,'EditorForAdmin',1),(13,'AdminIndex','首页小格子个性化显示',1,1382596073,'SiteStat,SystemInfo,DevTeam',1),(14,'topicComment','评论提交方式扩展钩子。',1,1380163518,'Editor',1),(16,'app_begin','应用开始',2,1384481614,'',1);
/*!40000 ALTER TABLE `jb_hooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_huiyibaoming`
--

DROP TABLE IF EXISTS `jb_huiyibaoming`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_huiyibaoming` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `mobile` varchar(12) DEFAULT NULL COMMENT '联系方式',
  `create_time` int(10) NOT NULL COMMENT '报名时间',
  `huiyi_id` int(10) unsigned NOT NULL COMMENT '报名会议id',
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_huiyibaoming`
--

LOCK TABLES `jb_huiyibaoming` WRITE;
/*!40000 ALTER TABLE `jb_huiyibaoming` DISABLE KEYS */;
INSERT INTO `jb_huiyibaoming` VALUES (1,'灌灌灌灌灌','13442322311',1446024643,11,7),(2,'灌灌灌灌灌','15727138023',1446027313,14,5),(3,'刘奇','15757857599',1446100736,6,8),(4,'刘奇','15757857599',1446100753,7,8),(5,'刘奇','15757857599',1446100766,8,8),(6,'卢子跃','15757857598',1446100797,9,8),(7,'丹揍揍','15757857589',1446101357,6,9),(8,'cspx','15757857581',1446102470,6,9);
/*!40000 ALTER TABLE `jb_huiyibaoming` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_member`
--

DROP TABLE IF EXISTS `jb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_member` (
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_member`
--

LOCK TABLES `jb_member` WRITE;
/*!40000 ALTER TABLE `jb_member` DISABLE KEYS */;
INSERT INTO `jb_member` VALUES (1,'admin','',0,'0000-00-00','',40,6,0,1445223881,2130706433,1460881346,1),(2,'chen','',0,'0000-00-00','',10,1,0,1445915085,0,1445915085,1),(5,'约约约','',0,'0000-00-00','',10,14,0,1446007349,0,1446027295,1),(7,'灌灌灌灌灌','13442324344',0,'0000-00-00','',10,1,0,1446010018,0,1446010018,1),(3,'asd','15757857594',0,'0000-00-00','',20,5,0,1446083764,2130706433,1460387976,1),(8,'刘奇','15757857599',0,'0000-00-00','',10,3,0,1446086001,0,1446088256,1),(9,'丹揍揍','15757857589',0,'0000-00-00','',10,2,0,1446101038,0,1446101286,1),(10,'朱针对','15757857622',0,'0000-00-00','',10,1,0,1446108884,0,1446108884,1);
/*!40000 ALTER TABLE `jb_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_menu`
--

DROP TABLE IF EXISTS `jb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_menu` (
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
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_menu`
--

LOCK TABLES `jb_menu` WRITE;
/*!40000 ALTER TABLE `jb_menu` DISABLE KEYS */;
INSERT INTO `jb_menu` VALUES (1,'首页',0,1,'Index/index',0,'','',0,1),(2,'内容',0,2,'Article/index',0,'','',0,1),(3,'文档列表',2,0,'article/index',1,'','内容',0,1),(4,'新增',3,0,'article/add',0,'','',0,1),(5,'编辑',3,0,'article/edit',0,'','',0,1),(6,'改变状态',3,0,'article/setStatus',0,'','',0,1),(7,'保存',3,0,'article/update',0,'','',0,1),(8,'保存草稿',3,0,'article/autoSave',0,'','',0,1),(9,'移动',3,0,'article/move',0,'','',0,1),(10,'复制',3,0,'article/copy',0,'','',0,1),(11,'粘贴',3,0,'article/paste',0,'','',0,1),(12,'导入',3,0,'article/batchOperate',0,'','',0,1),(13,'回收站',2,0,'article/recycle',1,'','内容',0,1),(14,'还原',13,0,'article/permit',0,'','',0,1),(15,'清空',13,0,'article/clear',0,'','',0,1),(16,'用户',0,3,'User/index',0,'','',0,1),(17,'用户信息',16,0,'User/index',0,'','用户管理',0,1),(18,'新增用户',17,0,'User/add',0,'添加新用户','',0,1),(19,'用户行为',16,0,'User/action',0,'','行为管理',0,1),(20,'新增用户行为',19,0,'User/addaction',0,'','',0,1),(21,'编辑用户行为',19,0,'User/editaction',0,'','',0,1),(22,'保存用户行为',19,0,'User/saveAction',0,'\"用户->用户行为\"保存编辑和新增的用户行为','',0,1),(23,'变更行为状态',19,0,'User/setStatus',0,'\"用户->用户行为\"中的启用,禁用和删除权限','',0,1),(24,'禁用会员',19,0,'User/changeStatus?method=forbidUser',0,'\"用户->用户信息\"中的禁用','',0,1),(25,'启用会员',19,0,'User/changeStatus?method=resumeUser',0,'\"用户->用户信息\"中的启用','',0,1),(26,'删除会员',19,0,'User/changeStatus?method=deleteUser',0,'\"用户->用户信息\"中的删除','',0,1),(27,'权限管理',16,0,'AuthManager/index',0,'','用户管理',0,1),(28,'删除',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'删除用户组','',0,1),(29,'禁用',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'禁用用户组','',0,1),(30,'恢复',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'恢复已禁用的用户组','',0,1),(31,'新增',27,0,'AuthManager/createGroup',0,'创建新的用户组','',0,1),(32,'编辑',27,0,'AuthManager/editGroup',0,'编辑用户组名称和描述','',0,1),(33,'保存用户组',27,0,'AuthManager/writeGroup',0,'新增和编辑用户组的\"保存\"按钮','',0,1),(34,'授权',27,0,'AuthManager/group',0,'\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组','',0,1),(35,'访问授权',27,0,'AuthManager/access',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮','',0,1),(36,'成员授权',27,0,'AuthManager/user',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮','',0,1),(37,'解除授权',27,0,'AuthManager/removeFromGroup',0,'\"成员授权\"列表页内的解除授权操作按钮','',0,1),(38,'保存成员授权',27,0,'AuthManager/addToGroup',0,'\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)','',0,1),(39,'分类授权',27,0,'AuthManager/category',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮','',0,1),(40,'保存分类授权',27,0,'AuthManager/addToCategory',0,'\"分类授权\"页面的\"保存\"按钮','',0,1),(41,'模型授权',27,0,'AuthManager/modelauth',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮','',0,1),(42,'保存模型授权',27,0,'AuthManager/addToModel',0,'\"分类授权\"页面的\"保存\"按钮','',0,1),(43,'扩展',0,7,'Addons/index',0,'','',0,1),(44,'插件管理',43,1,'Addons/index',0,'','扩展',0,1),(45,'创建',44,0,'Addons/create',0,'服务器上创建插件结构向导','',0,1),(46,'检测创建',44,0,'Addons/checkForm',0,'检测插件是否可以创建','',0,1),(47,'预览',44,0,'Addons/preview',0,'预览插件定义类文件','',0,1),(48,'快速生成插件',44,0,'Addons/build',0,'开始生成插件结构','',0,1),(49,'设置',44,0,'Addons/config',0,'设置插件配置','',0,1),(50,'禁用',44,0,'Addons/disable',0,'禁用插件','',0,1),(51,'启用',44,0,'Addons/enable',0,'启用插件','',0,1),(52,'安装',44,0,'Addons/install',0,'安装插件','',0,1),(53,'卸载',44,0,'Addons/uninstall',0,'卸载插件','',0,1),(54,'更新配置',44,0,'Addons/saveconfig',0,'更新插件配置处理','',0,1),(55,'插件后台列表',44,0,'Addons/adminList',0,'','',0,1),(56,'URL方式访问插件',44,0,'Addons/execute',0,'控制是否有权限通过url访问插件控制器方法','',0,1),(57,'钩子管理',43,2,'Addons/hooks',0,'','扩展',0,1),(58,'模型管理',68,3,'Model/index',0,'','系统设置',0,1),(59,'新增',58,0,'model/add',0,'','',0,1),(60,'编辑',58,0,'model/edit',0,'','',0,1),(61,'改变状态',58,0,'model/setStatus',0,'','',0,1),(62,'保存数据',58,0,'model/update',0,'','',0,1),(63,'属性管理',68,0,'Attribute/index',1,'网站属性配置。','',0,1),(64,'新增',63,0,'Attribute/add',0,'','',0,1),(65,'编辑',63,0,'Attribute/edit',0,'','',0,1),(66,'改变状态',63,0,'Attribute/setStatus',0,'','',0,1),(67,'保存数据',63,0,'Attribute/update',0,'','',0,1),(68,'系统',0,4,'Config/group',0,'','',0,1),(69,'网站设置',68,1,'Config/group',0,'','系统设置',0,1),(70,'配置管理',68,4,'Config/index',0,'','系统设置',0,1),(71,'编辑',70,0,'Config/edit',0,'新增编辑和保存配置','',0,1),(72,'删除',70,0,'Config/del',0,'删除配置','',0,1),(73,'新增',70,0,'Config/add',0,'新增配置','',0,1),(74,'保存',70,0,'Config/save',0,'保存配置','',0,1),(75,'菜单管理',68,5,'Menu/index',0,'','系统设置',0,1),(76,'导航管理',68,6,'Channel/index',0,'','系统设置',0,1),(77,'新增',76,0,'Channel/add',0,'','',0,1),(78,'编辑',76,0,'Channel/edit',0,'','',0,1),(79,'删除',76,0,'Channel/del',0,'','',0,1),(80,'分类管理',68,2,'Category/index',0,'','系统设置',0,1),(81,'编辑',80,0,'Category/edit',0,'编辑和保存栏目分类','',0,1),(82,'新增',80,0,'Category/add',0,'新增栏目分类','',0,1),(83,'删除',80,0,'Category/remove',0,'删除栏目分类','',0,1),(84,'移动',80,0,'Category/operate/type/move',0,'移动栏目分类','',0,1),(85,'合并',80,0,'Category/operate/type/merge',0,'合并栏目分类','',0,1),(86,'备份数据库',68,0,'Database/index?type=export',0,'','数据备份',0,1),(87,'备份',86,0,'Database/export',0,'备份数据库','',0,1),(88,'优化表',86,0,'Database/optimize',0,'优化数据表','',0,1),(89,'修复表',86,0,'Database/repair',0,'修复数据表','',0,1),(90,'还原数据库',68,0,'Database/index?type=import',0,'','数据备份',0,1),(91,'恢复',90,0,'Database/import',0,'数据库恢复','',0,1),(92,'删除',90,0,'Database/del',0,'删除备份文件','',0,1),(93,'其他',0,5,'other',1,'','',0,1),(96,'新增',75,0,'Menu/add',0,'','系统设置',0,1),(98,'编辑',75,0,'Menu/edit',0,'','',0,1),(106,'行为日志',16,0,'Action/actionlog',0,'','行为管理',0,1),(108,'修改密码',16,0,'User/updatePassword',1,'','',0,1),(109,'修改昵称',16,0,'User/updateNickname',1,'','',0,1),(110,'查看行为日志',106,0,'action/edit',1,'','',0,1),(112,'新增数据',58,0,'think/add',1,'','',0,1),(113,'编辑数据',58,0,'think/edit',1,'','',0,1),(114,'导入',75,0,'Menu/import',0,'','',0,1),(115,'生成',58,0,'Model/generate',0,'','',0,1),(116,'新增钩子',57,0,'Addons/addHook',0,'','',0,1),(117,'编辑钩子',57,0,'Addons/edithook',0,'','',0,1),(118,'文档排序',3,0,'Article/sort',1,'','',0,1),(119,'排序',70,0,'Config/sort',1,'','',0,1),(120,'排序',75,0,'Menu/sort',1,'','',0,1),(121,'排序',76,0,'Channel/sort',1,'','',0,1),(122,'数据列表',58,0,'think/lists',1,'','',0,1),(123,'审核列表',3,0,'Article/examine',1,'','',0,1);
/*!40000 ALTER TABLE `jb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_model`
--

DROP TABLE IF EXISTS `jb_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_model` (
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文档模型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_model`
--

LOCK TABLES `jb_model` WRITE;
/*!40000 ALTER TABLE `jb_model` DISABLE KEYS */;
INSERT INTO `jb_model` VALUES (1,'document','基础文档',0,'',1,'{\"1\":[\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}','1:基础','','','','','','id:编号\r\ntitle:标题:[EDIT]\r\nmodel_id|get_model_by_id:模型\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除',0,'','',1383891233,1460887498,1,'MyISAM'),(2,'article','文章',1,'',1,'{\"1\":[\"3\",\"5\",\"24\",\"12\"],\"2\":[\"2\",\"13\",\"19\",\"14\",\"26\",\"25\",\"11\",\"9\",\"16\",\"17\",\"10\",\"20\"]}','1:基础,2:扩展','','','','','','',0,'','',1383891243,1460887401,1,'MyISAM'),(3,'download','下载',1,'',1,'{\"1\":[\"5\",\"3\"]}','1:基础,2:扩展','5,3','','','','','',0,'','',1383891252,1445237677,1,'MyISAM'),(4,'huiyi','会议',1,'',1,'{\"1\":[\"3\",\"5\",\"39\",\"12\",\"35\",\"33\",\"54\",\"53\",\"10\",\"51\",\"37\",\"36\",\"9\"]}','1:基础,2:扩展','10,54,53,3,5,39,12,35,33,51,37,36,9','','','','','',10,'','',1445235141,1460911598,1,'MyISAM'),(6,'huiyibaoming','会议报名',0,'',1,'{\"1\":[\"41\",\"42\",\"43\"]}','1:基础','45,44,41,42,43','','','','','id:编号\r\nhuiyi_id|get_huiyi_title:会议名称\r\nname:姓名\r\nmobile:联系电话\r\ncreate_time|date:报名时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除',10,'','',1445308224,1446025373,1,'MyISAM'),(7,'luntan','论坛',1,'',1,'{\"1\":[\"3\",\"9\",\"2\",\"12\",\"5\",\"55\",\"56\",\"57\",\"47\"]}','1:基础','3,9,2,12,5,55,57,56,47','','','','','',10,'','',1460881467,1460912970,1,'MyISAM'),(8,'jiabin','嘉宾',1,'',1,'{\"1\":[\"3\",\"2\",\"12\",\"50\",\"5\",\"9\"],\"2\":[\"49\",\"10\",\"11\",\"19\",\"16\",\"14\",\"13\",\"17\",\"20\"]}','1:基础,2:扩展','','','','','','',10,'','',1460883116,1460903803,1,'MyISAM');
/*!40000 ALTER TABLE `jb_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_picture`
--

DROP TABLE IF EXISTS `jb_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_picture`
--

LOCK TABLES `jb_picture` WRITE;
/*!40000 ALTER TABLE `jb_picture` DISABLE KEYS */;
INSERT INTO `jb_picture` VALUES (1,'/Uploads/Picture/2015-10-29/5631811509457.jpg','','9198330e918f7685373229d4626a2615','97b3a7595abba2af5827d6de0c01bdc94bf42bcb',1,1446084884),(2,'/Uploads/Picture/2015-10-29/563182e856bd9.png','','318080d8689bf61f0ec394eb3e5f057a','ea3c030a8ee763089b44b3ad94b06909d85a7849',1,1446085352),(3,'/Uploads/Picture/2015-10-29/563183b92eaed.jpg','','31e05e3580b60c04339ec3414ffa504e','987ba8296a528d39ad5e93654fc7633ac62798b9',1,1446085561),(4,'/Uploads/Picture/2015-10-29/563183f688e90.jpg','','ac363af083d8d1f547868de42288f38b','3954f65929ebc1b98db20fe8fc7e8ea37d35637a',1,1446085622),(5,'/Uploads/Picture/2015-10-29/5631841e80f2b.jpg','','e2a93cb222c53382b0fffb05f18f0e46','2de0136086b5911a96d3a7613910f06c4c640db7',1,1446085662),(6,'/Uploads/Picture/2015-10-29/563184eb689fd.jpg','','86fa2d49e0b8f6a4d1315a3bda17989d','83c7cb72b731b6bf9c77cc6bf38b49bea020166b',1,1446085867),(7,'/Uploads/Picture/2015-10-29/5631852546ce5.jpg','','fac90aae0bfda6189b3f1b8303ef04a6','e42f425c1b929fc1f808b4f77252c0cf2e905dda',1,1446085925),(8,'/Uploads/Picture/2016-04-17/5713524d87141.jpg','','0c8e38160d7f87ebafe4b8c8ef497c19','d87b027b07d9c67e073659611a827d6b5ce6e2d0',1,1460884045),(9,'/Uploads/Picture/2016-04-17/571352543c9c4.png','','47077fec37daec0b025ceedbccd4db98','c8d9e81ddc5064f9489acb7dff7da7b24113bfd2',1,1460884052),(10,'/Uploads/Picture/2016-04-17/5713ae3b680bb.jpg','','37d21e396b2204f08eee9faadb2fd7d8','33be2f1823c216e434bfd22fd279e35cdcdef021',1,1460907579),(11,'/Uploads/Picture/2016-04-18/5713b4bae8faa.jpg','','8882794b74db55a938af7803f24d7972','a74ce8fe2c270303b3cbc702a7ff316195ad6e5c',1,1460909242),(12,'/Uploads/Picture/2016-04-18/5713bcb785d4b.png','','17f22c72957c7362a35765a3f623e64f','a38b6c9ca5c306746c07d278ef057379d6375188',1,1460911287),(13,'/Uploads/Picture/2016-04-18/5713c043412d9.jpg','','f28501db7a53668a1a43e2b2765ac00e','336af0d9ea6eb8ac4650f7cd30512fa60b139b16',1,1460912195),(14,'/Uploads/Picture/2016-04-18/5713c94f830f1.jpg','','7c020febc23ab158efe8cb70933cbca8','d24b2f7e26d734d38ccddcadf165522322da5df7',1,1460914511),(15,'/Uploads/Picture/2016-04-18/5713cc8dce9a6.jpg','','94780b7292096049a71aa10971c07c4d','f8b1c95eda44a078626e9b890818551237bb7526',1,1460915341),(16,'/Uploads/Picture/2016-04-18/5713cdef17860.jpg','','b5467fa7daa6e498a8c12deeb8e08295','4bad87e0087c8df967364ab227c6a8b8e49e2b96',1,1460915695),(17,'/Uploads/Picture/2016-04-18/5713cf7fdd864.jpg','','dcf4d93c4ce0d58aaf92d774eb3dd4c4','87763c93ed4121fae0d8e0814698e872b6f15d1a',1,1460916095),(18,'/Uploads/Picture/2016-04-18/5713d06758f82.jpg','','da6460469e104793af4f7717e17dc621','2ab63b10fc7f33c04ed4a5cf1322c2fefdcbb238',1,1460916327),(19,'/Uploads/Picture/2016-04-18/5713d09dc42f0.jpg','','cdd0aa2d7a55547fb320699c50ac7e59','2ca7b5ce4885e6fab1886f2c8da5841772a5ee05',1,1460916381),(20,'/Uploads/Picture/2016-04-18/5713d7713f982.jpg','','b114d8ec005b10e8c2aefd6397173358','582e9ff44df1c87f0f0ef1172b2c58bc5818fe37',1,1460918129);
/*!40000 ALTER TABLE `jb_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_ucenter_admin`
--

DROP TABLE IF EXISTS `jb_ucenter_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_ucenter_admin`
--

LOCK TABLES `jb_ucenter_admin` WRITE;
/*!40000 ALTER TABLE `jb_ucenter_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_ucenter_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_ucenter_app`
--

DROP TABLE IF EXISTS `jb_ucenter_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_ucenter_app` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_ucenter_app`
--

LOCK TABLES `jb_ucenter_app` WRITE;
/*!40000 ALTER TABLE `jb_ucenter_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_ucenter_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_ucenter_member`
--

DROP TABLE IF EXISTS `jb_ucenter_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_ucenter_member` (
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_ucenter_member`
--

LOCK TABLES `jb_ucenter_member` WRITE;
/*!40000 ALTER TABLE `jb_ucenter_member` DISABLE KEYS */;
INSERT INTO `jb_ucenter_member` VALUES (1,'admin','eaf6e523292ebe8e8c4b5b9b111b2aae','',1445223881,2130706433,1460881346,2130706433,1445223881,1),(2,'chen','2967d792b099004c0e05685c4ca118d1','16767',1445915074,0,1445915085,0,1445915074,1),(3,'asd','2967d792b099004c0e05685c4ca118d1','15757857594',1445918422,0,1460387976,2130706433,1445918422,1),(4,'qweqwe','2967d792b099004c0e05685c4ca118d1','13599999999',1445918540,0,0,0,1445918540,1),(5,'约约约','2967d792b099004c0e05685c4ca118d1','15727138723',1446007180,0,1446027295,0,1446007180,1),(6,'撒臭小子','2967d792b099004c0e05685c4ca118d1','13333333333',1446009547,0,0,0,1446009547,1),(7,'灌灌灌灌灌','2967d792b099004c0e05685c4ca118d1','13442324344',1446010018,0,1446010018,0,1446010018,1),(8,'刘奇','2967d792b099004c0e05685c4ca118d1','15757857599',1446086001,0,1446088256,0,1446086001,1),(9,'丹揍揍','43617ff1bd1d388e6440c317d64051f4','15757857589',1446101038,0,1446101286,0,1446101038,1),(10,'朱针对','e7b8966339f40cad55090958b3d24642','15757857622',1446108884,0,1446108884,0,1446108884,1);
/*!40000 ALTER TABLE `jb_ucenter_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_ucenter_setting`
--

DROP TABLE IF EXISTS `jb_ucenter_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_ucenter_setting`
--

LOCK TABLES `jb_ucenter_setting` WRITE;
/*!40000 ALTER TABLE `jb_ucenter_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_ucenter_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_url`
--

DROP TABLE IF EXISTS `jb_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_url`
--

LOCK TABLES `jb_url` WRITE;
/*!40000 ALTER TABLE `jb_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_userdata`
--

DROP TABLE IF EXISTS `jb_userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jb_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_userdata`
--

LOCK TABLES `jb_userdata` WRITE;
/*!40000 ALTER TABLE `jb_userdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_userdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-18 21:22:39
