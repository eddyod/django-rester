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
-- Temporary table structure for view `attendance`
--

DROP TABLE IF EXISTS `attendance`;

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
  KEY `K__employee_site_id` (`site_id`),
  KEY `FK__employee_user_id` (`user_id`),
  CONSTRAINT `FK__employee_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`),
  CONSTRAINT `FK__employee_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Gavin Harrison','bonillacarrie@turner-johnson.org','852-618-6267','8963 Lee Lane\nEast Angel, NC 55124',NULL,NULL,NULL,NULL,NULL,1,2,NULL),(2,'Cynthia Martin','olloyd@yahoo.com','688-065-9376','021 Gentry Trace Suite 856\nPort Cindyton, NH 50917',NULL,NULL,NULL,NULL,NULL,1,2,NULL),(3,'Jeffrey Parrish','steven07@hill-kim.com','869-292-0529','61521 Charles Heights Suite 120\nLake James, WA 755',NULL,NULL,NULL,NULL,NULL,1,2,NULL),(4,'April Griffin','parrishmatthew@crane.com','945-876-5175','99875 Walls Unions Suite 814\nPort Briantown, GA 68',NULL,NULL,NULL,NULL,NULL,1,2,NULL),(5,'Justin Price','juarezsarah@christensen-ross.com','203-861-3081','515 Carolyn Flat Suite 581\nDavisview, OR 27697',NULL,NULL,NULL,NULL,NULL,1,2,NULL),(6,'Boozer Randy Young','jonesdiana@jones.com','389-827-9671','108 Gonzalez Greens Suite 825\nOrtizstad, OR 08984',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(7,'Boozer Dustin Martinez','holdenmichele@hotmail.com','495-157-4531','0313 Olivia Summit Apt. 445\nLake Gregorymouth, NJ',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(8,'Boozer Laurie Wheeler','wmiller@glenn.info','448-313-5076','4727 Donna Tunnel\nNguyenmouth, AK 08901',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(9,'Boozer Kevin Ellison','nicholashiggins@hotmail.com','448-676-7878','6820 Lisa Streets Suite 894\nMichaelshire, MS 42879',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(10,'Boozer Steven Jones','robert51@hotmail.com','404-191-1013','1996 Nicole Square Apt. 544\nHillshire, NY 89924',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(11,'Boozer Cameron Bennett','diane02@kelly-johnson.biz','635-710-1761','0799 Oneill Canyon\nWest Michelleborough, NE 30512',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(12,'Boozer Casey Harris','shermanmichael@yahoo.com','692-847-0737','98205 John Common\nEast James, IL 89617',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(13,'Boozer Chris Thompson','klee@hotmail.com','848-789-8295','60055 Lauren Shoals\nCarolville, ME 82823',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(14,'Boozer Mackenzie Marshall','david74@gmail.com','824-033-0571','1858 Johnson Stravenue\nGonzalezview, IN 33871',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(15,'Boozer Amber Sanders','vdavis@gmail.com','779-311-3405','2081 Martinez Curve\nAnthonyton, VT 39751',NULL,NULL,NULL,NULL,NULL,1,1,NULL),(16,'Ima Teacher','ima@teacher.com','619-555-3232','123 Main St',NULL,NULL,NULL,NULL,NULL,1,2,NULL),(17,'Hesa Teacher','hesa@teacher.com','215-555-1212','666 Hades Way',NULL,NULL,NULL,NULL,NULL,0,2,NULL);
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
  KEY `K__location_site_id` (`site_id`),
  CONSTRAINT `FK__location_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Bloomsburg State College','buc@buc.edu','555-1212','Bloomsburg PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,2),(2,'Reading Area Community College','racc@racc.edu','215-555-1212','Reading PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,2),(3,'Kutztown Uni','ku@ku.edu','215-555-1212','Kutztown PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,2),(4,'Beer Bar','buc@buc.edu','555-1212','Bloomsburg PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,1),(5,'Marks Bar','racc@racc.edu','215-555-1212','Reading PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,1),(6,'Joes Bar','ku@ku.edu','215-555-1212','Kutztown PA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-11 12:57:34.000000',1,1),(7,'University of East Anglia','uea@uea.edu','215-555-1212','Norwich England UK',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-18 06:25:27.947288',1,2),(8,'San Diego State University','sdsu@sdsu.edu','619-555-3232','San Diego CA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-11-18 07:15:48.153949',1,2);
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
  KEY `K__schedule_employee_id` (`employee_id`),
  KEY `K__schedule_location_id` (`location_id`),
  KEY `K__schedule_site_id` (`site_id`),
  CONSTRAINT `FK__schedule_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `FK__schedule_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `FK__schedule_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,'2018-11-18 06:45:00.000000','2018-11-18 07:45:00.000000',11.00,'2018-11-18 06:46:11.406891',1,4,1,2),(2,'2018-11-19 09:00:00.000000','2018-11-19 10:00:00.000000',13.00,'2018-11-18 07:17:58.957842',1,17,3,2),(3,'2019-10-21 15:30:40.000000','2019-10-21 16:30:40.000000',33.00,'2018-11-18 07:36:17.104324',1,3,1,1),(4,'2020-05-19 21:12:20.000000','2020-05-19 22:12:20.000000',37.00,'2018-11-18 07:36:17.562548',1,11,4,1),(5,'2019-08-21 10:37:19.000000','2019-08-21 11:37:19.000000',27.00,'2018-11-18 07:38:43.517838',1,7,4,1),(6,'2020-04-18 16:12:55.000000','2020-04-18 17:12:55.000000',16.00,'2018-11-18 07:38:43.976010',1,8,4,1),(7,'2019-05-10 20:00:40.000000','2019-05-10 21:00:40.000000',20.00,'2018-11-18 07:39:40.058349',1,6,8,1),(8,'2020-09-27 08:07:03.000000','2020-09-27 09:07:03.000000',34.00,'2018-11-18 07:39:40.505686',1,17,1,1),(9,'2020-07-19 08:19:03.000000','2020-07-19 09:19:03.000000',40.00,'2018-11-18 07:40:12.351030',1,5,1,1),(10,'2020-05-20 12:32:13.000000','2020-05-20 13:32:13.000000',18.00,'2018-11-18 07:40:12.801936',1,15,2,1),(11,'2018-11-21 09:00:00.000000','2018-11-21 10:00:00.000000',100.00,'2018-11-18 07:43:57.435098',1,4,1,2),(12,'2018-12-04 09:00:00.000000','2018-12-04 10:00:00.000000',100.00,'2018-11-18 07:43:57.575010',1,4,1,2),(13,'2018-11-26 09:00:00.000000','2018-11-26 10:00:00.000000',100.00,'2018-11-18 07:43:57.928926',1,4,1,2),(14,'2018-11-20 09:00:00.000000','2018-11-20 10:00:00.000000',100.00,'2018-11-18 07:43:58.093206',1,4,1,2),(15,'2018-11-19 09:00:00.000000','2018-11-19 10:00:00.000000',100.00,'2018-11-18 07:43:58.135687',1,4,1,2),(16,'2018-12-12 09:00:00.000000','2018-12-12 10:00:00.000000',100.00,'2018-11-18 07:43:58.282633',1,4,1,2),(17,'2018-12-18 09:00:00.000000','2018-12-18 10:00:00.000000',100.00,'2018-11-18 07:43:58.818324',1,4,1,2),(18,'2018-12-24 09:00:00.000000','2018-12-24 10:00:00.000000',100.00,'2018-11-18 07:43:59.131658',1,4,1,2),(19,'2018-12-26 09:00:00.000000','2018-12-26 10:00:00.000000',100.00,'2018-11-18 07:43:59.358965',1,4,1,2),(20,'2018-12-11 09:00:00.000000','2018-12-11 10:00:00.000000',100.00,'2018-11-18 07:43:59.461309',1,4,1,2),(21,'2018-12-03 09:00:00.000000','2018-12-03 10:00:00.000000',100.00,'2018-11-18 07:43:59.543058',1,4,1,2),(22,'2018-12-17 09:00:00.000000','2018-12-17 10:00:00.000000',100.00,'2018-11-18 07:43:59.529523',1,4,1,2),(23,'2018-11-28 09:00:00.000000','2018-11-28 10:00:00.000000',100.00,'2018-11-18 07:44:00.190498',1,4,1,2),(24,'2018-12-19 09:00:00.000000','2018-12-19 10:00:00.000000',100.00,'2018-11-18 07:44:00.556614',1,4,1,2),(25,'2018-12-10 09:00:00.000000','2018-12-10 10:00:00.000000',100.00,'2018-11-18 07:44:00.627605',1,4,1,2),(26,'2018-11-27 09:00:00.000000','2018-11-27 10:00:00.000000',100.00,'2018-11-18 07:44:00.774604',1,4,1,2),(27,'2018-12-25 09:00:00.000000','2018-12-25 10:00:00.000000',100.00,'2018-11-18 07:44:00.917880',1,4,1,2),(28,'2018-12-05 09:00:00.000000','2018-12-05 10:00:00.000000',100.00,'2018-11-18 07:44:01.123823',1,4,1,2);
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
  KEY `K__site_owner_id` (`owner_id`),
  CONSTRAINT `FK__site_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
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

--
-- Table structure for table `user_site`
--

DROP TABLE IF EXISTS `user_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `K__user_site_auth` (`user_id`),
  KEY `K__user_site_site` (`site_id`),
  CONSTRAINT `FK__user_site_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `FK__user_site_site_id` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_site`
--

LOCK TABLES `user_site` WRITE;
/*!40000 ALTER TABLE `user_site` DISABLE KEYS */;
INSERT INTO `user_site` VALUES (1,2,2),(2,1,1);
/*!40000 ALTER TABLE `user_site` ENABLE KEYS */;
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
/*!50013 DEFINER=`eddyod`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance` AS select `s`.`id` AS `id`,`si`.`id` AS `site_id`,`e`.`id` AS `employee_id`,`e`.`name` AS `employee`,month(`s`.`start`) AS `class_month`,year(`s`.`start`) AS `class_year`,sum((case when (`s`.`completed` = 1) then 1 else 0 end)) AS `showed_up`,sum((case when (`s`.`completed` = 0) then 1 else 0 end)) AS `no_show`,(sum((case when (`s`.`completed` = 1) then 1 else 0 end)) * `s`.`pay_rate`) AS `monthly_pay` from ((`schedule` `s` join `employee` `e` on((`s`.`employee_id` = `e`.`id`))) join `site` `si` on((`e`.`site_id` = `si`.`id`))) group by `si`.`id`,`e`.`id`,`e`.`name`,`class_month`,`class_year` order by `class_year`,`class_month`,`e`.`name` */;
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

-- Dump completed on 2018-11-22  8:27:50
