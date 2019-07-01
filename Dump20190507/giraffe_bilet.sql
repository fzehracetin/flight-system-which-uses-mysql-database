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
-- Table structure for table `bilet`
--

DROP TABLE IF EXISTS `bilet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bilet` (
  `pnr` varchar(30) NOT NULL,
  `ucus_id` int(11) DEFAULT NULL,
  `kullanici_id` int(11) DEFAULT NULL,
  `yolcu_id` int(11) DEFAULT NULL,
  `fiyat_id` int(11) DEFAULT NULL,
  `sinif_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pnr`),
  KEY `ucus_id` (`ucus_id`),
  KEY `kullanici_id` (`kullanici_id`),
  KEY `yolcu_id` (`yolcu_id`),
  KEY `fiyat_id` (`fiyat_id`),
  KEY `sinif_id` (`sinif_id`),
  CONSTRAINT `bilet_ibfk_1` FOREIGN KEY (`ucus_id`) REFERENCES `ucus` (`ucus_id`) ON DELETE SET NULL,
  CONSTRAINT `bilet_ibfk_2` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`kullanici_id`) ON DELETE SET NULL,
  CONSTRAINT `bilet_ibfk_3` FOREIGN KEY (`yolcu_id`) REFERENCES `yolcu` (`yolcu_id`) ON DELETE SET NULL,
  CONSTRAINT `bilet_ibfk_4` FOREIGN KEY (`fiyat_id`) REFERENCES `fiyat` (`fiyat_id`) ON DELETE SET NULL,
  CONSTRAINT `bilet_ibfk_5` FOREIGN KEY (`sinif_id`) REFERENCES `sinif` (`sinif_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bilet`
--

LOCK TABLES `bilet` WRITE;
/*!40000 ALTER TABLE `bilet` DISABLE KEYS */;
INSERT INTO `bilet` VALUES ('BE1VVJ',33,7,NULL,5,1),('UJ6PRP',33,NULL,28,9,1),('UMQWDT',95,7,NULL,5,1),('UXA4OS',4,NULL,26,3,1),('X75162',4,7,NULL,5,1);
/*!40000 ALTER TABLE `bilet` ENABLE KEYS */;
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
