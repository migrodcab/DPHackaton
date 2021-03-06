﻿start transaction;

create database `Acme-Orienteering`;

use `Acme-Orienteering`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete	on `Acme-Orienteering`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `Acme-Orienteering`.* to 'acme-manager'@'%';


-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Orienteering
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  KEY `FK_iii10ovh0ix9dfhm8hh3no1e0` (`curriculum_id`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_iii10ovh0ix9dfhm8hh3no1e0` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (18,0,'Miguel','12345678A','666777888','Rodriguez',NULL,1);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bulletin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creationMoment` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2233cafbbkc6w4lu4fkwxbsdo` (`club_id`),
  CONSTRAINT `FK_2233cafbbkc6w4lu4fkwxbsdo` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin`
--

LOCK TABLES `bulletin` WRITE;
/*!40000 ALTER TABLE `bulletin` DISABLE KEYS */;
INSERT INTO `bulletin` VALUES (118,0,'2016-01-01 00:16:00','Our club have obtain the best classifications of 2015!','Thank you!',23,101),(119,0,'2016-02-21 21:16:00','Please go to the Meeting Room at 20:00','Next meeting!',23,101),(120,0,'2015-11-11 00:00:00','Another cup for this year!','Congratulations!',23,101),(121,0,'2015-09-09 11:11:00','Our club installation will be close the next Sunday.','Information',23,101),(122,0,'2016-07-01 12:05:00','One of our members lost his mobile phone, please take it to the concierge.','Pay Atention!',23,101),(123,0,'2015-12-02 12:00:00','The delivery of diplomas for our best runners will take place on the Meeting Room at 20th January 2016','Important meeting',23,101);
/*!40000 ALTER TABLE `bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (124,0,'Only for older than 18 years old runners and with a minimum of 5 years of experience.','Professional'),(125,0,'Only for younger than 18 years old runners and with a minimum of 2 years of experience.','Junior'),(126,0,'Only for Senior runners.','Senior'),(127,0,'Only for Cadete runners.','Cadete'),(128,0,'Only for Infantil runners.','Infantil'),(129,0,'Only for Benjamín runners.','Benjamín'),(130,0,'Only for Juvenil runners.','Juvenil');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classification`
--

DROP TABLE IF EXISTS `classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classification` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sw084lnv2tqkk7i4073kfnj88` (`club_id`),
  KEY `FK_j3n0hknmuwl55gdcwxmbylvb8` (`race_id`),
  CONSTRAINT `FK_j3n0hknmuwl55gdcwxmbylvb8` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`),
  CONSTRAINT `FK_sw084lnv2tqkk7i4073kfnj88` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classification`
--

LOCK TABLES `classification` WRITE;
/*!40000 ALTER TABLE `classification` DISABLE KEYS */;
INSERT INTO `classification` VALUES (147,0,25,1,101,139),(148,0,0,2,102,139),(149,0,0,3,103,139),(150,0,0,4,104,139),(151,0,0,5,105,139),(152,0,0,6,106,139);
/*!40000 ALTER TABLE `classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creationMoment` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pfe7cdghp0g3tuke10ef20xfh` (`manager_id`),
  CONSTRAINT `FK_pfe7cdghp0g3tuke10ef20xfh` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (101,0,'2014-06-16 13:05:00','El club con las mejores clasificaciones de los últimos años.','Los Imperdibles',23),(102,0,'2015-01-16 13:05:00','El mejor club de orientación de Triana y del mundo.','Triana OC',24),(103,0,'2015-05-15 11:00:00','RMOC, encuentra tu camino.','Reina Mercedes OC',25),(104,0,'2015-12-02 08:00:00','Todo profesional se orienta, sólo los mejores lo hacen en tiempo record.','Orienracing Faster Team',26),(105,0,'2016-01-01 15:00:00','Club para los más peques, ¡de todas las edades!.','Orientación Mairena',27),(106,0,'2013-03-13 13:00:00','Be proffesional, follow your instinct.','Prorienteering Club',28);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `club_pictures`
--

DROP TABLE IF EXISTS `club_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club_pictures` (
  `Club_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_62d5xnx2aiwlgunhe8n5bw8gk` (`Club_id`),
  CONSTRAINT `FK_62d5xnx2aiwlgunhe8n5bw8gk` FOREIGN KEY (`Club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club_pictures`
--

LOCK TABLES `club_pictures` WRITE;
/*!40000 ALTER TABLE `club_pictures` DISABLE KEYS */;
INSERT INTO `club_pictures` VALUES (101,'http://www.abc.es/Media/201310/31/222792351--644x362.jpg'),(102,'http://deportes-aventura.es/wp-content/uploads/2013/07/Orientaci%C3%B3n-deporte-de-b%C3%BAsqueda-2.jpg');
/*!40000 ALTER TABLE `club_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `starRating` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  `commentedEntity_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (189,0,'\0','2016-04-09 19:30:00',4,'Estoy muy contento con el resto de miembros.',31,101),(190,0,'','2016-03-09 19:30:00',1,'Los demás miembros no valen.',31,101),(191,0,'\0','2016-04-09 19:45:00',5,'Es la mejor liga del mundo.',31,131),(192,0,'','2016-03-09 19:45:00',0,'Es la peor liga del mundo.',31,131),(193,0,'\0','2016-04-09 20:45:00',3,'La carrera estaba bien.',31,139),(194,0,'','2016-04-08 20:45:00',0,'La carrera era demasiado mala.',31,139),(195,0,'\0','2015-04-10 10:30:00',0,'Ni me aceptan, tsss...',31,101),(196,0,'\0','2016-01-11 11:30:00',2,'Decepcionado con los resultados.',31,101),(197,0,'\0','2015-05-15 15:30:00',3,'No está mal, pero no tiene instalacione propias.',31,101),(198,0,'\0','2016-02-22 22:22:00',5,'Increíble, nunca he estado en un club mejor que este.',31,101),(199,0,'\0','2015-02-02 02:30:00',5,'Los miembros son muy amables, muy buen ambiente de equipo.',31,101);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `dislikes` varchar(255) DEFAULT NULL,
  `likes` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (19,0,'ciudad, vehículos a motor','deporte, naturaleza','Liderazgo, pasión','Experiencia guiando a los equipos hacia el éxito.'),(20,0,'trampas, juego sucio','deporte, montaña','velocidad, orientación','En el podio durante las últimas 25 competiciones.'),(21,0,'jugadores agresivos','montañismo, naturaleza','Visualizo cada detalle, respetuoso con los competidores','Totalmente imparcial y profesional en lo que hago.'),(22,0,'trampas, juego sucio','deporte, montaña','velocidad, orientación','En el podio durante las últimas 25 competiciones.');
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entered`
--

DROP TABLE IF EXISTS `entered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entered` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `acceptedMoment` datetime DEFAULT NULL,
  `isDenied` bit(1) NOT NULL,
  `isMember` bit(1) NOT NULL,
  `registerMoment` datetime DEFAULT NULL,
  `report` varchar(255) DEFAULT NULL,
  `club_id` int(11) NOT NULL,
  `runner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a700l9lx1p3cuu5xg2ybf5xv0` (`club_id`),
  KEY `FK_3kqxsjx830e2n76h0gjfu9oqy` (`runner_id`),
  CONSTRAINT `FK_3kqxsjx830e2n76h0gjfu9oqy` FOREIGN KEY (`runner_id`) REFERENCES `runner` (`id`),
  CONSTRAINT `FK_a700l9lx1p3cuu5xg2ybf5xv0` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entered`
--

LOCK TABLES `entered` WRITE;
/*!40000 ALTER TABLE `entered` DISABLE KEYS */;
INSERT INTO `entered` VALUES (107,0,'2016-01-10 18:55:00','\0','','2015-12-05 12:10:00','',101,31),(108,0,'2016-01-10 18:56:00','\0','','2015-12-05 12:10:00','',101,32),(109,0,NULL,'\0','\0','2015-12-05 12:10:00','',102,33),(110,0,'2016-01-10 18:55:00','\0','','2015-12-05 12:10:00','',101,33),(111,0,'2016-01-10 18:55:00','\0','','2012-12-06 22:10:00','',101,34),(112,0,'2016-01-10 18:55:00','\0','','2015-12-07 12:08:00','',101,35),(113,0,'2016-05-08 13:55:00','\0','','2015-12-08 12:00:00','',101,36),(114,0,NULL,'','\0','2016-05-05 12:30:00','',103,33),(115,0,NULL,'\0','\0','2016-05-05 12:50:00','',104,33),(116,0,'2016-01-10 18:55:00','\0','\0','2015-12-05 13:10:00','',105,33),(117,0,NULL,'','\0','2015-12-05 13:25:00','',106,33);
/*!40000 ALTER TABLE `entered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feepayment`
--

DROP TABLE IF EXISTS `feepayment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feepayment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `amount` double NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvvCode` int(11) NOT NULL,
  `expirationMonth` int(11) NOT NULL,
  `expirationYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `paymentMoment` datetime DEFAULT NULL,
  `club_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t3bl92dsds5tn5onbsgd2q9em` (`club_id`),
  KEY `FK_cjj36n9hynv129n9xa2vn8agu` (`league_id`),
  CONSTRAINT `FK_cjj36n9hynv129n9xa2vn8agu` FOREIGN KEY (`league_id`) REFERENCES `league` (`id`),
  CONSTRAINT `FK_t3bl92dsds5tn5onbsgd2q9em` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feepayment`
--

LOCK TABLES `feepayment` WRITE;
/*!40000 ALTER TABLE `feepayment` DISABLE KEYS */;
INSERT INTO `feepayment` VALUES (159,0,350,'VISA',303,7,2020,'Manolo López','1111222233334444','2016-02-03 12:12:00',101,131),(160,0,350,'MASTER CARD',553,8,2022,'Adrián Martínez','4716637707340143','2016-02-05 12:55:00',102,131),(161,0,150,'VISA',303,7,2020,'Manolo López','1111222233334444','2016-02-03 16:16:00',101,132),(162,0,50,'VISA',303,7,2020,'Manolo López','1111222233334444','2016-02-13 17:12:00',101,133),(163,0,125,'VISA',303,7,2020,'Manolo López','1111222233334444','2016-02-16 15:12:00',101,134),(164,0,300,'VISA',303,7,2020,'Manolo López','1111222233334444','2016-02-20 12:30:00',101,135),(165,0,780,'VISA',303,7,2020,'Manolo López','1111222233334444','2016-02-25 12:00:00',101,136);
/*!40000 ALTER TABLE `feepayment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finances`
--

DROP TABLE IF EXISTS `finances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finances` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `amount` double NOT NULL,
  `paymentMoment` datetime DEFAULT NULL,
  `league_id` int(11) NOT NULL,
  `sponsor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jtv969b4f6u46rxnoe09nxr2q` (`league_id`),
  KEY `FK_evv61nxkxotm55c4f5pam1y0l` (`sponsor_id`),
  CONSTRAINT `FK_evv61nxkxotm55c4f5pam1y0l` FOREIGN KEY (`sponsor_id`) REFERENCES `sponsor` (`id`),
  CONSTRAINT `FK_jtv969b4f6u46rxnoe09nxr2q` FOREIGN KEY (`league_id`) REFERENCES `league` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finances`
--

LOCK TABLES `finances` WRITE;
/*!40000 ALTER TABLE `finances` DISABLE KEYS */;
INSERT INTO `finances` VALUES (182,0,1500,'2016-04-12 17:06:00',131,176),(183,0,2500,'2016-04-05 01:01:00',131,177),(184,0,3100,'2016-04-08 22:00:00',131,178),(185,0,5000,'2016-04-01 20:05:00',131,179),(186,0,3000,'2016-04-22 17:05:00',131,180),(187,0,100,'2016-04-25 13:06:00',131,181),(188,0,1600,'2016-04-20 17:50:00',132,176);
/*!40000 ALTER TABLE `finances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder`
--

DROP TABLE IF EXISTS `folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `isSystem` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_l1kp977466ddsv762wign7kdh` (`name`),
  KEY `UK_a5prtxr1c0vwoxbpixtnse2nq` (`isSystem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder`
--

LOCK TABLES `folder` WRITE;
/*!40000 ALTER TABLE `folder` DISABLE KEYS */;
INSERT INTO `folder` VALUES (46,0,'','InBox',18),(47,0,'','OutBox',18),(48,0,'','TrashBox',18),(49,0,'','InBox',23),(50,0,'','OutBox',23),(51,0,'','TrashBox',23),(52,0,'','InBox',31),(53,0,'','OutBox',31),(54,0,'','TrashBox',31),(55,0,'','InBox',37),(56,0,'','OutBox',37),(57,0,'','TrashBox',37),(58,0,'','InBox',32),(59,0,'','OutBox',32),(60,0,'','TrashBox',32),(61,0,'','InBox',24),(62,0,'','OutBox',24),(63,0,'','TrashBox',24),(64,0,'','InBox',33),(65,0,'','OutBox',33),(66,0,'','TrashBox',33),(67,0,'','InBox',25),(68,0,'','OutBox',25),(69,0,'','TrashBox',25),(70,0,'','InBox',38),(71,0,'','OutBox',38),(72,0,'','TrashBox',38),(73,0,'\0','MyBox',31),(74,0,'','InBox',26),(75,0,'','OutBox',26),(76,0,'','TrashBox',26),(77,0,'','InBox',27),(78,0,'','OutBox',27),(79,0,'','TrashBox',27),(80,0,'','InBox',28),(81,0,'','OutBox',28),(82,0,'','TrashBox',28),(83,0,'','InBox',34),(84,0,'','OutBox',34),(85,0,'','TrashBox',34),(86,0,'','InBox',35),(87,0,'','OutBox',35),(88,0,'','TrashBox',35),(89,0,'','InBox',36),(90,0,'','OutBox',36),(91,0,'','TrashBox',36),(92,0,'','InBox',29),(93,0,'','OutBox',29),(94,0,'','TrashBox',29),(95,0,'','InBox',30),(96,0,'','OutBox',30),(97,0,'','TrashBox',30),(98,0,'\0','Mi carpeta 1',31),(99,0,'\0','Mi carpeta 2',31),(100,0,'\0','Mi carpeta 3',31);
/*!40000 ALTER TABLE `folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_message`
--

DROP TABLE IF EXISTS `folder_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder_message` (
  `folders_id` int(11) NOT NULL,
  `messages_id` int(11) NOT NULL,
  KEY `FK_mt7qqvep4q1vamxl5aqko7e1y` (`messages_id`),
  KEY `FK_op9t0hojipyl10ju0vp7sw4l6` (`folders_id`),
  CONSTRAINT `FK_op9t0hojipyl10ju0vp7sw4l6` FOREIGN KEY (`folders_id`) REFERENCES `folder` (`id`),
  CONSTRAINT `FK_mt7qqvep4q1vamxl5aqko7e1y` FOREIGN KEY (`messages_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_message`
--

LOCK TABLES `folder_message` WRITE;
/*!40000 ALTER TABLE `folder_message` DISABLE KEYS */;
INSERT INTO `folder_message` VALUES (46,42),(46,44),(47,39),(47,40),(47,41),(47,43),(47,45),(52,39),(52,41),(52,43),(52,45),(52,42),(52,44),(53,42),(53,44),(54,40);
/*!40000 ALTER TABLE `folder_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `amount` double NOT NULL,
  `creationMoment` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startedMoment` datetime DEFAULT NULL,
  `referee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_969iekw25xjufakwr07g5odhk` (`referee_id`),
  CONSTRAINT `FK_969iekw25xjufakwr07g5odhk` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (131,0,350,'2015-11-06 13:00:00','The most important european league!','First Orienteering League (FOL)','2016-02-02 10:30:00',37),(132,0,150,'2015-11-06 13:00:00','The most important junior european league!','First Junior Orienteering League (FJOL)','2016-12-12 10:30:00',38),(133,0,50,'2015-11-06 13:00:00','The most important junior american league!','First Junior Orienteering American League (FJOAL)','2015-12-12 10:30:00',38),(134,0,125,'2016-03-06 12:00:00','Para españoles de nacimiento.','Liga española de orientación','2016-12-01 04:30:00',38),(135,0,300,'2016-02-06 13:00:00','Para españoles Junior.','Liga española de orientación Junior','2016-11-01 05:30:00',37),(136,0,780,'2015-03-06 12:00:00','Ready?','Pro League International (PLI)','2015-12-01 04:30:00',38),(137,0,500,'2016-03-06 13:00:00','New League for new experiences.','New future league.','2016-12-01 00:30:00',37),(138,0,0,'2016-04-06 13:00:00','Free For All League','Free League','2016-11-01 00:30:00',37);
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `league_pictures`
--

DROP TABLE IF EXISTS `league_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league_pictures` (
  `League_id` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_4lhanyncgjhp90ngwreadsko6` (`League_id`),
  CONSTRAINT `FK_4lhanyncgjhp90ngwreadsko6` FOREIGN KEY (`League_id`) REFERENCES `league` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league_pictures`
--

LOCK TABLES `league_pictures` WRITE;
/*!40000 ALTER TABLE `league_pictures` DISABLE KEYS */;
INSERT INTO `league_pictures` VALUES (131,'http://www.fedo.org/web/images/banners/anuncios/logo-laliga-3.gif'),(132,'http://dizw242ufxqut.cloudfront.net/images/product/music/album/image5/liga-26768226-frntl.png');
/*!40000 ALTER TABLE `league_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_84bmmxlq61tiaoc7dy7kdcghh` (`userAccount_id`),
  KEY `FK_ectj9ff6dgtqf6dx95shxypcf` (`curriculum_id`),
  CONSTRAINT `FK_84bmmxlq61tiaoc7dy7kdcghh` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_ectj9ff6dgtqf6dx95shxypcf` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (23,0,'Guillermo','87654321B','666777666','Alcalá',19,2),(24,0,'Ruben','74654321B','652147963','Martinez',NULL,6),(25,0,'Javier','85274185L','689741157','García',NULL,8),(26,0,'Pepe','98865524G','655322988','García',NULL,10),(27,0,'Javier','24513587L','645978312','Santos',NULL,11),(28,0,'Ubaldo','45215789H','633522411','Mata',NULL,12),(29,0,'Miguel','45628547F','666543212','Alcántara',NULL,16),(30,0,'Jose','12345678A','635784147','Pozo',NULL,17);
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` longtext,
  `sentMoment` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (39,0,'You were registered successfully! Welcome to Acme Orienteering!','2016-05-02 12:15:00','Welcome!',18),(40,0,'You were registered successfully! Welcome to Acme Orienteering!','2016-05-02 12:15:00','Welcome!',18),(41,0,'Welcome to Acme Orienteering!','2016-05-02 12:20:00','Mensaje 0',18),(42,0,'Gracias !','2016-05-02 12:25:00','Mensaje 1',31),(43,0,'De nada','2016-05-02 12:30:00','Mensaje 2',18),(44,0,'¿Como se llama?','2016-05-02 12:35:00','Mensaje 3',31),(45,0,'Mi nombre de usuario es admin','2016-05-02 12:40:00','Mensaje 4',18);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_actor`
--

DROP TABLE IF EXISTS `message_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_actor` (
  `received_id` int(11) NOT NULL,
  `recipients_id` int(11) NOT NULL,
  KEY `FK_rymlb4i351cxqeovng9dovfk` (`received_id`),
  CONSTRAINT `FK_rymlb4i351cxqeovng9dovfk` FOREIGN KEY (`received_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_actor`
--

LOCK TABLES `message_actor` WRITE;
/*!40000 ALTER TABLE `message_actor` DISABLE KEYS */;
INSERT INTO `message_actor` VALUES (39,31),(40,31),(41,31),(42,18),(42,31),(43,31),(44,18),(44,31),(45,31);
/*!40000 ALTER TABLE `message_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participates`
--

DROP TABLE IF EXISTS `participates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participates` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `result` int(11) NOT NULL,
  `race_id` int(11) NOT NULL,
  `runner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oil6acl8vf0oqncpfi2rdx88f` (`race_id`),
  KEY `FK_sk34ygt8bmoixpe859bggbb8j` (`runner_id`),
  CONSTRAINT `FK_sk34ygt8bmoixpe859bggbb8j` FOREIGN KEY (`runner_id`) REFERENCES `runner` (`id`),
  CONSTRAINT `FK_oil6acl8vf0oqncpfi2rdx88f` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participates`
--

LOCK TABLES `participates` WRITE;
/*!40000 ALTER TABLE `participates` DISABLE KEYS */;
INSERT INTO `participates` VALUES (166,0,65,139,31),(167,0,70,140,33),(168,0,47,139,32),(169,0,65,139,33),(170,0,60,139,34),(171,0,50,139,35),(172,0,44,139,36),(173,0,0,144,36),(174,0,0,145,31),(175,0,0,144,32);
/*!40000 ALTER TABLE `participates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punishment`
--

DROP TABLE IF EXISTS `punishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `punishment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `points` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `club_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e5kkuxfm0gdv89e5xw2ib5aid` (`club_id`),
  KEY `FK_kg5091ucwo9xf006w14shqcfn` (`league_id`),
  CONSTRAINT `FK_kg5091ucwo9xf006w14shqcfn` FOREIGN KEY (`league_id`) REFERENCES `league` (`id`),
  CONSTRAINT `FK_e5kkuxfm0gdv89e5xw2ib5aid` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punishment`
--

LOCK TABLES `punishment` WRITE;
/*!40000 ALTER TABLE `punishment` DISABLE KEYS */;
INSERT INTO `punishment` VALUES (153,0,10,'The second place runner was catched going throw a ilegal zone.',101,131),(154,0,50,'A runner was catched cheating on the last race.',101,131),(155,0,50,'A runner was catched cheating on the start',101,131),(156,0,50,'A runner was catched cheating on the third race.',101,131),(157,0,60,'A runner was catched doping.',101,131),(158,0,250,'The full club was catched doping.',101,131);
/*!40000 ALTER TABLE `punishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `race` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7g7us6gu8le70ke4carod8mlo` (`category_id`),
  KEY `FK_smyiel3bhxs0g26t5u4987pmv` (`league_id`),
  CONSTRAINT `FK_smyiel3bhxs0g26t5u4987pmv` FOREIGN KEY (`league_id`) REFERENCES `league` (`id`),
  CONSTRAINT `FK_7g7us6gu8le70ke4carod8mlo` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (139,0,'Primera carrera de la liga','2016-01-01 12:00:00','Round 1',124,131),(140,0,'Segunda carrera de la liga','2016-03-01 12:00:00','Round 2',125,131),(141,0,'Tercera carrera de la liga','2016-05-01 12:00:00','Round 3',126,131),(142,0,'Cuarta carrera de la liga','2016-07-01 12:00:00','Round 4',127,131),(143,0,'Quinta carrera de la liga','2016-09-01 12:00:00','Round 5',128,131),(144,0,'Sexta carrera de la liga','2016-09-09 12:12:00','Round 6',129,131),(145,0,'Carrera de orientación perteneciente a la liga junior','2017-01-01 20:30:00','Primera carrera de la liga junior',125,132),(146,0,'The World First Free Race','2016-12-25 20:30:00','Free Race',125,138);
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referee` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_poaxqb6i26ly4p9nkegehjagr` (`userAccount_id`),
  KEY `FK_r3ok4lul9st8hlfwhs4qbny2b` (`curriculum_id`),
  CONSTRAINT `FK_poaxqb6i26ly4p9nkegehjagr` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_r3ok4lul9st8hlfwhs4qbny2b` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (37,0,'Carlos','66855744H','885223654','Mata',21,4),(38,0,'Jose','66851247H','669988147','Cortes',NULL,9);
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runner`
--

DROP TABLE IF EXISTS `runner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runner` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nif` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `curriculum_id` int(11) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_qb75kbc1r1jj1y78pqmyh6we0` (`userAccount_id`),
  KEY `FK_cndu4rfvc1dt63l33moth6a2r` (`curriculum_id`),
  CONSTRAINT `FK_qb75kbc1r1jj1y78pqmyh6we0` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_cndu4rfvc1dt63l33moth6a2r` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculum` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runner`
--

LOCK TABLES `runner` WRITE;
/*!40000 ALTER TABLE `runner` DISABLE KEYS */;
INSERT INTO `runner` VALUES (31,0,'Manolo','11155472F','666555222','López',20,3),(32,0,'Alejandro','11155482F','654236547','Parejo',22,5),(33,0,'Antonio','74955482A','777854265','Pozo',NULL,7),(34,0,'Antonio','54625785L','71236384','Lozano',NULL,13),(35,0,'Alfonso','45123738A','654245157','Garrido',NULL,14),(36,0,'Armando','45678912G','685942371','Tejas',NULL,15);
/*!40000 ALTER TABLE `runner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (176,0,'CocaCola Company.','https://www.cocacola.es/content/dam/GO/CokeZone/Common/global/logo/logodesktop/coca-cola-logo-260x260.png','CocaCola'),(177,0,'Your Social Network.','http://www.gratisdescargarfacebook.com/wp-content/uploads/2016/01/ee.png','Facebook'),(178,0,'Your time is now.','http://cms.ual.es/idc/groups/public/@serv/@deportes/documents/imagen/ceu12almeria_logo_aquarius.jpg','Aquarius'),(179,0,'¿Te gusta conducir?','https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/BMW.svg/2000px-BMW.svg.png','BMW'),(180,0,'01001001 01001110 01010100 01000101 01001100','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Intel-logo.svg/245px-Intel-logo.svg.png','Intel'),(181,0,'Los quitasoles de Andalucía con más de 20 años de experiencia.','http://aluminiosnoustil.com/wp-content/uploads/2015/11/toldos-sabadell-toldos-terrassa1.jpg','Toldos Manoli');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (1,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(2,0,'c240642ddef994358c96da82c0361a58','manager1'),(3,0,'f2e74bfb6cc78ce03fc6fd7ae33a344a','runner1'),(4,0,'092d469d0a71c8002e32f808b861f9a4','referee1'),(5,0,'feec5c28a7d93bb182334a8ad3db198e','runner2'),(6,0,'8df5127cd164b5bc2d2b78410a7eea0c','manager2'),(7,0,'edc6d81da126fb64a40a903f0f3dce10','runner3'),(8,0,'2d3a5db4a2a9717b43698520a8de57d0','manager3'),(9,0,'4f556d5a66f4fe0d058523a7b8e19d91','referee2'),(10,0,'e1ec6fc941af3ba79a4ac5242dd39735','manager4'),(11,0,'029cb1d27c0b9c551703ccba2591c334','manager5'),(12,0,'46bae9ead851e0f288529e6322f4fd77','manager6'),(13,0,'a2f8c3a5104421de95a2ca4626ac227e','runner4'),(14,0,'a0e7ce2c6a1dcf32361770f30beda7f7','runner5'),(15,0,'d313c8eb9a429b651ad577ee3d5ac5d6','runner6'),(16,0,'cc544735a88ba804fdd65113230c6e32','manager7'),(17,0,'d23c835597b48c694269b6a7590dc5b1','manager8');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (1,'ADMIN'),(2,'MANAGER'),(3,'RUNNER'),(4,'REFEREE'),(5,'RUNNER'),(6,'MANAGER'),(7,'RUNNER'),(8,'MANAGER'),(9,'REFEREE'),(10,'MANAGER'),(11,'MANAGER'),(12,'MANAGER'),(13,'RUNNER'),(14,'RUNNER'),(15,'RUNNER'),(16,'MANAGER'),(17,'MANAGER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-27 17:23:08

commit;