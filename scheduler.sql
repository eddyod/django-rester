-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: localhost    Database: scheduler
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Attendance',7,'add_attendance'),(26,'Can change Attendance',7,'change_attendance'),(27,'Can delete Attendance',7,'delete_attendance'),(28,'Can view Attendance',7,'view_attendance'),(29,'Can add Employee',8,'add_employee'),(30,'Can change Employee',8,'change_employee'),(31,'Can delete Employee',8,'delete_employee'),(32,'Can view Employee',8,'view_employee'),(33,'Can add Location',9,'add_location'),(34,'Can change Location',9,'change_location'),(35,'Can delete Location',9,'delete_location'),(36,'Can view Location',9,'view_location'),(37,'Can add Schedule',10,'add_schedule'),(38,'Can change Schedule',10,'change_schedule'),(39,'Can delete Schedule',10,'delete_schedule'),(40,'Can view Schedule',10,'view_schedule'),(41,'Can add Site',11,'add_site'),(42,'Can change Site',11,'change_site'),(43,'Can delete Site',11,'delete_site'),(44,'Can view Site',11,'view_site');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$0IXqijAje72w$XkC7APRPRIywupy9QKpSxnA7XWsxmvsK4VXJbByPzds=',NULL,1,'eddyod','','','eddyod@yahoo.com',1,1,'2018-11-11 12:56:59.603770'),(2,'pbkdf2_sha256$120000$r918LEUHjvCl$WTfk9wnXV65RghwLA4dvxtOL5TdPP6gryIS5EXbE79g=',NULL,1,'jason','','','jasonodonnell@yahoo.com',1,1,'2018-11-11 12:57:24.491601');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'scheduler','attendance'),(8,'scheduler','employee'),(9,'scheduler','location'),(10,'scheduler','schedule'),(11,'scheduler','site'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-11 12:55:54.504903'),(2,'auth','0001_initial','2018-11-11 12:55:58.012148'),(3,'admin','0001_initial','2018-11-11 12:55:58.958270'),(4,'admin','0002_logentry_remove_auto_add','2018-11-11 12:55:59.074624'),(5,'admin','0003_logentry_add_action_flag_choices','2018-11-11 12:55:59.190409'),(6,'contenttypes','0002_remove_content_type_name','2018-11-11 12:55:59.745203'),(7,'auth','0002_alter_permission_name_max_length','2018-11-11 12:56:00.032816'),(8,'auth','0003_alter_user_email_max_length','2018-11-11 12:56:00.376146'),(9,'auth','0004_alter_user_username_opts','2018-11-11 12:56:00.493001'),(10,'auth','0005_alter_user_last_login_null','2018-11-11 12:56:00.782363'),(11,'auth','0006_require_contenttypes_0002','2018-11-11 12:56:00.811968'),(12,'auth','0007_alter_validators_add_error_messages','2018-11-11 12:56:00.926779'),(13,'auth','0008_alter_user_username_max_length','2018-11-11 12:56:01.274992'),(14,'auth','0009_alter_user_last_name_max_length','2018-11-11 12:56:01.611122'),(15,'scheduler','0001_initial','2018-11-11 12:56:05.442395'),(16,'sessions','0001_initial','2018-11-11 12:56:05.692997');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `employee_site_id_f419377a_fk_site_id` (`site_id`),
  CONSTRAINT `employee_site_id_f419377a_fk_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`),
  CONSTRAINT `employee_user_id_cc4f5a1c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Gavin Harrison','bonillacarrie@turner-johnson.org','852-618-6267','8963 Lee Lane\nEast Angel, NC 55124',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(2,'Cynthia Martin','olloyd@yahoo.com','688-065-9376','021 Gentry Trace Suite 856\nPort Cindyton, NH 50917',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(3,'Jeffrey Parrish','steven07@hill-kim.com','869-292-0529','61521 Charles Heights Suite 120\nLake James, WA 755',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(4,'April Griffin','parrishmatthew@crane.com','945-876-5175','99875 Walls Unions Suite 814\nPort Briantown, GA 68',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(5,'Justin Price','juarezsarah@christensen-ross.com','203-861-3081','515 Carolyn Flat Suite 581\nDavisview, OR 27697',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(6,'Randy Young','jonesdiana@jones.com','389-827-9671','108 Gonzalez Greens Suite 825\nOrtizstad, OR 08984',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(7,'Dustin Martinez','holdenmichele@hotmail.com','495-157-4531','0313 Olivia Summit Apt. 445\nLake Gregorymouth, NJ',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(8,'Laurie Wheeler','wmiller@glenn.info','448-313-5076','4727 Donna Tunnel\nNguyenmouth, AK 08901',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(9,'Kevin Ellison','nicholashiggins@hotmail.com','448-676-7878','6820 Lisa Streets Suite 894\nMichaelshire, MS 42879',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(10,'Steven Jones','robert51@hotmail.com','404-191-1013','1996 Nicole Square Apt. 544\nHillshire, NY 89924',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(11,'Cameron Bennett','diane02@kelly-johnson.biz','635-710-1761','0799 Oneill Canyon\nWest Michelleborough, NE 30512',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(12,'Casey Harris','shermanmichael@yahoo.com','692-847-0737','98205 John Common\nEast James, IL 89617',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(13,'Chris Thompson','klee@hotmail.com','848-789-8295','60055 Lauren Shoals\nCarolville, ME 82823',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(14,'Mackenzie Marshall','david74@gmail.com','824-033-0571','1858 Johnson Stravenue\nGonzalezview, IN 33871',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(15,'Amber Sanders','vdavis@gmail.com','779-311-3405','2081 Martinez Curve\nAnthonyton, VT 39751',NULL,NULL,NULL,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` decimal(9,4) DEFAULT NULL,
  `longitude` decimal(9,4) DEFAULT NULL,
  `description` longtext,
  `created` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_site_id_b0ff19a8_fk_site_id` (`site_id`),
  CONSTRAINT `location_site_id_b0ff19a8_fk_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Bloomsburg State College','buc@buc.edu','555-1212','Bloomsburg PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,1),(2,'Reading Area Community College','racc@racc.edu','215-555-1212','Reading PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,1),(3,'Kutztown Uni','ku@ku.edu','215-555-1212','Kutztown PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,1),(4,'Beer Bar','buc@buc.edu','555-1212','Bloomsburg PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,2),(5,'Marks Bar','racc@racc.edu','215-555-1212','Reading PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,2),(6,'Joes Bar','ku@ku.edu','215-555-1212','Kutztown PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,2);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime(6) NOT NULL,
  `end` datetime(6) NOT NULL,
  `pay_rate` decimal(20,2) NOT NULL,
  `created` datetime(6) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedule_employee_id_c24e966a_fk_employee_id` (`employee_id`),
  KEY `schedule_location_id_d296afa1_fk_location_id` (`location_id`),
  KEY `schedule_site_id_074f37d3_fk_site_id` (`site_id`),
  CONSTRAINT `schedule_employee_id_c24e966a_fk_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `schedule_location_id_d296afa1_fk_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `schedule_site_id_074f37d3_fk_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2019-12-03 22:21:35.000000','2019-12-03 23:21:35.000000',34.00,'2018-11-11 13:18:06.345565',0,13,1,1),(2,'2019-05-05 23:56:36.000000','2019-05-06 00:56:36.000000',24.00,'2018-11-11 13:18:06.575410',1,9,6,1),(3,'2020-05-05 23:14:08.000000','2020-05-06 00:14:08.000000',23.00,'2018-11-11 13:18:06.780744',1,13,3,1),(4,'2020-09-05 14:18:57.000000','2020-09-05 15:18:57.000000',16.00,'2018-11-11 13:18:06.998890',1,5,3,1),(5,'2019-08-02 01:19:37.000000','2019-08-02 02:19:37.000000',25.00,'2018-11-11 13:18:07.208001',1,11,2,1),(6,'2019-12-31 18:47:23.000000','2019-12-31 19:47:23.000000',41.00,'2018-11-11 13:18:07.423488',0,14,3,1),(7,'2019-01-16 22:18:05.000000','2019-01-16 23:18:05.000000',17.00,'2018-11-11 13:18:07.650982',1,9,1,1),(8,'2020-03-27 17:14:48.000000','2020-03-27 18:14:48.000000',18.00,'2018-11-11 13:18:07.859763',0,2,6,1),(9,'2020-04-19 17:59:22.000000','2020-04-19 18:59:22.000000',32.00,'2018-11-11 13:18:08.079005',0,12,2,1),(10,'2018-12-19 03:34:49.000000','2018-12-19 04:34:49.000000',26.00,'2018-11-11 13:18:08.286177',1,7,6,1),(11,'2020-03-04 02:08:20.000000','2020-03-04 03:08:20.000000',24.00,'2018-11-11 13:18:08.496982',1,7,5,1),(12,'2018-11-14 10:32:54.000000','2018-11-14 11:32:54.000000',15.00,'2018-11-11 13:18:08.834590',1,4,2,1),(13,'2019-07-05 19:48:16.000000','2019-07-05 20:48:16.000000',37.00,'2018-11-11 13:18:09.066394',1,6,1,1),(14,'2019-04-10 13:39:47.000000','2019-04-10 14:39:47.000000',32.00,'2018-11-11 13:18:09.288852',1,13,5,1),(15,'2019-03-20 08:43:13.000000','2019-03-20 09:43:13.000000',14.00,'2018-11-11 13:18:09.492946',1,5,5,1),(16,'2019-10-13 14:48:53.000000','2019-10-13 15:48:53.000000',48.00,'2018-11-11 13:18:09.708707',1,1,2,1),(17,'2020-02-06 14:19:32.000000','2020-02-06 15:19:32.000000',17.00,'2018-11-11 13:18:09.912543',1,9,3,1),(18,'2019-06-19 15:48:47.000000','2019-06-19 16:48:47.000000',25.00,'2018-11-11 13:18:10.115210',1,8,6,1),(19,'2019-02-02 13:58:43.000000','2019-02-02 14:58:43.000000',15.00,'2018-11-11 13:18:10.338396',1,10,6,1),(20,'2020-08-31 01:57:26.000000','2020-08-31 02:57:26.000000',19.00,'2018-11-11 13:18:10.565432',1,13,3,1),(21,'2020-10-24 18:34:38.000000','2020-10-24 19:34:38.000000',26.00,'2018-11-11 13:18:10.794250',1,1,5,1),(22,'2019-11-15 15:34:29.000000','2019-11-15 16:34:29.000000',42.00,'2018-11-11 13:18:10.998015',1,11,2,1),(23,'2018-12-12 21:07:24.000000','2018-12-12 22:07:24.000000',38.00,'2018-11-11 13:18:11.200673',1,2,1,1),(24,'2020-08-27 22:08:39.000000','2020-08-27 23:08:39.000000',23.00,'2018-11-11 13:18:11.413890',1,15,5,1),(25,'2019-05-18 18:34:43.000000','2019-05-18 19:34:43.000000',42.00,'2018-11-11 13:18:11.617965',1,11,6,1),(26,'2019-10-10 15:03:19.000000','2019-10-10 16:03:19.000000',12.00,'2018-11-11 13:18:11.821487',1,12,6,1),(27,'2019-11-10 20:42:53.000000','2019-11-10 21:42:53.000000',22.00,'2018-11-11 13:18:12.045966',0,5,5,1),(28,'2019-08-16 04:52:50.000000','2019-08-16 05:52:50.000000',21.00,'2018-11-11 13:18:12.261344',0,15,6,1),(29,'2019-11-18 15:09:16.000000','2019-11-18 16:09:16.000000',46.00,'2018-11-11 13:18:12.479728',1,12,6,1),(30,'2019-06-08 03:20:36.000000','2019-06-08 04:20:36.000000',45.00,'2018-11-11 13:18:12.682648',0,14,4,1),(31,'2020-09-18 03:31:46.000000','2020-09-18 04:31:46.000000',33.00,'2018-11-11 13:18:12.887095',1,13,2,1),(32,'2020-10-10 00:08:54.000000','2020-10-10 01:08:54.000000',38.00,'2018-11-11 13:18:13.107956',1,4,2,1),(33,'2020-02-23 23:38:13.000000','2020-02-24 00:38:13.000000',15.00,'2018-11-11 13:18:13.312403',1,13,5,1),(34,'2020-01-09 02:08:39.000000','2020-01-09 03:08:39.000000',26.00,'2018-11-11 13:18:13.539625',1,9,6,1),(35,'2019-02-28 06:00:34.000000','2019-02-28 07:00:34.000000',35.00,'2018-11-11 13:18:13.753193',1,10,6,1),(36,'2019-06-17 05:32:32.000000','2019-06-17 06:32:32.000000',32.00,'2018-11-11 13:18:13.959339',1,10,2,1),(37,'2019-10-11 14:49:16.000000','2019-10-11 15:49:16.000000',43.00,'2018-11-11 13:18:14.179387',1,12,3,1),(38,'2020-07-28 17:07:27.000000','2020-07-28 18:07:27.000000',32.00,'2018-11-11 13:18:14.382290',1,13,5,1),(39,'2019-12-22 11:54:31.000000','2019-12-22 12:54:31.000000',50.00,'2018-11-11 13:18:14.596557',1,4,2,1),(40,'2020-10-27 06:33:28.000000','2020-10-27 07:33:28.000000',37.00,'2018-11-11 13:18:14.962992',1,1,1,1),(41,'2019-11-03 08:22:26.000000','2019-11-03 09:22:26.000000',48.00,'2018-11-11 13:18:15.177804',1,3,5,1),(42,'2018-11-27 00:53:16.000000','2018-11-27 01:53:16.000000',45.00,'2018-11-11 13:18:15.394506',0,3,4,1),(43,'2019-07-06 02:03:10.000000','2019-07-06 03:03:10.000000',20.00,'2018-11-11 13:18:15.599367',1,2,3,1),(44,'2020-11-08 05:52:35.000000','2020-11-08 06:52:35.000000',12.00,'2018-11-11 13:18:15.812732',1,11,4,1),(45,'2020-04-07 04:33:48.000000','2020-04-07 05:33:48.000000',32.00,'2018-11-11 13:18:16.015101',0,5,2,1),(46,'2020-02-21 17:21:45.000000','2020-02-21 18:21:45.000000',16.00,'2018-11-11 13:18:16.232517',1,10,2,1),(47,'2019-12-31 03:36:26.000000','2019-12-31 04:36:26.000000',31.00,'2018-11-11 13:18:16.469027',0,10,6,1),(48,'2020-10-17 12:37:41.000000','2020-10-17 13:37:41.000000',27.00,'2018-11-11 13:18:16.685551',1,7,5,1),(49,'2019-02-17 06:54:09.000000','2019-02-17 07:54:09.000000',23.00,'2018-11-11 13:18:16.913768',1,11,2,1),(50,'2020-02-25 13:22:39.000000','2020-02-25 14:22:39.000000',16.00,'2018-11-11 13:18:17.124992',1,5,2,1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_owner_id_5ae12135_fk_auth_user_id` (`owner_id`),
  CONSTRAINT `site_owner_id_5ae12135_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'Fast Eddys Bar and Grill','eddyod@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,1),(2,'Premier English','jason@jason.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,2),(3,'Joes Bar and Grill','joe@ucsd.edu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-12 10:23:13.105093',1,1);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

drop table if exists user_site;
CREATE TABLE user_site (
  id int(11) NOT NULL AUTO_INCREMENT,
  auth_id int(11) NOT NULL,
  site_id int(11) NOT NULL,
  PRIMARY KEY (id),
  KEY K__user_site_auth (auth_id),
  KEY K__user_site_site (site_id),
  CONSTRAINT FK__user_site_auth_id FOREIGN KEY (auth_id) REFERENCES auth_user (id),
  CONSTRAINT FK__user_site_site_id FOREIGN KEY (site_id) REFERENCES site (id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into user_site (auth_id,site_id ) values (2,2);
insert into user_site (auth_id,site_id ) values (1,1);




--
-- Final view structure for view `attendance`
--

/*!50001 DROP VIEW IF EXISTS `attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`eddyod`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance` AS select `s`.`id` AS `id`,`si`.`id` AS `site_id`,`e`.`id` AS `employee_id`,`e`.`name` AS `employee`,month(`s`.`start`) AS `class_month`,year(`s`.`start`) AS `class_year`,sum((case when (`s`.`completed` = 1) then 1 else 0 end)) AS `showed_up`,sum((case when (`s`.`completed` = 0) then 1 else 0 end)) AS `no_show` from ((`schedule` `s` join `employee` `e` on((`s`.`employee_id` = `e`.`id`))) join `site` `si` on((`e`.`site_id` = `si`.`id`))) group by `s`.`id`,`si`.`id`,`e`.`id`,`e`.`name`,`class_month`,`class_year` order by `class_year`,`class_month`,`e`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-13  5:53:46
