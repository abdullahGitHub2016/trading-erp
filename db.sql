-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: trading_erp
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
INSERT INTO `cache` VALUES ('laravel-cache-678685e8c14b40cf61075efc3a2c5ff0','i:1;',1767242159),('laravel-cache-678685e8c14b40cf61075efc3a2c5ff0:timer','i:1767242159;',1767242159);
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(2,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(3,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(4,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(5,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(6,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(7,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(8,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(9,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(10,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(11,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(12,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(13,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(14,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(15,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(16,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(17,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(18,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(19,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(20,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(21,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(22,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(23,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(24,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(25,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(26,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(27,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(28,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(29,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(30,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(31,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(32,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(33,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(34,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(35,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(36,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(37,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(38,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(39,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(40,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(41,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(42,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(43,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(44,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(45,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(46,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(47,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(48,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(49,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(50,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(51,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(52,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(53,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(54,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(55,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(56,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(57,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(58,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(59,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(60,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(61,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(62,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(63,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(64,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(65,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(66,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(67,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(68,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(69,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(70,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(71,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(72,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(73,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(74,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(75,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(76,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(77,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(78,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(79,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(80,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(81,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(82,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(83,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(84,'Electronics','2025-12-30 07:03:15','2025-12-30 07:03:15'),(85,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(86,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(87,'Furniture','2025-12-30 07:03:15','2025-12-30 07:03:15'),(88,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(89,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(90,'Groceries','2025-12-30 07:03:15','2025-12-30 07:03:15'),(91,'Industrial Tools','2025-12-30 07:03:15','2025-12-30 07:03:15'),(92,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(93,'Office Supplies','2025-12-30 07:03:15','2025-12-30 07:03:15'),(94,'Home Appliances','2025-12-30 07:03:15','2025-12-30 07:03:15'),(95,'Industrial Tools','2025-12-30 07:03:16','2025-12-30 07:03:16'),(96,'Groceries','2025-12-30 07:03:16','2025-12-30 07:03:16'),(97,'Electronics','2025-12-30 07:03:16','2025-12-30 07:03:16'),(98,'Groceries','2025-12-30 07:03:16','2025-12-30 07:03:16'),(99,'Office Supplies','2025-12-30 07:03:16','2025-12-30 07:03:16'),(100,'Home Appliances','2025-12-30 07:03:16','2025-12-30 07:03:16'),(101,'Furniture','2025-12-30 07:03:16','2025-12-30 07:03:16'),(102,'Home Appliances','2025-12-30 07:03:16','2025-12-30 07:03:16'),(103,'Electronics','2025-12-30 07:03:16','2025-12-30 07:03:16'),(104,'Industrial Tools','2025-12-30 07:03:16','2025-12-30 07:03:16'),(105,'Furniture','2025-12-30 07:03:16','2025-12-30 07:03:16'),(106,'Furniture','2025-12-30 07:03:16','2025-12-30 07:03:16'),(107,'Industrial Tools','2025-12-30 07:03:16','2025-12-30 07:03:16'),(108,'Electronics','2025-12-30 07:03:16','2025-12-30 07:03:16'),(109,'Industrial Tools','2025-12-30 07:03:16','2025-12-30 07:03:16'),(110,'Home Appliances','2025-12-30 07:03:16','2025-12-30 07:03:16'),(111,'Industrial Tools','2025-12-30 07:03:16','2025-12-30 07:03:16'),(112,'Office Supplies','2025-12-30 07:03:16','2025-12-30 07:03:16'),(113,'Home Appliances','2025-12-30 07:03:16','2025-12-30 07:03:16'),(114,'Electronics','2025-12-30 07:06:05','2025-12-30 07:06:05'),(115,'Furniture','2025-12-30 07:06:05','2025-12-30 07:06:05'),(116,'Stationery','2025-12-30 07:06:05','2025-12-30 07:06:05'),(117,'Groceries','2025-12-30 07:06:05','2025-12-30 07:06:05'),(118,'Furniture','2025-12-30 07:06:05','2025-12-30 07:06:05'),(119,'Furniture','2025-12-30 07:06:05','2025-12-30 07:06:05'),(120,'Home Appliances','2025-12-30 07:06:05','2025-12-30 07:06:05'),(121,'Electronics','2025-12-30 07:06:05','2025-12-30 07:06:05'),(122,'Electronics','2025-12-30 07:06:05','2025-12-30 07:06:05'),(123,'Home Appliances','2025-12-30 07:06:05','2025-12-30 07:06:05'),(124,'Furniture','2025-12-30 07:06:05','2025-12-30 07:06:05'),(125,'Home Appliances','2025-12-30 07:06:05','2025-12-30 07:06:05'),(126,'Home Appliances','2025-12-30 07:06:05','2025-12-30 07:06:05'),(127,'Groceries','2025-12-30 07:06:05','2025-12-30 07:06:05'),(128,'Groceries','2025-12-30 07:06:05','2025-12-30 07:06:05'),(129,'Furniture','2025-12-30 07:06:05','2025-12-30 07:06:05'),(130,'Furniture','2025-12-30 07:06:05','2025-12-30 07:06:05'),(131,'Home Appliances','2025-12-30 07:06:05','2025-12-30 07:06:05'),(132,'Electronics','2025-12-30 07:06:05','2025-12-30 07:06:05'),(133,'Groceries','2025-12-30 07:06:05','2025-12-30 07:06:05'),(134,'Office Supplies','2025-12-30 07:06:06','2025-12-30 07:06:06'),(135,'Groceries','2025-12-30 07:06:06','2025-12-30 07:06:06'),(136,'Groceries','2025-12-30 07:06:06','2025-12-30 07:06:06'),(137,'Groceries','2025-12-30 07:06:06','2025-12-30 07:06:06');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chart_of_accounts`
--

DROP TABLE IF EXISTS `chart_of_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chart_of_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('asset','liability','equity','revenue','expense') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chart_of_accounts_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chart_of_accounts`
--

LOCK TABLES `chart_of_accounts` WRITE;
/*!40000 ALTER TABLE `chart_of_accounts` DISABLE KEYS */;
INSERT INTO `chart_of_accounts` VALUES (1,'Cash on Hand','1000','asset','2025-12-30 07:03:14','2025-12-30 07:03:14'),(2,'Bank Account','1010','asset','2025-12-30 07:03:14','2025-12-30 07:03:14'),(3,'Accounts Receivable','1200','asset','2025-12-30 07:03:14','2025-12-30 07:03:14'),(4,'Inventory Asset','1300','asset','2025-12-30 07:03:14','2025-12-30 07:03:14'),(5,'Accounts Payable','2000','liability','2025-12-30 07:03:14','2025-12-30 07:03:14'),(6,'Sales Tax Payable','2100','liability','2025-12-30 07:03:14','2025-12-30 07:03:14'),(7,'Owner Equity','3000','equity','2025-12-30 07:03:14','2025-12-30 07:03:14'),(8,'Retained Earnings','3100','equity','2025-12-30 07:03:14','2025-12-30 07:03:14'),(9,'Sales Revenue','4000','revenue','2025-12-30 07:03:14','2025-12-30 07:03:14'),(10,'Service Income','4100','revenue','2025-12-30 07:03:14','2025-12-30 07:03:14'),(11,'Cost of Goods Sold (COGS)','5000','expense','2025-12-30 07:03:14','2025-12-30 07:03:14'),(12,'Office Expenses','5100','expense','2025-12-30 07:03:14','2025-12-30 07:03:14'),(13,'Salary Expense','5200','expense','2025-12-30 07:03:14','2025-12-30 07:03:14'),(14,'Rent Expense','5300','expense','2025-12-30 07:03:15','2025-12-30 07:03:15'),(15,'Preety Cash','1001','equity','2026-01-03 10:03:38','2026-01-03 10:03:38');
/*!40000 ALTER TABLE `chart_of_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `opening_balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `current_balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  KEY `customers_name_index` (`name`),
  KEY `customers_phone_index` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Hahn-Price','leatha39@example.net','(864) 965-9375','303 Armani Plaza\nSchmittmouth, OK 99895-4228',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(2,'Lebsack, Ernser and Herman','madie.wintheiser@example.org','+1-615-289-0354','23730 Zboncak Heights\nKochmouth, ID 28097-1101',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(3,'Bruen-Pagac','emorar@example.net','+1-364-987-9532','58452 Osinski Summit Suite 146\nLaylashire, VA 65845',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(4,'Kovacek and Sons','volkman.leanna@example.net','(860) 429-8012','24742 Cruickshank Skyway Suite 981\nLake Adolfo, OK 61716-7066',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(5,'Kemmer, Batz and Harvey','anastasia.murray@example.org','1-770-291-7182','779 Miguel Haven\nHelmerburgh, AL 71356-2930',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(6,'Jakubowski, Bergstrom and Powlowski','ygorczany@example.net','(541) 322-2574','2991 Korey Crossing\nLake Alessandrafurt, SD 95340-4611',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(7,'Schneider, Leffler and Buckridge','muller.elliott@example.net','(864) 477-5158','5656 Maximo Prairie Suite 249\nWizaland, NM 90905-1229',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(8,'Terry, Schowalter and Medhurst','brooks.ankunding@example.org','+1-985-414-6931','9667 Keely Crossing\nSouth Easterland, AZ 53157-3933',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(9,'Schmitt, Cruickshank and Rowe','yvonne.douglas@example.com','319-513-8743','6191 Jordon Drive Suite 924\nUbaldoville, NY 44544',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(10,'Lemke-Zemlak','althea.barton@example.net','314-464-9251','58493 Greenfelder Flat Apt. 110\nWest Ramon, UT 09400',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(11,'Johnston Inc','axel59@example.net','+1-469-240-8383','10134 Claudia Fall Apt. 933\nRoryfort, NC 84554',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(12,'Mraz, Russel and Hamill','wiegand.gertrude@example.net','+13515439459','43299 O\'Hara Lodge Suite 693\nPort Norval, MD 98566',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(13,'Hoeger PLC','laurie.tremblay@example.com','+14706370120','9431 Fidel Lodge Apt. 794\nStarkshire, WI 71001',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(14,'Rippin, Carroll and Torp','katrine22@example.com','469-596-3788','8810 Murl Squares Suite 284\nLindgrenmouth, CO 27876-1188',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(15,'Kuhic, Dibbert and Koss','urban.dare@example.org','615.544.8621','54626 Champlin Course\nWeberview, TX 07706',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(16,'Corkery-Wilkinson','lcollier@example.org','(209) 615-0611','45700 Bernier Lodge Suite 560\nNorth Aniballand, GA 02917',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(17,'McGlynn Group','shields.lupe@example.org','+1-463-831-9628','50796 Wava Way Suite 867\nCormiermouth, MS 04420-3995',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(18,'Cruickshank Inc','gabrielle.watsica@example.net','+1-616-252-1636','1608 Jacquelyn Club\nSouth Koryport, NV 35715',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(19,'Hayes, Kunde and Robel','glenda24@example.org','+1 (534) 547-4329','48545 Adams Ridge\nEast Izaiah, HI 57303-4667',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(20,'Schamberger, Hansen and Kertzmann','ubechtelar@example.com','(614) 210-1864','6314 Lenny Trail Apt. 547\nJaydenville, KY 43973-2703',0.00,0.00,1,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(21,'Hayes, Green and Morar','haleigh.pagac@example.net','1-442-759-9758','70328 Roberts Isle\nEast Kathrynetown, OH 37165',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(22,'Pagac, Steuber and Stokes','america53@example.com','256-866-5167','806 Littel Meadows Suite 671\nDaphneeberg, MT 08417-9836',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(23,'Price-Satterfield','cortney.homenick@example.net','+1-540-527-7240','803 Keely Road Apt. 302\nEast Dorotheatown, KS 34690-1641',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(24,'Kub and Sons','benny.borer@example.net','+1.734.332.8514','43368 Merl Cape Suite 837\nPort Bell, KY 02959-9720',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(25,'Prohaska, Donnelly and Toy','blang@example.com','(360) 912-5360','9448 Oberbrunner Park\nSouth Hiram, TX 36913-4593',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(26,'Prohaska, Price and Beer','doyle.lenna@example.net','1-252-281-2913','68214 Reinhold Park\nMosciskiville, PA 57310-8940',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(27,'Rempel-Kutch','joanie.mcglynn@example.org','(972) 447-8432','5933 Zulauf Knoll Suite 584\nKunzeborough, ND 74271-6635',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(28,'Rosenbaum-Ankunding','eprohaska@example.org','413.309.9845','41099 Mozell Green Suite 463\nO\'Harachester, OK 74324',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(29,'Sanford-Kuhic','hglover@example.net','1-332-641-5524','40362 Dominic Underpass Apt. 910\nChamplinmouth, NJ 60299',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05'),(30,'Schultz, Lockman and Bergnaum','hdickens@example.net','(973) 417-5498','10111 Veum Drive Apt. 576\nGiovannafort, NV 67921-9860',0.00,0.00,1,'2025-12-30 07:06:05','2025-12-30 07:06:05');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `journalable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `journalable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journals_journalable_type_journalable_id_index` (`journalable_type`,`journalable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,'2026-01-01','INV-001','Direct Cash Sale','App\\Models\\Sale',1,'2026-01-01 09:35:47','2026-01-01 09:35:47'),(8,'2026-01-01','INV-D05980B0','Updated Sale - INV-D05980B0','App\\Models\\Sale',36,'2026-01-01 05:05:44','2026-01-01 05:15:02'),(10,'2026-01-03','INV-D4E8BD2C','Updated Sale - INV-D4E8BD2C','App\\Models\\Sale',38,'2026-01-03 04:38:03','2026-01-03 04:38:07'),(15,'2026-01-03','PO-1767429911','Purchase Entry - PO-1767429911','App\\Models\\Purchase',12,'2026-01-03 08:48:40','2026-01-03 08:48:40'),(17,'2026-01-03','PO-1767430203','Purchase Entry - PO-1767430203','App\\Models\\Purchase',13,'2026-01-03 08:50:27','2026-01-03 08:50:27');
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgers`
--

DROP TABLE IF EXISTS `ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `journal_id` bigint unsigned NOT NULL,
  `chart_of_account_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_id` bigint DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `debit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00',
  `transaction_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ledgers_chart_of_account_id_foreign` (`chart_of_account_id`),
  CONSTRAINT `ledgers_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgers`
--

LOCK TABLES `ledgers` WRITE;
/*!40000 ALTER TABLE `ledgers` DISABLE KEYS */;
INSERT INTO `ledgers` VALUES (1,0,1,'App\\Models\\Sale',1,'Cash received for INV-001',500.00,0.00,'2026-01-01','2026-01-01 09:35:47','2026-01-01 09:35:47'),(2,0,9,'App\\Models\\Sale',1,'Revenue from INV-001',0.00,500.00,'2026-01-01','2026-01-01 09:35:48','2026-01-01 09:35:48'),(3,0,4,'App\\Models\\Purchase',1,'Stock received PO-99',3000.00,0.00,'2026-01-01','2026-01-01 09:35:54','2026-01-01 09:35:54'),(4,0,1,'App\\Models\\Purchase',1,'Paid for PO-99',0.00,3000.00,'2026-01-01','2026-01-01 09:35:55','2026-01-01 09:35:55'),(13,8,1,'App\\Models\\Journal',8,'Updated Cash for INV-D05980B0',174.98,0.00,'2026-01-01','2026-01-01 05:15:14','2026-01-01 05:15:14'),(14,8,9,'App\\Models\\Journal',8,'Updated Revenue for INV-D05980B0',0.00,174.98,'2026-01-01','2026-01-01 05:15:14','2026-01-01 05:15:14'),(15,9,1,'App\\Models\\Journal',9,'Cash received for INV-663881BD',0.00,0.00,'2026-01-01','2026-01-01 11:18:09','2026-01-01 11:18:09'),(16,9,9,'App\\Models\\Journal',9,'Revenue from INV-663881BD',0.00,0.00,'2026-01-01','2026-01-01 11:18:09','2026-01-01 11:18:09'),(17,9,1,'App\\Models\\Journal',9,'Cash received for INV-663881BD',0.00,0.00,'2026-01-01','2026-01-01 11:18:09','2026-01-01 11:18:09'),(18,9,4,'App\\Models\\Journal',9,'Inventory reduction for INV-663881BD',0.00,0.00,'2026-01-01','2026-01-01 11:18:09','2026-01-01 11:18:09'),(27,10,1,'App\\Models\\Journal',10,'Updated Cash for INV-D4E8BD2C',108.88,0.00,'2026-01-03','2026-01-03 04:39:29','2026-01-03 04:39:29'),(28,10,9,'App\\Models\\Journal',10,'Updated Revenue for INV-D4E8BD2C',0.00,108.88,'2026-01-03','2026-01-03 04:39:29','2026-01-03 04:39:29'),(29,12,4,NULL,NULL,NULL,450.00,0.00,'2026-01-03','2026-01-03 08:32:35','2026-01-03 08:32:35'),(30,12,1,NULL,NULL,NULL,0.00,450.00,'2026-01-03','2026-01-03 08:32:35','2026-01-03 08:32:35'),(31,13,4,NULL,NULL,NULL,45.50,0.00,'2026-01-03','2026-01-03 08:45:11','2026-01-03 08:45:11'),(32,13,1,NULL,NULL,NULL,0.00,45.50,'2026-01-03','2026-01-03 08:45:11','2026-01-03 08:45:11'),(33,14,4,NULL,NULL,NULL,455.00,0.00,'2026-01-03','2026-01-03 08:45:49','2026-01-03 08:45:49'),(34,14,1,NULL,NULL,NULL,0.00,455.00,'2026-01-03','2026-01-03 08:45:49','2026-01-03 08:45:49'),(35,15,4,NULL,NULL,NULL,821.00,0.00,'2026-01-03','2026-01-03 08:48:40','2026-01-03 08:48:40'),(36,15,1,NULL,NULL,NULL,0.00,821.00,'2026-01-03','2026-01-03 08:48:40','2026-01-03 08:48:40'),(37,16,4,NULL,NULL,NULL,150.74,0.00,'2026-01-03','2026-01-03 08:50:03','2026-01-03 08:50:03'),(38,16,1,NULL,NULL,NULL,0.00,150.74,'2026-01-03','2026-01-03 08:50:03','2026-01-03 08:50:03'),(39,17,4,NULL,NULL,NULL,123.55,0.00,'2026-01-03','2026-01-03 08:50:27','2026-01-03 08:50:27'),(40,17,1,NULL,NULL,NULL,0.00,123.55,'2026-01-03','2026-01-03 08:50:27','2026-01-03 08:50:27'),(49,18,1,'App\\Models\\Journal',18,'Updated Cash for INV-4AE1C96C',37.47,0.00,'2026-01-03','2026-01-03 09:12:17','2026-01-03 09:12:17'),(50,18,9,'App\\Models\\Journal',18,'Updated Revenue for INV-4AE1C96C',0.00,37.47,'2026-01-03','2026-01-03 09:12:17','2026-01-03 09:12:17');
/*!40000 ALTER TABLE `ledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_08_14_170933_add_two_factor_columns_to_users_table',1),(5,'2025_12_27_104408_create_permission_tables',1),(6,'2025_12_27_110000_create_categories_table',1),(7,'2025_12_27_110001_create_units_table',1),(8,'2025_12_27_115046_create_products_table',1),(9,'2025_12_29_074631_create_suppliers_table',1),(10,'2025_12_29_074632_create_purchases_table',1),(11,'2025_12_29_075316_create_purchase_items_table',1),(12,'2025_12_30_095644_create_customers_table',1),(13,'2025_12_30_095645_create_sales_table',1),(14,'2025_12_30_095646_create_sale_items_table',1),(15,'2025_12_30_095647_create_chart_of_accounts_table',1),(16,'2025_12_30_095650_create_ledgers_table',1),(17,'2025_12_30_132125_add_stock_to_products_table',2),(18,'2026_01_01_065355_create_journals_table',3),(19,'2026_01_01_104907_make_ledger_references_nullable',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1),(1,'App\\Models\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'product.view','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(2,'product.create','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(3,'product.update','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(4,'product.delete','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(5,'stock.view','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(6,'purchase.view','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(7,'purchase.create','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(8,'purchase.update','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(9,'purchase.delete','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(10,'sale.view','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(11,'sale.create','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(12,'sale.update','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(13,'sale.delete','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(14,'report.stock','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(15,'report.sales','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(16,'report.purchase','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(17,'report.profit','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(18,'user.view','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(19,'user.create','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(20,'user.update','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(21,'user.delete','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(22,'role.manage','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(23,'supplier.view','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(24,'supplier.create','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(25,'supplier.update','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(26,'supplier.delete','web','2025-12-30 06:48:24','2025-12-30 06:48:24');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `unit_id` bigint unsigned NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `sale_price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_unit_id_foreign` (`unit_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'consequatur','PROD-9789',11,7,42.44,15.79,21,'2025-12-30 07:03:15','2026-01-03 09:12:28'),(2,'vel','PROD-2201',12,8,49.66,128.72,94,'2025-12-30 07:03:15','2026-01-03 04:39:29'),(3,'aut','PROD-9582',13,9,12.50,87.16,44,'2025-12-30 07:03:15','2026-01-03 09:06:44'),(4,'voluptas','PROD-7535',14,10,32.67,157.39,53,'2025-12-30 07:03:15','2026-01-01 04:44:29'),(5,'inventore','PROD-2528',15,11,32.63,143.82,94,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(6,'consequuntur','PROD-6133',16,12,8.88,160.14,26,'2025-12-30 07:03:15','2026-01-03 04:39:29'),(7,'quas','PROD-4044',17,13,29.41,116.28,42,'2025-12-30 07:03:15','2026-01-03 08:50:27'),(8,'rerum','PROD-0079',18,14,28.52,21.68,16,'2025-12-30 07:03:15','2026-01-03 09:12:28'),(9,'consectetur','PROD-0678',19,15,85.59,172.98,34,'2025-12-30 07:03:15','2026-01-03 09:12:17'),(10,'quo','PROD-4807',20,16,39.73,91.31,25,'2025-12-30 07:03:15','2026-01-01 05:15:14'),(11,'aut','PROD-1096',21,17,69.02,126.11,16,'2025-12-30 07:03:15','2026-01-03 04:39:29'),(12,'maxime','PROD-2498',22,18,27.78,142.45,86,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(13,'quo','PROD-0129',23,19,71.05,24.62,97,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(14,'voluptatem','PROD-3462',24,20,31.38,79.63,40,'2025-12-30 07:03:15','2026-01-03 08:50:27'),(15,'corrupti','PROD-8530',25,21,36.60,29.54,76,'2025-12-30 07:03:15','2026-01-03 08:48:40'),(16,'dolor','PROD-2411',26,22,7.17,177.61,29,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(17,'et','PROD-8588',27,23,5.56,70.82,28,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(18,'sunt','PROD-0596',28,24,45.50,18.82,52,'2025-12-30 07:03:15','2026-01-03 08:48:40'),(19,'velit','PROD-3646',29,25,27.19,127.78,27,'2025-12-30 07:03:15','2026-01-03 08:50:27'),(20,'architecto','PROD-1067',30,26,27.66,175.69,92,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(21,'id','PROD-7667',31,27,34.21,187.70,96,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(22,'qui','PROD-1703',32,28,15.16,49.33,11,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(23,'inventore','PROD-2792',33,29,5.33,195.20,29,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(24,'qui','PROD-2123',34,30,28.28,195.99,13,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(25,'dignissimos','PROD-5507',35,31,35.62,130.86,61,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(26,'et','PROD-5702',36,32,47.53,180.78,74,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(27,'nam','PROD-1596',37,33,32.59,86.13,86,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(28,'cum','PROD-7014',38,34,20.76,13.92,15,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(29,'nemo','PROD-4701',39,35,75.99,43.61,80,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(30,'quos','PROD-7173',40,36,16.99,106.02,76,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(31,'est','PROD-6058',41,37,21.91,88.48,36,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(32,'magni','PROD-7871',42,38,29.66,152.36,34,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(33,'porro','PROD-5877',43,39,66.38,28.73,52,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(34,'omnis','PROD-2924',44,40,21.03,27.90,60,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(35,'dicta','PROD-5681',45,41,57.11,165.65,44,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(36,'libero','PROD-6479',46,42,31.35,195.35,28,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(37,'at','PROD-2146',47,43,38.90,48.44,88,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(38,'qui','PROD-3649',48,44,91.08,20.92,77,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(39,'molestiae','PROD-8103',49,45,37.57,96.63,18,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(40,'reiciendis','PROD-8416',50,46,88.52,167.60,34,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(41,'ipsa','PROD-8328',51,47,62.15,90.32,13,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(42,'consequatur','PROD-7094',52,48,28.86,173.71,46,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(43,'mollitia','PROD-2762',53,49,61.60,187.43,90,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(44,'facilis','PROD-5814',54,50,72.38,10.89,31,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(45,'corporis','PROD-8507',55,51,30.84,94.46,57,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(46,'in','PROD-5521',56,52,28.47,115.87,90,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(47,'ipsa','PROD-0132',57,53,13.88,135.43,90,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(48,'quos','PROD-2730',58,54,12.49,88.79,78,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(49,'est','PROD-7090',59,55,38.83,169.60,21,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(50,'laborum','PROD-2270',60,56,43.10,22.31,41,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(51,'cupiditate','PROD-6972',61,57,73.80,97.31,41,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(52,'animi','PROD-6930',62,58,90.26,165.23,75,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(53,'ad','PROD-6563',63,59,72.20,29.47,59,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(54,'et','PROD-4324',64,60,78.48,79.32,61,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(55,'commodi','PROD-4648',65,61,16.64,141.94,28,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(56,'nihil','PROD-8762',66,62,62.09,19.95,38,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(57,'sit','PROD-0659',67,63,27.99,119.48,99,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(58,'quos','PROD-2156',68,64,63.70,178.99,95,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(59,'odio','PROD-5275',69,65,62.72,179.56,79,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(60,'ipsam','PROD-7456',70,66,29.02,130.76,11,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(61,'iusto','PROD-9892',71,67,20.95,102.23,80,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(62,'suscipit','PROD-7482',72,68,34.65,78.10,84,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(63,'eos','PROD-4270',73,69,89.46,130.96,81,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(64,'ea','PROD-5862',74,70,26.56,60.33,51,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(65,'vitae','PROD-9572',75,71,83.71,105.95,95,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(66,'animi','PROD-3273',76,72,59.79,131.96,40,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(67,'possimus','PROD-4258',77,73,31.04,161.00,87,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(68,'voluptas','PROD-2614',78,74,52.36,156.01,33,'2025-12-30 07:03:15','2026-01-01 04:44:29'),(69,'aut','PROD-8907',79,75,15.37,186.98,77,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(70,'consequuntur','PROD-9175',80,76,12.98,68.99,96,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(71,'ducimus','PROD-3574',81,77,13.90,181.71,54,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(72,'sed','PROD-9289',82,78,69.41,185.08,67,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(73,'quod','PROD-0366',83,79,65.55,82.56,69,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(74,'occaecati','PROD-1293',84,80,94.83,170.20,47,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(75,'ab','PROD-2515',85,81,16.37,63.78,16,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(76,'quam','PROD-0041',86,82,14.15,133.11,20,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(77,'ipsa','PROD-0045',87,83,98.96,91.88,41,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(78,'velit','PROD-5305',88,84,19.65,71.43,47,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(79,'ut','PROD-5894',89,85,62.68,73.12,12,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(80,'autem','PROD-6951',90,86,48.80,148.84,91,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(81,'assumenda','PROD-3373',91,87,8.41,162.22,46,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(82,'adipisci','PROD-6263',92,88,91.37,150.63,38,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(83,'eos','PROD-7161',93,89,98.51,39.80,44,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(84,'quis','PROD-2396',94,90,41.94,89.85,94,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(85,'nam','PROD-9290',95,91,74.01,132.87,58,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(86,'hic','PROD-7318',96,92,10.01,17.23,88,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(87,'nam','PROD-4623',97,93,36.38,184.27,77,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(88,'itaque','PROD-6726',98,94,29.53,93.20,18,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(89,'earum','PROD-8071',99,95,18.15,13.85,33,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(90,'nihil','PROD-0281',100,96,62.69,158.74,11,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(91,'ipsam','PROD-6979',101,97,90.40,14.80,36,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(92,'ea','PROD-0776',102,98,54.30,198.70,49,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(93,'rerum','PROD-3303',103,99,27.81,119.69,35,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(94,'perspiciatis','PROD-1238',104,100,20.61,43.73,17,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(95,'beatae','PROD-0346',105,101,85.01,187.18,63,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(96,'nemo','PROD-4395',106,102,85.36,163.20,73,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(97,'est','PROD-0153',107,103,7.01,22.92,75,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(98,'veritatis','PROD-3587',108,104,45.59,197.48,54,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(99,'aut','PROD-6170',109,105,25.59,188.24,36,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(100,'similique','PROD-6178',110,106,89.94,88.93,100,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(101,'enim','PROD-2441',111,107,67.21,63.31,17,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(102,'nisi','PROD-3712',112,108,73.16,160.10,50,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(103,'exercitationem','PROD-5613',113,109,30.57,94.75,98,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(104,'Sample Product','PROD-001',102,60,100.00,150.00,59,'2025-12-30 07:03:46','2025-12-30 07:03:46'),(105,'repellendus','PROD-6005',118,110,99.83,192.81,83,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(106,'voluptatem','PROD-0090',119,111,85.70,192.73,44,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(107,'iusto','PROD-9100',120,112,33.00,139.73,52,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(108,'non','PROD-9359',121,113,56.17,83.61,27,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(109,'voluptatibus','PROD-6269',122,114,10.27,50.98,63,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(110,'fugiat','PROD-6053',123,115,79.48,44.65,42,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(111,'inventore','PROD-2087',124,116,82.63,65.03,13,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(112,'sed','PROD-2677',125,117,18.83,135.65,18,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(113,'accusantium','PROD-0063',126,118,20.63,68.42,41,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(114,'vel','PROD-1337',127,119,94.42,159.91,53,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(115,'quo','PROD-4500',128,120,40.62,54.51,40,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(116,'nam','PROD-1435',129,121,85.83,143.13,34,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(117,'repudiandae','PROD-5937',130,122,73.45,160.48,37,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(118,'reprehenderit','PROD-5197',131,123,82.55,176.79,75,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(119,'eos','PROD-9517',132,124,50.51,41.13,74,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(120,'sed','PROD-9655',133,125,65.74,24.31,42,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(121,'qui','PROD-6570',134,126,86.91,127.22,69,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(122,'quia','PROD-9715',135,127,60.62,18.42,28,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(123,'saepe','PROD-6629',136,128,46.55,30.79,15,'2025-12-30 07:06:06','2025-12-30 07:06:06'),(124,'deleniti','PROD-7309',137,129,76.49,18.16,73,'2025-12-30 07:06:06','2025-12-30 07:06:06');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_items`
--

DROP TABLE IF EXISTS `purchase_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `subtotal` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_items_purchase_id_foreign` (`purchase_id`),
  KEY `purchase_items_product_id_foreign` (`product_id`),
  CONSTRAINT `purchase_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `purchase_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_items`
--

LOCK TABLES `purchase_items` WRITE;
/*!40000 ALTER TABLE `purchase_items` DISABLE KEYS */;
INSERT INTO `purchase_items` VALUES (4,12,18,10,45.50,455.00,'2026-01-03 08:48:40','2026-01-03 08:48:40'),(5,12,15,10,36.60,366.00,'2026-01-03 08:48:40','2026-01-03 08:48:40'),(9,13,7,1,29.41,29.41,'2026-01-03 08:50:27','2026-01-03 08:50:27'),(10,13,14,3,31.38,94.14,'2026-01-03 08:50:27','2026-01-03 08:50:27');
/*!40000 ALTER TABLE `purchase_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `purchase_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` bigint unsigned NOT NULL,
  `purchase_date` date NOT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `status` enum('pending','received','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_by` bigint unsigned NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `purchases_purchase_no_unique` (`purchase_no`),
  KEY `purchases_supplier_id_foreign` (`supplier_id`),
  KEY `purchases_created_by_foreign` (`created_by`),
  CONSTRAINT `purchases_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `purchases_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (12,'PO-1767429911',1,'2026-01-03',821.00,'received',1,NULL,'2026-01-03 08:45:11','2026-01-03 08:48:40'),(13,'PO-1767430203',1,'2026-01-03',123.55,'received',1,NULL,'2026-01-03 08:50:03','2026-01-03 08:50:27');
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(1,2),(2,2),(3,2),(5,2),(6,2),(7,2),(8,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(23,2),(24,2),(25,2),(26,2),(1,3),(5,3),(1,4),(10,4),(11,4),(10,5),(14,5),(15,5),(16,5),(17,5),(23,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','web','2025-12-30 12:44:12','2025-12-30 12:44:12'),(2,'Manager','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(3,'Storekeeper','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(4,'Sales','web','2025-12-30 06:48:24','2025-12-30 06:48:24'),(5,'Accountant','web','2025-12-30 06:48:24','2025-12-30 06:48:24');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `item_total` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_items_sale_id_foreign` (`sale_id`),
  KEY `sale_items_product_id_foreign` (`product_id`),
  CONSTRAINT `sale_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `sale_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_items`
--

LOCK TABLES `sale_items` WRITE;
/*!40000 ALTER TABLE `sale_items` DISABLE KEYS */;
INSERT INTO `sale_items` VALUES (1,1,51,9,1701.25,15311.25,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(2,1,52,9,1933.75,17403.75,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(3,1,53,5,1260.51,6302.55,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(4,2,54,8,309.51,2476.08,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(5,2,55,1,1809.01,1809.01,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(6,2,56,7,813.40,5693.80,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(7,2,57,8,881.12,7048.96,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(8,2,58,8,1725.58,13804.64,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(9,3,59,8,1605.65,12845.20,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(10,3,60,2,1969.16,3938.32,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(11,3,61,1,147.20,147.20,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(12,3,62,10,983.58,9835.80,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(13,4,63,1,1138.89,1138.89,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(14,4,64,4,1011.18,4044.72,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(15,4,65,3,108.39,325.17,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(16,4,66,7,1202.91,8420.37,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(17,4,67,2,972.42,1944.84,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(18,5,68,8,649.28,5194.24,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(19,5,69,8,1995.49,15963.92,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(20,6,70,9,1422.21,12799.89,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(21,6,71,1,1057.83,1057.83,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(22,6,72,4,1829.14,7316.56,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(23,6,73,9,878.11,7902.99,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(24,6,74,4,820.89,3283.56,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(25,7,75,1,51.93,51.93,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(26,7,76,9,825.90,7433.10,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(27,7,77,9,1417.85,12760.65,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(28,8,78,10,1442.72,14427.20,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(29,8,79,7,920.49,6443.43,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(30,9,80,3,1650.06,4950.18,'2025-12-30 07:03:15','2025-12-30 07:03:15'),(31,9,81,4,1383.42,5533.68,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(32,9,82,5,1942.16,9710.80,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(33,9,83,6,306.30,1837.80,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(34,9,84,8,1314.90,10519.20,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(35,10,85,5,901.56,4507.80,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(36,10,86,4,108.73,434.92,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(37,10,87,4,1712.68,6850.72,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(38,11,88,10,1087.05,10870.50,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(39,11,89,4,1950.39,7801.56,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(40,12,90,1,1815.76,1815.76,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(41,12,91,6,455.01,2730.06,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(42,12,92,3,1758.97,5276.91,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(43,13,93,7,230.27,1611.89,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(44,13,94,1,173.79,173.79,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(45,14,95,3,1213.86,3641.58,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(46,14,96,6,1477.95,8867.70,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(47,14,97,3,819.86,2459.58,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(48,14,98,5,608.22,3041.10,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(49,14,99,6,1357.89,8147.34,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(50,15,100,7,562.09,3934.63,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(51,15,101,4,909.51,3638.04,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(52,15,102,1,1068.94,1068.94,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(53,15,103,9,402.44,3621.96,'2025-12-30 07:03:16','2025-12-30 07:03:16'),(58,25,6,1,160.14,160.14,'2025-12-30 08:13:14','2025-12-30 08:13:14'),(60,29,2,1,128.72,128.72,'2025-12-30 08:17:23','2025-12-30 08:17:23'),(61,29,6,1,160.14,160.14,'2025-12-30 08:17:23','2025-12-30 08:17:23'),(80,36,2,1,49.66,49.66,'2026-01-01 05:15:14','2026-01-01 05:15:14'),(81,36,9,1,85.59,85.59,'2026-01-01 05:15:14','2026-01-01 05:15:14'),(82,36,10,1,39.73,39.73,'2026-01-01 05:15:14','2026-01-01 05:15:14'),(89,38,2,2,50.00,100.00,'2026-01-03 04:39:29','2026-01-03 04:39:29'),(90,38,6,1,8.88,8.88,'2026-01-03 04:39:29','2026-01-03 04:39:29'),(93,39,1,1,15.79,15.79,'2026-01-03 08:54:46','2026-01-03 08:54:46'),(94,39,3,10,12.50,125.00,'2026-01-03 08:54:46','2026-01-03 08:54:46');
/*!40000 ALTER TABLE `sale_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `sale_date` date NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `tax_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(12,2) NOT NULL,
  `paid_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `due_amount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status` enum('completed','pending','voided') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'completed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_invoice_no_unique` (`invoice_no`),
  KEY `sales_customer_id_foreign` (`customer_id`),
  KEY `sales_user_id_foreign` (`user_id`),
  CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'INV-4993',8,1,'2025-12-30',39017.55,0.00,0.00,39017.55,1000.00,39017.55,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(2,'INV-1269',18,1,'2025-12-30',30832.49,0.00,0.00,30832.49,1000.00,30832.49,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(3,'INV-6655',5,1,'2025-12-30',26766.52,0.00,0.00,26766.52,1000.00,26766.52,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(4,'INV-6395',20,1,'2025-12-30',15873.99,0.00,0.00,15873.99,1000.00,15873.99,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(5,'INV-8254',6,1,'2025-12-30',21158.16,0.00,0.00,21158.16,1000.00,21158.16,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(6,'INV-1433',13,1,'2025-12-30',32360.83,0.00,0.00,32360.83,1000.00,32360.83,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(7,'INV-8876',18,1,'2025-12-30',20245.68,0.00,0.00,20245.68,1000.00,20245.68,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(8,'INV-3727',17,1,'2025-12-30',20870.63,0.00,0.00,20870.63,1000.00,20870.63,'completed','2025-12-30 07:03:15','2025-12-30 07:03:15'),(9,'INV-6539',7,1,'2025-12-30',32551.66,0.00,0.00,32551.66,1000.00,32551.66,'completed','2025-12-30 07:03:15','2025-12-30 07:03:16'),(10,'INV-8326',16,1,'2025-12-30',11793.44,0.00,0.00,11793.44,1000.00,11793.44,'completed','2025-12-30 07:03:15','2025-12-30 07:03:16'),(11,'INV-7881',17,1,'2025-12-30',18672.06,0.00,0.00,18672.06,1000.00,18672.06,'completed','2025-12-30 07:03:15','2025-12-30 07:03:16'),(12,'INV-9055',17,1,'2025-12-30',9822.73,0.00,0.00,9822.73,1000.00,9822.73,'completed','2025-12-30 07:03:15','2025-12-30 07:03:16'),(13,'INV-8255',20,1,'2025-12-30',1785.68,0.00,0.00,1785.68,1000.00,1785.68,'completed','2025-12-30 07:03:15','2025-12-30 07:03:16'),(14,'INV-6127',14,1,'2025-12-30',26157.30,0.00,0.00,26157.30,1000.00,26157.30,'completed','2025-12-30 07:03:15','2025-12-30 07:03:16'),(15,'INV-7216',20,1,'2025-12-30',12263.57,0.00,0.00,12263.57,1000.00,12263.57,'completed','2025-12-30 07:03:15','2025-12-30 07:03:16'),(16,'INV-9653',7,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(17,'INV-1871',8,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(18,'INV-2710',16,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(19,'INV-7757',11,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(20,'INV-3880',1,1,'2025-12-30',215.88,0.00,0.00,215.88,1000.00,0.00,'completed','2025-12-30 07:06:06','2026-01-01 04:41:24'),(21,'INV-3185',11,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(22,'INV-3681',2,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(23,'INV-5513',22,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(24,'INV-6249',4,1,'2025-12-30',1000.00,0.00,0.00,1000.00,1000.00,0.00,'completed','2025-12-30 07:06:06','2025-12-30 07:06:06'),(25,'INV-1321',28,1,'2025-12-30',160.14,0.00,0.00,160.14,160.14,0.00,'completed','2025-12-30 07:06:06','2025-12-30 08:13:14'),(29,'INV-6953DE8F21271',5,1,'2025-12-30',288.86,0.00,0.00,288.86,288.86,0.00,'completed','2025-12-30 08:15:43','2025-12-30 08:17:23'),(30,'INV-69560B9273CFD',11,1,'2026-01-01',4305.30,0.00,0.00,4305.30,4289.51,0.00,'completed','2025-12-31 23:52:18','2026-01-01 04:44:29'),(36,'INV-D05980B0',2,1,'2026-01-01',174.98,0.00,0.00,174.98,174.98,0.00,'completed','2026-01-01 05:05:44','2026-01-01 05:15:14'),(38,'INV-D4E8BD2C',2,1,'2026-01-03',108.88,0.00,0.00,108.88,108.88,0.00,'completed','2026-01-03 04:38:03','2026-01-03 04:39:29'),(39,'INV-6958BA7DB74C7',16,1,'2026-01-03',140.79,0.00,0.00,140.79,140.79,0.00,'completed','2026-01-03 00:43:09','2026-01-03 08:54:46');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('wBindnK6J66MrD2FQPGBnb471XfYEiIjDsFliP3P',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZzhvcGNMdGFOUWpISWdIYVM2aWx1S1gyN1hCcXp4eUdoMDJsN3pLZyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czo0MjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FjY291bnRpbmcvbGVkZ2VyLzE0IjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767437723);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Cronin-Hamill','sydnie.klocko@ortiz.biz','+1-209-625-7571','73085 Else Stravenue Suite 992\nAmericohaven, VT 22034','2025-12-30 07:06:05','2025-12-30 07:06:05'),(2,'Oberbrunner PLC','okuneva.camylle@rodriguez.com','1-804-816-3735','679 Willy Place Apt. 621\nSouth Santinafurt, MA 70563-9922','2025-12-30 07:06:05','2025-12-30 07:06:05'),(3,'Block Inc','larson.lola@cummings.net','1-401-610-5742','2929 Giovani Rest\nJenningsville, WI 44339-7711','2025-12-30 07:06:05','2025-12-30 07:06:05'),(4,'Ortiz Ltd','berge.sanford@shields.com','+1-830-490-7348','1297 Tara Forest Apt. 569\nNorth Demario, DE 38406-9602','2025-12-30 07:06:05','2025-12-30 07:06:05'),(5,'Strosin, Jacobi and Hudson','pagac.kassandra@runte.com','+1 (941) 207-8230','87778 Olson Land Suite 122\nSidneyview, AK 14295','2025-12-30 07:06:05','2025-12-30 07:06:05'),(6,'Lindgren-Larkin','renner.shayne@schumm.com','(636) 561-3574','95438 Bernita Union\nLexusberg, NC 47882','2025-12-30 07:06:05','2025-12-30 07:06:05'),(7,'Oberbrunner, Hettinger and Stokes','whowell@konopelski.com','972-452-5269','79326 Fisher Cliff\nDeonville, OK 06696','2025-12-30 07:06:05','2025-12-30 07:06:05'),(8,'Weimann PLC','anya23@mcdermott.com','(920) 283-4977','228 Jose Plains Suite 321\nWest Kathlynberg, RI 28532-9835','2025-12-30 07:06:05','2025-12-30 07:06:05'),(9,'Schaefer Inc','acummings@kemmer.com','909.292.8233','7183 Edwardo Rue Suite 809\nGaylordmouth, MI 40227-3663','2025-12-30 07:06:05','2025-12-30 07:06:05'),(10,'Legros-Jaskolski','tomas.beatty@satterfield.org','(564) 749-9650','3876 Corene Viaduct\nHoppeview, UT 20434-9201','2025-12-30 07:06:05','2025-12-30 07:06:05');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `units_short_name_unique` (`short_name`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'Piece','PCS','2025-12-30 07:03:14','2025-12-30 07:03:14'),(2,'Kilogram','KG','2025-12-30 07:03:14','2025-12-30 07:03:14'),(3,'Gram','G','2025-12-30 07:03:14','2025-12-30 07:03:14'),(4,'Litre','L','2025-12-30 07:03:14','2025-12-30 07:03:14'),(5,'Box','BX','2025-12-30 07:03:14','2025-12-30 07:03:14'),(6,'Meter','M','2025-12-30 07:03:14','2025-12-30 07:03:14'),(7,'corporis','vw-790','2025-12-30 07:03:15','2025-12-30 07:03:15'),(8,'quod','xy-536','2025-12-30 07:03:15','2025-12-30 07:03:15'),(9,'unde','nt-442','2025-12-30 07:03:15','2025-12-30 07:03:15'),(10,'ea','bl-243','2025-12-30 07:03:15','2025-12-30 07:03:15'),(11,'vero','zq-064','2025-12-30 07:03:15','2025-12-30 07:03:15'),(12,'repellendus','gh-368','2025-12-30 07:03:15','2025-12-30 07:03:15'),(13,'facere','wm-249','2025-12-30 07:03:15','2025-12-30 07:03:15'),(14,'eum','rx-080','2025-12-30 07:03:15','2025-12-30 07:03:15'),(15,'delectus','hp-640','2025-12-30 07:03:15','2025-12-30 07:03:15'),(16,'aut','wr-635','2025-12-30 07:03:15','2025-12-30 07:03:15'),(17,'atque','dd-799','2025-12-30 07:03:15','2025-12-30 07:03:15'),(18,'animi','rb-574','2025-12-30 07:03:15','2025-12-30 07:03:15'),(19,'amet','tz-227','2025-12-30 07:03:15','2025-12-30 07:03:15'),(20,'officia','id-607','2025-12-30 07:03:15','2025-12-30 07:03:15'),(21,'voluptate','rm-743','2025-12-30 07:03:15','2025-12-30 07:03:15'),(22,'magnam','ad-455','2025-12-30 07:03:15','2025-12-30 07:03:15'),(23,'culpa','ot-305','2025-12-30 07:03:15','2025-12-30 07:03:15'),(24,'occaecati','tp-146','2025-12-30 07:03:15','2025-12-30 07:03:15'),(25,'voluptas','ru-337','2025-12-30 07:03:15','2025-12-30 07:03:15'),(26,'nisi','ky-465','2025-12-30 07:03:15','2025-12-30 07:03:15'),(27,'quia','dz-772','2025-12-30 07:03:15','2025-12-30 07:03:15'),(28,'sunt','kg-600','2025-12-30 07:03:15','2025-12-30 07:03:15'),(29,'deleniti','ij-213','2025-12-30 07:03:15','2025-12-30 07:03:15'),(30,'soluta','eu-483','2025-12-30 07:03:15','2025-12-30 07:03:15'),(31,'consequatur','yp-192','2025-12-30 07:03:15','2025-12-30 07:03:15'),(32,'fugit','rp-403','2025-12-30 07:03:15','2025-12-30 07:03:15'),(33,'sit','cz-039','2025-12-30 07:03:15','2025-12-30 07:03:15'),(34,'repudiandae','nb-204','2025-12-30 07:03:15','2025-12-30 07:03:15'),(35,'qui','ds-521','2025-12-30 07:03:15','2025-12-30 07:03:15'),(36,'ipsa','bb-518','2025-12-30 07:03:15','2025-12-30 07:03:15'),(37,'facilis','zc-821','2025-12-30 07:03:15','2025-12-30 07:03:15'),(38,'ratione','xn-337','2025-12-30 07:03:15','2025-12-30 07:03:15'),(39,'error','li-912','2025-12-30 07:03:15','2025-12-30 07:03:15'),(40,'rerum','mi-699','2025-12-30 07:03:15','2025-12-30 07:03:15'),(41,'libero','ya-617','2025-12-30 07:03:15','2025-12-30 07:03:15'),(42,'nesciunt','pp-525','2025-12-30 07:03:15','2025-12-30 07:03:15'),(43,'eveniet','ru-656','2025-12-30 07:03:15','2025-12-30 07:03:15'),(44,'in','bc-728','2025-12-30 07:03:15','2025-12-30 07:03:15'),(45,'veniam','ve-380','2025-12-30 07:03:15','2025-12-30 07:03:15'),(46,'voluptatibus','se-398','2025-12-30 07:03:15','2025-12-30 07:03:15'),(47,'adipisci','jr-052','2025-12-30 07:03:15','2025-12-30 07:03:15'),(48,'velit','nr-696','2025-12-30 07:03:15','2025-12-30 07:03:15'),(49,'quam','mh-271','2025-12-30 07:03:15','2025-12-30 07:03:15'),(50,'natus','jq-992','2025-12-30 07:03:15','2025-12-30 07:03:15'),(51,'maiores','nd-587','2025-12-30 07:03:15','2025-12-30 07:03:15'),(52,'recusandae','uk-707','2025-12-30 07:03:15','2025-12-30 07:03:15'),(53,'labore','fp-169','2025-12-30 07:03:15','2025-12-30 07:03:15'),(54,'fugiat','js-008','2025-12-30 07:03:15','2025-12-30 07:03:15'),(55,'ducimus','hs-262','2025-12-30 07:03:15','2025-12-30 07:03:15'),(56,'minima','wd-017','2025-12-30 07:03:15','2025-12-30 07:03:15'),(57,'sapiente','pe-420','2025-12-30 07:03:15','2025-12-30 07:03:15'),(58,'ut','mg-047','2025-12-30 07:03:15','2025-12-30 07:03:15'),(59,'et','pm-813','2025-12-30 07:03:15','2025-12-30 07:03:15'),(60,'accusamus','ap-714','2025-12-30 07:03:15','2025-12-30 07:03:15'),(61,'ipsum','xm-295','2025-12-30 07:03:15','2025-12-30 07:03:15'),(62,'eos','gr-856','2025-12-30 07:03:15','2025-12-30 07:03:15'),(63,'mollitia','tv-837','2025-12-30 07:03:15','2025-12-30 07:03:15'),(64,'similique','po-586','2025-12-30 07:03:15','2025-12-30 07:03:15'),(65,'inventore','sl-189','2025-12-30 07:03:15','2025-12-30 07:03:15'),(66,'esse','an-078','2025-12-30 07:03:15','2025-12-30 07:03:15'),(67,'voluptatem','dw-204','2025-12-30 07:03:15','2025-12-30 07:03:15'),(68,'eaque','sq-012','2025-12-30 07:03:15','2025-12-30 07:03:15'),(69,'blanditiis','hf-908','2025-12-30 07:03:15','2025-12-30 07:03:15'),(70,'odit','nk-822','2025-12-30 07:03:15','2025-12-30 07:03:15'),(71,'est','ki-919','2025-12-30 07:03:15','2025-12-30 07:03:15'),(72,'quibusdam','ky-871','2025-12-30 07:03:15','2025-12-30 07:03:15'),(73,'quo','fj-296','2025-12-30 07:03:15','2025-12-30 07:03:15'),(74,'reprehenderit','ty-720','2025-12-30 07:03:15','2025-12-30 07:03:15'),(75,'illo','zu-130','2025-12-30 07:03:15','2025-12-30 07:03:15'),(76,'officiis','la-120','2025-12-30 07:03:15','2025-12-30 07:03:15'),(77,'quis','gj-763','2025-12-30 07:03:15','2025-12-30 07:03:15'),(78,'quas','jy-754','2025-12-30 07:03:15','2025-12-30 07:03:15'),(79,'porro','in-823','2025-12-30 07:03:15','2025-12-30 07:03:15'),(80,'eius','wy-169','2025-12-30 07:03:15','2025-12-30 07:03:15'),(81,'saepe','at-876','2025-12-30 07:03:15','2025-12-30 07:03:15'),(82,'repellat','bx-643','2025-12-30 07:03:15','2025-12-30 07:03:15'),(83,'asperiores','zs-922','2025-12-30 07:03:15','2025-12-30 07:03:15'),(84,'quasi','wn-066','2025-12-30 07:03:15','2025-12-30 07:03:15'),(85,'eligendi','si-628','2025-12-30 07:03:15','2025-12-30 07:03:15'),(86,'cumque','ne-386','2025-12-30 07:03:15','2025-12-30 07:03:15'),(87,'impedit','xn-840','2025-12-30 07:03:15','2025-12-30 07:03:15'),(88,'ab','rg-111','2025-12-30 07:03:15','2025-12-30 07:03:15'),(89,'perspiciatis','rj-143','2025-12-30 07:03:15','2025-12-30 07:03:15'),(90,'illum','zd-804','2025-12-30 07:03:15','2025-12-30 07:03:15'),(91,'iure','wn-214','2025-12-30 07:03:16','2025-12-30 07:03:16'),(92,'quos','br-874','2025-12-30 07:03:16','2025-12-30 07:03:16'),(93,'accusantium','ur-981','2025-12-30 07:03:16','2025-12-30 07:03:16'),(94,'beatae','lf-892','2025-12-30 07:03:16','2025-12-30 07:03:16'),(95,'cum','ye-168','2025-12-30 07:03:16','2025-12-30 07:03:16'),(96,'maxime','gb-483','2025-12-30 07:03:16','2025-12-30 07:03:16'),(97,'laboriosam','hq-143','2025-12-30 07:03:16','2025-12-30 07:03:16'),(98,'sint','ag-972','2025-12-30 07:03:16','2025-12-30 07:03:16'),(99,'pariatur','uh-398','2025-12-30 07:03:16','2025-12-30 07:03:16'),(100,'omnis','qz-386','2025-12-30 07:03:16','2025-12-30 07:03:16'),(101,'non','tz-102','2025-12-30 07:03:16','2025-12-30 07:03:16'),(102,'reiciendis','lj-903','2025-12-30 07:03:16','2025-12-30 07:03:16'),(103,'aperiam','zr-546','2025-12-30 07:03:16','2025-12-30 07:03:16'),(104,'alias','iz-963','2025-12-30 07:03:16','2025-12-30 07:03:16'),(105,'enim','vc-541','2025-12-30 07:03:16','2025-12-30 07:03:16'),(106,'laborum','uf-604','2025-12-30 07:03:16','2025-12-30 07:03:16'),(107,'a','di-602','2025-12-30 07:03:16','2025-12-30 07:03:16'),(108,'tempora','of-946','2025-12-30 07:03:16','2025-12-30 07:03:16'),(109,'sed','uz-497','2025-12-30 07:03:16','2025-12-30 07:03:16'),(110,'fugiat','ll-247','2025-12-30 07:06:05','2025-12-30 07:06:05'),(111,'sit','cr-153','2025-12-30 07:06:05','2025-12-30 07:06:05'),(112,'dolorem','lc-859','2025-12-30 07:06:05','2025-12-30 07:06:05'),(113,'ut','nm-311','2025-12-30 07:06:05','2025-12-30 07:06:05'),(114,'aspernatur','xd-238','2025-12-30 07:06:05','2025-12-30 07:06:05'),(115,'laboriosam','ik-481','2025-12-30 07:06:05','2025-12-30 07:06:05'),(116,'dignissimos','pz-671','2025-12-30 07:06:05','2025-12-30 07:06:05'),(117,'error','cg-659','2025-12-30 07:06:05','2025-12-30 07:06:05'),(118,'quod','ub-963','2025-12-30 07:06:05','2025-12-30 07:06:05'),(119,'ab','fn-474','2025-12-30 07:06:05','2025-12-30 07:06:05'),(120,'similique','rt-400','2025-12-30 07:06:05','2025-12-30 07:06:05'),(121,'magni','hv-380','2025-12-30 07:06:05','2025-12-30 07:06:05'),(122,'temporibus','qb-793','2025-12-30 07:06:05','2025-12-30 07:06:05'),(123,'sed','os-632','2025-12-30 07:06:05','2025-12-30 07:06:05'),(124,'distinctio','cw-228','2025-12-30 07:06:05','2025-12-30 07:06:05'),(125,'dolores','wa-764','2025-12-30 07:06:05','2025-12-30 07:06:05'),(126,'dolor','sn-137','2025-12-30 07:06:06','2025-12-30 07:06:06'),(127,'officiis','qo-758','2025-12-30 07:06:06','2025-12-30 07:06:06'),(128,'alias','rv-959','2025-12-30 07:06:06','2025-12-30 07:06:06'),(129,'cum','ee-124','2025-12-30 07:06:06','2025-12-30 07:06:06');
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','demo@localhost.com','2025-12-30 07:06:05','$2y$12$7SoEM3dh.XFvuit8c.P4A.LbgKB1DOitR14v0gQanx/WyS8r6Pqeu',NULL,NULL,NULL,'YWZTdXDCOxyIusAkPvSAH5WDALLERbKnnMunWxcxm8BeXbsZ9yRtRX8mi9GW','2025-12-30 07:01:25','2025-12-30 07:06:05');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-03 17:16:02
