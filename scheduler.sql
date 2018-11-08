-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: scheduler
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Temporary table structure for view `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!50001 DROP VIEW IF EXISTS `attendance`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `attendance` AS SELECT 
 1 AS `id`,
 1 AS `employee`,
 1 AS `class_month`,
 1 AS `class_year`,
 1 AS `showed_up`,
 1 AS `no_show`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$vv85oKFStkT3$g01jKAOSqAkj+GBy1Rd9+JdNPkVYLjgP4OvgzXPT3t0=','2018-11-07 12:16:03.417795',1,'eddyod','','','eddyod@yahoo.com',1,1,'2018-09-19 13:34:12.322694'),(2,'pbkdf2_sha256$120000$CylMNyPqApH2$YEiJ+CBaOvCe8cJ7dFnx1VdYm//h0ixJSOdSKabdv2w=','2018-10-09 05:26:46.000000',1,'jason','','','jasonodonnell@yahoo.com',1,1,'2018-10-09 05:26:28.000000'),(7,'',NULL,0,'eddyod@yahoo.com','','','',0,1,'2018-11-07 12:45:45.908369'),(9,'',NULL,0,'eddyod2@yahoo.com','','','eddyod2@yahoo.com',0,1,'2018-11-07 12:47:53.906384'),(10,'',NULL,0,'test1@test.com','','','test1@test.com',0,1,'2018-11-07 12:55:14.531189');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (2,2,53),(3,2,54),(4,2,55),(1,2,56);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-10-09 12:46:44.214637','2','jason',2,'[{\"changed\": {\"fields\": [\"user_permissions\"]}}]',4,1),(2,'2018-11-07 12:21:16.264088','3','Edward ODonnell',1,'[{\"added\": {}}]',15,1),(3,'2018-11-07 12:38:42.918633','7','Edward ODonnell',1,'[{\"added\": {}}]',15,1),(4,'2018-11-07 12:45:45.909983','8','Edward ODonnell',1,'[{\"added\": {}}]',15,1),(5,'2018-11-07 12:47:53.919523','10','Fast Eddy',1,'[{\"added\": {}}]',15,1),(6,'2018-11-07 12:55:14.544159','11','test1',1,'[{\"added\": {}}]',15,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'accounts','account'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'contacts','contact'),(5,'contenttypes','contenttype'),(15,'employees','employee'),(9,'leads','lead'),(10,'opportunities','opportunity'),(7,'restapp','school'),(13,'schedules','schedule'),(12,'schools','school'),(6,'sessions','session'),(14,'teachers','teacher');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-09-19 13:15:08.458757'),(2,'auth','0001_initial','2018-09-19 13:15:11.129884'),(3,'admin','0001_initial','2018-09-19 13:15:11.791671'),(4,'admin','0002_logentry_remove_auto_add','2018-09-19 13:15:11.813247'),(5,'admin','0003_logentry_add_action_flag_choices','2018-09-19 13:15:11.831978'),(6,'contenttypes','0002_remove_content_type_name','2018-09-19 13:15:12.100332'),(7,'auth','0002_alter_permission_name_max_length','2018-09-19 13:15:12.301563'),(8,'auth','0003_alter_user_email_max_length','2018-09-19 13:15:12.497731'),(9,'auth','0004_alter_user_username_opts','2018-09-19 13:15:12.519439'),(10,'auth','0005_alter_user_last_login_null','2018-09-19 13:15:12.663314'),(11,'auth','0006_require_contenttypes_0002','2018-09-19 13:15:12.680150'),(12,'auth','0007_alter_validators_add_error_messages','2018-09-19 13:15:12.698506'),(13,'auth','0008_alter_user_username_max_length','2018-09-19 13:15:12.895105'),(14,'auth','0009_alter_user_last_name_max_length','2018-09-19 13:15:13.091226'),(15,'restapp','0001_initial','2018-09-19 13:15:13.221817'),(16,'sessions','0001_initial','2018-09-19 13:15:13.389720'),(17,'restapp','0002_auto_20180919_1317','2018-09-19 13:17:19.994737'),(18,'accounts','0001_initial','2018-09-22 13:51:45.660768'),(19,'contacts','0001_initial','2018-09-22 13:51:46.237132'),(20,'leads','0001_initial','2018-09-22 13:51:47.433811'),(21,'opportunities','0001_initial','2018-09-22 13:51:48.890713'),(22,'teachers','0001_initial','2018-09-23 14:25:00.942422'),(23,'schools','0001_initial','2018-09-23 14:25:45.329119'),(24,'schedules','0001_initial','2018-09-23 14:25:46.061640'),(25,'schools','0002_auto_20180923_1429','2018-09-23 14:29:35.684102'),(26,'schools','0003_school_createdby','2018-09-23 14:39:52.958323'),(27,'teachers','0002_teacher_createdby','2018-09-23 14:39:53.301069'),(28,'schedules','0002_remove_schedule_name','2018-09-26 18:08:18.124215'),(29,'schedules','0003_auto_20180927_1841','2018-09-27 18:42:31.731996');
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
INSERT INTO `django_session` VALUES ('1zuehx5tg3ktw5iv31w4h4l9ulun6kxe','M2E0ODBlODIyNzA3ZmFjY2I4ZDBhMzIxZDdlNzhhZDU0MjU1NmJmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODk4YWRjYjQ5ZmE5MWNmOTVkZWQyNTM4MjY2NmFkNDEwNjRhYjcxIn0=','2018-10-10 03:33:27.476649'),('5b5ynw4brvqrs9gtbjavg8f85xgytiyp','M2E0ODBlODIyNzA3ZmFjY2I4ZDBhMzIxZDdlNzhhZDU0MjU1NmJmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODk4YWRjYjQ5ZmE5MWNmOTVkZWQyNTM4MjY2NmFkNDEwNjRhYjcxIn0=','2018-10-25 06:57:06.781155'),('5wclht2999w6tinj28atlppl2ipmko3m','MmM4Mjc2YmE3ZWY1MzI3MDIwNTRjYzhmYWVmMjkyMGUzZmNjZDg0ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MzRkMDhiNGZkZGE0MzQzMTFlMzQ3OWRlODczMDExNWQwMDgyMTA4In0=','2018-10-03 13:34:29.898985'),('7joup2mmbymr9x3hazu4bcldp9130l5i','M2E0ODBlODIyNzA3ZmFjY2I4ZDBhMzIxZDdlNzhhZDU0MjU1NmJmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODk4YWRjYjQ5ZmE5MWNmOTVkZWQyNTM4MjY2NmFkNDEwNjRhYjcxIn0=','2018-10-14 15:02:40.485196'),('j7uu3a8oejcrfahs1lv871ud4jts2in0','M2E0ODBlODIyNzA3ZmFjY2I4ZDBhMzIxZDdlNzhhZDU0MjU1NmJmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODk4YWRjYjQ5ZmE5MWNmOTVkZWQyNTM4MjY2NmFkNDEwNjRhYjcxIn0=','2018-10-17 04:56:11.479031'),('k2i3imesvcugzm10p5z97s71c3572iad','M2E0ODBlODIyNzA3ZmFjY2I4ZDBhMzIxZDdlNzhhZDU0MjU1NmJmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODk4YWRjYjQ5ZmE5MWNmOTVkZWQyNTM4MjY2NmFkNDEwNjRhYjcxIn0=','2018-10-10 12:51:53.716939'),('lbnsen97eksmce0nms1on5o4zjxghxto','YTA0OWFmNDc4MDQ2MTZhMzhjMzNhZWUwOTRhMGMzZTgzYmQ4OWEzYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4MmVlNGY2MTE3OGUyNDNjZDlhNmRlZmNlYzk1ZDBhZTJkMjEzMDcyIn0=','2018-10-23 05:26:46.522048'),('o5y2zct9sq5m4ecjak3xrfz8cul16srg','M2E0ODBlODIyNzA3ZmFjY2I4ZDBhMzIxZDdlNzhhZDU0MjU1NmJmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODk4YWRjYjQ5ZmE5MWNmOTVkZWQyNTM4MjY2NmFkNDEwNjRhYjcxIn0=','2018-10-23 12:44:42.207362'),('szvy5hdlnccdkcm5bzukio15cimpp7fa','M2E0ODBlODIyNzA3ZmFjY2I4ZDBhMzIxZDdlNzhhZDU0MjU1NmJmZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyODk4YWRjYjQ5ZmE5MWNmOTVkZWQyNTM4MjY2NmFkNDEwNjRhYjcxIn0=','2018-11-21 12:16:03.427188');
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
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_userId` (`user_id`),
  CONSTRAINT `FK_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (8,'Edward ODonnell','eddyod@yahoo.com','215-555-1212','4057 Brant St',NULL,NULL,NULL,NULL,NULL,'2018-11-07 20:45:46',1,NULL),(10,'Fast Eddy','eddyod2@yahoo.com','6195436040','4057 Brant St',NULL,NULL,NULL,NULL,NULL,'2018-11-07 20:47:54',1,NULL),(11,'test1','test1@test.com','55555','123',NULL,NULL,NULL,NULL,NULL,'2018-11-07 20:55:15',1,10);
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
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `latitude` decimal(12,9) DEFAULT NULL,
  `longitude` decimal(12,9) DEFAULT NULL,
  `description` longtext,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL,
  `created_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `K_location_created_id` (`created_id`),
  CONSTRAINT `FK_location_created_id` FOREIGN KEY (`created_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Bloomsburg State College','buc@buc.edu','215-555-1212','Bloomsburg PA','','','','','',NULL,NULL,NULL,'2018-11-07 11:53:43',1,2);
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
  `pay_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created` datetime(6) NOT NULL,
  `created_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `completed` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `K_schedule_employee_id` (`employee_id`),
  KEY `K_schedule_location_id` (`location_id`),
  KEY `FK_schedule_created_id` (`created_id`),
  CONSTRAINT `FK_schedule_created_id` FOREIGN KEY (`created_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `FK_schedule_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK_schedule_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50013 DEFINER=`eodonnell`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance` AS select `t`.`id` AS `id`,`t`.`name` AS `employee`,month(`s`.`start`) AS `class_month`,year(`s`.`start`) AS `class_year`,sum((case when (`s`.`completed` = 1) then 1 else 0 end)) AS `showed_up`,sum((case when (`s`.`completed` = 0) then 1 else 0 end)) AS `no_show` from (`schedule` `s` join `employee` `t` on((`s`.`employee_id` = `t`.`id`))) group by `t`.`id`,`t`.`name`,`class_month`,`class_year` order by `class_year`,`class_month`,`t`.`name` */;
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

-- Dump completed on 2018-11-07 13:31:01
