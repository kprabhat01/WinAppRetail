/*
SQLyog Community v11.31 (64 bit)
MySQL - 5.1.73-community : Database - db_rm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_rm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_rm`;

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `AreaName` varchar(50) NOT NULL,
  `Liesin` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `area` */

insert  into `area`(`Id`,`AreaName`,`Liesin`,`deleteflag`) values (1,'India',0,0),(2,'Maharastra',1,0),(3,'Ghansoli ',2,0),(4,'Vashi',2,0);

/*Table structure for table `machine_auth` */

DROP TABLE IF EXISTS `machine_auth`;

CREATE TABLE `machine_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `macID` varchar(50) NOT NULL,
  `cupId` varchar(50) DEFAULT NULL,
  `IsActive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `macID` (`macID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `machine_auth` */

/*Table structure for table `material` */

DROP TABLE IF EXISTS `material`;

CREATE TABLE `material` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MaterialName` varchar(50) NOT NULL,
  `ProductType` int(11) NOT NULL,
  `Unit` int(11) NOT NULL,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `Barcode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `MaterialName` (`MaterialName`),
  KEY `ProductType` (`ProductType`),
  KEY `Unit` (`Unit`),
  CONSTRAINT `material_ibfk_1` FOREIGN KEY (`ProductType`) REFERENCES `producttype` (`Id`),
  CONSTRAINT `material_ibfk_2` FOREIGN KEY (`Unit`) REFERENCES `units` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `material` */

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) DEFAULT NULL,
  `LiesIn` int(11) NOT NULL DEFAULT '0',
  `Deleteflag` int(11) NOT NULL DEFAULT '0',
  `FrmPath` varchar(255) DEFAULT NULL,
  `OpenType` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert  into `menu`(`Id`,`MenuName`,`LiesIn`,`Deleteflag`,`FrmPath`,`OpenType`) values (1,'Users',0,0,NULL,0),(2,'Inventory',0,0,NULL,0),(3,'Change Password',1,0,NULL,0),(4,'User Management',1,0,NULL,0);

/*Table structure for table `menulist_old` */

DROP TABLE IF EXISTS `menulist_old`;

CREATE TABLE `menulist_old` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuName` varchar(50) NOT NULL,
  `LiesIn` int(11) NOT NULL DEFAULT '0',
  `Controller` varchar(100) DEFAULT NULL,
  `view` varchar(100) DEFAULT NULL,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  `IconName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `menulist_old` */

insert  into `menulist_old`(`Id`,`MenuName`,`LiesIn`,`Controller`,`view`,`deleteflag`,`IconName`) values (1,'User',0,NULL,NULL,0,'fa fa-user'),(2,'Change Password',1,'/User/ChangePassword','ChangePassword',0,NULL),(3,'User Management',1,'/User/UserManagement','UserManagement',0,NULL),(4,'Security Settings',1,NULL,NULL,0,NULL),(5,'Master',0,NULL,NULL,0,'fa fa-briefcase'),(6,'Vendor Management',5,NULL,NULL,0,NULL);

/*Table structure for table `productcat` */

DROP TABLE IF EXISTS `productcat`;

CREATE TABLE `productcat` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) NOT NULL,
  `LiesIn` int(11) NOT NULL DEFAULT '0',
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  `Discription` text,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `productcat` */

insert  into `productcat`(`Id`,`ProductName`,`LiesIn`,`deleteflag`,`Discription`) values (1,'Grocery',0,0,'A grocery store is a retail store that primarily sells food. A grocer is a bulk seller of food. Grocery stores often offer non-perishable food that is packaged in bottles, boxes, and cans; some also have bakeries, butchers, delis, and fresh produce'),(2,'Clothing',0,0,'Baby wear and nursery goods, children’s wear, ladies’ wear, menswear, knitwear, fashion accessories, work wear, school wear, maternity wear, lingerie, leather wear, sports wear, bridal wear'),(3,'Books and stationery',0,0,'Printing, cards, paper, pens, writing materials'),(4,'Footwear',0,0,'Children’s, ladies’ and men\'s shoes, sports shoes, shoe repair'),(5,'Rentals',0,0,'Television, films, games, House or any thing on rent'),(6,'Sports equipment',0,0,'Camping and outdoor goods, leisure goods, bicycles and cycle accessories'),(7,'Chemists and drugstores',0,0,'Beauty products, toiletries, cosmetics'),(8,'Electrical goods',0,0,'Computer hardware, computer software, white goods, brown goods, audio-visual'),(9,'Alcohol',0,0,'Wines, beers, spirits');

/*Table structure for table `producttype` */

DROP TABLE IF EXISTS `producttype`;

CREATE TABLE `producttype` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(50) NOT NULL,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `TypeName` (`TypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `producttype` */

insert  into `producttype`(`Id`,`TypeName`,`deleteflag`) values (1,'Finished',0),(2,'Semi Finished',0),(3,'Raw Material',0);

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`id`,`name`,`deleteflag`) values (0,'Active',0),(1,'InActive',0);

/*Table structure for table `stores` */

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StoreName` varchar(100) NOT NULL,
  `storeCode` varchar(50) DEFAULT NULL,
  `Phone1` varchar(15) DEFAULT NULL,
  `Phone2` varchar(15) DEFAULT NULL,
  `AddressLine1` varchar(100) DEFAULT NULL,
  `AddressLine2` varchar(100) DEFAULT NULL,
  `Comment` text,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `StoreName` (`StoreName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `stores` */

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UnitName` varchar(50) NOT NULL,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UnitName` (`UnitName`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `units` */

insert  into `units`(`Id`,`UnitName`,`deleteflag`) values (1,'ML',0),(2,'Ltr',0),(3,'Grams',0),(4,'KG',0),(5,'Unit',0);

/*Table structure for table `userauth` */

DROP TABLE IF EXISTS `userauth`;

CREATE TABLE `userauth` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserLevel` int(11) NOT NULL,
  `MenuId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `UserLevel` (`UserLevel`),
  KEY `MenuId` (`MenuId`),
  CONSTRAINT `userauth_ibfk_1` FOREIGN KEY (`UserLevel`) REFERENCES `userlevel` (`id`),
  CONSTRAINT `userauth_ibfk_2` FOREIGN KEY (`MenuId`) REFERENCES `menulist_old` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `userauth` */

insert  into `userauth`(`Id`,`UserLevel`,`MenuId`) values (1,3,2),(2,3,3),(3,3,6);

/*Table structure for table `userlevel` */

DROP TABLE IF EXISTS `userlevel`;

CREATE TABLE `userlevel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `Type` (`Type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `userlevel` */

insert  into `userlevel`(`id`,`Type`,`deleteflag`) values (1,'Agent',0),(2,'Manager',0),(3,'Administrator',0);

/*Table structure for table `userlogs` */

DROP TABLE IF EXISTS `userlogs`;

CREATE TABLE `userlogs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `IpAddress` varchar(20) NOT NULL,
  `MacAddress` varchar(50) NOT NULL,
  `LoginTimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `LogOutTimeStamp` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;

/*Data for the table `userlogs` */

insert  into `userlogs`(`Id`,`UserId`,`IpAddress`,`MacAddress`,`LoginTimestamp`,`LogOutTimeStamp`) values (1,1,'10.211.20.66','12-455-hd-iuu','2017-11-13 17:06:18',NULL),(2,1,'10.87.76.230','1C6F650DAA42','2017-11-16 11:59:54',NULL),(3,1,'10.87.76.230','1C6F650DAA42','2017-11-16 13:03:43',NULL),(4,1,'10.87.76.230','1C6F650DAA42','2017-11-16 15:31:14',NULL),(5,1,'10.87.76.230','1C6F650DAA42','2017-11-16 15:35:10',NULL),(6,1,'10.87.76.230','1C6F650DAA42','2017-11-16 15:45:10',NULL),(7,1,'10.87.76.230','1C6F650DAA42','2017-11-16 16:37:22',NULL),(8,1,'10.87.76.230','1C6F650DAA42','2017-11-16 16:48:51',NULL),(9,1,'10.87.76.230','1C6F650DAA42','2017-11-16 16:57:00',NULL),(10,1,'10.87.76.230','1C6F650DAA42','2017-11-16 17:18:54',NULL),(11,1,'10.87.76.230','1C6F650DAA42','2017-11-16 17:22:22',NULL),(12,1,'10.87.76.230','1C6F650DAA42','2017-11-16 17:38:21',NULL),(13,1,'10.87.76.230','1C6F650DAA42','2017-11-16 17:48:31',NULL),(14,1,'10.87.76.230','1C6F650DAA42','2017-11-16 17:57:34',NULL),(15,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:02:02',NULL),(16,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:30:35',NULL),(17,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:33:19',NULL),(18,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:36:14',NULL),(19,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:37:52',NULL),(20,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:47:23',NULL),(21,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:52:22',NULL),(22,1,'10.87.76.230','1C6F650DAA42','2017-11-16 18:58:40',NULL),(23,1,'10.87.76.230','1C6F650DAA42','2017-11-20 15:22:02',NULL),(24,1,'10.87.76.230','1C6F650DAA42','2017-11-20 17:05:52',NULL),(25,1,'10.87.76.230','1C6F650DAA42','2017-11-20 20:08:18',NULL),(26,1,'10.87.76.230','1C6F650DAA42','2017-11-21 15:50:21',NULL),(27,1,'10.87.76.230','1C6F650DAA42','2017-11-21 15:54:07',NULL),(28,1,'10.87.76.230','1C6F650DAA42','2017-11-21 15:57:14',NULL),(29,1,'10.87.76.230','1C6F650DAA42','2017-11-21 15:58:45',NULL),(30,1,'10.87.76.230','1C6F650DAA42','2017-11-21 17:36:05',NULL),(31,1,'10.87.76.230','1C6F650DAA42','2017-11-21 17:39:20',NULL),(32,1,'10.87.76.230','1C6F650DAA42','2017-11-21 17:41:41',NULL),(33,1,'10.87.76.230','1C6F650DAA42','2017-11-21 17:44:20',NULL),(34,1,'10.87.76.230','1C6F650DAA42','2017-11-21 17:46:29',NULL),(35,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:09:41',NULL),(36,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:14:32',NULL),(37,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:17:38',NULL),(38,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:19:08',NULL),(39,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:21:29',NULL),(40,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:24:24',NULL),(41,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:27:46',NULL),(42,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:40:18',NULL),(43,1,'10.87.76.230','1C6F650DAA42','2017-11-21 18:45:14',NULL),(44,1,'10.87.76.230','1C6F650DAA42','2017-11-22 11:45:50',NULL),(45,1,'10.87.76.230','1C6F650DAA42','2017-11-22 11:47:03',NULL),(46,1,'10.87.76.230','1C6F650DAA42','2017-11-22 11:57:13',NULL),(47,1,'10.87.76.230','1C6F650DAA42','2017-11-22 11:59:55',NULL),(48,1,'10.87.76.230','1C6F650DAA42','2017-11-22 19:29:25',NULL),(49,1,'10.87.76.230','1C6F650DAA42','2017-11-23 10:05:03',NULL),(50,1,'10.87.76.230','1C6F650DAA42','2017-11-23 10:09:04',NULL),(51,1,'10.87.76.230','1C6F650DAA42','2017-11-23 11:48:45',NULL),(52,1,'10.87.76.230','1C6F650DAA42','2017-11-23 12:30:24',NULL),(53,1,'10.87.76.230','1C6F650DAA42','2017-11-23 13:01:46',NULL),(54,1,'10.87.76.230','1C6F650DAA42','2017-11-23 14:04:17',NULL),(55,1,'10.87.76.230','1C6F650DAA42','2017-11-23 15:10:58',NULL),(56,1,'10.87.76.230','1C6F650DAA42','2017-11-23 15:13:13',NULL),(57,1,'10.87.76.230','1C6F650DAA42','2017-11-27 11:21:07',NULL),(58,1,'10.87.76.230','1C6F650DAA42','2017-11-27 11:25:53',NULL),(59,1,'10.87.76.230','1C6F650DAA42','2017-11-27 11:35:20',NULL),(60,1,'10.87.76.230','1C6F650DAA42','2017-11-27 11:36:34',NULL),(61,1,'10.87.76.230','1C6F650DAA42','2017-11-27 11:39:12',NULL),(62,1,'10.87.76.230','1C6F650DAA42','2017-11-27 11:42:02',NULL),(63,1,'10.87.76.230','1C6F650DAA42','2017-11-27 11:45:46',NULL),(64,1,'10.87.76.230','1C6F650DAA42','2017-11-27 12:40:16',NULL),(65,1,'10.87.76.230','1C6F650DAA42','2017-11-27 12:41:12',NULL),(66,1,'10.87.76.230','1C6F650DAA42','2017-11-27 12:47:34',NULL),(67,1,'10.87.76.230','1C6F650DAA42','2017-11-27 12:56:33',NULL),(68,1,'10.87.76.230','1C6F650DAA42','2017-11-27 13:03:12',NULL),(69,1,'10.87.76.230','1C6F650DAA42','2017-11-28 11:14:09',NULL),(70,1,'10.87.76.230','1C6F650DAA42','2017-11-28 11:51:34',NULL),(71,1,'10.87.76.230','1C6F650DAA42','2017-11-28 11:53:14',NULL),(72,1,'10.87.76.230','1C6F650DAA42','2017-11-28 12:33:50',NULL),(73,1,'10.87.76.230','1C6F650DAA42','2017-11-28 14:43:29',NULL),(74,1,'10.87.76.230','1C6F650DAA42','2017-11-28 14:56:00',NULL),(75,1,'10.87.76.230','1C6F650DAA42','2017-11-28 15:01:51',NULL),(76,1,'10.87.76.230','1C6F650DAA42','2017-11-28 15:04:15',NULL),(77,1,'10.87.76.230','1C6F650DAA42','2017-11-28 15:09:18',NULL),(78,1,'10.87.76.230','1C6F650DAA42','2017-11-28 15:10:54',NULL),(79,1,'10.87.76.230','1C6F650DAA42','2017-11-28 15:34:43',NULL),(80,1,'10.87.76.230','1C6F650DAA42','2017-11-28 18:13:52',NULL),(81,1,'10.87.76.230','1C6F650DAA42','2017-11-28 18:15:37',NULL),(82,1,'10.87.76.230','1C6F650DAA42','2017-11-28 18:17:11',NULL),(83,1,'10.87.76.230','1C6F650DAA42','2017-11-28 18:33:43',NULL),(84,1,'10.87.76.230','1C6F650DAA42','2017-11-28 19:16:03',NULL),(85,1,'10.87.76.230','1C6F650DAA42','2017-11-28 19:23:22',NULL),(86,1,'10.87.76.230','1C6F650DAA42','2017-11-29 11:26:55',NULL),(87,1,'10.87.76.230','1C6F650DAA42','2017-11-29 11:28:15',NULL),(88,1,'10.87.76.230','1C6F650DAA42','2017-11-29 11:50:14',NULL),(89,1,'10.87.76.230','1C6F650DAA42','2017-11-29 16:15:25',NULL),(90,1,'10.87.76.230','1C6F650DAA42','2017-11-29 17:57:35',NULL),(91,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:02:30',NULL),(92,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:04:34',NULL),(93,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:05:44',NULL),(94,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:06:43',NULL),(95,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:08:13',NULL),(96,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:09:09',NULL),(97,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:10:03',NULL),(98,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:14:39',NULL),(99,1,'10.87.76.230','1C6F650DAA42','2017-11-29 18:25:52',NULL),(100,1,'10.87.76.230','1C6F650DAA42','2017-11-29 19:05:28',NULL),(101,1,'10.87.76.230','1C6F650DAA42','2017-11-30 10:28:37',NULL),(102,1,'10.87.76.230','1C6F650DAA42','2017-11-30 10:39:50',NULL),(103,1,'10.87.76.230','1C6F650DAA42','2017-11-30 12:03:03',NULL),(104,1,'10.87.76.230','1C6F650DAA42','2017-11-30 12:08:29',NULL),(105,1,'10.87.76.230','1C6F650DAA42','2017-11-30 12:19:51',NULL),(106,1,'10.87.76.230','1C6F650DAA42','2017-11-30 12:30:42',NULL),(107,1,'10.87.76.230','1C6F650DAA42','2017-11-30 12:31:59',NULL),(108,1,'10.87.76.230','1C6F650DAA42','2017-11-30 12:40:35',NULL),(109,1,'10.87.76.230','1C6F650DAA42','2017-11-30 12:43:08',NULL),(110,1,'10.87.76.230','1C6F650DAA42','2017-11-30 13:02:43',NULL),(111,1,'10.87.76.230','1C6F650DAA42','2017-11-30 16:39:44',NULL),(112,1,'10.87.76.230','1C6F650DAA42','2017-11-30 16:53:56',NULL),(113,1,'10.87.76.230','1C6F650DAA42','2017-11-30 16:55:18',NULL),(114,1,'10.87.76.230','1C6F650DAA42','2017-11-30 16:56:50',NULL),(115,1,'10.87.76.50','1C6F650DAA42','2017-12-04 12:30:41',NULL),(116,1,'10.87.76.50','1C6F650DAA42','2017-12-04 12:41:20',NULL),(117,1,'10.87.76.50','1C6F650DAA42','2017-12-04 15:49:50',NULL),(118,1,'10.87.76.50','1C6F650DAA42','2017-12-04 15:55:15',NULL),(119,1,'10.87.76.50','1C6F650DAA42','2017-12-04 16:22:14',NULL),(120,1,'10.87.76.50','1C6F650DAA42','2017-12-04 16:33:28',NULL),(121,1,'10.87.76.50','1C6F650DAA42','2017-12-04 16:40:03',NULL),(122,1,'10.87.76.50','1C6F650DAA42','2017-12-04 16:41:47',NULL),(123,1,'10.87.76.50','1C6F650DAA42','2017-12-04 16:43:19',NULL),(124,1,'10.87.76.50','1C6F650DAA42','2017-12-04 16:45:27',NULL),(125,1,'10.87.76.50','1C6F650DAA42','2017-12-04 16:49:57',NULL),(126,1,'10.87.76.50','1C6F650DAA42','2017-12-04 17:28:05',NULL),(127,1,'10.87.76.50','1C6F650DAA42','2017-12-08 18:04:06',NULL),(128,1,'10.87.76.50','1C6F650DAA42','2017-12-08 18:16:37',NULL),(129,1,'10.87.76.50','1C6F650DAA42','2017-12-11 11:14:54',NULL),(130,1,'10.87.76.50','1C6F650DAA42','2017-12-11 11:22:16',NULL),(131,1,'10.87.76.50','1C6F650DAA42','2017-12-11 11:36:48',NULL),(132,1,'10.87.76.50','1C6F650DAA42','2017-12-11 11:42:45',NULL),(133,1,'10.87.76.50','1C6F650DAA42','2017-12-11 17:31:00',NULL),(134,1,'10.87.76.50','1C6F650DAA42','2017-12-11 17:35:09',NULL),(135,1,'10.87.76.50','1C6F650DAA42','2017-12-11 18:28:56',NULL),(136,1,'10.87.76.50','1C6F650DAA42','2017-12-12 13:39:58',NULL),(137,1,'10.87.77.47','1C6F650DAA42','2017-12-14 11:35:17',NULL),(138,1,'10.87.77.47','1C6F650DAA42','2017-12-14 19:46:03',NULL),(139,1,'10.87.77.47','1C6F650DAA42','2017-12-15 17:40:02',NULL),(140,1,'10.87.77.47','1C6F650DAA42','2017-12-15 17:45:51',NULL),(141,1,'10.87.77.47','1C6F650DAA42','2017-12-15 17:49:21',NULL),(142,1,'10.87.77.47','1C6F650DAA42','2017-12-15 18:04:38',NULL),(143,1,'10.87.77.47','1C6F650DAA42','2017-12-15 18:17:11',NULL),(144,1,'10.87.77.47','1C6F650DAA42','2017-12-18 11:57:12',NULL),(145,1,'10.87.77.47','1C6F650DAA42','2017-12-18 12:01:32',NULL),(146,1,'10.87.77.47','1C6F650DAA42','2017-12-18 12:03:24',NULL),(147,1,'10.87.77.47','1C6F650DAA42','2017-12-18 12:05:14',NULL),(148,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:11:00',NULL),(149,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:13:35',NULL),(150,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:21:35',NULL),(151,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:30:44',NULL),(152,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:33:53',NULL),(153,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:35:42',NULL),(154,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:41:45',NULL),(155,1,'10.87.77.47','1C6F650DAA42','2017-12-19 17:43:40',NULL),(156,1,'10.87.77.47','1C6F650DAA42','2017-12-22 18:08:35',NULL),(157,1,'10.87.77.47','1C6F650DAA42','2017-12-22 18:11:15',NULL),(158,1,'10.87.77.47','1C6F650DAA42','2017-12-22 18:14:00',NULL),(159,1,'10.87.77.47','1C6F650DAA42','2017-12-26 12:59:12',NULL),(160,1,'10.87.77.47','1C6F650DAA42','2017-12-26 13:17:45',NULL),(161,1,'10.87.77.47','1C6F650DAA42','2017-12-26 13:36:03',NULL),(162,1,'10.87.77.47','1C6F650DAA42','2017-12-26 13:42:47',NULL),(163,1,'10.87.77.47','1C6F650DAA42','2017-12-26 15:22:45',NULL),(164,1,'10.87.77.47','1C6F650DAA42','2017-12-26 15:25:40',NULL),(165,1,'10.87.77.47','1C6F650DAA42','2017-12-26 15:36:34',NULL),(166,1,'10.87.77.47','1C6F650DAA42','2017-12-26 15:40:40',NULL),(167,1,'10.87.77.47','1C6F650DAA42','2017-12-26 15:43:11',NULL),(168,1,'10.87.77.47','1C6F650DAA42','2017-12-26 15:45:05',NULL),(169,1,'10.87.77.47','1C6F650DAA42','2017-12-26 15:46:15',NULL),(170,1,'10.87.77.47','1C6F650DAA42','2017-12-26 16:14:32',NULL),(171,1,'10.87.77.47','1C6F650DAA42','2017-12-26 16:17:58',NULL),(172,1,'10.87.77.47','1C6F650DAA42','2017-12-26 16:25:54',NULL),(173,1,'10.87.77.47','1C6F650DAA42','2017-12-26 16:26:00',NULL),(174,1,'10.87.77.47','1C6F650DAA42','2017-12-26 16:26:43',NULL),(175,1,'10.87.77.47','1C6F650DAA42','2017-12-26 16:42:06',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Ufname` varchar(100) NOT NULL,
  `Ulname` varchar(100) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `userlevel` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `ublk` int(11) NOT NULL DEFAULT '0',
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  `comment` text,
  `cdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CreatedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userlevel` (`userlevel`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status`) REFERENCES `status` (`id`) ON DELETE CASCADE,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`userlevel`) REFERENCES `userlevel` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`Ufname`,`Ulname`,`uname`,`pwd`,`userlevel`,`status`,`ublk`,`deleteflag`,`comment`,`cdate`,`CreatedBy`) values (1,'Support','Administrator','admin','ABE23BC305D7188487E6F1A2CF4EE623',3,0,0,0,'test comment please accept the comment','2017-11-13 12:04:48','Support Administrator'),(2,'Test','User','testuser','68a24878cc568766b735c62be5f306ed',2,0,0,0,'test comment please accept','2017-12-15 19:06:06','Support Administrator'),(3,'Deepak','Poojari','DeepPooja','68a24878cc568766b735c62be5f306ed',2,0,0,0,'test comment please accept','2017-12-15 19:20:14','Support Administrator');

/*Table structure for table `usersecurity` */

DROP TABLE IF EXISTS `usersecurity`;

CREATE TABLE `usersecurity` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MenuID` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `MenuID` (`MenuID`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `usersecurity` */

/*Table structure for table `vendors` */

DROP TABLE IF EXISTS `vendors`;

CREATE TABLE `vendors` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `OrgName` varchar(250) NOT NULL,
  `VendorCode` varchar(50) DEFAULT NULL,
  `Phone1` varchar(12) DEFAULT NULL,
  `Phone2` varchar(12) DEFAULT NULL,
  `Addressline1` varchar(250) DEFAULT NULL,
  `Addressline2` varchar(250) DEFAULT NULL,
  `Landmark` varchar(100) DEFAULT NULL,
  `pin` int(11) DEFAULT NULL,
  `State` int(11) NOT NULL,
  `AreaID` int(11) NOT NULL,
  `Tin` varchar(50) DEFAULT NULL,
  `VAT` varchar(50) DEFAULT NULL,
  `GST` varchar(50) DEFAULT NULL,
  `Comment` text,
  `deleteflag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vendors` */

/* Function  structure for function  `InsertUserLogs` */

/*!50003 DROP FUNCTION IF EXISTS `InsertUserLogs` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `InsertUserLogs`(userid int, IpAddress varchar(15),MacAddress varchar(50)) RETURNS int(11)
begin 
 insert into userlogs(UserId,IpAddress,MacAddress) values (userid,IpAddress,MacAddress);
 return (SELECT ID FROM userlogs WHERE UserId=userid ORDER BY id DESC LIMIT 1);
end */$$
DELIMITER ;

/* Procedure structure for procedure `MenuList` */

/*!50003 DROP PROCEDURE IF EXISTS  `MenuList` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `MenuList`()
Begin 
SELECT menulist.id, menulist.Menuname,menulist.liesin,menulist.controller,menulist.view,userauth.UserLevel,userauth.MenuId FROM userauth,menulist WHERE menulist.id = userauth.MenuId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `MenuUserdata` */

/*!50003 DROP PROCEDURE IF EXISTS  `MenuUserdata` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `MenuUserdata`()
Begin
SELECT menulist.id, menulist.Menuname,menulist.liesin,menulist.controller,menulist.view,userauth.UserLevel FROM userauth,menulist WHERE menulist.id = userauth.MenuId AND menulist.deleteflag=0 UNION 
SELECT menulist.id, menulist.Menuname,menulist.liesin,menulist.controller,menulist.view,userauth.UserLevel FROM menulist LEFT JOIN  userauth ON userauth.menuid = menulist.id WHERE menulist.deleteflag=0 AND menulist.liesin=0;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
