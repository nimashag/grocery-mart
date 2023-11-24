CREATE DATABASE  IF NOT EXISTS `grocery_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `grocery_db`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: grocery_db
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `feedback_records`
--

DROP TABLE IF EXISTS `feedback_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_records` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(450) NOT NULL,
  `lastname` varchar(450) NOT NULL,
  `email` varchar(450) NOT NULL,
  `address` varchar(450) NOT NULL,
  `feedback` varchar(450) NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_records`
--

LOCK TABLES `feedback_records` WRITE;
/*!40000 ALTER TABLE `feedback_records` DISABLE KEYS */;
INSERT INTO `feedback_records` VALUES (6,'Sawandi','Rathnayake','sawa123@gmail.com','123,Colombo','Good Experience'),(7,'Nisali','Akarsha','nisali@gmail.com','no.67,Kandy','Convenient'),(8,'Malshi','Siriwardhana','malshi@gmail.com','45A,Thalahena Gardens','Fresh Products');
/*!40000 ALTER TABLE `feedback_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `quantity` varchar(450) NOT NULL,
  `expiredate` date NOT NULL,
  `manufacturedate` date NOT NULL,
  `unitprice` double NOT NULL,
  `category` varchar(450) NOT NULL,
  `image` varchar(450) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Cabbage','50','2025-06-04','2023-04-07',546,'Vagetables','cabbage.jpg'),(2,'Carrots','100','2025-06-04','2023-04-07',987,'Vegetables','carrots.jpg'),(3,'Pineapple','90','2025-06-04','2023-04-07',32,'Fruits','pineapple.png'),(4,'Kotmale Fresh Milk','80','2025-06-04','2023-04-07',832,'Dairy','freshmilk.jpeg'),(5,'Sweet Melon','70','2025-06-04','2023-04-07',546,'Fruits','watermelon.jpeg'),(6,'Coca-Cola','900','2025-06-04','2023-04-07',32,'Beverages','coca-cola.jpg'),(7,'Chicken Sausages','60','2025-06-04','2023-04-07',372,'Meat','sausage.jpeg'),(8,'Cooking Salt','40','2025-06-04','2023-11-06',372,'Cooking Essentials','Salt.jpeg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-28 11:22:29
