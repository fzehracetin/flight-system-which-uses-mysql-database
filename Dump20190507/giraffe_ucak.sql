-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: giraffe
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ucak`
--

DROP TABLE IF EXISTS `ucak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ucak` (
  `ucak_tipi` varchar(15) DEFAULT NULL,
  `havayolu_id` int(11) DEFAULT NULL,
  `ucak_id` varchar(6) DEFAULT NULL,
  `koltuk_id` int(11) DEFAULT NULL,
  UNIQUE KEY `ucak_id` (`ucak_id`),
  KEY `havayolu_id` (`havayolu_id`),
  KEY `koltuk_id` (`koltuk_id`),
  CONSTRAINT `ucak_ibfk_1` FOREIGN KEY (`havayolu_id`) REFERENCES `havayolu` (`havayolu_id`) ON DELETE SET NULL,
  CONSTRAINT `ucak_ibfk_2` FOREIGN KEY (`koltuk_id`) REFERENCES `koltuk` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ucak`
--

LOCK TABLES `ucak` WRITE;
/*!40000 ALTER TABLE `ucak` DISABLE KEYS */;
INSERT INTO `ucak` VALUES ('Airbus A320',1,'THY100',1),('Airbus A320',2,'PC100',1),('Boeing 737',2,'PC101',2),('Boeing 737',1,'THY102',2),('Airbus A320',4,'OA100',1),('Boeing 737',3,'AND100',2);
/*!40000 ALTER TABLE `ucak` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-07 12:23:33
