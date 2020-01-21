CREATE DATABASE  IF NOT EXISTS `inbidwin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `inbidwin`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: inbidwin
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction` (
  `auctionid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aincrement` int(10) unsigned DEFAULT '0',
  `areserve` int(10) unsigned DEFAULT NULL,
  `stime` datetime DEFAULT NULL,
  `etime` datetime DEFAULT NULL,
  `item` int(10) unsigned NOT NULL,
  PRIMARY KEY (`auctionid`),
  KEY `fk_item2` (`item`),
  CONSTRAINT `fk_item2` FOREIGN KEY (`item`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction`
--

LOCK TABLES `auction` WRITE;
/*!40000 ALTER TABLE `auction` DISABLE KEYS */;
INSERT INTO `auction` VALUES (2,NULL,200,'2020-01-21 21:03:12','2020-01-28 21:03:12',9),(3,NULL,100,'2020-01-21 21:03:24','2020-01-28 21:03:24',8),(4,NULL,100,'2020-01-21 21:04:04','2020-01-28 21:04:04',5),(6,NULL,300,'2020-01-21 21:08:13','2020-01-28 21:08:13',6),(7,NULL,120,'2020-01-21 21:15:40','2020-01-28 21:15:40',4);
/*!40000 ALTER TABLE `auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `bidid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bprice` decimal(14,3) unsigned DEFAULT '0.000',
  `btime` datetime DEFAULT NULL,
  `auction` int(10) unsigned NOT NULL,
  `user` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bidid`),
  KEY `fk_auction` (`auction`),
  KEY `fk_user2` (`user`),
  CONSTRAINT `fk_auction` FOREIGN KEY (`auction`) REFERENCES `auction` (`auctionid`),
  CONSTRAINT `fk_user2` FOREIGN KEY (`user`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
  `hid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hlocation` varchar(100) NOT NULL,
  `hfloor` int(10) unsigned DEFAULT '0',
  `hsize` int(10) unsigned DEFAULT '0',
  `hroom` int(10) unsigned DEFAULT '0',
  `hbathroom` int(10) unsigned DEFAULT '0',
  `hheating` varchar(100) DEFAULT NULL,
  `hfurnished` varchar(3) DEFAULT NULL,
  `hdescr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (1,'Navarinou 8',1,70,2,1,'fusiko aerio','No','Newly renovated, very cosy'),(2,'Kifisias 65',2,50,1,2,'Central with oil','Yes','Old apartment, very close to transportation'),(3,'sadassa 1232',1,50,1,1,'dafaf','yes','sdfsfsf'),(4,'Tropical beach Caribbean',0,50,1,1,'no','yes','Perfect for vacation'),(5,'vuronos 11 Neo Irakleio',2,60,1,1,'no','yes','Old apartment '),(6,'doukisis plakentias 30 Athens',4,90,2,1,'fusiko aerio','no','new apartment'),(7,'kolonou 35 Keramikos',0,70,2,1,'petreleo','no',''),(8,'konstantinoupoleos 50 Egaleo',3,50,1,1,'Air condition','no',''),(9,'ksenofontos 57 Kalithea ',3,48,1,1,'no','yes','');
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iphoto` varchar(100) DEFAULT NULL,
  `house` int(10) unsigned NOT NULL,
  PRIMARY KEY (`iid`),
  KEY `fk_house2` (`house`),
  CONSTRAINT `fk_house2` FOREIGN KEY (`house`) REFERENCES `house` (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'https://i.postimg.cc/RV82vCKw/cgji0ufwnk941.jpg',1),(2,'https://i.postimg.cc/RV82vCKw/cgji0ufwnk941.jpg',2),(3,NULL,3),(4,'https://i.postimg.cc/RZdJDrcg/1546597849-1525116255-retro-palm2-min.gif',4),(5,'https://i.postimg.cc/q7Bscztk/ea-2-lightroom-609796820.jpg',5),(6,'https://i.postimg.cc/6qxgpr3W/vinhomes-bason-nonlahousing-1517969439.jpg',6),(7,'https://i.postimg.cc/Hxv0SHqf/img-2.jpg',7),(8,'https://i.postimg.cc/hGBfqw8h/5inathens-apartment-02-009.jpg',8),(9,'https://i.postimg.cc/cC4FkXkb/20171215121531.jpg',9),(10,'https://i.postimg.cc/kMvZNhg9/1546597849-1525116255-retro-palm2-min.gif',4);
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ititle` varchar(100) NOT NULL,
  `iprice` decimal(14,3) unsigned DEFAULT '0.000',
  `istatus` varchar(10) NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `house` int(10) unsigned NOT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_house` (`house`),
  KEY `fk_user` (`user`),
  CONSTRAINT `fk_house` FOREIGN KEY (`house`) REFERENCES `house` (`hid`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Renovated home',500.000,'DISABLED',2,1),(2,'Central Athens',300.000,'DISABLED',1,2),(3,'sdsafas',120.000,'DISABLED',3,3),(4,'bungalow',120.000,'ENABLED',4,4),(5,'Apartment',100.000,'ENABLED',3,5),(6,'Apartment',300.000,'ENABLED',4,6),(7,'Monokatoikia',300.000,'DISABLED',9,7),(8,'Apartment',100.000,'ENABLED',8,8),(9,'Apartment',200.000,'ENABLED',8,9);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `roleid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`roleid`),
  UNIQUE KEY `rolename` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(3,'ROLE_GUEST'),(2,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tprice` decimal(14,3) unsigned DEFAULT '0.000',
  `item` int(10) unsigned NOT NULL,
  `owner` int(10) unsigned NOT NULL,
  `winner` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`),
  KEY `fk_owner` (`owner`),
  KEY `fk_winner` (`winner`),
  KEY `fk_item3` (`item`),
  CONSTRAINT `fk_item3` FOREIGN KEY (`item`) REFERENCES `item` (`itemid`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`owner`) REFERENCES `user` (`userid`),
  CONSTRAINT `fk_winner` FOREIGN KEY (`winner`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `credit` decimal(14,3) unsigned DEFAULT '0.000',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','Admin','Istrator','$2y$10$VtHw3JgeDUgWn5eNUzIzLuzGBnkdLsnV9.arx/1xxwlHWFHzRC3KC','admin@gmail.com',NULL),(2,'mamra','Nikos','Nikolopoulos','$2a$10$GXvhLzB2nOVvPk4Cn8UQbeucESJm8ChJ.qvV5pID3jouJ.gEYEQyy','nick.nikolopouos@gmail.com',NULL),(3,'zerokatana','Christopher','Kampourelis','$2a$10$P.Am6Np6wPDcACuvxFZAQeT2qydKF49Znaa4XU5RlXTiYaUebr8x2','zerokatana@gmail.com',NULL),(4,'hardvee','George','Lardas','$2a$10$Z3./g8kUWb4J/U3kNVZtB.f.3ugf2PYuzfFTLx1SzZfTreKh3y1d6','hardvee@gmail.com',NULL),(5,'cavebird','Kostas','Spiliopoulos','$2a$10$9XbcxRe1VPten3FjA0ulzO3VYtBNFLZxQ2IP1BJy1q/.zrlkgygUq','cavebird@gmail.com',NULL),(8,'giani','Giannis','Giannakopoulos','$2a$10$wGfosITAJugS7uCHv6jbZ.1rSD2igR/ZH84npLxtZzKuhZ3pK/xUe','john@hotmail.com',NULL),(9,'johndoe','John','Doe','$2a$10$yifL7r7553/nhJcWVRBVs.39YfoFHh2Vh6T2riFkoOr6xXSV5pRuy','doejohn@hotmail.com',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `userid` int(10) unsigned NOT NULL,
  `roleid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`roleid`),
  KEY `userrolefk2` (`roleid`),
  CONSTRAINT `userrolefk1` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`),
  CONSTRAINT `userrolefk2` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(8,2),(9,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-21 22:09:34
