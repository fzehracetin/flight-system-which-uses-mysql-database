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
-- Table structure for table `binis_karti`
--

DROP TABLE IF EXISTS `binis_karti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `binis_karti` (
  `binis_id` varchar(15) NOT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `ucus_id` int(11) DEFAULT NULL,
  `koltuk_no` varchar(4) DEFAULT NULL,
  `pnr` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`binis_id`),
  KEY `ucus_id` (`ucus_id`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `pnr` (`pnr`),
  CONSTRAINT `binis_karti_ibfk_1` FOREIGN KEY (`ucus_id`) REFERENCES `ucus` (`ucus_id`) ON DELETE SET NULL,
  CONSTRAINT `binis_karti_ibfk_2` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`kullanici_id`) ON DELETE SET NULL,
  CONSTRAINT `binis_karti_ibfk_3` FOREIGN KEY (`pnr`) REFERENCES `bilet` (`pnr`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binis_karti`
--

LOCK TABLES `binis_karti` WRITE;
/*!40000 ALTER TABLE `binis_karti` DISABLE KEYS */;
INSERT INTO `binis_karti` VALUES ('JF3QHUTOU0BF',7,33,'29F','BE1VVJ'),('NO0F50RJRRW5',7,33,'10D','BE1VVJ');
/*!40000 ALTER TABLE `binis_karti` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-07 12:23:35
