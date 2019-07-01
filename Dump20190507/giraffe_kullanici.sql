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
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kullanici` (
  `kullanici_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) DEFAULT NULL,
  `sifre` varchar(16) DEFAULT NULL,
  `isim` varchar(15) DEFAULT NULL,
  `soyisim` varchar(15) DEFAULT NULL,
  `uyruk` varchar(3) DEFAULT NULL,
  `cinsiyet` varchar(1) DEFAULT NULL,
  `tc` varchar(11) DEFAULT NULL,
  `dogum_tarihi` varchar(30) DEFAULT NULL,
  `telefon` varchar(11) DEFAULT NULL,
  `kullanici_tipi` int(11) DEFAULT NULL,
  PRIMARY KEY (`kullanici_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `tc` (`tc`),
  UNIQUE KEY `telefon` (`telefon`),
  KEY `kullanici_tipi` (`kullanici_tipi`),
  CONSTRAINT `kullanici_ibfk_1` FOREIGN KEY (`kullanici_tipi`) REFERENCES `yolcu_tipi` (`tip_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanici`
--

LOCK TABLES `kullanici` WRITE;
/*!40000 ALTER TABLE `kullanici` DISABLE KEYS */;
INSERT INTO `kullanici` VALUES (2,'fzehracetin@gmail.com','123456','FATMA ZEHRA','CETIN','TC','K','28936340588','1999-12-11','05079391143',3),(3,'nmeryem@gmail.com','123456','NESIBE MERYEM','CETIN','TC','K','28945340296','1998-01-05','05079391142',3),(4,'death1881@gmail.com','123456','MUHAMMED TALHA','CETIN','TC','E','11006535168','2004-11-18','0541812987',3),(5,'szeynepc@gmail.com','9876','SUMEYYE ZEYNEP','CETIN','TC','K','28948340132','1995-06-21','05538802473',4),(6,'dilara.suveren@gmail.com','1234','DILARA','SUVEREN','TC','K','45049502054','1997-06-12','05444361367',3),(7,'11','111','1111','11111','11','1','1111','1111-11-11','111',3);
/*!40000 ALTER TABLE `kullanici` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-07 12:23:34
