-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: mscba02    Database: team3
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `activebooking`
--

DROP TABLE IF EXISTS `activebooking`;
/*!50001 DROP VIEW IF EXISTS `activebooking`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `activebooking` AS SELECT 
 1 AS `forename`,
 1 AS `lastname`,
 1 AS `telephone`,
 1 AS `bookingreference`,
 1 AS `activityname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `member_attendance`
--

DROP TABLE IF EXISTS `member_attendance`;
/*!50001 DROP VIEW IF EXISTS `member_attendance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `member_attendance` AS SELECT 
 1 AS `forename`,
 1 AS `lastname`,
 1 AS `telephone`,
 1 AS `bookingreference`,
 1 AS `attendanceid`,
 1 AS `activityname`,
 1 AS `weekday`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tbl_activity`
--

DROP TABLE IF EXISTS `tbl_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_activity` (
  `activityid` int NOT NULL AUTO_INCREMENT,
  `activityname` varchar(200) NOT NULL,
  `activityfee` double NOT NULL,
  `roomid` int NOT NULL,
  `isactive` tinyint NOT NULL,
  PRIMARY KEY (`activityid`),
  UNIQUE KEY `activityid_UNIQUE` (`activityid`),
  KEY `fk_roomid_idx` (`roomid`),
  CONSTRAINT `fk_roomid` FOREIGN KEY (`roomid`) REFERENCES `tbl_activity_room` (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_activity`
--

LOCK TABLES `tbl_activity` WRITE;
/*!40000 ALTER TABLE `tbl_activity` DISABLE KEYS */;
INSERT INTO `tbl_activity` VALUES (1,'A chance to dance with create',2,1,1),(2,'Aberdeen flydressers club',1.75,1,1),(3,'AKKG Kickboxing for children',1,2,1),(4,'B-Fitness class for Adults',4,3,1),(5,'Beginners computer class',2.5,2,1),(6,'Fitness gym',3.2,3,1),(7,'Foodbank by Inchgarth & Cfine',2,1,1),(8,'Friskis and svettis',1.5,1,1),(9,'Garthdee Pensioners club',1.99,2,1),(10,'Granite city brass band',1.65,1,1),(11,'Indoor carpet bowls',1.7,1,1),(12,'Mandy\'s art class',1.2,2,1),(13,'Outdoor play park',0,4,1),(14,'Phoenix club',1.5,2,1),(15,'Pool & snooker',2,5,1),(16,'Saxophone lessons',2.5,2,1),(17,'Sequence dancing with Barney',2,4,1),(18,'Silver city ring-craft dog group',1,4,1),(19,'Tablet class',2,1,1),(20,'Yoga with Manisha',3.5,3,1);
/*!40000 ALTER TABLE `tbl_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_activity_day`
--

DROP TABLE IF EXISTS `tbl_activity_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_activity_day` (
  `activity_dayid` int NOT NULL,
  `activityid` int NOT NULL,
  `dayid` int NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  PRIMARY KEY (`activity_dayid`),
  UNIQUE KEY `activity_dayid_UNIQUE` (`activity_dayid`),
  KEY `fk_dayid_idx` (`dayid`),
  KEY `fk_activityid_idx` (`activityid`),
  CONSTRAINT `fk_activityid` FOREIGN KEY (`activityid`) REFERENCES `tbl_activity` (`activityid`),
  CONSTRAINT `fk_dayid` FOREIGN KEY (`dayid`) REFERENCES `tbl_days` (`dayid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_activity_day`
--

LOCK TABLES `tbl_activity_day` WRITE;
/*!40000 ALTER TABLE `tbl_activity_day` DISABLE KEYS */;
INSERT INTO `tbl_activity_day` VALUES (1,1,3,'01:00:00','15:00:00'),(2,2,2,'07:00:00','21:00:00'),(3,4,4,'06:30:00','19:30:00'),(4,5,2,'14:00:00','15:00:00'),(5,3,1,'00:00:00','19:00:00'),(6,6,1,'09:30:00','21:30:00'),(7,6,3,'09:30:00','21:30:00'),(8,6,4,'09:30:00','21:30:00'),(9,6,2,'10:00:00','21:30:00'),(10,6,7,'10:00:00','21:30:00'),(11,6,5,'10:00:00','21:00:00'),(12,6,6,'09:00:00','14:00:00'),(13,7,3,'14:30:00','16:00:00'),(14,8,3,'18:00:00','19:00:00'),(15,9,1,'13:00:00','15:00:00'),(16,10,3,'19:30:00','22:00:00'),(17,10,7,'19:30:00','22:00:00'),(18,11,1,'09:30:00','23:30:00'),(19,11,3,'09:30:00','23:30:00'),(20,11,5,'10:00:00','12:00:00'),(21,12,2,'13:45:00','15:45:00'),(22,13,1,'00:00:00','00:00:00'),(23,13,2,'00:00:00','00:00:00'),(24,13,3,'00:00:00','00:00:00'),(25,13,4,'00:00:00','00:00:00'),(26,13,5,'00:00:00','00:00:00'),(27,13,6,'00:00:00','00:00:00'),(28,13,7,'00:00:00','00:00:00'),(29,19,2,'11:00:00','12:00:00'),(30,14,1,'19:00:00','21:00:00'),(31,15,1,'10:00:00','17:00:00'),(32,15,2,'10:00:00','17:00:00'),(33,15,4,'17:00:00','21:00:00'),(34,15,5,'10:00:00','12:00:00'),(35,15,6,'09:00:00','14:00:00'),(36,15,7,'10:00:00','21:00:00'),(37,16,2,'16:00:00','17:00:00'),(38,16,4,'16:00:00','17:00:00'),(39,17,7,'16:15:00','17:15:00'),(40,18,3,'19:00:00','21:00:00'),(41,20,5,'11:00:00','12:00:00'),(42,20,6,'11:30:00','12:30:00');
/*!40000 ALTER TABLE `tbl_activity_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_activity_room`
--

DROP TABLE IF EXISTS `tbl_activity_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_activity_room` (
  `roomid` int NOT NULL AUTO_INCREMENT,
  `roomname` varchar(70) NOT NULL,
  PRIMARY KEY (`roomid`),
  UNIQUE KEY `ROOMID_UNIQUE` (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_activity_room`
--

LOCK TABLES `tbl_activity_room` WRITE;
/*!40000 ALTER TABLE `tbl_activity_room` DISABLE KEYS */;
INSERT INTO `tbl_activity_room` VALUES (1,'Dahlia Room'),(2,'Tulip Room'),(3,'Gym Room'),(4,'Park side'),(5,'Pool Side');
/*!40000 ALTER TABLE `tbl_activity_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attendance`
--

DROP TABLE IF EXISTS `tbl_attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_attendance` (
  `attendanceid` int NOT NULL AUTO_INCREMENT,
  `bookingid` int NOT NULL,
  `membershipid` int NOT NULL,
  PRIMARY KEY (`attendanceid`),
  UNIQUE KEY `attendance_id_UNIQUE` (`attendanceid`),
  KEY `booking_id_idx` (`bookingid`),
  KEY `membership_id_idx` (`membershipid`),
  CONSTRAINT `booking_id` FOREIGN KEY (`bookingid`) REFERENCES `tbl_booking` (`bookingid`),
  CONSTRAINT `membership_id` FOREIGN KEY (`membershipid`) REFERENCES `tbl_membership_details` (`membershipid`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attendance`
--

LOCK TABLES `tbl_attendance` WRITE;
/*!40000 ALTER TABLE `tbl_attendance` DISABLE KEYS */;
INSERT INTO `tbl_attendance` VALUES (1,1,11),(2,2,2),(3,3,12),(4,4,35),(5,5,24),(6,6,34),(7,7,6),(8,8,7),(9,9,25),(10,10,77),(11,11,50),(12,12,27),(13,13,59),(14,14,45),(15,15,56),(16,16,69),(17,17,16),(18,18,13),(19,20,15),(20,21,48),(21,22,22),(22,23,74),(23,25,76),(24,26,80),(25,27,75),(26,28,19),(27,29,18),(28,30,8),(29,32,5),(30,33,52),(31,34,57),(32,35,54),(33,36,78),(34,37,42),(35,38,36),(36,39,47),(37,40,66),(38,41,33),(39,42,31),(40,44,30),(41,45,1),(42,46,3),(43,47,60),(44,48,53),(45,49,44),(46,50,58),(47,52,29),(48,53,51),(49,54,40),(50,55,61),(51,56,72),(52,57,38),(53,58,26),(54,59,73),(55,60,20),(56,61,14),(57,62,39),(58,63,37),(59,64,21),(60,65,64),(61,66,49),(62,67,41),(63,68,4),(64,69,65),(65,70,43),(66,71,23),(67,72,63),(68,73,67),(69,74,62),(70,75,32),(71,76,55),(72,77,71),(73,78,68),(74,79,70),(75,80,10),(76,81,85),(77,82,87),(78,83,83),(79,84,93),(80,85,94),(81,86,95),(82,87,96),(83,88,92),(84,90,84),(85,92,82),(86,93,91),(87,94,90),(88,95,89),(89,96,88),(90,98,99),(91,99,98),(92,100,81),(93,101,70),(94,102,10),(95,105,83),(96,106,93),(97,107,94),(98,108,95),(99,109,96),(100,110,92);
/*!40000 ALTER TABLE `tbl_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_booking`
--

DROP TABLE IF EXISTS `tbl_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_booking` (
  `bookingid` int NOT NULL AUTO_INCREMENT,
  `membershipid` int NOT NULL,
  `bookingreference` varchar(60) NOT NULL,
  `activityid` int NOT NULL,
  `bookeddate` date NOT NULL,
  `amountpaid` double NOT NULL,
  `amountdue` double NOT NULL,
  `bookingstatus` tinyint NOT NULL,
  PRIMARY KEY (`bookingid`),
  UNIQUE KEY `bookingid_UNIQUE` (`bookingid`),
  UNIQUE KEY `bookingrefrence_UNIQUE` (`bookingreference`),
  KEY `fk_membershipid_idx` (`membershipid`),
  KEY `fk_activityid_idx` (`activityid`),
  CONSTRAINT `activityid` FOREIGN KEY (`activityid`) REFERENCES `tbl_activity` (`activityid`),
  CONSTRAINT `membershipid` FOREIGN KEY (`membershipid`) REFERENCES `tbl_membership_details` (`membershipid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_booking`
--

LOCK TABLES `tbl_booking` WRITE;
/*!40000 ALTER TABLE `tbl_booking` DISABLE KEYS */;
INSERT INTO `tbl_booking` VALUES (1,11,'BK-10000001',11,'2022-10-21',1.7,0,1),(2,2,'BK-10000002',2,'2022-10-04',1.75,0,1),(3,12,'BK-10000003',12,'2022-10-11',1.2,0,1),(4,35,'BK-10000004',15,'2022-10-10',2,0,1),(5,24,'BK-10000005',4,'2022-10-06',4,0,1),(6,34,'BK-10000006',14,'2022-10-03',1.5,0,1),(7,6,'BK-10000007',6,'2022-10-03',3.2,0,1),(8,7,'BK-10000008',7,'2022-10-05',2,0,1),(9,25,'BK-10000009',5,'2022-10-04',2.5,0,1),(10,77,'BK-10000010',17,'2022-10-30',2,0,1),(11,50,'BK-10000011',10,'2022-10-02',1.65,0,1),(12,27,'BK-10000012',7,'2022-10-05',2,0,1),(13,59,'BK-10000013',19,'2022-10-04',2,0,1),(14,45,'BK-10000014',5,'2022-10-11',2.5,0,1),(15,56,'BK-10000015',16,'2022-10-04',2.5,0,1),(16,69,'BK-10000016',9,'2022-10-03',1.99,0,1),(17,16,'BK-10000017',16,'2022-10-06',2.5,0,1),(18,13,'BK-10000018',13,'2022-10-05',0,0,1),(19,9,'BK-10000019',9,'2022-10-10',0,0,0),(20,15,'BK-10000020',15,'2022-10-20',2,0,1),(21,48,'BK-10000021',8,'2022-10-05',1.5,0,1),(22,22,'BK-10000022',2,'2022-10-11',1.75,0,1),(23,74,'BK-10000023',14,'2022-10-10',1.5,0,1),(24,46,'BK-10000024',6,'2022-10-06',0,0,0),(25,76,'BK-10000025',16,'2022-10-06',2.5,0,1),(26,80,'BK-10000026',20,'2022-10-14',3.5,0,1),(27,75,'BK-10000027',15,'2022-10-11',2,0,1),(28,19,'BK-10000028',19,'2022-10-11',2,0,1),(29,18,'BK-10000029',18,'2022-10-26',1,0,1),(30,8,'BK-10000030',8,'2022-10-19',1.5,0,1),(31,17,'BK-10000031',17,'2022-10-02',0,0,0),(32,5,'BK-10000032',5,'2022-10-18',2.5,0,1),(33,52,'BK-10000033',12,'2022-10-04',1.2,0,1),(34,57,'BK-10000034',17,'2022-10-02',2,0,1),(35,54,'BK-10000035',14,'2022-10-03',1.5,0,1),(36,78,'BK-10000036',18,'2022-10-05',1,0,1),(37,42,'BK-10000037',2,'2022-11-18',1.75,0,1),(38,36,'BK-10000038',16,'2022-10-04',2.5,0,1),(39,47,'BK-10000039',7,'2022-10-12',2,0,1),(40,66,'BK-10000040',6,'2022-10-04',3.2,0,1),(41,33,'BK-10000041',13,'2022-10-06',0,0,1),(42,31,'BK-10000042',11,'2022-10-10',1.7,0,1),(43,28,'BK-10000043',8,'2022-10-12',0,0,0),(44,30,'BK-10000044',10,'2022-10-05',1.65,0,1),(45,1,'BK-10000045',1,'2022-10-05',2,0,1),(46,3,'BK-10000046',3,'2022-10-03',1,0,1),(47,60,'BK-10000047',20,'2022-10-08',3.5,0,1),(48,53,'BK-10000048',13,'2022-10-07',0,0,1),(49,44,'BK-10000049',4,'2022-10-13',4,0,1),(50,58,'BK-10000050',18,'2022-10-19',1,0,1),(51,79,'BK-10000051',19,'2022-10-25',0,0,0),(52,29,'BK-10000052',9,'2022-10-10',1.99,0,1),(53,51,'BK-10000053',11,'2022-10-10',1.7,0,1),(54,40,'BK-10000054',20,'2022-10-14',3.5,0,1),(55,61,'BK-10000055',1,'2022-10-12',2,0,1),(56,72,'BK-10000056',12,'2022-10-18',1.2,0,1),(57,38,'BK-10000057',18,'2022-10-05',1,0,1),(58,26,'BK-10000058',6,'2022-10-05',3.2,0,1),(59,73,'BK-10000059',13,'2022-10-08',0,0,1),(60,20,'BK-10000060',20,'2022-10-21',3.5,0,1),(61,14,'BK-10000061',14,'2022-10-24',1.5,0,1),(62,39,'BK-10000062',19,'2022-10-04',2,0,1),(63,37,'BK-10000063',17,'2022-10-09',2,0,1),(64,21,'BK-10000064',1,'2022-10-19',2,0,1),(65,64,'BK-10000065',4,'2022-10-20',4,0,1),(66,49,'BK-10000066',9,'2022-10-03',1.99,0,1),(67,41,'BK-10000067',1,'2022-10-20',2,0,1),(68,4,'BK-10000068',4,'2022-10-27',4,0,1),(69,65,'BK-10000069',5,'2022-10-25',2.5,0,1),(70,43,'BK-10000070',3,'2022-10-10',1,0,1),(71,23,'BK-10000071',3,'2022-10-17',1,0,1),(72,63,'BK-10000072',3,'2022-10-24',1,0,1),(73,67,'BK-10000073',7,'2022-10-12',2,0,1),(74,62,'BK-10000074',2,'2022-11-25',1.75,0,1),(75,32,'BK-10000075',12,'2022-10-04',1.2,0,1),(76,55,'BK-10000076',15,'2022-10-02',2,0,1),(77,71,'BK-10000077',11,'2022-10-05',1.7,0,1),(78,68,'BK-10000078',8,'2022-10-19',1.5,0,1),(79,70,'BK-10000079',10,'2022-10-09',1.65,0,1),(80,10,'BK-10000080',10,'2022-10-09',1.65,0,1),(81,85,'BK-10000081',11,'2022-10-26',1.7,0,1),(82,87,'BK-10000082',2,'2022-10-04',1.75,0,1),(83,83,'BK-10000083',12,'2022-10-11',1.2,0,1),(84,93,'BK-10000084',15,'2022-10-08',2,0,1),(85,94,'BK-10000085',4,'2022-10-06',4,0,1),(86,95,'BK-10000086',14,'2022-10-17',1.5,0,1),(87,96,'BK-10000087',6,'2022-10-06',3.2,0,1),(88,92,'BK-10000088',7,'2022-10-19',2,0,1),(89,97,'BK-10000089',5,'2022-10-04',2.5,0,1),(90,84,'BK-10000090',17,'2022-10-23',2,0,1),(91,86,'BK-10000091',10,'2022-10-19',0,0,0),(92,82,'BK-10000092',7,'2022-10-19',2,0,1),(93,91,'BK-10000093',19,'2022-10-18',2,0,1),(94,90,'BK-10000094',5,'2022-10-11',2.5,0,1),(95,89,'BK-10000095',16,'2022-10-18',2.5,0,1),(96,88,'BK-10000096',9,'2022-10-17',1.99,0,1),(97,100,'BK-10000097',16,'2022-10-11',0,0,0),(98,99,'BK-10000098',13,'2022-10-09',0,0,1),(99,98,'BK-10000099',9,'2022-10-24',1.99,0,1),(100,81,'BK-10000100',16,'2022-10-27',2.5,0,1),(101,70,'BK-10000101',9,'2022-10-10',1.99,0,1),(102,10,'BK-10000102',10,'2022-10-12',1.65,0,1),(103,85,'BK-10000103',7,'2022-10-20',2,0,1),(104,87,'BK-10000104',2,'2022-10-25',0,0,0),(105,83,'BK-10000105',10,'2022-10-23',1.65,0,1),(106,93,'BK-10000106',5,'2022-10-25',2.5,0,1),(107,94,'BK-10000107',1,'2022-10-05',2,0,1),(108,95,'BK-10000108',4,'2022-10-13',4,0,1),(109,96,'BK-10000109',9,'2022-10-31',1.99,0,1),(110,92,'BK-10000110',1,'2022-10-12',2,0,1),(111,97,'BK-10000111',16,'2022-10-27',2.5,0,1);
/*!40000 ALTER TABLE `tbl_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_days`
--

DROP TABLE IF EXISTS `tbl_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_days` (
  `dayid` int NOT NULL AUTO_INCREMENT,
  `weekday` varchar(45) NOT NULL,
  PRIMARY KEY (`dayid`),
  UNIQUE KEY `dayid_UNIQUE` (`dayid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_days`
--

LOCK TABLES `tbl_days` WRITE;
/*!40000 ALTER TABLE `tbl_days` DISABLE KEYS */;
INSERT INTO `tbl_days` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `tbl_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_membership_details`
--

DROP TABLE IF EXISTS `tbl_membership_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_membership_details` (
  `membershipid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `forename` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `postcode` varchar(45) NOT NULL,
  `dateofbirth` date DEFAULT NULL,
  `telephone` double NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`membershipid`),
  UNIQUE KEY `membershipid_UNIQUE` (`membershipid`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_membership_details`
--

LOCK TABLES `tbl_membership_details` WRITE;
/*!40000 ALTER TABLE `tbl_membership_details` DISABLE KEYS */;
INSERT INTO `tbl_membership_details` VALUES (1,'Mrs','Adison','Hall','AB3 2RY','1982-07-20',1761584612,'a.hall@randatmail.com','33 Corn Street, Bath'),(2,'Miss','Adrianna','Myers','AB1 3BE','1979-10-20',1225360634,'a.myers@randatmail.com','1 Franks Ground, Stourton'),(3,'Ms','Aida','Lloyd','AB3 3RD','2004-01-19',1761573136,'a.lloyd@randatmail.com','60 Jocelyn Drive, Wells'),(4,'Mr','Alan','Phillips','AB5 2HA','1988-04-19',1458478276,'a.phillips@randatmail.com','4 New Friary Cottages, Witham Friary'),(5,'Mr','Brad','Ross','AB22 7HG','1976-02-19',1963334701,'b.ross@randatmail.com','10 Stoke Road, Street'),(6,'Mrs','Brooke','Perry','AB11 1HB','1970-10-20',1373667757,'b.perry@randatmail.com','Stable Cottage, Home Farm Lane, Rimpton'),(7,'Mrs','Daisy','Carroll','AB11 5HW','1972-07-19',1373344365,'d.carroll@randatmail.com','Unit C, Lewin House, The Street, Radstock'),(8,'Mrs','Edith','Ferguson','AB2 2QT','1986-10-20',1225417262,'e.ferguson@randatmail.com','10 Weirside Court, Edington'),(9,'Ms','Florrie','Morris','AB14 7PS','1974-06-20',1225282606,'f.morris@randatmail.com','Holt Cottage, Witham Friary'),(10,'Mr','Garry','Owens','AB6 8TX','1999-02-20',1458215627,'g.owens@randatmail.com','91 High Meadows, Midsomer Norton'),(11,'Miss','Honey','Richards','AB1 1UF','1983-10-20',1225837055,'h.richards@randatmail.com','65 St Marys Crescent, Yeovil'),(12,'Ms','Lana','Dixon','AB1 3RN','1994-07-20',1225630463,'l.dixon@randatmail.com','17 Coniston Road, Trowbridge'),(13,'Mr','Martin','Russell','AB14 0NJ','1965-10-19',1373560402,'m.russell@randatmail.com','9 The Yews, Mere'),(14,'Dr','Natalie ','Adams','AB4 5PD','1998-11-20',1749807323,'n.adams@randatmail.com','74 Haydon Industrial Estate, Radstock'),(15,'Miss','Nicholas','Russell','AB14 8TD','1991-10-20',1225157257,'n.russell@randatmail.com','2 Marsh Road, Trowbridge'),(16,'Mr','Rafael','Thompson','AB13 4PP','1980-08-19',1985216353,'r.thompson@randatmail.com','1 The Council Houses, Hill Deverill'),(17,'Miss','Sydney','Crawford','AB2 5EX','1972-10-19',1225243020,'s.crawford@randatmail.com','17 Welton Road, Radstock'),(18,'Mr','Tyler','Johnston','AB2 2EH','1966-05-20',1225255716,'t.johnston@randatmail.com','11 Plantagenet Chase, Yeovil'),(19,'Mrs','Vanessa','Barnes','AB2 0JF','1971-10-20',1761066801,'v.barnes@randatmail.com','10 Were Close, Warminster'),(20,'Mr','Walter','Richardson','AB4 4QX','1996-03-19',1749283340,'w.richardson@randatmail.com','135 Rush Hill, Bath'),(21,'Mr','Robert','Richards','AB43 6JD','1987-10-20',1214509176,'r.richards@randatmail.com','55 B9031, Fraserburgh'),(22,'Mrs','Alexia','Murphy','AB15 6YL','1982-06-20',1185511853,'a.murphy@randatmail.com','39 Provost Graham Avenue, Aberdeen'),(23,'Mrs','Julian','Stewart','AB51 5NZ','1966-12-20',1796282165,'j.stewart@randatmail.com','89 Alexander Crescent, Inverurie'),(24,'Ms','Alisa','Jolie','AB10 6BR','1985-10-19',1576628369,'a.Jolie@randatmail.com','3 Moran Close, Bricket Wood'),(25,'Mr','Albert','Ferguson','AB11 6JN','1993-11-19',1352502553,'a.ferguson@randatmail.com','37 Lime Tree Court, London Colney'),(26,'Mrs','Adrianna','Mitchell','AB39 2PS','1973-10-19',1520559891,'a.mitchell@randatmail.com','86 Penn Way, Welwyn Garden City'),(27,'Mr','Alan','Nelson','AB11 9LX','1967-10-20',1341036476,'a.nelson@randatmail.com','Luton Road, Harpenden'),(28,'Mr','Mike','Anderson','AB25 2XP','1995-02-20',1214956515,'m.anderson@randatmail.com','Redhall Close, Hatfield'),(29,'Ms','Edith','Howard','AB31 5QJ','1990-10-20',1947401791,'e.howard@randatmail.com','21 Damson Way, St. Albans'),(30,'Mr','Derek','Parker','AB25 7LX','1962-08-20',1134857490,'d.parker@randatmail.com','40 Dixons Hill Close, Welham'),(31,'Mr','Luke','Owens','AB25 1ED','1969-04-19',1765112460,'l.owens@randatmail.com','Chestnut Drive, St Albans'),(32,'Mrs','Mary','Ryan','AB51 7HJ','1984-01-19',1580965816,'m.ryan@randatmail.com','8 Glenlyn Avenue, St Albans'),(33,'Mrs','Tara','Perry','AB24 4SU','1981-10-19',1355046102,'t.perry@randatmail.com','5 Marlborough Gate, St. Albans'),(34,'Miss','Belinda','Douglas','AB10 6BR','2000-10-19',1496866930,'b.douglas@randatmail.com','1 Furse Avenue, St Albans'),(35,'Mr','Alen','Barrett','AB10 1AU','1989-10-19',1691847132,'a.barrett@randatmail.com','96 Watford Road'),(36,'Miss','Miranda','Mitchell','AB24 3HX','1996-10-19',1786178820,'m.mitchell@randatmail.com','72 Hazel Grove, Hatfield'),(37,'Miss','Cadie','Owens','AB43 6JB','1998-10-20',1946084701,'c.owens@randatmail.com','29 Digswell Road, Welwyn Garden City,'),(38,'Mrs','Kristian','Hunt','AB39 2DA','1975-10-20',1267333396,'k.hunt@randatmail.com','The Kestrels, Bricket Wood,'),(39,'Mr','Alan','Morrison','AB42 5EH','1991-10-20',1708154010,'a.morrison@randatmail.com','6 Carnegie Road, St. Albyns'),(40,'Mrs','Kimberly','Holmes','AB34 5HX','1983-01-20',6621055812,'k.holmes@randatmail.com','2 Leith Hill Court, Guild Road'),(41,'Miss','Michelle','Armstrong','AB44 1RL','2000-05-19',9496926309,'m.armstrong@randatmail.com','91 Crook O\'Ness Street, MacDuff'),(42,'Mrs','Rubie','Grant','AB24 2YS','2022-10-20',1889742410,'r.grant@randatmail.com','84 Gordon\'s Mills Place, Aberdeen'),(43,'Mrs','Alissa','Perry','AB51 0XF','1995-12-20',7123812429,'a.perry@randatmail.com','2 Provost Lawrence Court, Inverurie'),(44,'Mr','Tyler','Harrison','AB31 4BY','2022-02-20',1353958463,'t.harrison@randatmail.com','39 Brathens, Banchory'),(45,'Mr','Henry','Hall','AB12 3LD','2022-10-20',1344174347,'h.hall@randatmail.com','59 Abbotswell Crescent, Aberdeen'),(46,'Mr','Vincent','Tucker','AB15 8NU','2001-10-19',1391649069,'v.tucker@randatmail.com','35 Countesswells Park Avenue, Aberdeen'),(47,'Mr','Albert','Leo','AB24 3NT','2022-11-20',1773148338,'a.leo@randatmail.com','40 Kittybrewster Retail Park, Aberdeen'),(48,'Mrs','Sarah','Mitchell','AB15 5PT','1997-12-19',1174265938,'s.mitchell@randatmail.com','53 Beechgrove Gardens, Aberdeen'),(49,'Mrs','Sofia','Richardson','AB43 7EU','2022-09-20',1142946911,'s.richardson@randatmail.com','83 Pittendrum Gardens, Fraserburgh'),(50,'Mrs','Victoria','Cunningham','AB11 8TY','1999-09-20',1460365473,'v.cunningham@randatmail.com','35 North Balnagask Road, Aberdeen'),(51,'Mr','William','Andrews','AB34 5DY','2004-12-19',1179743641,'w.andrews@randatmail.com','Aboyne, AB34 5, United Kingdom'),(52,'Mr','Henry','Cameron','AB23 8RP','2022-10-20',1559308265,'h.cameron@randatmail.com','26 Provost Mitchell Circle, Aberdeen'),(53,'Mr','Frederick','Morrison','AB30 1FH','2004-08-19',1492918414,'f.morrison@randatmail.com','46 Grassic Gibbon Gardens, Laurencekirk'),(54,'Mr','Marcus','Owens','AB23 9BL','2022-01-20',1414769947,'m.owens@randatmail.com','95 Silverburn Crescent, Aberdeen'),(55,'Miss','Kelsey','Martin','AB51 7JE','2000-10-19',1773833962,'k.martin@randatmail.com','35 Donview, Inverurie'),(56,'Miss','Lily','Crawford','AB12 4TW','2022-10-20',1152661286,'l.crawford@randatmail.com','60 Cairngrassie Circle, Aberdeen'),(57,'Miss','Audrey','Payne','AB23 8XD','2002-12-20',1827380635,'a.payne@randatmail.com','11 Drovers Place, Aberdeen'),(58,'Miss','Amy','Hawkins','AB31 4FF','2000-10-19',1821705813,'a.hawkins@randatmail.com','8 Village Farm Court, Banchory'),(59,'Mrs','Natalie','Owens','AB12 3JZ','2022-10-20',1106706184,'n.owens@randatmail.com','47 Peterseat Drive, Aberdeen'),(60,'Mrs','Vivian','Hall','AB30 1EF','1992-05-19',1535329122,'v.hall@randatmail.com','54 Grassic Gibbon Gardens, Laurencekirk'),(61,'Mr','Jack','Jones','AB35 5SF','1976-01-19',1314960537,'b.jones@mac.com','19 St. John?s Road'),(62,'Mrs','Kamila','Harris','AB51 7HF','1990-10-20',2079460415,'k.lharris@aol.com','76 Main Road'),(63,'Mr','James','Cook','AB51 5PL','1983-10-20',1174960643,'cjames02@live.com','47 Grange Road'),(64,'Miss','Cynthia','Nebella','AB43 7BZ','1993-06-19',1144960631,'c.nebella@outlook.com','23 St. John?s Road '),(65,'Mr','Logan ','Curry','AB51 0UU','1972-10-19',1134960807,'l.curry@randatmail.com','79 Chester Road'),(66,'Mr','Zachary','Phillips','AB24 3QB','1970-10-20',1214960453,'z.phillips@ggg.ac.uk','9 Kings Road'),(67,'Mrs','Aileen ','Adkins','AB51 5TF','1975-07-20',1614960841,'a.adkind@outlook.com','63 Highfield Road'),(68,'Mrs','Amy ','Aitchison','AB54 8PF','1986-10-20',1154960548,'aattchison@yahoo.com','32 Park Road'),(69,'Miss','Catherine ','Austin','AB12 9EZ','1991-12-20',1314960629,'c.chappell@live.com','6 Main Street'),(70,'Mrs','Cherida ','Ayrton','AB55 4ET','1969-10-19',1314960322,'cjayrton@gmail.com','55 High Street'),(71,'Miss','Faye ','Bence','AB51 8XQ','1995-08-20',1214960750,'f.bence@mac.om','24 The Avenue'),(72,'Mrs','Gail','Best','AB39 2BS','1988-10-19',1214960510,'ghbest03@outlook.com','58 Kings Road'),(73,'Miss','Jackie ','Bow','AB39 3SX','1974-07-20',2079460697,'j.bow@live.com','29 Main Road '),(74,'Mr','Teddy ','Gold','AB15 7XW','1964-10-19',1214960774,'t.gold@live.com','5 Church Road'),(75,'Mr','Gerald ','Brooks','AB16 7YD','1962-10-20',1314960330,'gbrooks@outlook.com','16 Manor Road '),(76,'Mr','Alec ','Adley','AB16 6YF','1968-11-19',1414960992,'a.adley@randatmail.com','76 School Lane '),(77,'Mr','Floyd ','Brackman','AB11 6SL','1996-10-19',1154960871,'f.larry@randatmail.com','21 Station Road'),(78,'Mr','Clifton ','Baxendale','AB24 2UY','1973-10-19',1144960284,'c.vincent@randatmail.com','8 Mill Lane'),(79,'Mr','Mason ','Debney','AB31 4FX','1960-09-19',1614960398,'m.debney@randatmail.com','15 North Road'),(80,'Mr','Egbert','Bomer','AB16 7ER','1997-10-19',1414960675,'e.corrie@randatmail.com','16 Victoria Street'),(81,'Mr','Joel','Cunningham','AB15 5HL','1997-10-20',1224645451,'joehall@live.com','73 Cairnaquheen Gardens, Aberdeen'),(82,'Mr','Musa','Carter','DA2 7QH','1997-10-21',1322631750,'improv@gmail.com','61 Top Dartford Road, Dartford'),(83,'Mr','Ebony','Graves','BB18 5NF','1997-10-22',1756606175,'tezbo@yahoo.com','2 Foresters Buildings, Barnoldswick'),(84,'Mr','Ivan','Tate','CO3 3SE','1997-10-23',1206111678,'pappp@verizon.net','14 Sanders Drive, Colchester'),(85,'Mr','Kira','Campbell','AL3 4RY','1997-10-24',1727461217,'dimensio@live.com','145 Fishpool Street, St Albans'),(86,'Mr','Mitchel','Marsh','CR2 6DN','1997-10-25',1883625601,'yruan@gmail.com','15 St Anns Way, South Croydon'),(87,'Mr','Eugene','Carroll','B15 3PE','1997-10-26',1211136541,'gboss@aol.com','7 Rodman Close, Birmingham'),(88,'Mr','Jim','Perkins','HX6 4NJ','1997-10-27',1422360557,'mkearl@aol.com','31 Causeway Head, Ripponden'),(89,'Mr','Frederick','Donnelly','GL3 1ER','1997-10-28',1452372228,'oevans@gmail.com','35 Mottershead Drive, Gloucester'),(90,'Mr','Niall','Vaughn','EN1 3HJ','1997-10-29',1992406281,'jfinke@live.com','89 Churchbury Lane, Enfield'),(91,'Mrs','Fannie','Perry','DG1 4NF','1997-10-30',1387552520,'attwood@yahoo.ca','25 Woodside Avenue, Dumfries'),(92,'Miss','Rebecca','Figueroa','CA14 4QG','1997-10-31',1900285604,'ninenine@msn.com','Fellview Cottage, Pica'),(93,'Mrs','Khadija','Russell','BH9 3QF','1997-11-01',1202216750,'yenya@outlook.com','93 West Howe Industrial Estate, Bournemouth'),(94,'Miss','Ffion','Santos','BL8 1LJ','1997-11-02',1204747214,'andrei@optonline.net','55 Tottington Road, Bury'),(95,'Miss','Chantelle','Stevens','BR8 7LJ','1997-11-03',1322663243,'grady@att.net','10 Woodgers Grove, Swanley'),(96,'Miss','Kane','Richards','BS49 4QN','1997-11-04',1275641001,'pedwards@live.com','26 Horsecastle Farm Road, Bristol'),(97,'Mrs','Laura','Foster','CF48 1RH','1997-11-05',1685482711,'muadip@yahoo.ca','146 Corner Houses, Heolgerrig'),(98,'Mrs','Milly','Mcgee','RG14 6EF','1997-11-06',1635017672,'cosimo@gmail.com','Flat 1, Wormestall Grange, Enborne Road, Newbury'),(99,'Mrs','Michelle','Houghton','PL1 4RB','1997-11-07',1752007306,'leakin@gmail.com','8 South Yard Way, Plymouth'),(100,'Mrs','Caitlyn','Ross','NW1 3QB','1997-11-08',2067710750,'wildfire@msn.com','Flat 9, Scafell, Stanhope Street, London');
/*!40000 ALTER TABLE `tbl_membership_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_10_members`
--

DROP TABLE IF EXISTS `top_10_members`;
/*!50001 DROP VIEW IF EXISTS `top_10_members`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_10_members` AS SELECT 
 1 AS `membershipid`,
 1 AS `title`,
 1 AS `forename`,
 1 AS `lastname`,
 1 AS `postcode`,
 1 AS `dateofbirth`,
 1 AS `telephone`,
 1 AS `email`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `totalsalesbyactivity`
--

DROP TABLE IF EXISTS `totalsalesbyactivity`;
/*!50001 DROP VIEW IF EXISTS `totalsalesbyactivity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `totalsalesbyactivity` AS SELECT 
 1 AS `totalsalesamount`,
 1 AS `activityid`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `activebooking`
--

/*!50001 DROP VIEW IF EXISTS `activebooking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`2203891`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activebooking` AS select `a`.`forename` AS `forename`,`a`.`lastname` AS `lastname`,`a`.`telephone` AS `telephone`,`b`.`bookingreference` AS `bookingreference`,`c`.`activityname` AS `activityname` from ((`tbl_membership_details` `a` join `tbl_booking` `b` on((`a`.`membershipid` = `b`.`membershipid`))) join `tbl_activity` `c` on((`b`.`activityid` = `c`.`activityid`))) where (`b`.`bookingstatus` = 1) order by `c`.`activityname` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `member_attendance`
--

/*!50001 DROP VIEW IF EXISTS `member_attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`2211879`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `member_attendance` AS select `a`.`forename` AS `forename`,`a`.`lastname` AS `lastname`,`a`.`telephone` AS `telephone`,`b`.`bookingreference` AS `bookingreference`,`c`.`attendanceid` AS `attendanceid`,`d`.`activityname` AS `activityname`,`f`.`weekday` AS `weekday` from (((((`tbl_membership_details` `a` join `tbl_booking` `b` on((`a`.`membershipid` = `b`.`membershipid`))) left join `tbl_attendance` `c` on((`b`.`bookingid` = `c`.`bookingid`))) left join `tbl_activity` `d` on((`b`.`activityid` = `d`.`activityid`))) left join `tbl_activity_day` `e` on((`d`.`activityid` = `e`.`activityid`))) left join `tbl_days` `f` on((`e`.`dayid` = `f`.`dayid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10_members`
--

/*!50001 DROP VIEW IF EXISTS `top_10_members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`2211879`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10_members` AS select `tbl_membership_details`.`membershipid` AS `membershipid`,`tbl_membership_details`.`title` AS `title`,`tbl_membership_details`.`forename` AS `forename`,`tbl_membership_details`.`lastname` AS `lastname`,`tbl_membership_details`.`postcode` AS `postcode`,`tbl_membership_details`.`dateofbirth` AS `dateofbirth`,`tbl_membership_details`.`telephone` AS `telephone`,`tbl_membership_details`.`email` AS `email`,`tbl_membership_details`.`address` AS `address` from `tbl_membership_details` limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `totalsalesbyactivity`
--

/*!50001 DROP VIEW IF EXISTS `totalsalesbyactivity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`2211879`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `totalsalesbyactivity` AS select sum(`tbl_booking`.`amountpaid`) AS `totalsalesamount`,`tbl_booking`.`activityid` AS `activityid` from `tbl_booking` group by `tbl_booking`.`activityid` order by `totalsalesamount` desc */;
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

-- Dump completed on 2022-11-25 10:27:45
