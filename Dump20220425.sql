-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: campeoneslol
-- ------------------------------------------------------
-- Server version	5.6.43-log

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
-- Table structure for table `campeon`
--

DROP TABLE IF EXISTS `campeon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campeon` (
  `campeon_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cham` varchar(45) DEFAULT NULL,
  `roll` varchar(45) DEFAULT NULL,
  `fecha_lanzamiento` datetime(6) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`campeon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campeon`
--

LOCK TABLES `campeon` WRITE;
/*!40000 ALTER TABLE `campeon` DISABLE KEYS */;
INSERT INTO `campeon` VALUES (1,'Draven','Tirador','2012-06-06 00:00:00.000000','Noxus'),(2,'Dr. Mundo','Luchador','2009-09-02 00:00:00.000000','Zaun'),(3,'Ekko','Asesino','2015-05-29 00:00:00.000000','Piltover'),(4,'Elise','Mago','2012-10-26 00:00:00.000000','Noxus'),(5,'Aatrox','Peleador','2013-06-13 00:00:00.000000','Runaterra'),(6,'Ahri','Mago','2014-12-14 00:00:00.000000','Jonia'),(7,'Akali','Asesino','2010-11-05 00:00:00.000000','Jonia'),(8,'Akshan','Tirador','2021-07-22 00:00:00.000000','Shurima'),(9,'Alistar','Tanque','2009-02-21 00:00:00.000000','Runaterra'),(10,'Amumu','Tanque','2009-06-26 00:00:00.000000','Shurima'),(11,'Aphelios','Tirador','2019-12-11 00:00:00.000000','Targon'),(12,'Ashe','Tirador','2009-02-21 00:00:00.000000','El Freljord'),(13,'Cho\'Gath','Tanque','2009-06-26 00:00:00.000000','El Vacio');
/*!40000 ALTER TABLE `campeon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_skin`
--

DROP TABLE IF EXISTS `categoria_skin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_skin` (
  `categoria_skin_id` int(11) NOT NULL AUTO_INCREMENT,
  `skins_id_FK` int(11) NOT NULL,
  `categoria_skin` varchar(45) NOT NULL,
  PRIMARY KEY (`categoria_skin_id`),
  KEY `skins_categoria_skins_idx` (`skins_id_FK`),
  CONSTRAINT `skins_categoria_skins` FOREIGN KEY (`skins_id_FK`) REFERENCES `skins` (`skins_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_skin`
--

LOCK TABLES `categoria_skin` WRITE;
/*!40000 ALTER TABLE `categoria_skin` DISABLE KEYS */;
INSERT INTO `categoria_skin` VALUES (1,1,'Epico'),(2,2,'Legendario'),(3,3,'Legendario'),(4,4,'Legado'),(6,5,'Epico'),(7,6,'Epico'),(8,7,'Legado'),(9,8,'Epico'),(10,9,'Legendaria'),(11,10,'Epico'),(12,11,'Legado'),(13,12,'Legendario'),(14,13,'Legendario');
/*!40000 ALTER TABLE `categoria_skin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadisticas_campeon`
--

DROP TABLE IF EXISTS `estadisticas_campeon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadisticas_campeon` (
  `estadisticas_campeon_id` int(11) NOT NULL AUTO_INCREMENT,
  `campeon_id_FK` int(11) NOT NULL,
  `vida_inicial` int(11) NOT NULL,
  `mana_inicial` int(11) DEFAULT NULL,
  `energia_inicial` int(11) DEFAULT NULL,
  `daño_fisico_base` int(11) DEFAULT NULL,
  `daño_magico_base` int(11) DEFAULT NULL,
  PRIMARY KEY (`estadisticas_campeon_id`),
  KEY `estadisticas_campeon_campeon_idx` (`campeon_id_FK`),
  CONSTRAINT `campeones_estadisticas` FOREIGN KEY (`campeon_id_FK`) REFERENCES `campeon` (`campeon_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadisticas_campeon`
--

LOCK TABLES `estadisticas_campeon` WRITE;
/*!40000 ALTER TABLE `estadisticas_campeon` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadisticas_campeon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skins`
--

DROP TABLE IF EXISTS `skins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skins` (
  `skins_id` int(11) NOT NULL AUTO_INCREMENT,
  `campeon_id_FK` int(11) NOT NULL,
  `nombre_campeon` varchar(45) NOT NULL,
  `fecha_lanzamiento` datetime(6) NOT NULL,
  `costo_rp` int(11) NOT NULL,
  PRIMARY KEY (`skins_id`),
  KEY `campeon_skins_idx` (`campeon_id_FK`),
  CONSTRAINT `campeon_skins` FOREIGN KEY (`campeon_id_FK`) REFERENCES `campeon` (`campeon_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skins`
--

LOCK TABLES `skins` WRITE;
/*!40000 ALTER TABLE `skins` DISABLE KEYS */;
INSERT INTO `skins` VALUES (1,1,'Draven Reinos Mecha','2020-01-15 00:00:00.000000',1070),(2,2,'Mundo Ejecutivo','2010-09-13 00:00:00.000000',1820),(3,3,'Ekko True Damage','2019-11-10 00:00:00.000000',1215),(4,4,'Elise Luna de Sangre','2015-01-08 00:00:00.000000',975),(5,5,'Atrox Odisea','2020-10-15 00:00:00.000000',1350),(6,6,'Ahri K/DA ALL OUT','2020-11-06 00:00:00.000000',1350),(7,7,'Akali Luna de Sangre','2011-06-06 00:00:00.000000',975),(8,8,'Akshan Ciber POP','2021-07-22 00:00:00.000000',1350),(9,9,'Alistar Vaquita Mu','2017-03-29 00:00:00.000000',975),(10,10,'Amumu Caballero Andante','2011-07-17 00:00:00.000000',750),(11,11,'Aphelios Bestia Lunar','2021-02-04 00:00:00.000000',1350),(12,12,'Ashe La Forajida','2019-10-10 00:00:00.000000',975),(13,13,'Cho\'Gath Blindaje Superior','2012-08-02 00:00:00.000000',975);
/*!40000 ALTER TABLE `skins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'campeoneslol'
--

--
-- Dumping routines for database 'campeoneslol'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 10:35:05
