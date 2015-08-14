-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: games
-- ------------------------------------------------------
-- Server version	5.6.24-log

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
-- Table structure for table `contentdescriptors`
--

DROP TABLE IF EXISTS `contentdescriptors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentdescriptors` (
  `contentID` int(11) NOT NULL AUTO_INCREMENT,
  `contentName` varchar(55) DEFAULT NULL,
  `contentDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contentID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentdescriptors`
--

LOCK TABLES `contentdescriptors` WRITE;
/*!40000 ALTER TABLE `contentdescriptors` DISABLE KEYS */;
INSERT INTO `contentdescriptors` VALUES (1,'Alcohol Reference','References to and/or images of alcoholic beverages'),(2,'Animated Blood','Discolored and/or unrealistic depictions of blood'),(3,'Blood','Depictions of blood'),(4,'Blood and Gore','Depictions of blood or the mutilation of body parts'),(5,'Cartoon Violence','Violent actions involving cartoon-like situations and characters. May include violence where a character is unhardmed after the action has been inflicted'),(6,'Comic Mischief','Depictions or dialogue involving slapstick or suggestive humor'),(7,'Crude Humor','\"Depictions or dialogue involving vulgar antics'),(8,'Drug Reference','Reference to and/or images of illegal drugs'),(9,'Fantasy Violence','\"Violent actions of a fantasy nature'),(10,'Intense Violence','\"Graphic and realistic-looking depictions of physical conflict. May involve extreme and/or realistic blood'),(11,'Language','Mild to moderate use of profanity'),(12,'Lyrics','\"Mild references to profanity'),(13,'Mature Humor','\"Depictions or dialogue involving \"\"adult\"\" humor'),(14,'Nudity','Graphic or prolonged depictions of nudity'),(15,'Partial Nudity','Brief and/or mild depictions of nudity'),(16,'Real Gambling','\"Player can gamble'),(17,'Sexual Content','\"Non-explicit depictions of sexual behavior'),(18,'Sexual Themes','References to sex or sexuality'),(19,'Sexual Violence','Depictions of rape or other violent sexual acts'),(20,'Simulated Gambling','Player can gamble without bettering or wagering real cash or currency'),(21,'Strong Language','Explicit and/or frequent use of profanity'),(22,'Strong Lyrics','\"Explicit and/or frequent references to proganity'),(23,'Strong Sexual Content','\"Explicit and/or frequent depictions of sexual behavior'),(24,'Suggestive Themes','Mild provocative references or materials'),(25,'Tobacco Reference','Reference to and/or images of tobacco products'),(26,'Use of Alcohol','The consumption of alcoholic beverages'),(27,'Use of Drugs','The consumption or use of illegal drugs'),(28,'Use of Tobacco','The consumption of tobacco products'),(29,'Violence','Scenes involving aggressive conflict. May contain bloodless dismemberment'),(30,'Violent References','References to violent acts');
/*!40000 ALTER TABLE `contentdescriptors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gameratings`
--

DROP TABLE IF EXISTS `gameratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameratings` (
  `ratingID` int(11) NOT NULL AUTO_INCREMENT,
  `rating` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ratingID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameratings`
--

LOCK TABLES `gameratings` WRITE;
/*!40000 ALTER TABLE `gameratings` DISABLE KEYS */;
INSERT INTO `gameratings` VALUES (1,'Early Childhood'),(2,'Everyone'),(3,'Everyone 10+'),(4,'Teen'),(5,'Mature'),(6,'Adults Only');
/*!40000 ALTER TABLE `gameratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `gameName` varchar(50) DEFAULT NULL,
  `played` varchar(3) DEFAULT NULL,
  `ratingID` int(11) DEFAULT NULL,
  PRIMARY KEY (`gameID`),
  KEY `ratingID` (`ratingID`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`ratingID`) REFERENCES `gameratings` (`ratingID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (1,'Borderlands 2','yes',5),(2,'Amnesia: The Dark Descent','no',5),(3,'Bastion','no',3);
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingdescriptions`
--

DROP TABLE IF EXISTS `ratingdescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratingdescriptions` (
  `ratingID` int(11) DEFAULT NULL,
  `contentID` int(11) DEFAULT NULL,
  `contentMetadata` blob,
  KEY `ratingID` (`ratingID`),
  KEY `contentID` (`contentID`),
  CONSTRAINT `ratingdescriptions_ibfk_1` FOREIGN KEY (`ratingID`) REFERENCES `gameratings` (`ratingID`),
  CONSTRAINT `ratingdescriptions_ibfk_2` FOREIGN KEY (`contentID`) REFERENCES `contentdescriptors` (`contentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingdescriptions`
--

LOCK TABLES `ratingdescriptions` WRITE;
/*!40000 ALTER TABLE `ratingdescriptions` DISABLE KEYS */;
INSERT INTO `ratingdescriptions` VALUES (1,1,'101010101010101'),(1,2,'010101010101010'),(1,3,'101101101101101'),(1,4,'010010010010010'),(1,5,'101010101010101'),(1,6,'010101010101010'),(1,7,'101101101101101'),(1,8,'010010010010010'),(1,9,'101010101010101'),(1,10,'010101010101010'),(2,2,'101101101101101'),(2,4,'010010010010010'),(2,6,'101010101010101'),(2,8,'010101010101010'),(2,10,'101101101101101'),(2,12,'010010010010010'),(2,14,'101010101010101'),(2,16,'010101010101010'),(2,18,'101101101101101'),(2,20,'010010010010010'),(3,3,'101010101010101'),(3,6,'010101010101010'),(3,9,'101101101101101'),(3,12,'010010010010010'),(3,15,'101010101010101'),(3,18,'010101010101010'),(3,21,'101101101101101'),(3,24,'010010010010010'),(3,27,'101010101010101'),(3,30,'010101010101010'),(4,4,'101101101101101'),(4,8,'010010010010010'),(4,12,'101010101010101'),(4,16,'010101010101010'),(4,20,'101101101101101'),(4,24,'010010010010010'),(4,28,'101010101010101'),(5,5,'010101010101010'),(5,10,'101101101101101'),(5,15,'010010010010010'),(5,20,'101010101010101'),(5,25,'010101010101010'),(5,30,'101101101101101'),(6,6,'010010010010010'),(6,12,'101010101010101'),(6,18,'010101010101010'),(6,24,'101101101101101'),(6,30,'010010010010010');
/*!40000 ALTER TABLE `ratingdescriptions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-13 21:53:50
