CREATE DATABASE  IF NOT EXISTS `airline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `airline`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: airline
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(50) NOT NULL,
  `icaoCode` varchar(5) NOT NULL,
  `model` varchar(50) NOT NULL,
  `engineClass` enum('Piston','Jet','Turboprop') NOT NULL DEFAULT 'Turboprop',
  `numEngine` int NOT NULL DEFAULT '1',
  `numSeat` int NOT NULL DEFAULT '10',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'Acro Sport','ACRO','Acro Sport','Piston',1,10),(2,'Adam Aircraft Industries','A500','A-500','Piston',2,20),(3,'Beechcraft','B18T','Model 18 Turboliner','Turboprop',2,40),(4,'Boeing','B743','747-300SR','Jet',4,75),(5,'Cessna','C526','CitationJet','Jet',2,50),(6,'Embraer','E170','EMB 175-E2','Jet',2,30),(7,'Globe Aircraft/TEMCO','GC1','GC-1B Globe','Piston',1,40),(8,'Israel Aircraft Industries','WW23','1123 Westwind','Jet',4,60),(9,'North American Rockwell','SBR1','Sabre 40/60','Jet',2,50),(10,'Piper','PA18','PA-18-150 Super Cub','Piston',1,30);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `airlinemanifestview`
--

DROP TABLE IF EXISTS `airlinemanifestview`;
/*!50001 DROP VIEW IF EXISTS `airlinemanifestview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `airlinemanifestview` AS SELECT 
 1 AS `Name`,
 1 AS `Number`,
 1 AS `Role`,
 1 AS `Origin`,
 1 AS `Departure`,
 1 AS `Destination`,
 1 AS `Arrival`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `faa` char(3) NOT NULL,
  `icao` char(4) NOT NULL,
  `cityServed` char(5) NOT NULL,
  PRIMARY KEY (`faa`),
  UNIQUE KEY `icao` (`icao`),
  KEY `cityServed` (`cityServed`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`cityServed`) REFERENCES `citystate` (`zipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('DAB','KDAB','32114'),('ECP','KECP','32401'),('EYW','KEYW','33041'),('FLL','KFLL','33301'),('GNV','KGNV','32601'),('JAX','KJAX','32099'),('MCO','KMCO','32801'),('MIA','KMIA','33109'),('MLB','KMLB','32904'),('PBI','KPBI','33401'),('PGD','KPGD','33950'),('PIE','KPIE','33701'),('PNS','KPNS','32501'),('RSW','KRSW','33900'),('SFB','KSFB','32771'),('SRQ','KSRQ','34231'),('TLH','KTLH','32301'),('TPA','KTPA','33602'),('VPS','KVPS','32547');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citystate`
--

DROP TABLE IF EXISTS `citystate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citystate` (
  `city` varchar(90) NOT NULL,
  `state` char(2) NOT NULL,
  `zipCode` char(5) NOT NULL,
  PRIMARY KEY (`zipCode`),
  UNIQUE KEY `zipCode` (`zipCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citystate`
--

LOCK TABLES `citystate` WRITE;
/*!40000 ALTER TABLE `citystate` DISABLE KEYS */;
INSERT INTO `citystate` VALUES ('Trumbull','CT','06611'),('Paterson','NJ','07501'),('Ballston Spa','NY','12020'),('Havertown','PA','19083'),('Waldorf','MD','20601'),('Glenarden','MD','20706'),('Chesterfield','VA','23832'),('Abingdon','VA','24210'),('Indian Trail','NC','28079'),('Mooresville','NC','28115'),('Clover','SC','29710'),('Duluth','GA','30096'),('Jacksonville','FL','32099'),('Daytona Beach','FL','32114'),('Tallahassee','FL','32301'),('Panama City','FL','32401'),('Pensacola','FL','32501'),('Fort Walton Beach','FL','32547'),('Gainesville','FL','32601'),('Sanford','FL','32771'),('Orlando','FL','32801'),('Melbourne','FL','32904'),('Key West','FL','33041'),('Miami','FL','33109'),('Fort Lauderdale','FL','33301'),('West Palm Beach','FL','33401'),('Jupiter','FL','33458'),('Tampa','FL','33602'),('St. Petersburg','FL','33701'),('Fort Myers','FL','33900'),('Punta Gorda','FL','33950'),('Sarasota','FL','34231'),('Nashville','TN','37205'),('Memphis','TN','38117'),('Vicksburg','MS','39180'),('Willoughby','OH','44094'),('Cuyahoga Falls','OH','44223'),('Chillicothe','OH','45601'),('Noblesville','IN','46060'),('Battle Creek','MI','49016'),('Jefferson','LA','70121'),('Covington','LA','70433'),('Scottsdale','AZ','85260'),('Piscataway','NJ','8854'),('Ontario','CA','91764'),('San Marcos','CA','92078'),('Huntington Beach','CA','92647'),('Santa Cruz','CA','95060');
/*!40000 ALTER TABLE `citystate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(90) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `zipCode` (`zipCode`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`zipCode`) REFERENCES `citystate` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Paris','Lindsey','763 West Mulberry St','29710','2025550132','plindsey@airline.com'),(2,'Umaiza','Melia','545 Ohio Ave','29710','2025550135','umelia@airline.com'),(3,'Nico','Prince','20 Middle River Street','44094','2025550137','nprince@airline.com'),(4,'Javan','Rennie','8112 North Country St','44094','2025550139','jrennie@airline.com'),(5,'Ali','Waters','83 Rockland Lane','44094','2025550144','awaters@airline.com'),(6,'JohnPaul','Clarke','1 Riverside Lane','44094','2025550153','jpcClarke@airline.com'),(7,'Dane','Kaiser','694 Wall Road','44094','2025550155','kdaiser@airline.com'),(8,'Hammad','Newman','9970 State Court','30096','2025550157','hnewman@airline.com'),(9,'Maha','Guthrie','54 Woodsman Drive','30096','2025550161','mguthrie@airline.com'),(10,'Tulisa','Roberts','7174 Studebaker Street','30096','2025550163','troberts@airline.com'),(161,'Raheem','Montgomery','71 Paris Hill Rd.','39180','4134849795','rmontgomery@airline.com'),(163,'Oliwier','Barnett','81 Cedar Swamp St.','39180','2764343958','obarnett@airline.com'),(192,'Dawson','Marquez','90 Mammoth Street','45601','7634882879','dmarquez@airline.com'),(193,'Raja','Glass','7918 Talbot Ave.','45601','2319969540','rglass@airline.com'),(194,'Alissa','Ortiz','7756 Fulton Court','23832','2397268929','aortiz@airline.com'),(195,'Nicholas','Pena','8123 Race Ave.','95060','7815242242','npena@airline.com'),(196,'Harvey','West','9 Cherry Ave','23832','7326232762','hwest@airline.com'),(197,'Aamina','Dillon','9 West Boston Lane','95060','2035745299','adillon@airline.com'),(198,'Louis','Giles','598 North Road','28115','2708583758','lgiles@airline.com'),(199,'Krystal','Walters','583 North Nichols Street','95060','3232591832','kwalters@airline.com'),(200,'Alexa','Preston','9227 North Bow Ridge Street','28115','4098496634','apreston@airline.com'),(201,'Rebekah','Morgan','9437 East 6th Street','20601','6073928343','rmorgan@airline.com'),(202,'Ethan','Ali','167 NE. Depot Dr.','28115','2245499884','eali@airline.com'),(203,'Malik','Vincent','312 Colonial Ave.','19083','9149573014','mvincent@airline.com'),(204,'Sara','Barron','9064 E. Swanson St.','20601','8707743244','sbarron@airline.com'),(205,'Lyra','Murphy','400 Nut Swamp Drive','19083','3527673126','lmurphy@airline.com'),(206,'Awais','Carrillo','225 South Manhattan Street','28079','6369577670','acarrillo@airline.com'),(207,'Kaya','Hodge','9572 William Lane','46060','2125271561','khodge@airline.com'),(208,'Jemima','Miller','9290 Indian Spring Rd.','28079','6206673264','jmiller@airline.com'),(209,'Laila','Christensen','15 Rose Avenue','07501','9017396978','lchristensen@airline.com'),(210,'Honey','Warren','7946 Leeton Ridge Street','06611','5858531050','hwarren@airline.com'),(211,'Brodie','Gordon','71 Jackson Ave.','46060','9016899813','bgordon@airline.com'),(212,'Lauren','Morton','7931 Rockaway Street','28079','4476721422','lmorton@airline.com'),(213,'Ty','Bell','921 Brook St.','07501','2393336881','tbell@airline.com'),(214,'Floyd','Johns','2 Shore Street','06611','4065842872','fjohns@airline.com'),(215,'Mathew','Horton','1 Rockland Ave.','46060','7195789907','mhorton@airline.com'),(216,'Ernest','Higgins','451 Marshall Lane','06611','7637651247','ehiggins@airline.com'),(217,'Kamil','Lozano','75 N. Golden Star Street','07501','7638554744','klozano@airline.com'),(220,'Leo','Bird','201 Eagle Dr.','12020','7747829407','lbird@airline.com'),(221,'Fern','Garner','37 Gartner Court','12020','2256254378','fgarner@airline.com'),(222,'Fatima','Robles','2519 Bottom Lane','33900','5126024452','frobles@airline.com'),(223,'Angelita','Turner','3447 Valley Lane','33109','8574960348','aturner@airline.com'),(224,'Robert','Johnson','526 Metz Lane','32401','5306942786','rjohnson@airline.com'),(225,'Francisca','Spence','1253 Coulter Lane','32547','8043389754','fspence@airline.com'),(226,'Matthew','Lee','756 Long Street','32601','3522635642','mlee@airline.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeaudit`
--

DROP TABLE IF EXISTS `employeeaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeaudit` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeNumber` int NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `email` varchar(90) NOT NULL,
  `changeDate` datetime DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeaudit`
--

LOCK TABLES `employeeaudit` WRITE;
/*!40000 ALTER TABLE `employeeaudit` DISABLE KEYS */;
INSERT INTO `employeeaudit` VALUES (1,1,'Paris','Lindsey','plindsey@isp.com','2023-12-03 17:40:05','UPDATE'),(2,2,'Umaiza','Melia','umelia@isp.com','2023-12-03 17:40:05','UPDATE'),(3,3,'Nico','Prince','nprince@isp.com','2023-12-03 17:40:05','UPDATE'),(4,4,'Javan','Rennie','jrennie@isp.com','2023-12-03 17:40:05','UPDATE'),(5,5,'Ali','Waters','awaters@isp.com','2023-12-03 17:40:05','UPDATE'),(6,6,'JohnPaul','Clarke','jpcClarke@isp.com','2023-12-03 17:40:05','UPDATE'),(7,7,'Dane','Kaiser','kdaiser@isp.com','2023-12-03 17:40:05','UPDATE'),(8,8,'Hammad','Newman','hnewman@isp.com','2023-12-03 17:40:05','UPDATE'),(9,9,'Maha','Guthrie','mguthrie@isp.com','2023-12-03 17:40:05','UPDATE'),(10,10,'Tulisa','Roberts','troberts@isp.com','2023-12-03 17:40:05','UPDATE'),(11,161,'Raheem','Montgomery','rmontgomery@cruise.com','2023-12-03 17:40:05','UPDATE'),(12,163,'Oliwier','Barnett','obarnett@cruise.com','2023-12-03 17:40:05','UPDATE'),(13,192,'Dawson','Marquez','dmarquez@cruise.com','2023-12-03 17:40:05','UPDATE'),(14,193,'Raja','Glass','rglass@cruise.com','2023-12-03 17:40:05','UPDATE'),(15,194,'Alissa','Ortiz','aortiz@cruise.com','2023-12-03 17:40:05','UPDATE'),(16,195,'Nicholas','Pena','npena@cruise.com','2023-12-03 17:40:05','UPDATE'),(17,196,'Harvey','West','hwest@cruise.com','2023-12-03 17:40:05','UPDATE'),(18,197,'Aamina','Dillon','adillon@cruise.com','2023-12-03 17:40:05','UPDATE'),(19,198,'Louis','Giles','lgiles@cruise.com','2023-12-03 17:40:05','UPDATE'),(20,199,'Krystal','Walters','kwalters@cruise.com','2023-12-03 17:40:05','UPDATE'),(21,200,'Alexa','Preston','apreston@cruise.com','2023-12-03 17:40:05','UPDATE'),(22,201,'Rebekah','Morgan','rmorgan@cruise.com','2023-12-03 17:40:05','UPDATE'),(23,202,'Ethan','Ali','eali@cruise.com','2023-12-03 17:40:05','UPDATE'),(24,203,'Malik','Vincent','mvincent@cruise.com','2023-12-03 17:40:05','UPDATE'),(25,204,'Sara','Barron','sbarron@cruise.com','2023-12-03 17:40:05','UPDATE'),(26,205,'Lyra','Murphy','lmurphy@cruise.com','2023-12-03 17:40:05','UPDATE'),(27,206,'Awais','Carrillo','acarrillo@cruise.com','2023-12-03 17:40:05','UPDATE'),(28,207,'Kaya','Hodge','khodge@cruise.com','2023-12-03 17:40:05','UPDATE'),(29,208,'Jemima','Miller','jmiller@cruise.com','2023-12-03 17:40:05','UPDATE'),(30,209,'Laila','Christensen','lchristensen@cruise.com','2023-12-03 17:40:05','UPDATE'),(31,210,'Honey','Warren','hwarren@cruise.com','2023-12-03 17:40:05','UPDATE'),(32,211,'Brodie','Gordon','bgordon@cruise.com','2023-12-03 17:40:05','UPDATE'),(33,212,'Lauren','Morton','lmorton@cruise.com','2023-12-03 17:40:05','UPDATE'),(34,213,'Ty','Bell','tbell@cruise.com','2023-12-03 17:40:05','UPDATE'),(35,214,'Floyd','Johns','fjohns@cruise.com','2023-12-03 17:40:05','UPDATE'),(36,215,'Mathew','Horton','mhorton@cruise.com','2023-12-03 17:40:05','UPDATE'),(37,216,'Ernest','Higgins','ehiggins@cruise.com','2023-12-03 17:40:05','UPDATE'),(38,217,'Kamil','Lozano','klozano@cruise.com','2023-12-03 17:40:05','UPDATE'),(39,220,'Leo','Bird','lbird@cruise.com','2023-12-03 17:40:05','UPDATE'),(40,221,'Fern','Garner','fgarner@cruise.com','2023-12-03 17:40:05','UPDATE');
/*!40000 ALTER TABLE `employeeaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeflight`
--

DROP TABLE IF EXISTS `employeeflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeflight` (
  `employeeId` int NOT NULL,
  `flightId` int NOT NULL,
  PRIMARY KEY (`employeeId`,`flightId`),
  KEY `flightId` (`flightId`),
  CONSTRAINT `employeeflight_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`),
  CONSTRAINT `employeeflight_ibfk_2` FOREIGN KEY (`flightId`) REFERENCES `flight` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeflight`
--

LOCK TABLES `employeeflight` WRITE;
/*!40000 ALTER TABLE `employeeflight` DISABLE KEYS */;
INSERT INTO `employeeflight` VALUES (2,100),(3,100),(201,100),(211,100),(213,100),(203,106),(205,106),(209,106),(215,106),(220,106),(1,113),(3,113),(203,113),(213,113),(221,113),(201,116),(205,116),(209,116),(211,116),(220,116);
/*!40000 ALTER TABLE `employeeflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employeeflightview`
--

DROP TABLE IF EXISTS `employeeflightview`;
/*!50001 DROP VIEW IF EXISTS `employeeflightview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employeeflightview` AS SELECT 
 1 AS `Employee`,
 1 AS `Origin`,
 1 AS `Departure`,
 1 AS `Destination`,
 1 AS `Arrival`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employeeposition`
--

DROP TABLE IF EXISTS `employeeposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeposition` (
  `employeeId` int NOT NULL,
  `positionId` int NOT NULL,
  PRIMARY KEY (`employeeId`,`positionId`),
  UNIQUE KEY `employeeId` (`employeeId`),
  KEY `positionId` (`positionId`),
  CONSTRAINT `employeeposition_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`),
  CONSTRAINT `employeeposition_ibfk_2` FOREIGN KEY (`positionId`) REFERENCES `position` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeposition`
--

LOCK TABLES `employeeposition` WRITE;
/*!40000 ALTER TABLE `employeeposition` DISABLE KEYS */;
INSERT INTO `employeeposition` VALUES (1,1),(2,2),(3,3),(4,6),(5,7),(6,11),(7,14),(8,15),(9,15),(10,16),(161,8),(163,12),(192,13),(193,17),(194,6),(195,4),(196,6),(197,9),(198,17),(199,10),(200,17),(201,3),(202,17),(203,3),(204,15),(205,3),(206,15),(207,5),(208,15),(209,3),(210,8),(211,1),(212,8),(213,3),(214,11),(215,1),(216,14),(217,6),(220,2),(221,2);
/*!40000 ALTER TABLE `employeeposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `origin` char(3) NOT NULL,
  `destination` char(3) NOT NULL,
  `aircraft` int NOT NULL,
  `departure` timestamp NOT NULL,
  `arrival` timestamp NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `origin` (`origin`),
  KEY `destination` (`destination`),
  KEY `aircraft` (`aircraft`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`origin`) REFERENCES `airport` (`faa`),
  CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`destination`) REFERENCES `airport` (`faa`),
  CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`aircraft`) REFERENCES `aircraft` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (100,'DAB','FLL',1,'2023-11-01 11:00:00','2023-11-01 12:00:00'),(101,'FLL','RSW',9,'2023-11-01 12:00:00','2023-11-01 13:00:00'),(102,'RSW','VPS',2,'2023-11-01 13:00:00','2023-11-01 14:00:00'),(103,'VPS','GNV',8,'2023-11-01 14:00:00','2023-11-01 15:00:00'),(104,'GNV','JAX',3,'2023-11-11 16:00:00','2023-11-11 17:00:00'),(105,'JAX','EYW',7,'2023-11-11 17:00:00','2023-11-11 18:00:00'),(106,'EYW','MLB',4,'2023-11-04 17:00:00','2023-11-04 18:00:00'),(107,'MLB','MIA',6,'2023-11-04 18:00:00','2023-11-04 19:00:00'),(108,'MIA','MCO',5,'2023-11-05 20:00:00','2023-11-05 21:00:00'),(109,'MCO','ECP',5,'2023-11-05 21:00:00','2023-11-05 22:00:00'),(110,'ECP','PNS',6,'2023-11-06 22:00:00','2023-11-06 23:00:00'),(111,'PNS','PGD',4,'2023-11-07 00:00:00','2023-11-07 01:00:00'),(112,'PGD','SFB',7,'2023-11-07 12:00:00','2023-11-07 13:00:00'),(113,'SFB','SRQ',3,'2023-11-07 14:00:00','2023-11-07 15:00:00'),(114,'SRQ','PIE',8,'2023-11-08 12:00:00','2023-11-08 13:00:00'),(115,'PIE','TLH',2,'2023-11-08 14:00:00','2023-11-08 15:00:00'),(116,'TLH','TPA',9,'2023-11-09 12:00:00','2023-11-09 13:00:00'),(117,'TPA','PBI',1,'2023-11-09 15:00:00','2023-11-09 16:00:00'),(118,'PBI','DAB',10,'2023-11-10 16:00:00','2023-11-10 17:00:00');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(90) NOT NULL,
  `address` varchar(90) NOT NULL,
  `zipCode` char(5) NOT NULL,
  `phone` char(10) NOT NULL,
  `email` varchar(90) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  KEY `zipCode` (`zipCode`),
  CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`zipCode`) REFERENCES `citystate` (`zipCode`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (106,'Igor','Prince','12 Creekside St','92647','2025550199','iprince@isp.com'),(107,'Dante','Rennie','137 Wall St','38117','2225550112','drennie@isp.com'),(108,'Thomas','Waters','411 Shirley St','24210','2225550115','twaters@isp.com'),(109,'Avaya','Clarke','7771 Border Court','92078','2225550119','aclarke@isp.com'),(110,'Haniya','Kaiser','6 South Sulphur Springs Street','70121','2225550121','hkaiser@isp.com'),(111,'Victor','Newman','942 New Saddle Drive','70433','2225550122','vnewman@isp.com'),(112,'Douglas','Guthrie','9 Wrangler Ave','91764','2225550124','dguthrie@isp.com'),(113,'Brian','Roberts','7319 S. Greenview Drive','44223','2225550125','broberts@isp.com'),(114,'Paris','Solis','763 West Mulberry St','49016','2025550132','psolis@isp.com'),(115,'Umaiza','Heath','545 Ohio Ave','85260','2025550135','uheath@isp.com'),(116,'Yvonne','Goodman','12 Creekside St','37205','2025550109','ygoodman@isp.com'),(117,'Dante','Mackenzie','137 Wall St','37205','2025550112','dmackenzie@isp.com'),(118,'Alysha','Rollins','411 Shirley St','37205','2025550115','arollins@isp.com'),(119,'Avaya','Gonzalez','7771 Border Court','37205','2025550119','agonzalez@isp.com'),(120,'Haniya','Kelly','6 South Sulphur Springs Street','37205','2025550121',' hkelly@isp.com'),(121,'Nathalie','Chambers','942 New Saddle Drive','29710','2025550122','nchambers@isp.com'),(122,'Dante','Rollins','9 Wrangler Ave','29710','2025550124','drollins@isp.com'),(123,'Beverley','Mckee','7319 S. Greenview Drive','29710','2025550125','bmckee@isp.com'),(124,'Robin','Solis','8474 Wentworth Street','30096','2025550164','rsolis@isp.com'),(125,'Kavita','Heath','796 Hartford St','30096','2025550165','kheath@isp.com'),(126,'Meera','White','484 Bridge St','8854','2025550166','mwhite@isp.com'),(127,'Bradlee','Esparza','7031 Gainsway St','8854','2025550173','besparza@isp.com'),(128,'Leilani','Leonard','37 Monroe Street','8854','2025550175','lleonard@isp.com'),(129,'Stefanie','Brook','7990 West Surrey St','8854','2025550179','sbrook@isp.com'),(130,'Grover','Squires','7618 Madison Court','8854','2025550180','gsquires@isp.com'),(131,'Jonathan','Kumar','25 Annadale Court','33458','2025550182','jkumar@isp.com'),(132,'Angus','Neville','9841 Smith Drive','33458','2025550187','aneville@isp.com'),(133,'Uzair','Sparrow','7999 Hall Street','33458','2025550188','usparrow@isp.com'),(134,'Amari','Currie','8411 Pleasant St','33458','2025550194','acurrie@isp.com'),(135,'Imaani','Wallace','33 Pierce Rd','33458','2025550195','iwallace@isp.com'),(136,'Efe','House','97 High Point Street','20706','2025550196','ehouse@isp.com'),(137,'Atticus','Atkinson','66 Harrison Dr','20706','2025550197','aatkinson@isp.com'),(138,'Michelle','Ramirez','370 Hill Field Ave','20706','2025550198',' mramirez@isp.com'),(139,'Remy','Hassan','249 Devon Lane','20706','2225550199','rhassan@isp.com'),(140,'Jordana','Beck','7911 Carson Lane','20706','2025550200','jbeck@isp.com');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengerflight`
--

DROP TABLE IF EXISTS `passengerflight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengerflight` (
  `passengerId` int NOT NULL,
  `flightId` int NOT NULL,
  PRIMARY KEY (`passengerId`,`flightId`),
  KEY `flightId` (`flightId`),
  CONSTRAINT `passengerflight_ibfk_1` FOREIGN KEY (`passengerId`) REFERENCES `passenger` (`ID`),
  CONSTRAINT `passengerflight_ibfk_2` FOREIGN KEY (`flightId`) REFERENCES `flight` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengerflight`
--

LOCK TABLES `passengerflight` WRITE;
/*!40000 ALTER TABLE `passengerflight` DISABLE KEYS */;
INSERT INTO `passengerflight` VALUES (107,100),(108,100),(118,100),(124,100),(140,100),(109,106),(110,106),(130,106),(135,106),(138,106),(111,113),(115,113),(116,113),(125,113),(136,113),(106,116),(113,116),(119,116),(123,116),(134,116);
/*!40000 ALTER TABLE `passengerflight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `passengerflightview`
--

DROP TABLE IF EXISTS `passengerflightview`;
/*!50001 DROP VIEW IF EXISTS `passengerflightview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passengerflightview` AS SELECT 
 1 AS `Passenger`,
 1 AS `Origin`,
 1 AS `Departure`,
 1 AS `Destination`,
 1 AS `Arrival`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `hourly` decimal(5,2) NOT NULL DEFAULT '11.00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `description` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Pilot',58.00),(2,'Co-pilot',40.00),(3,'Flight Attendant',48.00),(4,'Cabin Attendant',38.00),(5,'Aeronautical Engineer',42.00),(6,'Aircraft Mechanic',33.00),(7,'Airport Police',20.00),(8,'Security',14.00),(9,'Airport Planner',46.00),(10,'Airfield Operations Specialists',22.00),(11,'Airline Ticket Agent',13.00),(12,'Reservation Service Agent',15.00),(13,'Passenger Service Agent',11.00),(14,'Meteorologist',37.00),(15,'Baggage Handler',13.00),(16,'Administrative Jobs',17.00),(17,'Cleaning Jobs',13.00);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheet` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `employeeId` int NOT NULL,
  `sun` int NOT NULL DEFAULT '0',
  `mon` int NOT NULL DEFAULT '0',
  `tues` int NOT NULL DEFAULT '0',
  `wed` int NOT NULL DEFAULT '0',
  `thurs` int NOT NULL DEFAULT '0',
  `fri` int NOT NULL DEFAULT '0',
  `sat` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `employeeId` (`employeeId`),
  CONSTRAINT `timesheet_ibfk_1` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (1,202,7,4,9,0,0,10,3),(2,163,0,12,6,10,6,8,0),(3,204,10,8,0,0,8,10,10),(4,213,12,0,12,0,4,12,0),(5,220,6,6,6,6,6,5,0),(6,206,12,0,12,0,4,12,0),(7,209,12,0,12,0,4,12,0),(8,6,12,0,12,0,4,12,0),(9,197,7,4,9,0,0,10,3),(10,221,0,12,6,10,6,8,0),(11,198,6,6,6,6,6,5,0),(12,193,0,8,8,8,8,8,0),(13,211,6,6,6,6,6,5,0),(14,9,10,8,0,0,8,10,10),(15,216,0,8,8,8,8,8,0),(16,207,0,12,6,10,6,8,0),(17,215,6,6,6,6,6,5,0),(18,214,0,8,8,8,8,8,0),(19,7,8,8,0,0,8,10,6),(20,1,10,8,0,0,8,10,10),(21,217,10,8,0,0,8,10,10),(22,192,12,0,12,0,4,12,0),(23,2,8,8,0,0,8,10,6),(24,208,10,8,0,0,8,10,10),(25,161,0,8,8,8,8,8,0),(26,201,6,6,6,6,6,5,0),(27,212,7,4,9,0,0,10,3),(28,205,0,12,6,10,6,8,0),(29,8,0,8,8,8,8,8,0),(30,194,0,8,8,8,8,8,0),(31,195,8,8,0,0,8,10,6),(32,200,0,12,6,10,6,8,0),(33,3,6,6,6,6,6,5,0),(34,4,7,4,9,0,0,10,3),(35,10,10,8,0,0,8,10,10),(36,203,0,12,6,10,6,8,0),(37,199,8,8,0,0,8,10,6),(38,210,8,8,0,0,8,10,6),(39,5,0,8,8,8,8,8,0),(40,196,12,0,12,0,4,12,0),(41,222,0,0,0,0,0,0,0),(42,223,0,0,0,0,0,0,0),(43,224,0,0,0,0,0,0,0),(44,225,0,0,0,0,0,0,0),(45,226,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `timesheetview`
--

DROP TABLE IF EXISTS `timesheetview`;
/*!50001 DROP VIEW IF EXISTS `timesheetview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `timesheetview` AS SELECT 
 1 AS `Employee`,
 1 AS `Position`,
 1 AS `Hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `airlinemanifestview`
--

/*!50001 DROP VIEW IF EXISTS `airlinemanifestview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `airlinemanifestview` AS select concat(`e`.`firstName`,' ',`e`.`lastName`) AS `Name`,`e`.`phone` AS `Number`,`p`.`description` AS `Role`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Destination`,`f`.`arrival` AS `Arrival` from ((((`employee` `e` join `flight` `f`) join `employeeflight` `ef`) join `position` `p`) join `employeeposition` `ep`) where ((`e`.`ID` = `ef`.`employeeId`) and (`e`.`ID` = `ep`.`employeeId`) and (`f`.`ID` = `ef`.`flightId`) and (`p`.`ID` = `ep`.`positionId`)) union select concat(`pa`.`firstName`,' ',`pa`.`lastName`) AS `Name`,`pa`.`phone` AS `Number`,'Passenger' AS `Role`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Destination`,`f`.`arrival` AS `Arrival` from ((`passenger` `pa` join `flight` `f`) join `passengerflight` `pf`) where ((`pa`.`ID` = `pf`.`passengerId`) and (`f`.`ID` = `pf`.`flightId`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employeeflightview`
--

/*!50001 DROP VIEW IF EXISTS `employeeflightview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employeeflightview` AS select concat(`e`.`firstName`,' ',`e`.`lastName`) AS `Employee`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Destination`,`f`.`arrival` AS `Arrival` from ((`employee` `e` join `flight` `f`) join `employeeflight` `ef`) where ((`e`.`ID` = `ef`.`employeeId`) and (`ef`.`flightId` = `f`.`ID`)) order by `f`.`departure`,`e`.`lastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passengerflightview`
--

/*!50001 DROP VIEW IF EXISTS `passengerflightview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passengerflightview` AS select concat(`p`.`firstName`,' ',`p`.`lastName`) AS `Passenger`,`f`.`origin` AS `Origin`,`f`.`departure` AS `Departure`,`f`.`destination` AS `Destination`,`f`.`arrival` AS `Arrival` from ((`passenger` `p` join `flight` `f`) join `passengerflight` `pf`) where ((`p`.`ID` = `pf`.`passengerId`) and (`f`.`ID` = `pf`.`flightId`)) order by `f`.`departure`,`p`.`lastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `timesheetview`
--

/*!50001 DROP VIEW IF EXISTS `timesheetview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `timesheetview` AS select concat(`e`.`firstName`,' ',`e`.`lastName`) AS `Employee`,`p`.`description` AS `Position`,((((((`t`.`sun` + `t`.`mon`) + `t`.`tues`) + `t`.`wed`) + `t`.`thurs`) + `t`.`fri`) + `t`.`sat`) AS `Hours` from (((`employee` `e` join `timesheet` `t`) join `position` `p`) join `employeeposition` `ep`) where ((`e`.`ID` = `ep`.`employeeId`) and (`ep`.`positionId` = `p`.`ID`) and (`e`.`ID` = `t`.`employeeId`)) order by `e`.`lastName` */;
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

-- Dump completed on 2023-12-03 17:40:55
