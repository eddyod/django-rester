-- MySQL dump 10.13  Distrib 5.6.40, for Linux (x86_64)
--
-- Host: 192.168.1.12    Database: scheduler
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
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(254),
  `phone` varchar(20) ,
  `address1` varchar(50),
  `address2` varchar(50),
  `city` varchar(50) ,
  `postalCode` varchar(50) ,
  `province` varchar(50) ,
  `country` varchar(50) ,
  `latitude` decimal(20,14) DEFAULT 0.0,
  `longitude` decimal(20,14) DEFAULT 0.0,
  `description` longtext,
  `createdOn` datetime(6) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `createdBy_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_createdBy_id_125a267f_fk_auth_user_id` (`createdBy_id`),
  CONSTRAINT `teacher_createdBy_id_125a267f_fk_auth_user_id` FOREIGN KEY (`createdBy_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
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

-- Dump completed on 2018-09-23  8:27:49

insert into teacher
(name, email, phone, address1, createdOn, isActive, createdBy_id)

select concat(last_name,', ', first_name) as name,
email,
phone,
bargaining_unit as address1,
update_ts as createdOn,
enabled as isActive,
1 as createdBy_id

from eddyod.se5aug2010 
where 
first_name is not null and last_name is not null and bargaining_unit is not null
and length(first_name) > 1 and length(last_name) > 1 and length(bargaining_unit) > 1
order by rand()
limit 33;
