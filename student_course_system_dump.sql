-- MySQL dump 10.13  Distrib 9.0.0, for macos14 (arm64)
--
-- Host: localhost    Database: student_course_system
-- ------------------------------------------------------
-- Server version	9.0.0

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `credits` int NOT NULL,
  `year_offered` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Mathematics I',5,1),(2,'Physics I',5,1),(3,'Chemistry I',5,1),(4,'C Programming',5,1),(5,'English I',5,1),(6,'Data Structures',3,2),(7,'OOP',3,2),(8,'DBMS',3,2),(9,'Operating Systems',3,2),(10,'Computer Networks',3,2),(11,'Java',3,2),(12,'Python',3,2),(13,'Web Development',3,2);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  `enroll_year` int NOT NULL,
  `grade` varchar(2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (1,10,6,2024,NULL,NULL),(2,10,7,2024,'B','PASSED'),(3,10,8,2024,'A','PASSED'),(4,10,9,2024,'B','PASSED'),(5,10,13,2024,'B','PASSED'),(6,1,1,2025,'A','PASSED'),(7,1,2,2025,'B','PASSED'),(8,1,3,2025,'A','PASSED'),(9,1,4,2025,'A','PASSED'),(10,2,1,2025,'A','PASSED'),(11,2,2,2025,'B','PASSED'),(12,2,4,2025,'B','PASSED'),(13,2,5,2025,'C','PASSED'),(14,3,1,2025,'B','PASSED'),(15,3,3,2025,'F','FAILED'),(16,3,4,2025,'C','PASSED'),(17,3,5,2025,'B','PASSED'),(18,8,1,2025,'A','PASSED'),(19,8,2,2025,'B','PASSED'),(20,8,3,2025,'C','PASSED'),(21,8,5,2025,'A','PASSED'),(22,9,2,2025,'B','PASSED'),(23,9,3,2025,'C','PASSED'),(24,9,4,2025,'A','PASSED'),(25,9,5,2025,'A','PASSED'),(26,4,6,2024,'B','PASSED'),(27,4,7,2024,'C','PASSED'),(28,4,8,2024,'B','PASSED'),(29,4,9,2024,'A','PASSED'),(30,4,10,2024,'A','PASSED'),(31,5,6,2024,'A','PASSED'),(32,5,8,2024,'B','PASSED'),(33,5,10,2024,'B','PASSED'),(34,5,11,2024,'A','PASSED'),(35,5,12,2024,'C','PASSED'),(36,6,6,2024,'C','PASSED'),(37,6,7,2024,'B','PASSED'),(38,6,9,2024,'A','PASSED'),(39,6,11,2024,'A','PASSED'),(40,6,13,2024,'B','PASSED'),(41,7,7,2024,'B','PASSED'),(42,7,8,2024,'C','PASSED'),(43,7,10,2024,'A','PASSED'),(44,7,12,2024,'B','PASSED'),(45,7,13,2024,'C','PASSED');
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `year_of_study` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Student A','a@student.com',1),(2,'Student B','b@student.com',1),(3,'Student C','c@student.com',1),(4,'Student D','d@student.com',2),(5,'Student E','e@student.com',2),(6,'Student F','f@student.com',2),(7,'Student G','g@student.com',2),(8,'Student H','h@student.com',1),(9,'Student I','i@student.com',1),(10,'Student J','j@student.com',2);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-25 23:22:41
