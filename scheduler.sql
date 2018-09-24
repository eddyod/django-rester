-- MySQL dump 10.13  Distrib 5.6.40, for Linux (x86_64)
--
-- Host: localhost    Database: scheduler
-- ------------------------------------------------------
-- Server version	5.6.40-log

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
-- Table structure for table `accounts_account`
--

DROP TABLE IF EXISTS `accounts_account`;

DROP TABLE IF EXISTS `accounts_account_assigned_to`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add School',7,'add_school'),(26,'Can change School',7,'change_school'),(27,'Can delete School',7,'delete_school'),(28,'Can view School',7,'view_school'),(29,'Can add account',8,'add_account'),(30,'Can change account',8,'change_account'),(31,'Can delete account',8,'delete_account'),(32,'Can view account',8,'view_account'),(33,'Can add lead',9,'add_lead'),(34,'Can change lead',9,'change_lead'),(35,'Can delete lead',9,'delete_lead'),(36,'Can view lead',9,'view_lead'),(37,'Can add opportunity',10,'add_opportunity'),(38,'Can change opportunity',10,'change_opportunity'),(39,'Can delete opportunity',10,'delete_opportunity'),(40,'Can view opportunity',10,'view_opportunity'),(41,'Can add contact',11,'add_contact'),(42,'Can change contact',11,'change_contact'),(43,'Can delete contact',11,'delete_contact'),(44,'Can view contact',11,'view_contact'),(45,'Can add School',12,'add_school'),(46,'Can change School',12,'change_school'),(47,'Can delete School',12,'delete_school'),(48,'Can view School',12,'view_school'),(49,'Can add Schedule',13,'add_schedule'),(50,'Can change Schedule',13,'change_schedule'),(51,'Can delete Schedule',13,'delete_schedule'),(52,'Can view Schedule',13,'view_schedule'),(53,'Can add Teacher',14,'add_teacher'),(54,'Can change Teacher',14,'change_teacher'),(55,'Can delete Teacher',14,'delete_teacher'),(56,'Can view Teacher',14,'view_teacher');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$vv85oKFStkT3$g01jKAOSqAkj+GBy1Rd9+JdNPkVYLjgP4OvgzXPT3t0=','2018-09-19 13:34:29.886736',1,'eddyod','','','eddyod@yahoo.com',1,1,'2018-09-19 13:34:12.322694');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts_contact`
--

DROP TABLE IF EXISTS `contacts_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext,
  `description` longtext,
  `createdOn` datetime(6) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `createdBy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_contact_account_id_9a5698ce_fk_accounts_account_id` (`account_id`),
  KEY `contacts_contact_createdBy_id_a0e5dd03_fk_auth_user_id` (`createdBy_id`),
  CONSTRAINT `contacts_contact_account_id_9a5698ce_fk_accounts_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `contacts_contact_createdBy_id_a0e5dd03_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts_contact`
--

LOCK TABLES `contacts_contact` WRITE;
/*!40000 ALTER TABLE `contacts_contact` DISABLE KEYS */;
INSERT INTO `contacts_contact` VALUES (4,'JEANN','HUGHES','jaaron@ucsd.edu','6195436560','NX','L','2008-06-05 12:25:09.000000',2,2,1),(5,'ERICA','PENN','','','HX','RACHEL','2006-09-01 13:10:05.000000',2,2,1),(6,'PROSERPINA','ABAD','pabad@ucsd.edu              ','6195435924','EX','H.','2010-08-04 06:01:09.000000',1,2,1),(7,'','','labalos@ucsd.edu','8586576175','HX','','2006-03-31 14:10:06.000000',2,2,1),(8,'RONALDO','ABAYON','rabayon@ucsd.edu            ','6195436409','EX','T','2010-08-04 06:01:09.000000',1,2,1),(9,'JUAN','CRUZ','jcsoriano@ucsd.edu          ','6195211983','99','A.','2010-08-04 06:01:09.000000',1,2,1),(10,'SARAH','CORTEZ','scortez@ucsd.edu','8582460029','99','E','2009-05-08 13:15:07.000000',2,2,1),(11,'JACK','MASER','jmaser@ucsd.edu             ','7606039554','99','D','2009-08-16 06:01:07.000000',2,2,1),(12,'LIANA','ABASCAL','labascal@ucsd.edu           ','','HX','BELLE','2010-08-04 06:01:09.000000',1,2,1),(13,'AMI','ABBOTT','amabbott@ucsd.edu           ','8585340127','TX','MARLO','2010-08-04 06:01:09.000000',1,2,1),(14,'CARINA','ABAYON','cabayon@ucsd.edu            ','6195436600','EX','TERCERO','2010-08-04 06:01:09.000000',1,2,1),(15,'PETER','ABAT','pabat@ucsd.edu','8586576667','EX','M','2008-01-08 13:20:09.000000',2,2,1),(16,'YUKO','ABBOTT','yabbott@ucsd.edu            ','8582460263','HX','KOMURO','2010-08-04 06:01:09.000000',1,2,1),(17,'ELISA','ABATE','','','99','ANN','2010-08-04 06:01:09.000000',1,2,1),(18,'MARK','ABCEDE','mabcede@ucsd.edu            ','6192946188','RX','A','2010-08-04 06:01:09.000000',1,2,1),(19,'ELIZABETH','ABLOLA','','6195433248','NX','N.','2006-07-01 13:16:46.000000',2,2,1),(20,'KA KI','WONG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(21,'FARID','ABDEL-WAHHAB','fabdelwahhab@ucsd.edu','8585344930','RX','','2008-01-23 13:20:08.000000',2,2,1),(22,'JAMEE','SMITH','jas008@ucsd.edu             ','8585341057','99','LYNN','2010-08-04 06:01:09.000000',1,2,1),(23,'KRISTINA','TRINH','','','99','NGA','2010-08-04 06:01:09.000000',1,2,1),(24,'MUNIRA','ABDI','mabdi@ucsd.edu','6195433776','EX','ALI','2007-07-27 14:00:09.000000',2,2,1),(25,'SUMIKO','ABE','sabe@ucsd.edu','8588221767','99','','2007-11-01 12:20:09.000000',2,2,1),(26,'BARRETT','ABEL','babel@ucsd.edu              ','8582460992','99','L','2009-09-26 06:01:07.000000',2,2,1),(27,'','','','8586578080','EX','','2006-02-02 15:36:54.000000',2,2,1),(28,'WILFREDO','ABELGAS','','','NX','MORALES','2006-12-21 14:10:06.000000',2,2,1),(29,'DATASHA','HUDSON','dhudson@ucsd.edu            ','8588223824','CX','E','2010-08-04 06:01:09.000000',1,2,1),(30,'SAGRADO','ABELLERA','sabellera@ucsd.edu          ','','EX','L','2010-05-04 06:01:11.000000',2,2,1),(31,'SHARON','XU','','','99','','2010-08-04 06:01:09.000000',1,2,1),(32,'TING-AN','TSAI','','','99','','2010-08-04 06:01:09.000000',1,2,1),(33,'BERRY','CHOU','bpchou@ucsd.edu             ','','EX','P','2010-05-12 06:01:21.000000',2,2,1),(34,'BERNARDO','LARA','','','99','HERALDO','2010-08-04 06:01:09.000000',1,2,1),(35,'HOPE','LOVE','hlove@ucsd.edu              ','','EX','RHEA','2010-06-11 06:02:16.000000',2,2,1),(36,'CLAUDIA','JONES','c8jones@ucsd.edu            ','','EX','PATRICIA','2010-06-12 06:01:12.000000',2,2,1),(37,'MELISSA','ANTHONY','mlanthony@ucsd.edu          ','','CX','LYNN','2010-08-04 06:01:09.000000',1,2,1),(38,'FARAH','ABDI','','','99','ALI','2009-07-02 13:01:07.000000',2,2,1),(39,'SOFIA','JIMENEZ','','','99','RENEE','2010-06-08 06:01:11.000000',2,2,1),(40,'JAMIE','MOSER','jmmoser@ucsd.edu            ','8588222942','RX','M','2010-08-04 06:01:09.000000',1,2,1),(41,'CHARLES','ABNEY','cabney@ucsd.edu','8588220413','99','CONRAD','2007-05-08 03:21:25.000000',2,2,1),(42,'SARA','MCCARTIN','smccartin@ucsd.edu          ','8586576657','NX','JANE','2010-08-04 06:01:09.000000',1,2,1),(43,'','','','8586578000','EX','','2006-03-14 01:29:00.000000',2,2,1),(44,'ROBIN','ABERNATHY','rlabernathy@ucsd.edu        ','','NX','L','2010-08-04 06:01:09.000000',1,2,1),(45,'LOUSANY','ABERO','labero@ucsd.edu             ','6195435977','NX','SAWADAN','2010-08-04 06:01:09.000000',1,2,1),(46,'KARL','MITCHELL','kmitchell@ucsd.edu          ','','EX','GENE','2010-07-15 06:01:07.000000',2,2,1),(47,'CRISTAL','GRAHAM','crgraham@ucsd.edu           ','','EX','L','2010-08-04 06:01:09.000000',1,2,1),(48,'MONICA','MILLER','momiller@ucsd.edu           ','','NX','KAY','2010-05-12 06:01:21.000000',2,2,1),(49,'JULIE','ABRAHAM','jaabraham@ucsd.edu','6195435924','99','ANN','2009-05-27 13:15:10.000000',2,2,1),(50,'KELLY','MCDONALD','kemcdonald@ucsd.edu         ','6195432091','NX','EILEEN','2010-08-04 06:01:09.000000',1,2,1),(51,'CARLA','LU','c8lu@ucsd.edu               ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(52,'EUJENE','SERRANO','jserrano@ucsd.edu           ','','EX','L.','2010-08-04 06:01:09.000000',1,2,1),(53,'ANNELIE','SCHAIRER','aeabrahamsson@ucsd.edu      ','8585349995','RX','ELISABETH','2009-09-26 06:01:07.000000',2,2,1),(54,'EDUARDO','GONZALEZ','edg006@ucsd.edu             ','6195432549','99','','2010-08-04 06:01:09.000000',1,2,1),(55,'DEANNA','CRAIG','d1craig@ucsd.edu            ','','NX','RITA MARIE','2010-08-04 06:01:09.000000',1,2,1),(56,'KENNETH','JENSEN','kejensen@ucsd.edu           ','','99','FREEDOM','2010-08-04 06:01:09.000000',1,2,1),(57,'REBECCA','LYNCH','','','99','MARRIE','2010-07-30 06:01:07.000000',2,2,1),(58,'MELISSA','SANCHEZ','mes005@ucsd.edu             ','','CX','PEREZ','2010-08-04 06:01:09.000000',1,2,1),(59,'JENNIFER','HERNANDEZ','','','99','','2010-08-04 06:01:09.000000',1,2,1),(60,'SABRINA','WEST','snwest@ucsd.edu             ','6195437428','NX','NICOLE','2010-08-04 06:01:09.000000',1,2,1),(61,'YAE','KIM','','','99','JEE','2010-08-04 06:01:09.000000',1,2,1),(62,'CARINNE','HAWLEY','clhawley@ucsd.edu           ','8588227753','RX','L','2010-06-05 06:01:07.000000',2,2,1),(63,'ERIN','DRAKE','                            ','','EX','','2010-06-02 06:01:10.000000',2,2,1),(64,'AMY','SOLOMON','amsolomon@ucsd.edu          ','','NX','','2010-08-04 06:01:09.000000',1,2,1),(65,'ASHLEY','LEE','','','99','W','2010-07-01 06:01:11.000000',2,2,1),(66,'ISSAC','RUTHERFORD','irutherford@ucsd.edu        ','','99','NATHANIEL','2010-07-15 06:01:07.000000',2,2,1),(67,'RAUL','CORTEZ','racortez@ucsd.edu           ','','99','','2010-08-04 06:01:09.000000',1,2,1),(68,'DANIELA','ABRAMOVITZ','dabramovitz@ucsd.edu        ','6195741051','99','','2010-08-04 06:01:09.000000',1,2,1),(69,'JENNIFER','WANG','','','99','RENEE','2010-08-04 06:01:09.000000',1,2,1),(70,'GUSTAVO','MARIN REGALADO','gumarin@ucsd.edu            ','','EX','ADOLFO','2010-06-11 06:02:16.000000',2,2,1),(71,'THU MONG','PHAM','                            ','','99','','2010-08-04 06:01:09.000000',1,2,1),(72,'JENNA','NEAL','jeneal@ucsd.edu             ','','EX','ELYSSE','2010-06-11 06:02:16.000000',2,2,1),(73,'MICHELLE','CHUNG','mic013@ucsd.edu             ','','EX','K','2010-07-23 06:01:06.000000',2,2,1),(74,'DANIELLE','GLENN','dlglenn@ucsd.edu            ','6195437428','NX','LEE','2010-08-04 06:01:09.000000',1,2,1),(75,'TRANG','VO','trv001@ucsd.edu             ','','EX','THUY','2010-08-04 06:01:09.000000',1,2,1),(76,'LINDSAY','RANDALL','lrandall@ucsd.edu           ','','NX','JANE','2010-08-04 06:01:09.000000',1,2,1),(77,'NANCY','WHITE','nawhite@ucsd.edu            ','','NX','LYNNE','2010-08-04 06:01:09.000000',1,2,1),(78,'RUBY MAE','GONZALES','rmg002@ucsd.edu             ','','NX','','2010-08-04 06:01:09.000000',1,2,1),(79,'WON','LEE','','','EX','','2010-08-04 06:01:09.000000',1,2,1),(80,'KATHERINE','WOODWARD','kwoodward@ucsd.edu          ','6195437428','NX','E.','2010-08-04 06:01:09.000000',1,2,1),(81,'JI-YOUNG','WOO','jcw016@ucsd.edu             ','6195437428','NX','CECILIA','2010-08-04 06:01:09.000000',1,2,1),(82,'MARLOWE','FERNANDEZ','mmf001@ucsd.edu             ','6195437428','NX','MANGAOANG','2010-03-30 06:01:33.000000',2,2,1),(83,'MICHAEL','LIU','','','99','Y.','2010-08-04 06:01:09.000000',1,2,1),(84,'JEFFREY','MCGRATH','jmcgrath@ucsd.edu           ','','NX','JOHN','2010-08-04 06:01:09.000000',1,2,1),(85,'CHRIS','JUNG','','','99','JEE-WON','2010-07-01 06:01:11.000000',2,2,1),(86,'EUN JEE','KOH','','','99','','2010-08-04 06:01:09.000000',1,2,1),(87,'CATHERINE','MUSTAIN','c8flores@ucsd.edu           ','8583096303','CX','ELIZABETH','2010-08-04 06:01:09.000000',1,2,1),(88,'SHELLEY','CLARK','sdclark@ucsd.edu            ','6195435708','99','D','2010-08-04 06:01:09.000000',1,2,1),(89,'AMY','CHADWICK','aechadwick@ucsd.edu         ','8589667703','99','ELIZABETH','2010-08-01 06:01:07.000000',2,2,1),(90,'EVELYN','OLAES','eolaes@ucsd.edu             ','8588223433','99','V.','2010-08-04 06:01:09.000000',1,2,1),(91,'JENNIFER','CHOY','','','99','S','2010-06-20 06:01:12.000000',2,2,1),(92,'JULIE','ALBRIGHT','jalbright@ucsd.edu          ','6195433579','EX','A.','2010-08-04 06:01:09.000000',1,2,1),(93,'FELIX','HSU','fehsu@ucsd.edu              ','','RX','','2010-04-13 06:01:12.000000',2,2,1),(94,'MARC','ABRAMS','mabrams@ucsd.edu','8585348758','99','K.','2009-04-22 13:15:09.000000',2,2,1),(95,'YE','DING','','','99','','2010-08-04 06:01:09.000000',1,2,1),(96,'MARY','COLLINS','m1collins@ucsd.edu          ','8588223167','99','REGINA','2010-08-04 06:01:09.000000',1,2,1),(97,'MANUEL','LUNA','m6luna@ucsd.edu             ','6195436671','SX','ALEJANDRO','2010-08-04 06:01:09.000000',1,2,1),(98,'EDWARD','CERVANTES','edcervantes@ucsd.edu        ','','99','GONZALES','2010-08-04 06:01:09.000000',1,2,1),(99,'ADRIANA','VILLALPANDO','advillalpando@ucsd.edu      ','','EX','CISNEROS','2010-03-13 06:01:17.000000',2,2,1),(100,'SUSAN','RYAN','s4ryan@ucsd.edu             ','','NX','MARY','2010-04-14 06:01:14.000000',2,2,1),(101,'MYRA','ROMERO','myr001@ucsd.edu             ','','EX','ALEXANDRA','2010-08-04 06:01:09.000000',1,2,1),(102,'CATHERINE ANN','CRAWFORD','cacrawford@ucsd.edu         ','8586576540','EX','BARRERA','2010-08-04 06:01:09.000000',1,2,1),(103,'GERALDINE','TRAN','','','99','','2010-06-24 06:01:12.000000',2,2,1),(104,'BINH','NGO','','','99','X','2010-05-05 06:01:14.000000',2,2,1),(105,'YING','WANG','yiw025@ucsd.edu             ','8588222125','99','','2010-08-04 06:01:09.000000',1,2,1),(106,'CORY','CHRISTY','cchristy@ucsd.edu           ','','SX','JAMES','2010-08-04 06:01:09.000000',1,2,1),(107,'JAMIE','SHERWOOD','jtsherwood@ucsd.edu         ','','CX','THERESA','2010-08-04 06:01:09.000000',1,2,1),(108,'EMILY','FU','','','99','Z','2010-08-04 06:01:09.000000',1,2,1),(109,'KELLEY','TRAN','','','99','','2010-08-04 06:01:09.000000',1,2,1),(110,'PABLO','ARELLANO','','','99','','2010-02-09 06:01:09.000000',2,2,1),(111,'GARY','HARMON','gfharmon@ucsd.edu           ','','99','FRANCIS','2010-07-31 06:01:07.000000',2,2,1),(112,'CAROLINE','LIU','','','99','','2010-08-04 06:01:09.000000',1,2,1),(113,'ROSE','STEWART','','','99','ALICIA','2010-08-04 06:01:09.000000',1,2,1),(114,'KEVIN','CHENG','','','99','KAI-WEN','2010-08-04 06:01:09.000000',1,2,1),(115,'ALAN','YANG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(116,'CYNTHIA','ENRIQUEZ','','','99','','2010-08-04 06:01:09.000000',1,2,1),(117,'DANIEL','GOLDBERG','dbgoldberg@ucsd.edu         ','8588224231','TX','B','2010-08-04 06:01:09.000000',1,2,1),(118,'LIEN LIEN','WU','','','99','LILLY','2010-08-04 06:01:09.000000',1,2,1),(119,'BRUCE','POWELL','bpowell@ucsd.edu            ','8588225127','RX','R.','2010-05-07 06:01:15.000000',2,2,1),(120,'JUSTINE','LIANG','','','99','H','2010-08-04 06:01:09.000000',1,2,1),(121,'JONNA','JENSEN','j1jensen@ucsd.edu           ','8585275209','SX','L','2010-08-04 06:01:09.000000',1,2,1),(122,'GREGORY','SPENCER','gspencer@ucsd.edu           ','8585342257','RX','MICHAEL','2010-06-02 06:01:10.000000',2,2,1),(123,'RICARDO','PADILLA','ripadilla@ucsd.edu          ','6195436400','EX','MIGUEL','2010-08-04 06:01:09.000000',1,2,1),(124,'KATHRYN','ELLIOTT','kcelliott@ucsd.edu          ','8588223585','RX','C.','2010-08-04 06:01:09.000000',1,2,1),(125,'LAURA','HERNANDEZ','ldhernandez@ucsd.edu        ','','RX','D.','2010-08-04 06:01:09.000000',1,2,1),(126,'TIMOTHY','HALL','tihall@ucsd.edu             ','','NX','E','2010-08-04 06:01:09.000000',1,2,1),(127,'ANTONIO','SMITH','ans007@ucsd.edu             ','','SX','','2010-08-04 06:01:09.000000',1,2,1),(128,'MIGUEL','VELASQUEZ','mvelasquez@ucsd.edu         ','','SX','ANGEL','2010-08-04 06:01:09.000000',1,2,1),(129,'DAVID','BENNETT','dabennett@ucsd.edu          ','6195436350','NX','RAY','2010-08-04 06:01:09.000000',1,2,1),(130,'CRISTEN','KRAUSE','clkrause@ucsd.edu           ','6195435280','NX','LEE','2010-08-04 06:01:09.000000',1,2,1),(131,'QINGFEI','JIANG','q1jiang@ucsd.edu            ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(132,'MICHAEL','GREEN','m4green@ucsd.edu            ','','NX','JOHN','2010-08-04 06:01:09.000000',1,2,1),(133,'NATASHA','SCHWARZ','nmooney@ucsd.edu            ','','99','MARIE','2010-08-04 06:01:09.000000',1,2,1),(134,'JESSE','RICHARDS','j4richards@ucsd.edu         ','6195436400','EX','D','2010-08-04 06:01:09.000000',1,2,1),(135,'TARA','CRAWFORD','tacrawford@ucsd.edu         ','','EX','RANA','2010-08-04 06:01:09.000000',1,2,1),(136,'HELEN','PEREIRA','hpereira@ucsd.edu           ','','NX','JYOTHI','2010-08-04 06:01:09.000000',1,2,1),(137,'JOSEPHINE','LOGAN','jalogan@ucsd.edu            ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(138,'ERIC','O\'CONNOR','edoconnor@ucsd.edu          ','8588223244','RX','DAVID','2010-08-04 06:01:09.000000',1,2,1),(139,'BRICE','HOLMES','bdholmes@ucsd.edu           ','6195436077','99','DANIEL MARTIN','2010-08-04 06:01:09.000000',1,2,1),(140,'JENNIFER','HALL','jeh034@ucsd.edu             ','','NX','NICOLE','2010-08-04 06:01:09.000000',1,2,1),(141,'CHRISTINE','LEE','','','99','BORA','2010-08-04 06:01:09.000000',1,2,1),(142,'CHRISTINE','JOHNSON','clj006@ucsd.edu             ','8582460933','99','L.','2010-08-04 06:01:09.000000',1,2,1),(143,'NOHA','ABDELHAMID','nabdelhamid@ucsd.edu        ','','EX','M','2010-08-04 06:01:09.000000',1,2,1),(144,'BHAVIKA','PATEL','bjpatel@ucsd.edu            ','8588222418','RX','J','2010-08-04 06:01:09.000000',1,2,1),(145,'LINDONG','SUN','','','99','','2010-05-29 06:01:11.000000',2,2,1),(146,'BEVERLY','CARLOS','','','99','','2010-08-04 06:01:09.000000',1,2,1),(147,'ALEXANDRA','MARTINEZ','','','99','GABRIELLE','2010-08-04 06:01:09.000000',1,2,1),(148,'DANIEL','RODRIGUEZ','','','99','BAEZ','2010-08-04 06:01:09.000000',1,2,1),(149,'SUN KYUNG','KIM','','','99','','2010-08-04 06:01:09.000000',1,2,1),(150,'MICHAEL','WILLIAMS','','','99','REY','2010-08-04 06:01:09.000000',1,2,1),(151,'DORIS','ACERON','daceron@ucsd.edu            ','8588226226','NX','','2010-08-04 06:01:09.000000',1,2,1),(152,'TERESA','ACERA','tacera@ucsd.edu             ','8588221643','RX','','2010-08-04 06:01:09.000000',1,2,1),(153,'KARI','ABULHOSN','kabulhosn@ucsd.edu          ','6195433714','HX','K.','2010-08-04 06:01:09.000000',1,2,1),(154,'MAGDALENA','ACAIN','macain@ucsd.edu','6195436305','NX','D','2008-09-27 13:15:10.000000',2,2,1),(155,'ANGELA','ETHRIDGE','aacey@ucsd.edu              ','8586578501','EX','L','2010-08-04 06:01:09.000000',1,2,1),(156,'EMELITA','ACEBEDO','','','EX','NOMBRADO','2006-07-01 13:10:04.000000',2,2,1),(157,'EMIL','ACHMAD','eachmad@ucsd.edu            ','6194710512','RX','M','2010-07-08 06:01:10.000000',2,2,1),(158,'MARGARITA','MONTEMAYOR','mabude@ucsd.edu             ','','SX','ZAMORA','2010-08-04 06:01:09.000000',1,2,1),(159,'DEAN','ACHESON','dacheson@ucsd.edu','','99','THOMAS','2009-07-02 13:01:07.000000',2,2,1),(160,'JACQUELINE','LUU','','','99','BAOTRAN','2010-08-04 06:01:09.000000',1,2,1),(161,'ANN','BECKER','ahbecker@ucsd.edu           ','8585340069','RX','H','2010-08-04 06:01:09.000000',1,2,1),(162,'KAREN','HERRERA','','','99','MARITZA','2010-08-04 06:01:09.000000',1,2,1),(163,'ANAYS','AGUILERA','a2aguilera@ucsd.edu         ','','CX','','2010-08-01 06:01:07.000000',2,2,1),(164,'LARRY','HA','','','99','','2010-07-21 06:01:10.000000',2,2,1),(165,'LILY','WONG','','','99','MAN LAI','2010-06-29 06:01:10.000000',2,2,1),(166,'ESTHER','OH','','','99','EUNHEE','2010-08-04 06:01:09.000000',1,2,1),(167,'SAMANTHA','WILLIAMS','slw015@ucsd.edu             ','6195435244','RX','L.','2010-08-04 06:01:09.000000',1,2,1),(168,'EMILY','ACKISS','eackiss@ucsd.edu','','99','ANN','2007-12-04 13:20:09.000000',2,2,1),(169,'JAZMENE','WASHINGTON','jawashington@ucsd.edu       ','6195432091','EX','FRANAE','2010-08-04 06:01:09.000000',1,2,1),(170,'TERRANCE','MARTIN','temartin@ucsd.edu           ','','SX','L','2010-08-04 06:01:09.000000',1,2,1),(171,'MATTHEW','CASE','mcase@ucsd.edu              ','6195436400','EX','LUTHER','2010-08-04 06:01:09.000000',1,2,1),(172,'TIFFANY','BROWN','t6brown@ucsd.edu            ','','HX','CHRISTINA','2010-08-04 06:01:09.000000',1,2,1),(173,'LEONARDO','DOMINGO','ldomingo@ucsd.edu           ','8586577600','NX','ROMERO','2010-08-04 06:01:09.000000',1,2,1),(174,'KATHLEEN','LAO','','','99','UNTALAN','2010-08-04 06:01:09.000000',1,2,1),(175,'RUBY','VASQUEZ','ruvasquez@ucsd.edu          ','8588226168','EX','A','2010-08-04 06:01:09.000000',1,2,1),(176,'WENDY','KING','wbking@ucsd.edu             ','','NX','BUCK','2010-08-04 06:01:09.000000',1,2,1),(177,'SHANE','JOHNSTON','shjohnston@ucsd.edu         ','6195437428','EX','HENRY','2010-04-21 06:01:33.000000',2,2,1),(178,'ALEXANDRA','ACKOUREY','','','99','','2010-03-05 06:01:27.000000',2,2,1),(179,'MARIN','PECK','mapeck@ucsd.edu             ','','99','L','2010-08-04 06:01:09.000000',1,2,1),(180,'CHRISTOPHER','FOWLER','cafowler@ucsd.edu           ','','99','ANTHONY','2010-07-24 06:01:06.000000',2,2,1),(181,'CEANA','OH','','','99','','2010-08-04 06:01:09.000000',1,2,1),(182,'JULIA','MURPHY','','','99','','2010-08-04 06:01:09.000000',1,2,1),(183,'GENNA','YUASA-ACOSTA','gyuasaacosta@ucsd.edu       ','6194710680','CX','K.','2010-08-04 06:01:09.000000',1,2,1),(184,'JOYCE','CHAU','','','99','','2010-04-04 06:01:12.000000',2,2,1),(185,'JILL','RUSSELL','j3russell@ucsd.edu          ','8585355900','HX','MICHELLE BABBITT','2010-08-04 06:01:09.000000',1,2,1),(186,'DANIEL','LEE','','','99','KIM','2010-08-04 06:01:09.000000',1,2,1),(187,'ADRIENNE','WHEELER','adwheeler@ucsd.edu          ','','CX','C','2010-08-04 06:01:09.000000',1,2,1),(188,'ANA','ACOSTA','aacosta@ucsd.edu            ','','SX','JULIA','2010-08-04 06:01:09.000000',1,2,1),(189,'MICHELLE','COOK','','','99','KATHERINE','2010-08-04 06:01:09.000000',1,2,1),(190,'MONICA','FRENCH','mofrench@ucsd.edu           ','6195433284','CX','','2010-07-30 06:01:07.000000',2,2,1),(191,'BERNADETTE','DEGUZMAN','bgdeguzman@ucsd.edu         ','6195435011','RX','G.','2010-08-04 06:01:09.000000',1,2,1),(192,'CHIN CHIA','CHEN','ccc016@ucsd.edu             ','8586577003','RX','LOU','2010-07-31 06:01:07.000000',2,2,1),(193,'CHRISTIAN','SALGADO','','','99','LENORE','2010-08-04 06:01:09.000000',1,2,1),(194,'MICAH','SMITH','mismith@ucsd.edu            ','6194710620','CX','PAULETTE','2010-08-04 06:01:09.000000',1,2,1),(195,'KATHERINE','HANSEN','khhansen@ucsd.edu           ','','RX','HELEN','2010-08-01 06:01:07.000000',2,2,1),(196,'BRIAN','MCLAUGHLIN','brmclaughlin@ucsd.edu       ','','EX','SCOTT','2010-08-04 06:01:09.000000',1,2,1),(197,'MONICA','QUINTANA','moquintana@ucsd.edu         ','','EX','CELESTE','2010-08-04 06:01:09.000000',1,2,1),(198,'MIHYUN','KIM','mik053@ucsd.edu             ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(199,'ROMEO','HERNANDEZ','                            ','','SX','REYES','2010-08-04 06:01:09.000000',1,2,1),(200,'JORGE','ARANDA','joaranda@ucsd.edu           ','','SX','','2010-08-04 06:01:09.000000',1,2,1),(201,'CHRISTIN','COLE','chcole@ucsd.edu             ','8586577600','NX','L','2010-08-04 06:01:09.000000',1,2,1),(202,'MAHTAB','ABBASI','mabbasi@ucsd.edu            ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(203,'MIGUEL','LOPEZ','mil054@ucsd.edu             ','','EX','ANGEL','2010-08-04 06:01:09.000000',1,2,1),(204,'AUGUSTINE','JOSEPH','a1joseph@ucsd.edu           ','','99','PERUKKONIL','2010-08-04 06:01:09.000000',1,2,1),(205,'JUSTINE','BATES','jubates@ucsd.edu            ','6195436560','NX','RITA','2010-08-04 06:01:09.000000',1,2,1),(206,'MONETTE','ARELLANO','moarellano@ucsd.edu         ','','NX','OBEDOZA','2010-08-04 06:01:09.000000',1,2,1),(207,'JUNGSU','KIM','juk029@ucsd.edu             ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(208,'JOHN','CHOI','','','99','HAN','2010-05-01 06:01:10.000000',2,2,1),(209,'CRISANA','RODRIGUEZ','crr002@ucsd.edu             ','8585355904','HX','','2010-08-04 06:01:09.000000',1,2,1),(210,'HAIPENG','XUE','h1xue@ucsd.edu              ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(211,'TRISTINA','CHUNG','','','99','M','2010-08-04 06:01:09.000000',1,2,1),(212,'SAN','LY','','','99','HUE','2010-08-04 06:01:09.000000',1,2,1),(213,'DANIELLE','RICE','d2rice@ucsd.edu             ','','HX','ALVIANCE','2010-08-04 06:01:09.000000',1,2,1),(214,'HEATHER','BLAKE','hblake@ucsd.edu             ','','NX','JOY','2010-08-04 06:01:09.000000',1,2,1),(215,'DARREN','TAYLOR','dataylor@ucsd.edu           ','6195432614','99','','2010-08-04 06:01:09.000000',1,2,1),(216,'JEFF','WANG','','','99','DAVID','2010-08-04 06:01:09.000000',1,2,1),(217,'JOSIE','FLORES','joflores@ucsd.edu           ','','NX','LLANA','2010-08-04 06:01:09.000000',1,2,1),(218,'CHRISTINA','PURDY','cpurdy@ucsd.edu             ','8586576295','NX','SUZANNE','2010-08-04 06:01:09.000000',1,2,1),(219,'APRIL','MAY','acmay@ucsd.edu              ','8582460638','TX','CHELSEA','2010-08-04 06:01:09.000000',1,2,1),(220,'FERLITA','BOND','fbond@ucsd.edu              ','6195437383','NX','CRUZ','2010-08-04 06:01:09.000000',1,2,1),(221,'SEUNG','KOH','s3koh@ucsd.edu              ','','TX','H','2010-08-04 06:01:09.000000',1,2,1),(222,'CUONG','NGUYEN','','','99','QUOC','2010-08-04 06:01:09.000000',1,2,1),(223,'MIRABELL','HALEY','mhaley@ucsd.edu             ','6195436020','EX','S','2010-08-04 06:01:09.000000',1,2,1),(224,'RENARDA','JONES','rjones@ucsd.edu             ','','RX','MONIQUE','2010-07-10 06:01:07.000000',2,2,1),(225,'KSHIPRA','JAIN','','','99','','2010-08-04 06:01:09.000000',1,2,1),(226,'ARNE','VOIE','avoie@ucsd.edu              ','','RX','H','2010-08-04 06:01:09.000000',1,2,1),(227,'JONATHAN','YANG','','','99','T','2010-08-04 06:01:09.000000',1,2,1),(228,'CATHERINE','PHAM','','','99','DIEM','2010-08-04 06:01:09.000000',1,2,1),(229,'JIA','CHEN','','','99','YI','2010-08-04 06:01:09.000000',1,2,1),(230,'NORMA','CASTRO','','','TX','','2010-08-04 06:01:09.000000',1,2,1),(231,'CHUN','CHAN','','','99','BONG','2010-08-04 06:01:09.000000',1,2,1),(232,'KYLE','LY','','','99','','2010-08-04 06:01:09.000000',1,2,1),(233,'HOLLY','WILSON','hwilson@ucsd.edu            ','','99','L.','2010-08-04 06:01:09.000000',1,2,1),(234,'JORGE','VELASQUEZ','javelasquez@ucsd.edu        ','8582006763','99','ARTURO','2010-08-04 06:01:09.000000',1,2,1),(235,'JANET','WEBER','jlweber@ucsd.edu            ','8585346745','RX','LYDIA','2010-07-15 06:01:07.000000',2,2,1),(236,'DEBAL','ACQUARO','dacquaro@ucsd.edu','8586587422','NX','LORRAINE','2009-07-11 13:01:06.000000',2,2,1),(237,'KRISTY','BRODERICK','krbroderick@ucsd.edu        ','6198404432','NX','ROSE','2010-08-04 06:01:09.000000',1,2,1),(238,'ALMENDRA','LEDESMA','a9cruz@ucsd.edu             ','','HX','CRUZ','2010-05-04 06:01:11.000000',2,2,1),(239,'FIDEL','GONZALEZ','figonzalez@ucsd.edu         ','6195435939','99','','2010-08-04 06:01:09.000000',1,2,1),(240,'OSCAR','CRUZ','ocruz@ucsd.edu              ','6195436400','EX','DAVID','2010-08-04 06:01:09.000000',1,2,1),(241,'MINJUNG','KIM','','','99','','2010-08-04 06:01:09.000000',1,2,1),(242,'RUTH','TANG','','','99','WEI','2010-08-04 06:01:09.000000',1,2,1),(243,'ANTHONY','TRUJILLO','antrujillo@ucsd.edu         ','','EX','V','2010-08-04 06:01:09.000000',1,2,1),(244,'SIMON','JONES','                            ','','NX','JOHN','2010-08-04 06:01:09.000000',1,2,1),(245,'DAISY','PEREZ','dap010@ucsd.edu             ','','NX','L','2010-05-19 06:01:14.000000',2,2,1),(246,'ERIKA','WEINBERGER BAGATTI','eweinberger@ucsd.edu        ','8586576295','NX','LYNN','2010-08-04 06:01:09.000000',1,2,1),(247,'ALMA','BARBA','albarba@ucsd.edu            ','','EX','RUTH','2010-08-04 06:01:09.000000',1,2,1),(248,'KARLA','PEREZ','k1perez@ucsd.edu            ','6194719210','EX','BELEN','2010-08-04 06:01:09.000000',1,2,1),(249,'KATHLEEN','HUBBARD','khubbard@ucsd.edu           ','6195436493','CX','A','2010-08-04 06:01:09.000000',1,2,1),(250,'MARIEL','BAUTISTA','m4bautista@ucsd.edu         ','','HX','WONG','2010-08-04 06:01:09.000000',1,2,1),(251,'CHRISTAL','HAWKINS','chhawkins@ucsd.edu          ','','EX','MICHELLE','2010-08-04 06:01:09.000000',1,2,1),(252,'ALEX','LE','','','99','T','2010-08-04 06:01:09.000000',1,2,1),(253,'CHUI MAN','LEUNG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(254,'LINDSAY','CHAMBERS','l2chambers@ucsd.edu         ','','NX','M','2010-08-04 06:01:09.000000',1,2,1),(255,'MICHELLE','DIEP','mdiep@ucsd.edu              ','8586576695','EX','','2010-08-04 06:01:09.000000',1,2,1),(256,'UYEN','TRAN','','','99','THUY','2010-08-04 06:01:09.000000',1,2,1),(257,'ONNIE','PARKER','oparker@ucsd.edu            ','8224848','CX','','2010-08-04 06:01:09.000000',1,2,1),(258,'GABRIEL E','ORTIZ','geortiz@ucsd.edu            ','6195436400','EX','HERBERT','2010-08-04 06:01:09.000000',1,2,1),(259,'DANIEL','LI','','','99','Y','2010-07-01 06:01:11.000000',2,2,1),(260,'MICHELLE','CHANG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(261,'TIQING','LIU','tiliu@ucsd.edu              ','','99','','2010-08-04 06:01:09.000000',1,2,1),(262,'SAMUEL','CHEN','','','99','','2010-08-04 06:01:09.000000',1,2,1),(263,'KAREN','CHANG','','','99','SHI-YAUN','2010-08-04 06:01:09.000000',1,2,1),(264,'NATASHA','JONES','najones@ucsd.edu            ','6195432870','EX','MINNIE','2010-08-04 06:01:09.000000',1,2,1),(265,'KA YING','CHAN','y0c003@ucsd.edu             ','6195436400','EX','','2010-08-04 06:01:09.000000',1,2,1),(266,'STAN','BUI','','','NX','VAN','2010-08-04 06:01:09.000000',1,2,1),(267,'DAWN','CORDOVA','dacordova@ucsd.edu          ','','NX','SEPIDEH','2010-05-26 06:01:12.000000',2,2,1),(268,'FATIMAH','HARVEY','fharvey@ucsd.edu            ','','NX','ZADA','2010-08-04 06:01:09.000000',1,2,1),(269,'GEORGINA','MICHAEL','gemichael@ucsd.edu          ','','NX','M','2010-08-04 06:01:09.000000',1,2,1),(270,'MARY','RICE','mrice@ucsd.edu              ','','EX','M','2010-08-04 06:01:09.000000',1,2,1),(271,'JUDITH','BROWN','jubrown@ucsd.edu            ','','TX','ELAINE','2010-08-04 06:01:09.000000',1,2,1),(272,'JOHN','CAMPBELL','ducampbell@ucsd.edu         ','6195433982','99','DUNCAN','2010-08-04 06:01:09.000000',1,2,1),(273,'BRANDY','HICKMAN','                            ','','99','SUE','2010-05-07 06:01:15.000000',2,2,1),(274,'ROBERT','MARQUEZ','r2marquez@ucsd.edu          ','','HX','AGUSTO','2010-08-04 06:01:09.000000',1,2,1),(275,'SARAH','CLARK','','','99','V.','2010-08-04 06:01:09.000000',1,2,1),(276,'LINDSEY','CARLSON','lncarlson@ucsd.edu          ','','EX','NICOLE','2010-08-04 06:01:09.000000',1,2,1),(277,'MELISSA','LAU','','','99','TIFFANI','2010-08-04 06:01:39.000000',1,2,1),(278,'FREDERICK','BENNETT','fbennett@ucsd.edu           ','','99','EUGENE','2010-08-04 06:01:09.000000',1,2,1),(279,'SHAWN','SMITH','sps002@ucsd.edu             ','','99','P','2010-07-08 06:01:10.000000',2,2,1),(280,'NATHANIEL','TRAN','','','99','VU','2010-08-04 06:01:09.000000',1,2,1),(281,'SMRITI','RAO','smrao@ucsd.edu              ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(282,'MINLEI','WANG','miw024@ucsd.edu             ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(283,'LAURA','SMITH','las004@ucsd.edu             ','','NX','ELIZABETH','2010-06-19 06:01:07.000000',2,2,1),(284,'ONDEANA','PRICE','oprice@ucsd.edu             ','6195436400','NX','MICHELLE','2010-08-04 06:01:09.000000',1,2,1),(285,'JENNIFER','MURPHY','jemurphy@ucsd.edu           ','6195432870','NX','ELIZABETH','2010-08-04 06:01:09.000000',1,2,1),(286,'KANG SEON','CHO','','','99','','2010-08-04 06:01:09.000000',1,2,1),(287,'ANTHONY','BROWN','a1brown@ucsd.edu            ','','EX','D','2010-06-23 06:01:10.000000',2,2,1),(288,'YANHAN','WANG','yaw015@ucsd.edu             ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(289,'DELMI','MENDEZ','dymendez@ucsd.edu           ','6195436098','99','YANIRA','2010-08-04 06:01:09.000000',1,2,1),(290,'DESERIE','JONES','dejones@ucsd.edu            ','','EX','DIAN','2010-08-04 06:01:09.000000',1,2,1),(291,'SHAN','ZHONG','shzhong@ucsd.edu            ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(292,'NICOLE','FIELDS','ncfields@ucsd.edu           ','','99','C','2010-08-04 06:01:09.000000',1,2,1),(293,'JUDY','VO','','','99','THI','2010-08-04 06:01:09.000000',1,2,1),(294,'JENNIFER','LEE','','','99','LAURA','2010-08-04 06:01:09.000000',1,2,1),(295,'LISA','ZHU','','','99','','2010-08-04 06:01:09.000000',1,2,1),(296,'AMANDA','GRAYSON','','','99','JOY','2010-08-04 06:01:09.000000',1,2,1),(297,'QUYEN','TRAN','','','99','TO','2010-08-04 06:01:09.000000',1,2,1),(298,'JENNIFER','ANDRADE','                            ','','TX','DAWN','2010-07-01 06:01:11.000000',2,2,1),(299,'LISA','NOBLE','','','99','','2010-08-04 06:01:09.000000',1,2,1),(300,'FROLAN','ANGELES','fangeles@ucsd.edu           ','','EX','MAGAT','2010-08-04 06:01:09.000000',1,2,1),(301,'PATRICIA','CHAVEZ','p3chavez@ucsd.edu           ','6195437107','EX','C','2010-08-04 06:01:09.000000',1,2,1),(302,'KAREN','SHEA','kshea@ucsd.edu              ','6195435753','99','MARION','2010-08-04 06:01:09.000000',1,2,1),(303,'CHENOA','WILSON','cwilson@ucsd.edu            ','','CX','MAE','2010-08-04 06:01:09.000000',1,2,1),(304,'DANA','LESLIE','dleslie@ucsd.edu            ','6195437257','99','F','2010-08-04 06:01:09.000000',1,2,1),(305,'GEORJETTE','GUTIERREZ','g7gutierrez@ucsd.edu        ','','EX','F','2010-08-04 06:01:09.000000',1,2,1),(306,'THERESA','DRUMMOND','tdrummond@ucsd.edu          ','','EX','RICHARDSON','2010-08-04 06:01:09.000000',1,2,1),(307,'MICHELLE','MCCANN','memccann@ucsd.edu           ','6195432870','EX','ELIZABETH','2010-08-04 06:01:09.000000',1,2,1),(308,'ANJELICA THERESE','PASCUAL','anpascual@ucsd.edu          ','6195436400','EX','APOSTOL','2010-08-04 06:01:09.000000',1,2,1),(309,'JEAN','GUAN','                            ','','TX','YE-QIONG','2010-08-04 06:01:09.000000',1,2,1),(310,'LORENA','HAYDEN','                            ','','EX','SANTANA','2010-08-04 06:01:09.000000',1,2,1),(311,'GINA','SANTIAGO','gfsantiago@ucsd.edu         ','','EX','FERNANDEZ','2010-08-04 06:01:09.000000',1,2,1),(312,'XIANG','LI','','','99','','2010-08-04 06:01:09.000000',1,2,1),(313,'CAROLINE','SANCHEZ','ccortes@ucsd.edu            ','','NX','PAULINE','2010-08-04 06:01:09.000000',1,2,1),(314,'JENNIFER','CLARK','jdc002@ucsd.edu             ','6195432798','NX','DYAN','2010-08-04 06:01:09.000000',1,2,1),(315,'CARMENCITA','KENNEDY','c4kennedy@ucsd.edu          ','','NX','TAMBONG','2010-08-04 06:01:09.000000',1,2,1),(316,'JULIE','JUAREZ','jujuarez@ucsd.edu           ','','EX','A','2010-08-04 06:01:09.000000',1,2,1),(317,'RICHARD','SOTO','risoto@ucsd.edu             ','6195436400','NX','','2010-08-04 06:01:09.000000',1,2,1),(318,'ADRIENNE','HORNER','','','99','','2010-08-04 06:01:09.000000',1,2,1),(319,'NANCY','CALDERON','necalderon@ucsd.edu         ','8589667703','RX','ESMERALDA','2010-08-04 06:01:09.000000',1,2,1),(320,'CHRISTOPHER','LAW','','','99','JOHN','2010-07-31 06:01:07.000000',2,2,1),(321,'AUGUST','SLATER','agslater@ucsd.edu           ','','TX','GWENFANA','2010-08-03 06:01:07.000000',2,2,1),(322,'DYLAN','BARNES','dmbarnes@ucsd.edu           ','8585345324','RX','MATTHEW','2010-08-04 06:01:09.000000',1,2,1),(323,'AUSTIN','HARRINGTON','','','99','ROBERT','2010-08-04 06:01:09.000000',1,2,1),(324,'JANNE','CHUANG','','','99','YI-NI','2010-08-04 06:01:09.000000',1,2,1),(325,'CHEN','YANG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(326,'DONG','BAI','dobai@ucsd.edu              ','8588224622','RX','','2010-08-04 06:01:09.000000',1,2,1),(327,'LU','YIN','','','99','','2010-08-04 06:01:09.000000',1,2,1),(328,'ALEXANDRIA','RILEY','','','99','LEIGH','2010-08-04 06:01:09.000000',1,2,1),(329,'LANCE','YAMADA','lyamada@ucsd.edu            ','6195433887','99','Y','2010-08-04 06:01:09.000000',1,2,1),(330,'JOYCE','MCDONALD','jmcdonald@ucsd.edu          ','8588223299','RX','ISOBELLE','2010-08-04 06:01:09.000000',1,2,1),(331,'CINDY','GOODRICH','cgoodrich@ucsd.edu          ','6195436020','EX','LEE','2010-08-04 06:01:09.000000',1,2,1),(332,'RYAN','SIMMONS','rysimmons@ucsd.edu          ','','99','ELIZABETH','2010-08-04 06:01:09.000000',1,2,1),(333,'ADA','IP','','','99','','2010-08-04 06:01:09.000000',1,2,1),(334,'KIMBERLEE','BOND','kibond@ucsd.edu             ','','HX','ANN','2010-08-04 06:01:09.000000',1,2,1),(335,'JOHN','CORNEJO','jcornejo@ucsd.edu           ','6195436040','NX','CARLOS','2010-08-04 06:01:09.000000',1,2,1),(336,'TAMMY','LU','tclu@ucsd.edu               ','','NX','C','2010-08-04 06:01:09.000000',1,2,1),(337,'SHERIE','RICHARDS','s3richards@ucsd.edu         ','','EX','RAE','2010-08-04 06:01:09.000000',1,2,1),(338,'LISA','EDWARDS','ledwards@ucsd.edu           ','','NX','KAREN','2010-08-04 06:01:09.000000',1,2,1),(339,'PAUL','MURPHY','                            ','6195437505','NX','THOMAS','2010-08-04 06:01:09.000000',1,2,1),(340,'CHELSEA','CAMPBELL','chcampbell@ucsd.edu         ','6195436400','NX','MARIE','2010-08-04 06:01:09.000000',1,2,1),(341,'ERIC','RAMIREZ','                            ','','SX','','2010-08-04 06:01:09.000000',1,2,1),(342,'CASSANDRA','LEHMAN','clehman@ucsd.edu            ','','NX','LEE','2010-08-04 06:01:09.000000',1,2,1),(343,'KATHERINE','CURTIS','k1curtis@ucsd.edu           ','6195436400','NX','ROSE','2010-07-15 06:01:07.000000',2,2,1),(344,'PABLO','MACIAS','pamacias@ucsd.edu           ','','EX','JORGE','2010-08-04 06:01:09.000000',1,2,1),(345,'MICHAEL','THOMAS','mlthomas@ucsd.edu           ','','99','LEE','2010-08-04 06:01:09.000000',1,2,1),(346,'TAL','DO','                            ','','99','TRAN','2010-08-04 06:01:09.000000',1,2,1),(347,'ALDO','RODRIGUEZ','','','99','EDEL','2010-08-03 06:01:07.000000',2,2,1),(348,'JESSICA','KIM','','','99','MIN','2010-08-04 06:01:09.000000',1,2,1),(349,'KEARNY','TSE','','','99','KEN','2010-08-04 06:01:09.000000',1,2,1),(350,'BEVERLY','HOM','','','99','','2010-08-04 06:01:09.000000',1,2,1),(351,'ALISON','LAWRENCE','arlawrence@ucsd.edu         ','','RX','R.','2010-08-04 06:01:09.000000',1,2,1),(352,'CARA','MORRIS','c2morris@ucsd.edu           ','','99','LYN','2010-08-04 06:01:09.000000',1,2,1),(353,'YUNSHI','ZHAO','','','99','','2010-08-04 06:01:09.000000',1,2,1),(354,'ROBERT','SHAW','                            ','','SX','HONG-JUN','2010-08-04 06:01:09.000000',1,2,1),(355,'AIMEE','HUMPHREY','ashumphrey@ucsd.edu         ','','RX','SAO MAI','2010-08-04 06:01:09.000000',1,2,1),(356,'ROBIN','HUNTER','r1hunter@ucsd.edu           ','6195436014','EX','CHRISTINA','2010-08-04 06:01:09.000000',1,2,1),(357,'ALISON','SOLOMON','a2solomon@ucsd.edu          ','','HX','RUTH','2010-08-04 06:01:09.000000',1,2,1),(358,'NICKEY','LEE','nil001@ucsd.edu             ','8582460141','RX','','2010-08-04 06:01:09.000000',1,2,1),(359,'KRISTINE','TOLENTINO','','','99','ELI','2010-08-04 06:01:09.000000',1,2,1),(360,'EUGENIA','MOSLEY','epmosley@ucsd.edu           ','6195436014','NX','P','2010-08-04 06:01:09.000000',1,2,1),(361,'AUGUSTIN','KIM','','','99','J','2010-08-04 06:01:09.000000',1,2,1),(362,'MICHELLE','RUBIO','mprubio@ucsd.edu            ','6195435280','EX','PARICA','2010-08-04 06:01:09.000000',1,2,1),(363,'MEGHAN','MEYER','m3meyer@ucsd.edu            ','','NX','JEANNETTE','2010-08-04 06:01:09.000000',1,2,1),(364,'ERIC','WARREN','','','99','C','2010-08-04 06:01:09.000000',1,2,1),(365,'JILL','BELL','j1bell@ucsd.edu             ','','99','ELIZABETH','2010-08-04 06:01:09.000000',1,2,1),(366,'AMANDA','STEINER','arsteiner@ucsd.edu          ','6195433660','99','RACHEL WHITE','2010-08-04 06:01:09.000000',1,2,1),(367,'TUYET','NGUYEN','','','99','ANN','2010-08-04 06:01:09.000000',1,2,1),(368,'MICHAEL','STEVENS','','','99','W.','2010-08-04 06:01:09.000000',1,2,1),(369,'JENNIFER','LU','','','99','','2010-08-04 06:01:09.000000',1,2,1),(370,'LETICIA','MARTINEZ','lemartinez@ucsd.edu         ','','EX','BURGUENO','2010-08-04 06:01:09.000000',1,2,1),(371,'JAKITA','BALDWIN','                            ','','99','DANIELLE','2010-08-04 06:01:09.000000',1,2,1),(372,'RICHARD','WILSON','r3wilson@ucsd.edu           ','','HX','E','2010-08-04 06:01:09.000000',1,2,1),(373,'GRACE','DELA CRUZ','grdelacruz@ucsd.edu         ','','NX','R','2010-08-04 06:01:09.000000',1,2,1),(374,'MARCEL','ACEVEDO','maacevedo@ucsd.edu          ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(375,'ADNEY','CASTANEDA','                            ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(376,'CHRISTINE','WONG','','','99','ROSE','2010-08-04 06:01:09.000000',1,2,1),(377,'ALICIA','FAGAN','afagan@ucsd.edu             ','','NX','DIANE','2010-08-04 06:01:09.000000',1,2,1),(378,'DIANA','LOPEZ','','','99','MICHELLE','2010-08-04 06:01:39.000000',1,2,1),(379,'PHILLIP','LE','','','99','','2010-08-04 06:01:09.000000',1,2,1),(380,'DANIEL','HOGAN','','','99','J','2010-08-04 06:01:09.000000',1,2,1),(381,'ADRIAN','DIAMOND','                            ','','99','ALECHANDRE','2010-08-04 06:01:09.000000',1,2,1),(382,'JACQUELINE','ENGEL','                            ','','99','KAYLAH','2010-08-04 06:01:09.000000',1,2,1),(383,'ISABEL','MEJIA','imejia@ucsd.edu             ','','EX','ADRIANA','2010-08-04 06:01:09.000000',1,2,1),(384,'ALI','EVANS','                            ','','99','EDWARD','2010-08-04 06:01:09.000000',1,2,1),(385,'OMAR','GUTIERREZ','                            ','','99','','2010-08-04 06:01:09.000000',1,2,1),(386,'TEDRA','THOMAS','                            ','','99','CAROLYN','2010-08-04 06:01:09.000000',1,2,1),(387,'DAVID','WONG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(388,'KATRINA','FLORES','kfflores@ucsd.edu           ','','99','FELICIA','2010-08-04 06:01:09.000000',1,2,1),(389,'DAPHNE','WANG','','','99','W','2010-08-04 06:01:09.000000',1,2,1),(390,'SANDEE','NGUYEN','stn028@ucsd.edu             ','','RX','T','2010-08-04 06:01:09.000000',1,2,1),(391,'HYUNCHUL','JUNG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(392,'KAREN','MENDEZ','                            ','','99','','2010-07-01 06:01:11.000000',2,2,1),(393,'ANNA','FUNG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(394,'DOUGLAS','TANG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(395,'JI SUN','BAEK','sbaek@ucsd.edu              ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(396,'KARL','MARQUEZ','','','99','EDISSON SORIANO','2010-08-04 06:01:09.000000',1,2,1),(397,'SHUXIANG','LIU','shl042@ucsd.edu             ','6195438204','99','','2010-08-04 06:01:09.000000',1,2,1),(398,'CONNIE','WANG','c8wang@ucsd.edu             ','8582460893','TX','WEI-LIE','2010-08-04 06:01:09.000000',1,2,1),(399,'STEPHANIE','NG','','','99','RACHEL','2010-08-04 06:01:09.000000',1,2,1),(400,'ANGELA','CHEN','','','99','','2010-08-04 06:01:09.000000',1,2,1),(401,'JENNIE','LACY','','','99','LEE','2010-08-04 06:01:09.000000',1,2,1),(402,'GREG','PERLMAN','grperlman@ucsd.edu          ','8585528585','99','','2010-08-04 06:01:09.000000',1,2,1),(403,'MELANIE','LUCERO','mjlucero@ucsd.edu           ','','RX','J.','2010-08-04 06:01:09.000000',1,2,1),(404,'BERNICE','YAN','','','99','YICK-TUNG','2010-08-04 06:01:09.000000',1,2,1),(405,'JESSICA','LEUNG','','','99','PO YING','2010-08-04 06:01:09.000000',1,2,1),(406,'CHARLES','ZHANG','cfzhang@ucsd.edu            ','','RX','FENG HUA','2010-08-04 06:01:09.000000',1,2,1),(407,'CHARLOTTE','WICKHAM','','','TX','JOHANNA','2010-08-04 06:01:09.000000',1,2,1),(408,'BEN','TSE','','','99','','2010-08-04 06:01:09.000000',1,2,1),(409,'STEPHANIE','CHAU','','','99','','2010-08-04 06:01:09.000000',1,2,1),(410,'ALEXANDER','ABDEL ALIM','','','99','S','2010-08-04 06:01:09.000000',1,2,1),(411,'ELISEO','RIVAS','','','99','JUNIOR','2010-08-04 06:01:09.000000',1,2,1),(412,'KARLA','SANTIAGO','','','99','I','2010-08-04 06:01:09.000000',1,2,1),(413,'NORBERTO','MORALES','namorales@ucsd.edu          ','8585242073','TX','AARON','2010-08-04 06:01:09.000000',1,2,1),(414,'CARMEN','CHEN','','','99','G','2010-08-04 06:01:09.000000',1,2,1),(415,'ADITI','ABRAHAM','','','99','MARY','2010-08-04 06:01:09.000000',1,2,1),(416,'IAN','CRANE','imcrane@ucsd.edu            ','8588224004','TX','MATTHEW','2010-08-04 06:01:09.000000',1,2,1),(417,'NOE','MADRIGAL','nmadrigal@ucsd.edu          ','','EX','S','2010-08-04 06:01:09.000000',1,2,1),(418,'ARAN','LEVINE','aelevine@ucsd.edu           ','','99','E','2010-08-04 06:01:09.000000',1,2,1),(419,'GABRIEL','AGUIRRE','gaaguirre@ucsd.edu          ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(420,'NEHAL','MEHTA','','','99','MUKUL','2010-08-04 06:01:09.000000',1,2,1),(421,'JENNIFER','SCHMIDT','j1schmidt@ucsd.edu          ','','NX','NICOLE','2010-08-04 06:01:09.000000',1,2,1),(422,'LISA','MORGAN','limorgan@ucsd.edu           ','','NX','FARRIS','2010-08-04 06:01:09.000000',1,2,1),(423,'ROBERTO','NELSON','','','99','','2010-08-04 06:01:09.000000',1,2,1),(424,'FRANCIS','LEE','felee@ucsd.edu              ','','TX','E','2010-08-04 06:01:09.000000',1,2,1),(425,'JESSICA','RAMIREZ','                            ','','EX','VANESSA','2010-08-04 06:01:09.000000',1,2,1),(426,'NICOLE','SHAPIRO','nshapiro@ucsd.edu           ','8589667703','99','MICHELLE','2010-08-04 06:01:09.000000',1,2,1),(427,'ALEC','MORGAN','a2morgan@ucsd.edu           ','','EX','DAVID','2010-08-04 06:01:09.000000',1,2,1),(428,'RITA','SCOTT','riscott@ucsd.edu            ','','99','MARIE','2010-08-04 06:01:09.000000',1,2,1),(429,'JESSICA','PERRY','jperry@ucsd.edu             ','6195436560','NX','ELIZABETH','2010-08-04 06:01:09.000000',1,2,1),(430,'GUSTAVO','HERNANDEZ','','','99','','2010-08-04 06:01:09.000000',1,2,1),(431,'JIMMY','DO','','','99','DANG','2010-08-04 06:01:09.000000',1,2,1),(432,'MY','PHAM','','','99','QUOC','2010-08-04 06:01:09.000000',1,2,1),(433,'RACHEL','CARTER','rmcarter@ucsd.edu           ','8585349765','TX','M.','2010-08-04 06:01:09.000000',1,2,1),(434,'ALLAN','ASUNCION','aasuncion@ucsd.edu          ','6195435581','RX','MARK','2010-08-04 06:01:09.000000',1,2,1),(435,'JASON','SMITH','jes008@ucsd.edu             ','8588226761','RX','EVAN','2010-08-04 06:01:09.000000',1,2,1),(436,'INDIRA','JIMENEZ','','','99','M','2010-08-04 06:01:09.000000',1,2,1),(437,'STEPHANIE','ABEL','slabel@ucsd.edu             ','8588226037','RX','LOUISE MANNIX','2010-08-04 06:01:09.000000',1,2,1),(438,'QUYEN','BUI','','','99','H','2010-08-04 06:01:09.000000',1,2,1),(439,'CRYSTAL','GARZA','','','CX','L','2010-08-04 06:01:09.000000',1,2,1),(440,'JASON','REED','j1reed@ucsd.edu             ','8585528585','RX','D','2010-08-04 06:01:09.000000',1,2,1),(441,'ANGELINE','YU','','','99','PANN PANN','2010-08-04 06:01:09.000000',1,2,1),(442,'ISHITA','SHAH','ishah@ucsd.edu              ','','RX','ASHOKKUMAR','2010-08-04 06:01:09.000000',1,2,1),(443,'STEPHANIE','LUM','','','99','F','2010-08-04 06:01:09.000000',1,2,1),(444,'JASON','LY','','','99','','2010-08-04 06:01:09.000000',1,2,1),(445,'JUNGHEE','LEE','','','99','J','2010-08-04 06:01:09.000000',1,2,1),(446,'SOLOMON','LI','','','99','','2010-08-04 06:01:09.000000',1,2,1),(447,'SHOLIDA','ELLIS','sellis@ucsd.edu             ','','99','NICOLE','2010-08-04 06:01:09.000000',1,2,1),(448,'ALEJANDRO','MIRANDA','ajmiranda@ucsd.edu          ','','99','JESUS','2010-08-04 06:01:09.000000',1,2,1),(449,'STELLA','CHEN','','','99','XIANG','2010-08-04 06:01:09.000000',1,2,1),(450,'KATHERINE','FULLER','kfuller@ucsd.edu            ','','TX','M','2010-08-04 06:01:09.000000',1,2,1),(451,'ANKUR','MITTAL','','','99','','2010-08-04 06:01:09.000000',1,2,1),(452,'EDUARDO','REYNOSO','','','99','','2010-08-04 06:01:09.000000',1,2,1),(453,'JOANNA','JACOBSEN','                            ','','99','JEAN','2010-08-04 06:01:09.000000',1,2,1),(454,'JENNIFER','LE','','','99','','2010-08-04 06:01:09.000000',1,2,1),(455,'CHONG','FANG','','','99','','2010-08-04 06:01:09.000000',1,2,1),(456,'BLAZE','FERNANDES','bifernandes@ucsd.edu        ','','SX','LOURENCO','2010-08-04 06:01:09.000000',1,2,1),(457,'LEOPOLDO','ALCALA','lalcala@ucsd.edu            ','6195432091','NX','','2010-08-04 06:01:09.000000',1,2,1),(458,'NOEL','WILLIAMS','nowilliams@ucsd.edu         ','','EX','K','2010-08-04 06:01:09.000000',1,2,1),(459,'MONIQUE','BEAN','mrbean@ucsd.edu             ','8586571600','EX','R','2010-08-04 06:01:09.000000',1,2,1),(460,'MARLA CRISTAL','CASTANEDA','mccastaneda@ucsd.edu        ','','99','B','2010-08-04 06:01:09.000000',1,2,1),(461,'CARA','RODRIGUEZ','car009@ucsd.edu             ','','EX','LYNN','2010-08-04 06:01:09.000000',1,2,1),(462,'JASON','YEH','','','99','JARWAY','2010-08-04 06:01:09.000000',1,2,1),(463,'ROSINE','LY','','','99','D.','2010-08-04 06:01:09.000000',1,2,1),(464,'JENNIFER','CHANDLER','jchandler@ucsd.edu          ','','99','J','2010-08-04 06:01:09.000000',1,2,1),(465,'CHRISTINA','RICHARDS','c4richards@ucsd.edu         ','','NX','ELIZABETH','2010-08-04 06:01:09.000000',1,2,1),(466,'MU LI','LIU','','','99','','2010-08-04 06:01:09.000000',1,2,1),(467,'JOLLEY BETH','LIM','jblim@ucsd.edu              ','8586424774','HX','Y','2010-08-04 06:01:09.000000',1,2,1),(468,'THOMAS','MILLER','thmiller@ucsd.edu           ','','99','JAMES','2010-08-04 06:01:09.000000',1,2,1),(469,'CARLA','SALINAS','c1salinas@ucsd.edu          ','','HX','LORENA','2010-08-04 06:01:09.000000',1,2,1),(470,'PATRICIA','LIU','','','99','W.','2010-08-04 06:01:09.000000',1,2,1),(471,'CHRISTOPHER','DAVIS','c1davis@ucsd.edu            ','','HX','HUGH','2010-08-04 06:01:09.000000',1,2,1),(472,'NICOLE','CAMPBELL','nacampbell@ucsd.edu         ','8588220516','TX','ANN','2010-08-04 06:01:09.000000',1,2,1),(473,'CHRISTOPHER','GRAVES','clgraves@ucsd.edu           ','','HX','LEE','2010-08-04 06:01:09.000000',1,2,1),(474,'KENNETH','BELL','ktbell@ucsd.edu             ','','EX','TYRONE','2010-08-04 06:01:09.000000',1,2,1),(475,'LUKE','SCHROEDER','','','99','ANDREW','2010-08-04 06:01:09.000000',1,2,1),(476,'GRETCHEN','SAUNDERS','grsaunders@ucsd.edu         ','8588220325','TX','RUTH BAKER','2010-08-04 06:01:09.000000',1,2,1),(477,'TERESA','REYES','tereyes@ucsd.edu            ','','NX','','2010-08-04 06:01:09.000000',1,2,1),(478,'CHRISTINA','TORRES','chtorres@ucsd.edu           ','8585348259','TX','','2010-08-04 06:01:09.000000',1,2,1),(479,'TRAVIS','WOOD','','','99','C','2010-08-04 06:01:09.000000',1,2,1),(480,'GARRICK','LI','','','99','NICHOLAS','2010-08-04 06:01:09.000000',1,2,1),(481,'MAISI','MAYO','','','TX','L','2010-08-04 06:01:09.000000',1,2,1),(482,'TRACY','MARTINEZ','','','99','','2010-08-04 06:01:09.000000',1,2,1),(483,'SUSAN','MARTIN','','','CX','C','2010-08-04 06:01:09.000000',1,2,1),(484,'ANA','REYES','','','99','L','2010-08-04 06:01:09.000000',1,2,1),(485,'ELISEA','AVALOS','','','99','E','2010-08-04 06:01:09.000000',1,2,1),(486,'LETICIA','AGUILAR','lacuna@ucsd.edu             ','6195435205','99','','2010-08-04 06:01:09.000000',1,2,1),(487,'LOURDES','ADA','lada@ucsd.edu               ','6195432457','99','O.','2010-08-04 06:01:09.000000',1,2,1),(488,'CATERINA','ADAMO','cadamo@ucsd.edu             ','6195431860','EX','','2010-08-04 06:01:09.000000',1,2,1),(489,'CYNTHIA','ADAMS','c1adams@ucsd.edu            ','6195432824','HX','S.','2010-08-04 06:01:09.000000',1,2,1),(490,'CARYL','ADAMS','','','99','ANNE','2007-11-02 12:20:08.000000',2,2,1),(491,'GLORIA','ADAMS','gjadams@ucsd.edu            ','6194719394','CX','J.','2010-05-04 06:01:11.000000',2,2,1),(492,'IAN','ADAMS','','','99','K','2010-08-04 06:01:09.000000',1,2,1),(493,'JEANINE','ADAMS KOTZ','jyadams@ucsd.edu            ','6195437216','99','YVETTE','2010-08-04 06:01:09.000000',1,2,1),(494,'KERRI','LINDGREN','k1adams@ucsd.edu            ','6195437428','NX','ANN','2010-08-04 06:01:09.000000',1,2,1),(495,'LAURA','ADAMS','laadams@ucsd.edu            ','8588223167','99','V','2009-11-04 06:01:08.000000',2,2,1),(496,'MARC','ADAMS','m1adams@ucsd.edu            ','8585349311','99','ANTHONY','2009-10-10 06:01:07.000000',2,2,1),(497,'ANTHONY','ADAME','asadame@ucsd.edu            ','8585346209','RX','S','2010-08-04 06:01:09.000000',1,2,1),(498,'DENISE','ADAME','dadame@ucsd.edu             ','8588225972','CX','CATALINA','2010-08-04 06:01:09.000000',1,2,1),(499,'LAUREN','ADAMEK','','','99','M','2010-08-04 06:01:09.000000',1,2,1),(500,'SHARON','ADAMS','s2adams@ucsd.edu            ','6195431844','99','ANN','2010-08-04 06:01:09.000000',1,2,1),(501,'BLAIN','ADAMS-DENNER','','','99','EDWARD','2006-07-01 13:10:03.000000',2,2,1),(502,'BONITA','ADAMSON','badamson@ucsd.edu           ','8586576805','99','L.','2010-08-04 06:01:09.000000',1,2,1),(503,'HEIDI','RATAJ','haddison@ucsd.edu','8585341806','99','RUTH','2007-07-07 13:00:09.000000',2,2,1),(504,'ABDI','ADAN','','','EX','MOHAMED','2006-06-08 13:10:06.000000',2,2,1),(505,'JUDITH','ADDISON','','','NX','F.','2007-10-12 12:20:10.000000',2,2,1),(506,'KIMBERLY','ADCOCK','kadcock@ucsd.edu            ','6195432107','HX','MARIE','2010-08-04 06:01:09.000000',1,2,1),(507,'ROBIN','ADDUONO','radduono@ucsd.edu           ','8586576500','NX','D','2010-08-04 06:01:09.000000',1,2,1),(508,'AVITO','ADAN','aadan@ucsd.edu              ','6195435447','EX','VEGA','2010-08-04 06:01:09.000000',1,2,1),(509,'IFEOLUWA','ADERINTO','','','99','JOHNATHAN','2010-07-01 06:01:11.000000',2,2,1),(510,'ABBY','ADESANYA','aadesanya@ucsd.edu','6195432465','HX','F','2007-07-27 14:00:09.000000',2,2,1),(511,'MICHELLE ANNE','ADIA','','','99','','2010-08-04 06:01:09.000000',1,2,1),(512,'ELAINE','ADLAM','eadlam@ucsd.edu             ','6195436400','NX','P','2009-10-24 06:01:07.000000',2,2,1),(513,'NIKKI','ADLAON','nadlaon@ucsd.edu            ','','NX','CLAVDEL P','2010-08-04 06:01:09.000000',1,2,1),(514,'SEAN','ADLAON','sadlaon@ucsd.edu            ','6195436871','NX','Z','2010-06-26 07:02:26.000000',2,2,1),(515,'DYNN','ADRIANZEN','dadrianzen@ucsd.edu         ','6195431820','EX','J','2010-08-04 06:01:09.000000',1,2,1),(516,'THERESA','AVORH','thadu@ucsd.edu              ','6195436364','NX','','2010-08-04 06:01:09.000000',1,2,1),(517,'DANA','ADVINCULA','dadvincula@ucsd.edu         ','','EX','G','2010-08-04 06:01:09.000000',1,2,1),(518,'SAEED','AFANEH','','','99','ABULLATIF','2008-09-22 13:15:09.000000',2,2,1),(519,'ALISON','AFFLECK','aaffleck@ucsd.edu','','TX','Z','2008-02-23 13:25:09.000000',2,2,1),(520,'KAREN','AFICIAL','kaficial@ucsd.edu           ','8588227570','RX','FLORIDA','2010-08-04 06:01:09.000000',1,2,1),(521,'SALLY','AGENT','sagent@ucsd.edu             ','6195435497','NX','ELLEN','2010-08-04 06:01:09.000000',1,2,1),(522,'EMILIO','AGBUYA','eagbuya@ucsd.edu            ','6195432255','SX','MUTYA','2010-08-04 06:01:09.000000',1,2,1),(523,'GLORIA','AGBUYA','gagbuya@ucsd.edu            ','6195433000','SX','SISON','2010-08-04 06:01:09.000000',1,2,1),(524,'ADITI','AGGARWAL','','','99','','2007-07-02 13:00:09.000000',2,2,1),(525,'CARMEN','AGBUNAG','cagbunag@ucsd.edu           ','','SX','V','2010-08-04 06:01:39.000000',1,2,1),(526,'J.','AGNEW','jvagnew@ucsd.edu','6194710679','99','V.','2008-03-06 13:25:08.000000',2,2,1),(527,'ERAN','AGMON','','','99','','2006-10-25 13:10:04.000000',2,2,1),(528,'ELISA','AGPAOA','eagpaoa@ucsd.edu','6195437428','NX','F.','2007-12-04 13:20:09.000000',2,2,1),(529,'JOLENE','AGUILAR','jaguilar@ucsd.edu           ','8583001018','99','A','2010-08-04 06:01:09.000000',1,2,1),(530,'MARY','ACEDO-IGNACIO','macedoignacio@ucsd.edu      ','','99','MADELEINE','2010-05-12 06:01:21.000000',2,2,1),(531,'CARLOS','AGUILERA','caaguilera@ucsd.edu         ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(532,'SUSAN','AGUILAR','suaguilar@ucsd.edu          ','6195431889','EX','','2010-08-04 06:01:09.000000',1,2,1),(533,'SARA','AGUILAR','sgaguilar@ucsd.edu','6196926614','99','GUADALUPE','2009-07-11 13:01:06.000000',2,2,1),(534,'SUSANA','AGUILAR','s2aguilar@ucsd.edu          ','6195437505','EX','','2010-08-04 06:01:09.000000',1,2,1),(535,'SAUL','AGUILAR','snaguilar@ucsd.edu          ','','SX','N','2010-08-04 06:01:09.000000',1,2,1),(536,'JOSEPH','AGUILERA','jaguilera@ucsd.edu          ','8588224180','RX','A','2010-08-04 06:01:09.000000',1,2,1),(537,'ANDREW','AGUINALDO','ajaguinaldo@ucsd.edu        ','6195432072','99','JR','2010-08-04 06:01:09.000000',1,2,1),(538,'NATALIE','AGUILING VIBAL','naguilingvibal@ucsd.edu','8585528585','CX','A.','2007-05-08 03:21:25.000000',2,2,1),(539,'JUANITA','AGUIRRE','juaguirre@ucsd.edu          ','6195436600','EX','','2010-08-04 06:01:09.000000',1,2,1),(540,'ANDREA','AGUIRRE','','','99','MARICELLA','2006-09-15 13:10:03.000000',2,2,1),(541,'FRANK','AGUON','faguon@ucsd.edu             ','6195436671','SX','G.','2010-08-04 06:01:09.000000',1,2,1),(542,'ALMA','AGUIRRE','','','CX','ROSA','2009-07-02 13:01:07.000000',2,2,1),(543,'','','','','CX','','2005-11-21 08:22:43.000000',2,2,1),(544,'NORMA','AGUIRRE','naguirre@ucsd.edu           ','','RX','','2010-08-04 06:01:09.000000',1,2,1),(545,'ROWENA','AGUSTIN','rnagustin@ucsd.edu          ','6195437878','EX','NAGUIT','2010-08-04 06:01:09.000000',1,2,1),(546,'CHRISTOPHER','AHAMEFULA','cahamefula@ucsd.edu         ','6195432255','SX','C.','2010-08-04 06:01:09.000000',1,2,1),(547,'SHABBIR','AHMAD','shahmad@ucsd.edu            ','6195436020','EX','','2010-08-04 06:01:09.000000',1,2,1),(548,'AHMAD','AHMAD','aahmad@ucsd.edu             ','','99','K','2010-06-23 06:01:10.000000',2,2,1),(549,'DESIREA','AHERN-YOUNG','dahernyoung@ucsd.edu        ','','NX','MARIE','2010-08-04 06:01:09.000000',1,2,1),(550,'GOLNAZ','AHADI','gahadi@ucsd.edu             ','','TX','','2010-08-04 06:01:09.000000',1,2,1),(551,'HEIDI','AIEM','haiem@ucsd.edu','6195438080','99','C','2008-06-13 12:25:09.000000',2,2,1),(552,'ALLEN','AIKEN','aaiken@ucsd.edu             ','','EX','B','2010-08-04 06:01:09.000000',1,2,1),(553,'MELISSA','AILLAUD','','','99','','2010-07-01 06:01:11.000000',2,2,1),(554,'ALEX','AKAMINE','aakamine@ucsd.edu           ','6195435280','NX','H.','2010-08-04 06:01:09.000000',1,2,1),(555,'CHRISTOPHER','AIRRIESS','cairriess@ucsd.edu','8585343650','99','NELSON','2009-03-13 13:15:06.000000',2,2,1),(556,'CHRISTOPHER','AKE','cake@ucsd.edu','6195438136','99','FRANCIS','2009-07-30 06:01:06.000000',2,2,1),(557,'MOHAMED','ALAGHA','malagha@ucsd.edu            ','','EX','','2010-08-04 06:01:09.000000',1,2,1),(558,'TERRI','AKERSON','takerson@ucsd.edu','8585345923','CX','','2007-06-23 13:00:09.000000',2,2,1),(559,'GUSTAVO','ALATORRE','galatorre@ucsd.edu          ','6195436493','CX','H. FLORES','2009-09-01 06:01:07.000000',2,2,1),(560,'ROSALEEH','ALAYON','ralayon@ucsd.edu            ','6195436130','NX','T','2010-08-04 06:01:09.000000',1,2,1),(561,'SUMAIRA','AKBARZADA','','','99','','2008-07-01 12:25:09.000000',2,2,1),(562,'DANIZA','AIZAGA','','','99','TATYANNA','2006-08-24 13:10:03.000000',2,2,1),(563,'SARA','ALBANIL','salbanil@ucsd.edu           ','6194710426','RX','','2010-02-27 06:01:17.000000',2,2,1),(564,'FLORDELIZA','ALBANO','falbano@ucsd.edu            ','6195433000','HX','Q','2010-08-04 06:01:09.000000',1,2,1),(565,'FIDEL','ALBANO','fmalbano@ucsd.edu           ','6195436592','NX','M','2010-08-04 06:01:09.000000',1,2,1),(566,'ALLISON','AKA','','','99','ASHLEY','2009-01-14 14:15:09.000000',2,2,1),(567,'MONA','AKBARNIA','','','99','LADEN','2010-08-04 06:01:09.000000',1,2,1),(568,'NASEEM','AJILI','','','99','','2010-08-04 06:01:09.000000',1,2,1),(569,'NICOLE','RIGGS','nalbers@ucsd.edu            ','6195436496','EX','PENCES','2010-08-04 06:01:09.000000',1,2,1),(570,'ALI','AHMADZAI','aahmadzai@ucsd.edu          ','','NX','REZA','2010-08-04 06:01:09.000000',1,2,1),(571,'KIMBERLY','ALBERTO','','','99','A','2007-09-24 12:20:08.000000',2,2,1),(572,'VALENTINE','ALBERTO','valberto@ucsd.edu           ','8586572275','99','ANNE','2010-08-04 06:01:09.000000',1,2,1),(573,'JOANNE','ALBRECHT','jalbrecht@ucsd.edu          ','8589666763','CX','RAYMER','2010-08-04 06:01:09.000000',1,2,1),(574,'JANET','ALBRIGHT','jtalbright@ucsd.edu','','CX','T.','2008-10-01 13:15:11.000000',2,2,1),(575,'TERRY','ALBRITTON','talbritton@ucsd.edu         ','6195433064','99','ANNE','2010-08-04 06:01:09.000000',1,2,1),(576,'JEFFERY','ALBRO','jalbro@ucsd.edu             ','','NX','SCOTT','2010-08-04 06:01:09.000000',1,2,1),(577,'REYNALDO','ALCAFARAS','ralcafaras@ucsd.edu         ','8586576470','SX','I.','2010-01-06 06:01:17.000000',2,2,1),(578,'TERESITA','ADAMS','talcantara@ucsd.edu         ','6195436364','EX','TOLENTINO','2010-08-04 06:01:09.000000',1,2,1),(579,'LINDA','DELAP','lalcancia@ucsd.edu          ','6195436502','NX','GRACE','2010-08-04 06:01:09.000000',1,2,1),(580,'JOSEPH','ALCONES','','','NX','GLENN M','2006-06-10 13:10:07.000000',2,2,1),(581,'DANILO','ALCORDO','','','NX','D','2010-03-20 06:01:08.000000',2,2,1),(582,'DIANA','ALCOVA','dalcova@ucsd.edu            ','','NX','ALCASID','2010-08-04 06:01:09.000000',1,2,1),(583,'JESSE','ALDAMA DIAZ','jaldama@ucsd.edu            ','','SX','','2010-04-14 06:01:14.000000',2,2,1),(584,'RAMON','ALDECOA','raldecoa@ucsd.edu           ','8585340366','99','J','2010-08-04 06:01:09.000000',1,2,1),(585,'LEAH','ADRID','ladrid@ucsd.edu             ','6195435280','99','K','2010-08-04 06:01:09.000000',1,2,1),(586,'ANNA','ADONGO','','','99','A','2007-08-18 14:00:10.000000',2,2,1),(587,'TRACY','ALDERMAN','talderman@ucsd.edu          ','6195437761','HX','ANNE','2010-08-04 06:01:09.000000',1,2,1),(588,'KATHY','ALDERN','kaldern@ucsd.edu            ','8585528585','RX','A.','2010-08-04 06:01:09.000000',1,2,1),(589,'NAZILLA','ALDERSON','nalderson@ucsd.edu          ','8588224606','RX','BAHRAINI','2010-08-04 06:01:09.000000',1,2,1),(590,'LEONORA','ALDRICH','laldrich@ucsd.edu           ','6195435231','HX','','2010-08-04 06:01:09.000000',1,2,1),(591,'ELMER','ALEJANDRO','ealejandro@ucsd.edu         ','6195432255','SX','A','2010-08-04 06:01:09.000000',1,2,1),(592,'JANE','ALEJANDRO','','','99','P.','2006-09-18 13:10:03.000000',2,2,1),(593,'OLIVIA','ALDRETE','oaldrete@ucsd.edu           ','6195432255','SX','IRENE','2010-08-04 06:01:09.000000',1,2,1),(594,'NICHOLAS','ALDRIDGE','naldridge@ucsd.edu          ','','RX','RYAN','2010-07-01 06:01:11.000000',2,2,1),(595,'CECILIA','ALDRETE','caldrete@ucsd.edu           ','8588223389','99','MARIA','2010-08-04 06:01:09.000000',1,2,1),(596,'SHEREE','ALDRIDGE','','6194976668','EX','KIM','2006-05-13 13:16:38.000000',2,2,1),(597,'ISABEL','ALEGRIA','','','99','E','2009-08-22 06:01:07.000000',2,2,1),(598,'EMNET','ALEMU','','','99','','2008-01-11 13:20:09.000000',2,2,1),(599,'AMINE','ALE-ALI','aaleali@ucsd.edu            ','8588226094','HX','BEHZAD','2010-08-04 06:01:09.000000',1,2,1),(600,'PAT','STRAVALEXIS-WASHINGTON','pstravalexiswashin@ucsd.edu ','8584531792','99','J.','2010-08-04 06:01:09.000000',1,2,1),(601,'BRENDA','WILLIAMS','bhalexander@ucsd.edu','6195435280','EX','HAYWOOD','2008-07-08 12:25:09.000000',2,2,1),(602,'CATHERYN','ALEXANDER','cnalexander@ucsd.edu        ','6195437155','EX','NATALIE','2010-08-04 06:01:09.000000',1,2,1),(603,'CLINTON','ALEXANDER','','','EX','K','2010-04-21 06:01:33.000000',2,2,1),(604,'GENEVA','ALEXANDER','gealexander@ucsd.edu','6195432870','EX','DEE','2008-09-27 13:15:10.000000',2,2,1),(605,'GUY','ALEXANDER','galexander@ucsd.edu         ','6195433077','EX','E','2010-08-04 06:01:09.000000',1,2,1),(606,'','','','8585528585','RX','','2006-02-02 15:36:55.000000',2,2,1),(607,'','','','8586578378','CX','','2006-02-02 15:36:55.000000',2,2,1),(608,'TERRY','ALEXANDER','tjalexander@ucsd.edu        ','6195435003','99','J','2010-08-04 06:01:09.000000',1,2,1),(609,'DORU','ALEXANDRESCU','dtalexandrescu@ucsd.edu','','RX','TRAIAN','2009-06-29 13:01:06.000000',2,2,1),(610,'PAMELA','ALFORD','palford@ucsd.edu            ','8588221364','99','B.','2010-08-04 06:01:09.000000',1,2,1),(611,'LAWRENCE','ALFRED','lalfred@ucsd.edu            ','8588222741','99','J.','2010-08-04 06:01:09.000000',1,2,1),(612,'MADELINE','ALGIERS','','8589668180','CX','NANETTE','2006-11-01 14:20:29.000000',2,2,1),(613,'SUSAN','ALGERT-STUBBLEFIELD','salgertstubblefiel@ucsd.edu ','','99','J','2009-08-01 06:01:07.000000',2,2,1),(614,'ESTELA','ALIAGA','ealiaga@ucsd.edu','6195431949','CX','I','2008-11-20 14:15:09.000000',2,2,1),(615,'ANNA LIZA','ALIDO','aalido@ucsd.edu             ','6195432244','HX','LAZARO','2010-08-04 06:01:09.000000',1,2,1),(616,'TARA','ALIRE','','','99','LYNNE','2010-08-04 06:01:09.000000',1,2,1),(617,'JENNIFER','ALISANGCO','jalisangco@ucsd.edu         ','','NX','B.','2010-08-04 06:01:09.000000',1,2,1),(618,'MATIAS','ALLAPITAN','mallapitan@ucsd.edu         ','6195432255','SX','D','2010-08-04 06:01:09.000000',1,2,1),(619,'FAISAL','AHMED','faahmed@ucsd.edu            ','8586577122','RX','','2010-08-04 06:01:09.000000',1,2,1),(620,'NICHOLAS','ALBRECHT','','','CX','R.','2007-05-08 03:21:25.000000',2,2,1),(621,'ELVIRA','ALLEN','elallen@ucsd.edu            ','6194719498','99','','2010-08-04 06:01:09.000000',1,2,1),(622,'JULIANNE','ALLEN','j6allen@ucsd.edu            ','6195436364','NX','W','2010-08-04 06:01:09.000000',1,2,1),(623,'JOHN','ALLEN','','6195437505','NX','P','2006-06-29 13:19:23.000000',2,2,1),(624,'LATRISHA','ALLEN','llallen@ucsd.edu            ','6195432009','CX','LORRIONE','2009-12-30 06:01:26.000000',2,2,1),(625,'LESLEE','ALLEN','leallen@ucsd.edu            ','6195433057','99','','2010-08-04 06:01:09.000000',1,2,1),(626,'LEISA','ALLEN','lcallen@ucsd.edu            ','8588226843','CX','CHRISTINE','2010-06-16 06:01:12.000000',2,2,1),(627,'PATRICK','ALLEN','pjallen@ucsd.edu','6195435294','CX','J','2008-10-02 13:15:11.000000',2,2,1),(628,'RACHEL','ALLEN-CORNEL','r1allen@ucsd.edu','6195436364','NX','LORRAINE','2007-09-16 12:20:08.000000',2,2,1),(629,'SUSAN','ALLEN','s1allen@ucsd.edu            ','6195435237','CX','A.','2009-10-31 06:01:07.000000',2,2,1),(630,'VICKI','ALLEN','vallen@ucsd.edu             ','6195211983','99','JANE','2010-08-04 06:01:09.000000',1,2,1),(631,'','','calfaro@ucsd.edu','8585343364','CX','','2006-04-06 13:17:51.000000',2,2,1),(632,'RONALD','ALFA','','','RX','WAKIM','2006-09-16 13:10:05.000000',2,2,1),(633,'MARIA','ALFARO','mealfaro@ucsd.edu','8588225791','99','ESTELA','2008-08-23 12:25:09.000000',2,2,1),(634,'JESUS','ALFARO','','','99','G','2010-08-04 06:01:09.000000',1,2,1),(635,'ANDRE','ALFARO','aalfaro@ucsd.edu','','RX','JOSEPH','2009-05-01 13:15:09.000000',2,2,1),(636,'CATHERINE','ALLISON','caallison@ucsd.edu          ','8586576295','NX','ANN','2010-08-04 06:01:09.000000',1,2,1),(637,'DAVID','ALLISON','dwallison@ucsd.edu          ','6195436291','EX','WILBANKS','2010-08-04 06:01:09.000000',1,2,1),(638,'TERESA','ALLISON','tallison@ucsd.edu           ','','99','A.','2010-08-04 06:01:09.000000',1,2,1),(639,'AARYN','GREER-BELFER','agreerbelfer@ucsd.edu       ','8588225844','99','','2010-08-04 06:01:09.000000',1,2,1),(640,'MICHELLE','ALLISON','','8588223606','CX','','2006-04-29 13:16:58.000000',2,2,1),(641,'JENNIFER','ALLYN','jallyn@ucsd.edu             ','6195437428','NX','LEE','2010-08-04 06:01:09.000000',1,2,1),(642,'ERICH','ALLMAN','ecallman@ucsd.edu','8588225369','RX','C.','2007-06-28 13:00:08.000000',2,2,1),(643,'JANISE','ZAPANTA','','','NX','A.','2006-05-31 13:10:07.000000',2,2,1),(644,'DEVONNA','ALMAGRO','','','99','NISHMET','2006-09-26 14:11:41.000000',2,2,1),(645,'NANCY','STEEL','nalmance@ucsd.edu           ','6195211983','99','ALMANCE','2010-08-04 06:01:09.000000',1,2,1),(646,'FELICIDAD','ALMAZAN','falmazan@ucsd.edu           ','8585344407','RX','A','2010-08-04 06:01:09.000000',1,2,1),(647,'MARIA','ALMARIO','mlalmario@ucsd.edu          ','','NX','LEA','2010-08-04 06:01:09.000000',1,2,1),(648,'ANA','ALMARAZ','aalmaraz@ucsd.edu           ','6195437700','HX','C','2010-08-04 06:01:09.000000',1,2,1),(649,'TARA','ALMAZAN','talmazan@ucsd.edu','8585349501','CX','M','2008-07-16 12:25:09.000000',2,2,1),(650,'MELISSA','ALMEDA','malmeda@ucsd.edu            ','6195435280','NX','DE LOS SANTOS','2010-08-04 06:01:09.000000',1,2,1),(651,'ADELAIDA','ALMARIO','aalmario@ucsd.edu           ','','NX','M','2009-09-17 06:01:06.000000',2,2,1),(652,'LORENA','SMITH','lalmeida@ucsd.edu           ','8584555050','99','','2010-08-04 06:01:09.000000',1,2,1),(653,'MARILYN','ALM','malmpulvirenti@ucsd.edu     ','8586576500','EX','CHARMAGNE','2009-09-01 06:01:07.000000',2,2,1),(654,'MARIA LOURDES','ALMARIO','','','EX','AYSON','2010-08-04 06:01:09.000000',1,2,1),(655,'LOURDES','ALMIROL','lalmirol@ucsd.edu           ','6195436350','NX','S','2010-08-04 06:01:09.000000',1,2,1),(656,'THERESA','ALONSO','talonso@ucsd.edu            ','6195436534','CX','M.','2010-08-04 06:01:09.000000',1,2,1),(657,'EDGAR','ALMINAR','eaalminar@ucsd.edu          ','8586228798','RX','ANTHONY','2010-08-04 06:01:09.000000',1,2,1),(658,'MARIA','ALONSO','malonso@ucsd.edu            ','6195435719','EX','','2010-08-04 06:01:09.000000',1,2,1),(659,'PACITA','ALONZO','palonzo@ucsd.edu            ','6195436300','EX','C','2009-12-16 06:01:20.000000',2,2,1),(660,'WILLIAM','ALOZIE','walozie@ucsd.edu            ','','EX','CHIKAODI','2010-08-04 06:01:09.000000',1,2,1),(661,'KENNETH','ALMINAR','kalminar@ucsd.edu           ','8588221508','CX','E','2009-09-01 06:01:07.000000',2,2,1),(662,'VERONICA','ALONSO','valonso@ucsd.edu            ','8586578745','EX','','2010-08-04 06:01:09.000000',1,2,1),(663,'SUNNY','ALPERSON','salperson@ucsd.edu          ','','NX','YIM','2009-10-06 06:01:07.000000',2,2,1),(664,'MELLISA','ALRIDGE','malridge@ucsd.edu           ','','EX','LASHELLE','2010-08-04 06:01:09.000000',1,2,1),(665,'FERDINAND','ALSISTO','falsisto@ucsd.edu','6194719013','CX','A','2008-02-21 13:25:08.000000',2,2,1),(666,'JOHN','ALSPAUGH','','','EX','D.','2006-11-15 14:10:05.000000',2,2,1),(667,'COURTNEY','ALSTON','','','99','M','2010-08-04 06:01:09.000000',1,2,1),(668,'MALLIKA','ALLU','mallu@ucsd.edu              ','8588224069','99','SASHI','2010-08-04 06:01:09.000000',1,2,1),(669,'MELINDA','ALTADONNA','maltadonna@ucsd.edu         ','','NX','J','2010-08-04 06:01:09.000000',1,2,1),(1027,'kaya','Abbes','abbess@email.com','00121212101','Home N 333 Apartment 300','This is the third contact','2018-09-22 17:24:17.278335',1,NULL,1),(1028,'joeblow','Abbes','abbess@email.com','00121212101','Home N 333 Apartment 300','This is the third contact','2018-09-22 17:32:29.437943',1,NULL,1);
/*!40000 ALTER TABLE `contacts_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'accounts','account'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'contacts','contact'),(5,'contenttypes','contenttype'),(9,'leads','lead'),(10,'opportunities','opportunity'),(7,'restapp','school'),(13,'schedules','schedule'),(12,'schools','school'),(6,'sessions','session'),(14,'teachers','teacher');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-19 13:15:08.458757'),(2,'auth','0001_initial','2018-09-19 13:15:11.129884'),(3,'admin','0001_initial','2018-09-19 13:15:11.791671'),(4,'admin','0002_logentry_remove_auto_add','2018-09-19 13:15:11.813247'),(5,'admin','0003_logentry_add_action_flag_choices','2018-09-19 13:15:11.831978'),(6,'contenttypes','0002_remove_content_type_name','2018-09-19 13:15:12.100332'),(7,'auth','0002_alter_permission_name_max_length','2018-09-19 13:15:12.301563'),(8,'auth','0003_alter_user_email_max_length','2018-09-19 13:15:12.497731'),(9,'auth','0004_alter_user_username_opts','2018-09-19 13:15:12.519439'),(10,'auth','0005_alter_user_last_login_null','2018-09-19 13:15:12.663314'),(11,'auth','0006_require_contenttypes_0002','2018-09-19 13:15:12.680150'),(12,'auth','0007_alter_validators_add_error_messages','2018-09-19 13:15:12.698506'),(13,'auth','0008_alter_user_username_max_length','2018-09-19 13:15:12.895105'),(14,'auth','0009_alter_user_last_name_max_length','2018-09-19 13:15:13.091226'),(15,'restapp','0001_initial','2018-09-19 13:15:13.221817'),(16,'sessions','0001_initial','2018-09-19 13:15:13.389720'),(17,'restapp','0002_auto_20180919_1317','2018-09-19 13:17:19.994737'),(18,'accounts','0001_initial','2018-09-22 13:51:45.660768'),(19,'contacts','0001_initial','2018-09-22 13:51:46.237132'),(20,'leads','0001_initial','2018-09-22 13:51:47.433811'),(21,'opportunities','0001_initial','2018-09-22 13:51:48.890713'),(22,'teachers','0001_initial','2018-09-23 14:25:00.942422'),(23,'schools','0001_initial','2018-09-23 14:25:45.329119'),(24,'schedules','0001_initial','2018-09-23 14:25:46.061640'),(25,'schools','0002_auto_20180923_1429','2018-09-23 14:29:35.684102'),(26,'schools','0003_school_createdby','2018-09-23 14:39:52.958323'),(27,'teachers','0002_teacher_createdby','2018-09-23 14:39:53.301069');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('5wclht2999w6tinj28atlppl2ipmko3m','MmM4Mjc2YmE3ZWY1MzI3MDIwNTRjYzhmYWVmMjkyMGUzZmNjZDg0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MzRkMDhiNGZkZGE0MzQzMTFlMzQ3OWRlODczMDExNWQwMDgyMTA4In0=','2018-10-03 13:34:29.898985');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_lead`
--

DROP TABLE IF EXISTS `leads_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_lead` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `description` longtext,
  `account_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` decimal(12,2) DEFAULT NULL,
  `createdOn` datetime(6) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `enquery_type` varchar(255) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `createdBy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `leads_lead_account_id_d7b48dfa_fk_accounts_account_id` (`account_id`),
  KEY `leads_lead_createdBy_id_d18eb78b_fk_auth_user_id` (`createdBy_id`),
  CONSTRAINT `leads_lead_account_id_d7b48dfa_fk_accounts_account_id` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `leads_lead_createdBy_id_d18eb78b_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_lead`
--

LOCK TABLES `leads_lead` WRITE;
/*!40000 ALTER TABLE `leads_lead` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads_lead_assigned_to`
--

DROP TABLE IF EXISTS `leads_lead_assigned_to`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leads_lead_assigned_to` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `leads_lead_assigned_to_lead_id_user_id_96e37802_uniq` (`lead_id`,`user_id`),
  KEY `leads_lead_assigned_to_user_id_e9de5cbf_fk_auth_user_id` (`user_id`),
  CONSTRAINT `leads_lead_assigned_to_lead_id_b43e64b4_fk_leads_lead_id` FOREIGN KEY (`lead_id`) REFERENCES `leads_lead` (`id`),
  CONSTRAINT `leads_lead_assigned_to_user_id_e9de5cbf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads_lead_assigned_to`
--

LOCK TABLES `leads_lead_assigned_to` WRITE;
/*!40000 ALTER TABLE `leads_lead_assigned_to` DISABLE KEYS */;
/*!40000 ALTER TABLE `leads_lead_assigned_to` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_opportunity`
--

DROP TABLE IF EXISTS `opportunities_opportunity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_opportunity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `stage` varchar(64) NOT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `probability` int(11) DEFAULT NULL,
  `closedOn` datetime(6) DEFAULT NULL,
  `description` longtext,
  `createdOn` datetime(6) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `closedBy_id` int(11) DEFAULT NULL,
  `createdBy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `opportunities_opport_account_id_9d121ef9_fk_accounts_` (`account_id`),
  KEY `opportunities_opportunity_closedBy_id_f8eb0c8f_fk_auth_user_id` (`closedBy_id`),
  KEY `opportunities_opportunity_createdBy_id_878e15ae_fk_auth_user_id` (`createdBy_id`),
  CONSTRAINT `opportunities_opport_account_id_9d121ef9_fk_accounts_` FOREIGN KEY (`account_id`) REFERENCES `accounts_account` (`id`),
  CONSTRAINT `opportunities_opportunity_closedBy_id_f8eb0c8f_fk_auth_user_id` FOREIGN KEY (`closedBy_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `opportunities_opportunity_createdBy_id_878e15ae_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_opportunity`
--

LOCK TABLES `opportunities_opportunity` WRITE;
/*!40000 ALTER TABLE `opportunities_opportunity` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_opportunity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities_opportunity_contacts`
--

DROP TABLE IF EXISTS `opportunities_opportunity_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities_opportunity_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opportunity_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `opportunities_opportunit_opportunity_id_contact_i_f87dcb1d_uniq` (`opportunity_id`,`contact_id`),
  KEY `opportunities_opport_contact_id_5b86e581_fk_contacts_` (`contact_id`),
  CONSTRAINT `opportunities_opport_contact_id_5b86e581_fk_contacts_` FOREIGN KEY (`contact_id`) REFERENCES `contacts_contact` (`id`),
  CONSTRAINT `opportunities_opport_opportunity_id_6348de4a_fk_opportuni` FOREIGN KEY (`opportunity_id`) REFERENCES `opportunities_opportunity` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities_opportunity_contacts`
--

LOCK TABLES `opportunities_opportunity_contacts` WRITE;
/*!40000 ALTER TABLE `opportunities_opportunity_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `opportunities_opportunity_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(254),
  `phone` varchar(20),
  `address1` varchar(50) ,
  `address2` varchar(50) ,
  `city` varchar(50) ,
  `postalCode` varchar(50) ,
  `province` varchar(50) ,
  `country` varchar(50) ,
  `latitude` decimal(9,4) DEFAULT NULL,
  `longitude` decimal(9,4) DEFAULT NULL,
  `description` longtext,
  `createdOn` datetime(6) ,
  `isActive` tinyint(1) ,
  `createdBy_id` int(11) ,
  PRIMARY KEY (`id`),
  KEY `school_createdBy_id_2789765b_fk_auth_user_id` (`createdBy_id`),
  CONSTRAINT `school_createdBy_id_2789765b_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postalCode` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` decimal(20,14) DEFAULT '0.00000000000000',
  `longitude` decimal(20,14) DEFAULT '0.00000000000000',
  `description` longtext,
  `createdOn` datetime(6) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_createdBy_id_125a267f_fk_auth_user_id` (`createdBy_id`),
  CONSTRAINT `teacher_createdBy_id_125a267f_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'TSUI, TIMOTHY','','','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(2,'DEL ROSARIO, CINDY','crdelrosario@ucsd.edu       ','8588225000','CX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(3,'SHAFFER, ELIZABETH','eshaffer@ucsd.edu           ','8586771545','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(4,'MURRAY, JENNIFER','jlmurray@ucsd.edu           ','6195437428','NX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(5,'IMEL, ANNE','aimel@ucsd.edu','6195432244','HX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2007-05-08 03:21:25.000000',2,1),(6,'AZAMOV, ALISHERHON','aazamov@ucsd.edu            ','6195436040','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2009-10-16 06:01:06.000000',2,1),(7,'ANTHONY, MELISSA','mlanthony@ucsd.edu          ','','CX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(8,'IMAGAWA, SAYAKA','simagawa@ucsd.edu','8588220218','RX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2009-07-02 13:01:07.000000',2,1),(9,'MENDOZA, LEE','l1ho@ucsd.edu','8586423875','RX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2008-01-01 13:20:09.000000',2,1),(10,'PAE, IVANA','','','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(11,'MIN, HYO','hjmin@ucsd.edu              ','','RX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-05-01 06:01:10.000000',2,1),(12,'STARK, JOHN','jmstark@ucsd.edu            ','6195436893','EX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(13,'BURROLA, ERNESTINA','eburrola@ucsd.edu           ','6195436570','EX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(14,'VANDERVELDE, JILL','jvandervelde@ucsd.edu','6195940300','HX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2006-08-16 13:10:06.000000',2,1),(15,'RICHTER III, FREDERICK','frichter@ucsd.edu           ','6195435358','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(16,'FERNANDEZ, BERNABE','befernandez@ucsd.edu        ','','EX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-05-11 06:01:08.000000',2,1),(17,'IMANSJAH, AUDREYANDRA','','','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(18,'GARBELLA, MARY','mgarbella@ucsd.edu          ','8585345923','CX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(19,'RUBERG, JOSHUA','jruberg@ucsd.edu','','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2009-07-02 13:01:07.000000',2,1),(20,'SHAPUTNIC, CAROLYN','cshaputnic@ucsd.edu         ','8588223698','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(21,'ALKATIB, DIANA','','','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2009-11-26 06:01:15.000000',2,1),(22,'LIU, MICHAEL','','','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(23,'DELOS ANGELES, MARIA ARABELLE','mdelosangeles@ucsd.edu      ','6195436364','NX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(24,'GISON, DOROTHY','','','NX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2007-09-11 14:00:08.000000',2,1),(25,'SHEA, KAREN','kshea@ucsd.edu              ','6195435753','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(26,'ZEPEDA, KARLA','kzepeda@ucsd.edu            ','6194719210','EX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(27,'VERA, JESUS','jevera@ucsd.edu             ','8588225604','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(28,'RILEY, TERENCE','tmriley@ucsd.edu','6195432952','EX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2008-01-19 13:20:08.000000',2,1),(29,'TAING, JENNIFER','jtaing@ucsd.edu','','EX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2008-05-21 12:25:09.000000',2,1),(30,'SOKOTOFF, RONNIE','','','99',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2008-07-01 12:25:09.000000',2,1),(31,'SANCHEZ, ADRIANNA','','','SX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2008-06-01 12:25:09.000000',2,1),(32,'LAUGHLIN, WILLIS','wlaughlin@ucsd.edu          ','','CX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-08-04 06:01:09.000000',1,1),(33,'RYAN, SUSAN','s4ryan@ucsd.edu             ','','NX',NULL,NULL,NULL,NULL,NULL,0.00000000000000,0.00000000000000,NULL,'2010-04-14 06:01:14.000000',2,1);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-24  9:10:34


--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `startTime` datetime(6) NOT NULL,
  `endTime` datetime(6) NOT NULL,
  `description` longtext,
  `createdOn` datetime(6) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy_id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_createdBy_id_c938e024_fk_auth_user_id` (`createdBy_id`),
  KEY `schedule_school_id_8d0196c4_fk_school_id` (`school_id`),
  KEY `schedule_teacher_id_3c8a1fec_fk_teacher_id` (`teacher_id`),
  CONSTRAINT `schedule_createdBy_id_c938e024_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `schedule_school_id_8d0196c4_fk_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `schedule_teacher_id_3c8a1fec_fk_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

insert into school (name,email,phone,address1,createdOn,isActive,createdBy_id) values ('UCSD', 'eodonnell@ucsd.edu','555-1212','Gilmore Dr',now(),1,1);
