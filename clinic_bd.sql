-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: clinic_bd
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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `appointment_doctor_id` int NOT NULL,
  `appointment_patient_id` int NOT NULL,
  `appointment_time_from` time NOT NULL,
  `appointment_time_to` time NOT NULL,
  `appointment_date` date NOT NULL,
  PRIMARY KEY (`a_id`),
  KEY `fk_doctor_appointments` (`appointment_doctor_id`),
  KEY `fk_patient_appointments` (`appointment_patient_id`),
  CONSTRAINT `fk_doctor_appointments` FOREIGN KEY (`appointment_doctor_id`) REFERENCES `doctors` (`d_id`),
  CONSTRAINT `fk_patient_appointments` FOREIGN KEY (`appointment_patient_id`) REFERENCES `patients` (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,9,4,'15:30:00','15:45:00','2023-12-10'),(2,2,6,'15:30:00','15:45:00','2023-12-10'),(34,5,5,'15:30:00','15:45:00','2023-12-15');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`department_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Терапевтическое отделение'),(2,'Хирургическое отделение'),(3,'Травматологическое отделение'),(4,'Педиатрическое отделение'),(5,'Неврологическое отделение'),(6,'Ортопедическое отделение');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `disease_name` varchar(100) NOT NULL,
  `disease_department_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_disease_department` (`disease_department_id`),
  CONSTRAINT `fk_disease_department` FOREIGN KEY (`disease_department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'Грипп',1),(2,'Сколиоз',2),(3,'Перелом',1),(4,'Астма',1),(6,'Артрит',6),(7,'ОРВИ',3),(8,'Краснуха',3),(9,'Сотрясение мозга',3),(10,'Сколиоз',6),(11,'Гиперлордоз',6),(12,'Краснуха',4),(90,'ОРЗ',1);
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctors` (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `d_name` varchar(45) DEFAULT NULL,
  `d_surname` varchar(45) DEFAULT NULL,
  `d_last_name` varchar(45) DEFAULT NULL,
  `doctor_sex` varchar(6) DEFAULT NULL,
  `doctor_age` int DEFAULT NULL,
  `doctor_cabinet` int DEFAULT NULL,
  `doctor_department_id` int DEFAULT NULL,
  `doctor_schedule_id` int DEFAULT NULL,
  `doctor_specialty` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `fk_doctor_department` (`doctor_department_id`),
  KEY `fk_doctor_schedule` (`doctor_schedule_id`),
  CONSTRAINT `fk_doctor_department` FOREIGN KEY (`doctor_department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (2,'Елена','Петрова','Сергеевна','Жен',35,202,2,1,'Кардиохирург'),(3,'Мария','Козлова','Игоревна','Жен',32,204,3,2,'Хирург-стоматолог'),(4,'Анна','Сидорова','Петровна','Жен',42,102,2,3,'Хирург-травматолог'),(5,'Валентин','Михайлов','Викторович','Муж',38,666,4,4,'Педиатр-ЛОР'),(6,'Андрей','Смирнов','Александрович','Муж',45,103,1,5,'Терапевт'),(7,'Александра','Климова','Владимировна','Жен',50,201,5,6,'Ортодонт'),(9,'Сазан','Алмазов','Петрович','муж',55,555,6,8,'Хирург-ортопед'),(12,'Владимир','Сизов','Викторович','муж',45,237,2,9,'Нейрохирург'),(13,'Константин','Семенов','Игоревич','муж',28,55,4,10,'Педиатр'),(14,'Сергей','Платонов','Георгиевич','муж',25,78,5,11,'Невролог'),(15,'Валерий','Леонтьев','Герогиевич','муж',55,106,4,12,'Неонатолог');
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papers` (
  `paper_id` int NOT NULL AUTO_INCREMENT,
  `paper_patient_id` int NOT NULL,
  `paper_doctor_id` int NOT NULL,
  `paper_date_start` date NOT NULL,
  `paper_date_end` date DEFAULT NULL,
  PRIMARY KEY (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES (1,1,2,'2023-10-15','2023-10-20'),(2,2,13,'2023-01-05','2023-01-07'),(3,3,5,'2023-01-01','2023-10-01');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_disease`
--

DROP TABLE IF EXISTS `patient_disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_disease` (
  `patient_id` int NOT NULL,
  `disease_id` int NOT NULL,
  PRIMARY KEY (`patient_id`,`disease_id`),
  KEY `disease_id` (`disease_id`),
  CONSTRAINT `patient_disease_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`p_id`) ON DELETE CASCADE,
  CONSTRAINT `patient_disease_ibfk_2` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_disease`
--

LOCK TABLES `patient_disease` WRITE;
/*!40000 ALTER TABLE `patient_disease` DISABLE KEYS */;
INSERT INTO `patient_disease` VALUES (5,2),(7,2),(2,3),(5,3),(7,3),(3,4),(2,6),(1,7),(1,8),(3,8),(5,8),(7,8),(1,9),(2,9);
/*!40000 ALTER TABLE `patient_disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(45) DEFAULT NULL,
  `p_surname` varchar(45) DEFAULT NULL,
  `p_last_name` varchar(45) DEFAULT NULL,
  `patient_sex` varchar(6) DEFAULT NULL,
  `patient_age` int DEFAULT NULL,
  `patient_district` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Алексей','Сидоров','Петрович','Муж',28,'Центральный'),(2,'Ольга','Иванова','Андреевна','Жен',40,'Северный'),(3,'Дмитрий','Павлов','Вячеславович','Муж',55,'Западный'),(4,'Екатерина','Смирнова','Игоревна','Жен',22,'Восточный'),(5,'Вера','Климова','Владимировна','Жен',50,'Южный'),(6,'Александра','Михальченко','Викторовна','Жен',27,'Западный'),(7,'Иван','Смирнов','Александрович','Муж',34,'Приморский'),(12,'Алтынбек','Арбидолов','','Муж',18,'Красносельский'),(14,'Василий','Пупкин','','Муж',55,'Приморский');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int NOT NULL AUTO_INCREMENT,
  `monday` time DEFAULT NULL,
  `tuesday` time DEFAULT NULL,
  `wednesday` time DEFAULT NULL,
  `thursday` time DEFAULT NULL,
  `friday` time DEFAULT NULL,
  `saturday` time DEFAULT NULL,
  `sunday` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (2,NULL,'08:00:00','15:00:00',NULL,'15:00:00','21:00:00',NULL),(3,NULL,NULL,'08:00:00',NULL,'21:00:00','15:00:00',NULL),(4,NULL,NULL,NULL,'21:00:00',NULL,NULL,NULL),(5,NULL,'08:00:00','21:00:00',NULL,'08:00:00','08:00:00','08:00:00'),(6,NULL,'21:00:00',NULL,NULL,NULL,'08:00:00',NULL),(8,NULL,'15:00:00','21:00:00',NULL,NULL,NULL,NULL),(9,NULL,'00:00:00','15:00:00','21:00:00',NULL,NULL,NULL),(10,NULL,NULL,NULL,'15:00:00','21:00:00',NULL,NULL),(11,NULL,NULL,NULL,NULL,'15:00:00','21:00:00',NULL),(12,NULL,NULL,NULL,NULL,NULL,'15:00:00','21:00:00'),(13,NULL,NULL,NULL,NULL,NULL,NULL,'15:00:00'),(14,NULL,NULL,NULL,'15:00:00','21:00:00','08:00:00',NULL),(15,NULL,NULL,'15:00:00',NULL,'21:00:00','08:00:00',NULL),(16,NULL,'15:00:00',NULL,NULL,'21:00:00','08:00:00',NULL),(45,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00'),(46,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00'),(47,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00'),(48,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00'),(49,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00'),(50,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00'),(51,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00'),(52,'08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00','08:00:00');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-24 14:36:31
