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
-- Table structure for table `yolcu`
--

DROP TABLE IF EXISTS `yolcu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `yolcu` (
  `yolcu_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc` varchar(11) DEFAULT NULL,
  `dogum_tarihi` varchar(30) DEFAULT NULL,
  `isim` varchar(15) DEFAULT NULL,
  `soyisim` varchar(15) DEFAULT NULL,
  `uyruk` varchar(3) DEFAULT NULL,
  `cinsiyet` varchar(1) DEFAULT NULL,
  `telefon` varchar(11) DEFAULT NULL,
  `yolcu_tipi` int(11) DEFAULT NULL,
  PRIMARY KEY (`yolcu_id`),
  UNIQUE KEY `tc` (`tc`),
  UNIQUE KEY `telefon` (`telefon`),
  KEY `yolcu_tipi` (`yolcu_tipi`),
  CONSTRAINT `yolcu_ibfk_1` FOREIGN KEY (`yolcu_tipi`) REFERENCES `yolcu_tipi` (`tip_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yolcu`
--

LOCK TABLES `yolcu` WRITE;
/*!40000 ALTER TABLE `yolcu` DISABLE KEYS */;
INSERT INTO `yolcu` VALUES (24,'11','1111-11-11','11','11','11','1','11',1),(25,'22','2222-22-22','22','22','22','2','22',1),(26,'333','3333-33-33','33','333','33','3','33',2),(27,'444','4444-44-44','144','4444','44','4','44',4),(28,'55','5555-55-55','55','55','55','5','55',5);
/*!40000 ALTER TABLE `yolcu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-07 12:23:37
