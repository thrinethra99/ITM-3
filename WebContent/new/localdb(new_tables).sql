/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.0.27-community-nt : Database - localdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`localdb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `localdb`;

/*Table structure for table `area_label_focus` */

DROP TABLE IF EXISTS `area_label_focus`;

CREATE TABLE `area_label_focus` (
  `id` int(11) NOT NULL auto_increment,
  `wondering_area_id` int(11) default NULL,
  `color_label` varchar(255) default NULL,
  `my_focus` varchar(255) default 'no',
  `author_id` varchar(255) default NULL,
  `project_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `area_label_focus` */

insert  into `area_label_focus`(`id`,`wondering_area_id`,`color_label`,`my_focus`,`author_id`,`project_id`) values (10,28,'#ff0194','no','201705141056563050000',2),(11,27,'#ec00ff','no','201705141056563050000',4),(12,21,'#0c00ff','no','201705141056563050000',2),(13,29,'#4000fe','no','201705141056563050000',2),(14,30,'#d501ff','no','201705141056563050000',2);

/*Table structure for table `note_view_record` */

DROP TABLE IF EXISTS `note_view_record`;

CREATE TABLE `note_view_record` (
  `id` int(11) NOT NULL auto_increment,
  `author_id` varchar(255) default NULL,
  `note_id` varchar(255) default NULL,
  `create_time` varchar(255) default NULL,
  `thread_id` int(11) default NULL,
  `weighted_position` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `note_view_record` */

insert  into `note_view_record`(`id`,`author_id`,`note_id`,`create_time`,`thread_id`,`weighted_position`) values (3,'201705141056563050000','669','@ctime',8,55),(4,'201705141056563050000','934','@ctime',8,44),(5,'201705141056563050000','562','@ctime',11,40),(6,'201705141056563050000','481','@ctime',11,32),(7,'201705141056563050000','178','@ctime',11,43),(8,'201705141056563050000','1130','@ctime',11,38),(9,'201705141056563050000','1130','@ctime',11,38),(10,'201705141056563050000','1129','@ctime',11,37),(11,'201705141056563050000','1129','@ctime',11,37),(12,'201705141056563050000','937','@ctime',11,34),(13,'201705141056563050000','937','@ctime',11,34),(14,'201705141056563050000','937','@ctime',11,34),(15,'201705141056563050000','937','@ctime',11,34),(16,'201705141056563050000','1219','@ctime',11,39),(17,'201705141056563050000','1129','@ctime',11,37),(18,'201705141056563050000','1130','@ctime',11,38),(19,'201705141056563050000','1219','@ctime',11,39),(20,'201705141056563050000','1129','@ctime',11,37),(21,'201705141056563050000','1129','@ctime',11,37),(22,'201705141056563050000','1129','@ctime',11,37),(23,'201705141056563050000','1129','@ctime',11,37),(24,'201705141056563050000','962','@ctime',11,41),(25,'201705141056563050000','1206','@ctime',9,80),(26,'201705141056563050000','789','@ctime',11,21),(27,'201705141056563050000','792','@ctime',11,22),(28,'201705141056563050000','1129','@ctime',11,37),(29,'201705141056563050000','1120','@ctime',11,29),(30,'201705141056563050000','1124','@ctime',11,30),(31,'201705141056563050000','924','@ctime',11,27),(32,'201705141056563050000','1129','@ctime',11,37),(33,'201705141056563050000','1215','@ctime',11,18),(34,'201705141056563050000','914','@ctime',11,23),(35,'201705141056563050000','914','@ctime',11,23),(36,'201705141056563050000','924','@ctime',11,27),(37,'201705141056563050000','479','@ctime',11,31),(38,'201705141056563050000','786','@ctime',11,33);

/*Table structure for table `thread_label` */

DROP TABLE IF EXISTS `thread_label`;

CREATE TABLE `thread_label` (
  `id` int(11) NOT NULL auto_increment,
  `thread_id` int(11) default NULL,
  `color_label` varchar(255) default NULL,
  `author_id` varchar(255) default NULL,
  `project_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `thread_label` */

insert  into `thread_label`(`id`,`thread_id`,`color_label`,`author_id`,`project_id`) values (4,11,'#c6ff00','201705141056563050000',2),(5,20,'#3800fd','201705141056563050000',2),(6,12,'#ff005e','201705141056563050000',2),(7,16,'#ff8800','201705141056563050000',4),(8,8,'#abff01','201705141056563050000',4),(9,53,'#4f69cb','201705141056563050000',2),(10,9,'#b6ff00','201705141056563050000',4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
