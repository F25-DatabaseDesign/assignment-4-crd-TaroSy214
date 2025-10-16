-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: unitedhelper
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment` (
  `volunteerId` int NOT NULL,
  `taskCode` int NOT NULL,
  `startDateTime` datetime NOT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`volunteerId`,`taskCode`),
  KEY `taskCode` (`taskCode`),
  CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`volunteerId`) REFERENCES `volunteer` (`volunteerId`),
  CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignment`
--

LOCK TABLES `assignment` WRITE;
/*!40000 ALTER TABLE `assignment` DISABLE KEYS */;
INSERT INTO `assignment` VALUES (1,1,'2025-10-01 08:00:00',NULL),(1,2,'2025-10-02 08:00:00',NULL),(1,7,'2025-10-05 08:00:00',NULL),(2,4,'2025-10-01 09:00:00',NULL),(2,5,'2025-10-03 08:00:00',NULL),(2,10,'2025-10-06 10:00:00',NULL),(3,1,'2025-10-01 08:00:00',NULL),(4,2,'2025-10-02 08:00:00',NULL),(5,3,'2025-09-28 08:00:00','2025-09-30 17:00:00'),(6,6,'2025-10-08 08:00:00',NULL),(7,7,'2025-10-05 08:00:00',NULL),(8,8,'2025-09-25 08:00:00','2025-09-25 17:00:00'),(9,11,'2025-10-10 08:00:00',NULL),(10,12,'2025-10-01 09:00:00',NULL),(11,13,'2025-10-12 08:00:00',NULL),(12,14,'2025-09-20 08:00:00','2025-09-20 17:00:00'),(12,15,'2025-10-05 08:00:00',NULL);
/*!40000 ALTER TABLE `assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `itemId` int NOT NULL AUTO_INCREMENT,
  `itemDescription` varchar(200) NOT NULL,
  `itemValue` decimal(10,2) NOT NULL,
  `quantityOnHand` int NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'First Aid Kid',20.00,1000),(2,'Bandages (100-pack)',12.99,400),(3,'Alcohol Wipes (100-pack)',7.99,400),(4,'Pain Relief Medication (100ct)',200.13,20),(5,'Protein Bars (12-pack)',30.99,600),(6,'Bread (30-pack)',10.00,300),(7,'Eggs (carton)',7.99,400),(8,'Canned Soup',2.99,6000),(9,'Soap Bars (4-pack)',3.54,500),(10,'Toothbrush and Toothpaste Set',0.99,2000),(11,'Hand Sanitizer (1L)',5.90,200),(12,'Toilet Paper (12-pack)',12.99,400),(13,'Heavy Gloves',9.99,2000),(14,'Thermal Socks',4.99,2000),(15,'Coloring Book',1.28,300),(16,'Jenga',10.03,30),(17,'Chess Board and Chess Pieces',40.00,10),(18,'Newspaper',0.60,200),(19,'Bottled Water (24-pack)',8.99,3000),(20,'Emergency Blanket',4.50,800);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageId` int NOT NULL AUTO_INCREMENT,
  `taskCode` int NOT NULL,
  `packageTypeId` int NOT NULL,
  `packageCreateDate` date NOT NULL,
  `packageWeight` decimal(10,2) NOT NULL,
  PRIMARY KEY (`packageId`),
  KEY `taskCode` (`taskCode`),
  KEY `packageTypeId` (`packageTypeId`),
  CONSTRAINT `package_ibfk_1` FOREIGN KEY (`taskCode`) REFERENCES `task` (`taskCode`),
  CONSTRAINT `package_ibfk_2` FOREIGN KEY (`packageTypeId`) REFERENCES `package_type` (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,1,'2025-10-01',5.50),(2,1,1,'2025-10-01',5.75),(3,1,1,'2025-10-01',5.25),(4,1,1,'2025-10-01',5.60),(5,2,2,'2025-10-02',12.50),(6,2,2,'2025-10-02',12.75),(7,2,2,'2025-10-02',12.25),(8,2,2,'2025-10-02',12.90),(9,3,3,'2025-09-29',4.50),(10,3,3,'2025-09-29',4.75),(11,3,3,'2025-09-30',4.25),(12,6,4,'2025-10-08',6.50),(13,7,5,'2025-10-05',3.75),(14,7,5,'2025-10-05',3.50),(15,11,2,'2025-10-10',13.25),(16,13,3,'2025-10-12',4.50),(17,15,4,'2025-10-06',7.25);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_contents`
--

DROP TABLE IF EXISTS `package_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_contents` (
  `itemId` int NOT NULL,
  `packageId` int NOT NULL,
  `itemQuantity` int NOT NULL,
  PRIMARY KEY (`itemId`,`packageId`),
  KEY `packageId` (`packageId`),
  CONSTRAINT `package_contents_ibfk_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`),
  CONSTRAINT `package_contents_ibfk_2` FOREIGN KEY (`packageId`) REFERENCES `package` (`packageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_contents`
--

LOCK TABLES `package_contents` WRITE;
/*!40000 ALTER TABLE `package_contents` DISABLE KEYS */;
INSERT INTO `package_contents` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(2,1,2),(2,2,2),(2,4,2),(3,1,2),(3,2,3),(3,3,2),(3,4,2),(4,1,1),(4,2,1),(4,3,1),(5,5,1),(5,6,1),(5,7,2),(5,8,1),(5,15,2),(6,5,2),(6,6,2),(6,7,3),(6,8,2),(6,15,3),(7,5,1),(7,7,2),(8,5,6),(8,6,8),(8,7,6),(8,8,10),(8,15,8),(9,9,1),(9,10,2),(9,11,1),(9,16,2),(10,9,2),(10,10,1),(10,11,2),(10,16,2),(11,9,1),(11,11,2),(11,16,1),(12,9,1),(12,10,1),(12,11,2),(13,12,2),(13,17,1),(14,12,3),(14,17,2),(15,13,3),(15,14,2),(16,13,1),(17,14,1),(18,13,2),(18,14,1);
/*!40000 ALTER TABLE `package_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_type`
--

DROP TABLE IF EXISTS `package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_type` (
  `packageTypeId` int NOT NULL AUTO_INCREMENT,
  `packageTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`packageTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_type`
--

LOCK TABLES `package_type` WRITE;
/*!40000 ALTER TABLE `package_type` DISABLE KEYS */;
INSERT INTO `package_type` VALUES (1,'Medical'),(2,'Food'),(3,'Hygiene'),(4,'Winter Clothing'),(5,'Entertainment');
/*!40000 ALTER TABLE `package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_list`
--

DROP TABLE IF EXISTS `packing_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_list` (
  `packingListId` int NOT NULL AUTO_INCREMENT,
  `packingListName` varchar(100) NOT NULL,
  `packingListDescription` text NOT NULL,
  PRIMARY KEY (`packingListId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_list`
--

LOCK TABLES `packing_list` WRITE;
/*!40000 ALTER TABLE `packing_list` DISABLE KEYS */;
INSERT INTO `packing_list` VALUES (1,'Hurricane Medical Relief','Hurricane victims need first aid kits, pain meds, bandages, and alcohol wipes in each box. Need 1000 packages total.'),(2,'Flood Emergency Food','Flood victims need packages with bread, eggs, protein bars, and plenty of canned soup. Need 2000 packages.'),(3,'Tornado Hygiene Relief','Tornado survivors are asking for basic hygiene supplies including soap, hand sanitizer, toothbrush kits, and toilet paper. Need 500 complete packages.'),(4,'Winter Clothing Assistance','Warm clothing, especially thermal socks and heavy gloves are needed. Need 1500 packages.'),(5,'Child Entertainment Packages','Children are requesting activities to help cope with trauma. Include coloring books, games like Jenga or Chess if available, even newspapers for older kids. Need 800 packages.'),(6,'Comprehensive Medical Aid','We need first aid supplies, all available medications, and emergency medical items. Need 3000 packages.'),(7,'Hurricane Season Food Prep','We need packages with foods that can survive storage. Need 5000 packages.'),(8,'Wildfire Hygiene Kits','Wildfire escapees are left with nothing. They need at least some hygiene items including soap, sanitizer, and toothbrush sets. Need 400 kits.'),(9,'Homeless Winter Outreach','Homeless retired soldiers request thermal socks, heavy gloves, and any warm accessories we have in stock. Need 1200 packages.'),(10,'Local Shelter Food Support','Local shelters are running low on food supplies. They need bread, eggs, canned soup, and protein bars in each package. Need 600 packages.');
/*!40000 ALTER TABLE `packing_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `taskCode` int NOT NULL AUTO_INCREMENT,
  `packingListId` int DEFAULT NULL,
  `taskTypeId` int NOT NULL,
  `taskStatusId` int NOT NULL,
  `taskDescription` text NOT NULL,
  PRIMARY KEY (`taskCode`),
  KEY `packingListId` (`packingListId`),
  KEY `taskTypeId` (`taskTypeId`),
  KEY `taskStatusId` (`taskStatusId`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`packingListId`) REFERENCES `packing_list` (`packingListId`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`taskTypeId`) REFERENCES `task_type` (`taskTypeId`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`taskStatusId`) REFERENCES `task_status` (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,1,2,'Medical supplies for hurricane survivors in the Gulf.'),(2,2,1,2,'2000 food boxes for the flood victims.'),(3,3,1,3,'Hygiene packages for tornado survivors.'),(4,NULL,2,2,'Put on the emergency hotline, we need to coordinate volunteer response teams.'),(5,NULL,3,2,'Put together our big fundraising event for next month.'),(6,4,1,1,'Winter clothing for homeless shelters before the cold comes soon.'),(7,5,1,2,'Entertainment for kids stuck in evacuation.'),(8,NULL,4,3,'Drive the relief packages down to Los Angeles distribution center - they need this delivery.'),(9,6,1,1,'Comprehensive medical kits for our world known relief mission in Europe.'),(10,NULL,2,2,'Sort through all donated items, update inventory.'),(11,7,1,1,'5000 food packages to prepare for hurricanes.'),(12,NULL,5,2,'Meet with medical employees to coordinate work.'),(13,8,1,1,'Hygiene care packages for the wildfire evacuees.'),(14,NULL,4,3,'Delivered emergency supplies to Florida this morning.'),(15,9,1,2,'Pack winter gear for Californian homeless.'),(16,10,1,1,'Please prepare 600 food relief packages for local shelter distribution by Friday.'),(17,NULL,3,1,'Planned our training event for spring.');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_status`
--

DROP TABLE IF EXISTS `task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_status` (
  `taskStatusId` int NOT NULL AUTO_INCREMENT,
  `taskStatusName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskStatusId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_status`
--

LOCK TABLES `task_status` WRITE;
/*!40000 ALTER TABLE `task_status` DISABLE KEYS */;
INSERT INTO `task_status` VALUES (1,'Open'),(2,'Ongoing'),(3,'Completed'),(4,'Cancelled');
/*!40000 ALTER TABLE `task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_type`
--

DROP TABLE IF EXISTS `task_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_type` (
  `taskTypeId` int NOT NULL AUTO_INCREMENT,
  `taskTypeName` varchar(50) NOT NULL,
  PRIMARY KEY (`taskTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_type`
--

LOCK TABLES `task_type` WRITE;
/*!40000 ALTER TABLE `task_type` DISABLE KEYS */;
INSERT INTO `task_type` VALUES (1,'Packing'),(2,'Support Services'),(3,'Event Organization'),(4,'Transportation'),(5,'Coordination');
/*!40000 ALTER TABLE `task_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteerId` int NOT NULL AUTO_INCREMENT,
  `volunteerName` varchar(100) NOT NULL,
  `volunteerAddress` varchar(200) NOT NULL,
  `volunteerTelephone` varchar(20) NOT NULL,
  PRIMARY KEY (`volunteerId`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES (1,'Bob Socks','345 Nice Street, Cupertino, CA 95014','345-456-1233'),(2,'Steve Ross','595 Beautiful Street, San Francisco, CA 03495','533-666-2456'),(3,'Reed Fee','457 Wonderful Court, Los Angeles, CA 45634','456-123-7564'),(4,'Cate Foo','4567 Anderson Lane, Sacremento, CA 45662','242-684-5734'),(5,'Kathy Peep','987 Narnara Road, San Jose, CA 86435','345-866-7777'),(6,'James Happ','2345 Tonny Street, Fremont, CA 56796','112-344-6788'),(7,'Daniel Gott','7555 Michelin Lane, Cupertino, CA 75746','857-342-2567'),(8,'Henry Never','67545 Stanford Place, San Francisco, CA 35443','454-888-1221'),(9,'Plato Pecul','3467 Columbus Avenue, Irvine, CA 66889','686-296-1293'),(10,'Allison Fequr','2275 Sunshine Drive, Davis, CA 44432','122-111-7952'),(11,'Alicia Chen','4474 Suncity Boulevard, San Diego, CA 55747','585-754-3211'),(12,'Jessica Zhang','2636 Seven Lane, Sacremento, CA 22424','998-666-5532'),(13,'Charlotte Zhou','99766 Neather Street, Campbell, CA 96846','112-334-5567'),(14,'Dorothy Zheng','22686 Jose Road, Saratoga, CA 84522','998-008-3334'),(15,'Charlie Yan','63473 Washington Place, San Francisco, CA 11135','223-555-9862');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-15 22:13:52
