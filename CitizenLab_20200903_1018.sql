CREATE DATABASE  IF NOT EXISTS `CitizenLab` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `CitizenLab`;
-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: CitizenLab
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.16.04.1

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
-- Table structure for table `conf`
--

DROP TABLE IF EXISTS `conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conf` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `API_key_tw` varchar(255) NOT NULL,
  `API_secret_key_tw` varchar(255) NOT NULL,
  `Cantidad_data_tw` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conf`
--

LOCK TABLES `conf` WRITE;
/*!40000 ALTER TABLE `conf` DISABLE KEYS */;
INSERT INTO `conf` VALUES (1,'F70Tuo2dL0e08mgLU7QTSP9R9','I8jKWmBnq2qOlGVnRKintRztIL79q53YDmMUZV5phWpKW9SnBP',10);
/*!40000 ALTER TABLE `conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cuentas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `cuenta` varchar(255) NOT NULL,
  `red_social` int(255) NOT NULL,
  `create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `lnk_redes_sociales_cuentas` (`red_social`) USING BTREE,
  CONSTRAINT `lnk_redes_sociales_cuentas` FOREIGN KEY (`red_social`) REFERENCES `redes_sociales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,'valerySandoval0',1,NULL,NULL),(2,'dani_mesen',1,NULL,NULL),(3,'Cristiano',1,NULL,NULL),(4,'ChinoKV99',1,NULL,NULL),(5,'Nicole_gg09',1,NULL,NULL),(6,'pau_salas12',1,NULL,NULL),(7,'jsosacr',1,NULL,NULL),(8,'Yerlin_Ovares11',1,NULL,NULL),(9,'MGuerrero_12',1,NULL,NULL),(10,'vale_delca',1,NULL,NULL),(11,'jeimy_0220',1,NULL,NULL),(12,'DaniCont19',1,NULL,NULL),(13,'NikkyGenisR',1,NULL,NULL),(14,'AlexandraPinel5',1,NULL,NULL),(15,'KennerGuti04',1,NULL,NULL),(16,'willy10038',1,NULL,NULL),(17,'CrisNunezCR',1,NULL,NULL),(18,'marcelhndez89',1,NULL,NULL),(19,'hansen_jonatan',1,NULL,NULL),(20,'AndyReyesCR',1,NULL,NULL);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_twitter`
--

DROP TABLE IF EXISTS `data_twitter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_twitter` (
  `id` varchar(255) NOT NULL,
  `screen_name` varchar(90) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_twitter`
--

LOCK TABLES `data_twitter` WRITE;
/*!40000 ALTER TABLE `data_twitter` DISABLE KEYS */;
INSERT INTO `data_twitter` VALUES ('1070353721291358208','dani_mesen','Dani Mesén','Heredia, Costa Rica','Jugadora Primera División Liga Deportiva Alajuelense \nInsta: dani_mesen16'),('1242268165','vale_delca','Valeria Del Campo','Costa Rica','Selection of Costa Rica || Instagram: vale_delca || Deut. 31: 6 || Saprissa FF || UCR'),('1294457013393645574','Nicole_gg09','Nicole Gómez','','Insta: nicole_gg09\nLDA primera división\nSelección Nacional sub 20'),('1297237436716724225','Yerlin_Ovares11','Yerlin Ovares','','Player of the Sport Herediano Club and National Sub 20 Selected'),('1368220597','ElNegrovicto','El negro victor','Montería, Colombia','Periodista cívico independiente de carácter critico, No hago bulto ni soy arrodillado, Director del portal https://t.co/njGvtFceP4'),('155659213','Cristiano','Cristiano Ronaldo','Turim, Piemonte','This Privacy Policy addresses the collection and use of personal information - https://t.co/Jp6yh1T58c'),('720268798490578946','valerySandoval0','Valery Sandoval','Alajuela, Costa Rica','19 years old, soccer player • First division L.D.A • National U20 team selected');
/*!40000 ALTER TABLE `data_twitter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_twitter_detalle`
--

DROP TABLE IF EXISTS `data_twitter_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `data_twitter_detalle` (
  `id` varchar(255) NOT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `text` text,
  `place_type` varchar(99) DEFAULT NULL,
  `place` varchar(200) DEFAULT NULL,
  `subjectivity` decimal(10,2) DEFAULT NULL,
  `polarity` decimal(10,2) DEFAULT NULL,
  `classification` varchar(90) DEFAULT NULL,
  `p_pos` decimal(10,2) DEFAULT NULL,
  `p_neg` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_twitter_detalle`
--

LOCK TABLES `data_twitter_detalle` WRITE;
/*!40000 ALTER TABLE `data_twitter_detalle` DISABLE KEYS */;
INSERT INTO `data_twitter_detalle` VALUES ('1296865905490657280','1242268165','RT @SaprissaOficial: We are fed up ... https://t.co/jZTT5cjVxi','admin','Alajuela',0.50,0.50,'neg',0.39,0.61),('1296872551797399552','1242268165','@DiegoPicadoV Mmm no no','admin','Alajuela',0.00,0.00,'pos',0.50,0.50),('1297227076433588224','1242268165','RT @ KevinVR1998: If there was a story I wanted to write about for a long time, it was this','','',0.40,-0.05,'neg',0.31,0.69),('1298028691394633729','1242268165','RT @SaprissaOficial: 1, 2, 3, 4 These were the four entries of #SaprissaFF in his game yesterday #VamosMoradas!','','',0.40,-0.50,'pos',0.86,0.14),('1298067539361226752','1242268165','RT @fedefutbolcrc: The women\'s U-20 national team has not stopped and this Monday started its fifth week of training, with m…','','',0.00,0.00,'neg',0.12,0.88),('1299399347050811401','1242268165','RT @SaprissaOficial: #VamosMoradas','','',0.00,0.00,'pos',0.50,0.50),('1299574399054610433','1242268165','RT @SaprissaOficial: After 10 months of recovery the player Sofía Varela is today on the substitute list. @ sofi_vares98 ...','','',0.00,0.00,'pos',0.98,0.02),('1300145253119406080','1242268165','@DiegoPicadoV HAHA oh yes he exaggerates','admin','Alajuela',0.30,0.20,'pos',0.70,0.30),('1300882641718325249','1242268165','@ameliarueda @DiegoPicadoV','admin','Alajuela',0.00,0.00,'pos',0.50,0.50),('1301668421919272960','1242268165','RT @SaprissaOficial: Tomorrow Saprissa will play Women\'s Soccer\n\nThe match will be against Dimas Escazú at 7 p.m. in La Cueva and will be transmitted ...','','',0.00,0.00,'pos',0.79,0.21),('1302361120217477120','1242268165','RT @SaprissaOficial: We are fed up ...','','',0.00,0.00,'pos',0.58,0.42);
/*!40000 ALTER TABLE `data_twitter_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redes_sociales`
--

DROP TABLE IF EXISTS `redes_sociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redes_sociales` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `create` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redes_sociales`
--

LOCK TABLES `redes_sociales` WRITE;
/*!40000 ALTER TABLE `redes_sociales` DISABLE KEYS */;
INSERT INTO `redes_sociales` VALUES (1,'Twiiter','2020-07-28 23:51:00','2020-07-28 23:51:00'),(2,'Facebook','2020-07-28 23:51:09','2020-07-28 23:51:09'),(3,'Instagram','2020-07-28 23:51:17','2020-07-28 23:51:17');
/*!40000 ALTER TABLE `redes_sociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_sis`
--

DROP TABLE IF EXISTS `users_sis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_sis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(90) NOT NULL,
  `correo` varchar(90) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_sis`
--

LOCK TABLES `users_sis` WRITE;
/*!40000 ALTER TABLE `users_sis` DISABLE KEYS */;
INSERT INTO `users_sis` VALUES (13,'Rodrigo','rodrigo@gmail.com','SAsvGnJ7itXgk'),(14,'rodrigo','rodrigo2@gmail.com','SAsvGnJ7itXgk'),(15,'rodrigo','rodrigo00@gmail.com','SAsvGnJ7itXgk'),(16,'rodrigo','rodrigo9@gmail.com','SAsvGnJ7itXgk'),(17,'rodrigo','ro99drigo@gmail.com','SAsvGnJ7itXgk'),(18,'rodrigo','rodrigo@gmail.com88','SAsvGnJ7itXgk'),(19,'rodrigo','rodrigo99@gmail.com','SAsvGnJ7itXgk'),(20,'julio','julio@lugo.com','SA8s9T.F53Qz.');
/*!40000 ALTER TABLE `users_sis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-07  3:50:00
