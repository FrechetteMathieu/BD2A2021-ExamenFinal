-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: bd2_examenfinal
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `bd2_examenfinal`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bd2_examenfinal` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `bd2_examenfinal`;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) NOT NULL,
  `type_question_id` int(11) NOT NULL,
  `texte_question` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `obligatoire` tinyint(4) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  `pointage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questionnaire_FK` (`questionnaire_id`),
  KEY `type_question_FK` (`type_question_id`),
  CONSTRAINT `questionnaire_FK` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaire` (`id`),
  CONSTRAINT `type_question_FK` FOREIGN KEY (`type_question_id`) REFERENCES `type_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (8,1,1,'Quel est la capitale du Botswana',1,1,5),(9,1,2,'Nommez une des langues officielles du pays',1,2,5);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_question` AFTER INSERT ON `question` FOR EACH ROW begin 

	if (new.pointage is not null) then
	
		update examenfinal_versioncorrige.questionnaire 
		set pointage_calcule = ifnull(pointage_calcule, 0) + new.pointage 
		where id = NEW.questionnaire_id;
	
	end if;
	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_question` AFTER UPDATE ON `question` FOR EACH ROW begin 

	if (new.pointage is not null) then
	
		update questionnaire 
		set pointage_calcule = ifnull(pointage_calcule, 0) + new.pointage 
		where id = NEW.questionnaire_id;
	
	end if;	
	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_delete_question` AFTER DELETE ON `question` FOR EACH ROW begin 
	if (old.pointage is not null) then
	
		update questionnaire 
		set pointage_calcule = ifnull(pointage_calcule, 0) - old.pointage 
		where id = old.questionnaire_id;
	
	end if;	
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `question_choix`
--

DROP TABLE IF EXISTS `question_choix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_choix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `texte_choix` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bonne_reponse` tinyint(4) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_choix_FK` (`question_id`),
  CONSTRAINT `question_choix_FK` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_choix`
--

LOCK TABLES `question_choix` WRITE;
/*!40000 ALTER TABLE `question_choix` DISABLE KEYS */;
INSERT INTO `question_choix` VALUES (5,8,'Molepole',0,1),(6,8,'Gaborone',1,2),(7,8,'Selebi-Phikwe',0,3);
/*!40000 ALTER TABLE `question_choix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_texte_reponse`
--

DROP TABLE IF EXISTS `question_texte_reponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_texte_reponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `reponse` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_texte_reponse_FK` (`question_id`),
  CONSTRAINT `question_texte_reponse_FK` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_texte_reponse`
--

LOCK TABLES `question_texte_reponse` WRITE;
/*!40000 ALTER TABLE `question_texte_reponse` DISABLE KEYS */;
INSERT INTO `question_texte_reponse` VALUES (1,9,'Anglais'),(2,9,'Tswana');
/*!40000 ALTER TABLE `question_texte_reponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire`
--

DROP TABLE IF EXISTS `questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pointage_calcule` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire`
--

LOCK TABLES `questionnaire` WRITE;
/*!40000 ALTER TABLE `questionnaire` DISABLE KEYS */;
INSERT INTO `questionnaire` VALUES (1,'Examen final','Questionnaire créé pour la partie 2 de l\'examen finale',10);
/*!40000 ALTER TABLE `questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_question`
--

DROP TABLE IF EXISTS `type_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_question`
--

LOCK TABLES `type_question` WRITE;
/*!40000 ALTER TABLE `type_question` DISABLE KEYS */;
INSERT INTO `type_question` VALUES (1,'Question à choix'),(2,'Question texte');
/*!40000 ALTER TABLE `type_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'examenfinal_versioncorrige'
--

--
-- Dumping routines for database 'examenfinal_versioncorrige'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-14 22:50:17
