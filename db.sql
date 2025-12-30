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
INSERT INTO `cache` VALUES ('laravel-cache-678685e8c14b40cf61075efc3a2c5ff0','i:1;',1767081894),('laravel-cache-678685e8c14b40cf61075efc3a2c5ff0:timer','i:1767081894;',1767081894),('laravel-cache-boost.roster.scan','a:2:{s:6:\"roster\";O:21:\"Laravel\\Roster\\Roster\":3:{s:13:\"\0*\0approaches\";O:29:\"Illuminate\\Support\\Collection\":2:{s:8:\"\0*\0items\";a:1:{i:0;O:23:\"Laravel\\Roster\\Approach\":1:{s:11:\"\0*\0approach\";E:38:\"Laravel\\Roster\\Enums\\Approaches:ACTION\";}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:19:{i:0;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^2.0\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:INERTIA\";s:14:\"\0*\0packageName\";s:25:\"inertiajs/inertia-laravel\";s:10:\"\0*\0version\";s:6:\"2.0.16\";s:6:\"\0*\0dev\";b:0;}i:1;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^2.0\";s:10:\"\0*\0package\";E:45:\"Laravel\\Roster\\Enums\\Packages:INERTIA_LARAVEL\";s:14:\"\0*\0packageName\";s:25:\"inertiajs/inertia-laravel\";s:10:\"\0*\0version\";s:6:\"2.0.16\";s:6:\"\0*\0dev\";b:0;}i:2;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.30\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:FORTIFY\";s:14:\"\0*\0packageName\";s:15:\"laravel/fortify\";s:10:\"\0*\0version\";s:6:\"1.33.0\";s:6:\"\0*\0dev\";b:0;}i:3;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^12.0\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:LARAVEL\";s:14:\"\0*\0packageName\";s:17:\"laravel/framework\";s:10:\"\0*\0version\";s:7:\"12.44.0\";s:6:\"\0*\0dev\";b:0;}i:4;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v0.3.8\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PROMPTS\";s:14:\"\0*\0packageName\";s:15:\"laravel/prompts\";s:10:\"\0*\0version\";s:5:\"0.3.8\";s:6:\"\0*\0dev\";b:0;}i:5;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^0.1.9\";s:10:\"\0*\0package\";E:39:\"Laravel\\Roster\\Enums\\Packages:WAYFINDER\";s:14:\"\0*\0packageName\";s:17:\"laravel/wayfinder\";s:10:\"\0*\0version\";s:6:\"0.1.12\";s:6:\"\0*\0dev\";b:0;}i:6;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^0.1.9\";s:10:\"\0*\0package\";E:47:\"Laravel\\Roster\\Enums\\Packages:WAYFINDER_LARAVEL\";s:14:\"\0*\0packageName\";s:17:\"laravel/wayfinder\";s:10:\"\0*\0version\";s:6:\"0.1.12\";s:6:\"\0*\0dev\";b:0;}i:7;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:6:\"v0.5.1\";s:10:\"\0*\0package\";E:33:\"Laravel\\Roster\\Enums\\Packages:MCP\";s:14:\"\0*\0packageName\";s:11:\"laravel/mcp\";s:10:\"\0*\0version\";s:5:\"0.5.1\";s:6:\"\0*\0dev\";b:1;}i:8;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.24\";s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:PINT\";s:14:\"\0*\0packageName\";s:12:\"laravel/pint\";s:10:\"\0*\0version\";s:6:\"1.26.0\";s:6:\"\0*\0dev\";b:1;}i:9;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.41\";s:10:\"\0*\0package\";E:34:\"Laravel\\Roster\\Enums\\Packages:SAIL\";s:14:\"\0*\0packageName\";s:12:\"laravel/sail\";s:10:\"\0*\0version\";s:6:\"1.51.0\";s:6:\"\0*\0dev\";b:1;}i:10;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:7:\"^11.5.3\";s:10:\"\0*\0package\";E:37:\"Laravel\\Roster\\Enums\\Packages:PHPUNIT\";s:14:\"\0*\0packageName\";s:15:\"phpunit/phpunit\";s:10:\"\0*\0version\";s:7:\"11.5.46\";s:6:\"\0*\0dev\";b:1;}i:11;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";r:13;s:14:\"\0*\0packageName\";s:15:\"@inertiajs/vue3\";s:10:\"\0*\0version\";s:6:\"2.2.19\";s:6:\"\0*\0dev\";b:0;}i:12;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:41:\"Laravel\\Roster\\Enums\\Packages:INERTIA_VUE\";s:14:\"\0*\0packageName\";s:15:\"@inertiajs/vue3\";s:10:\"\0*\0version\";s:6:\"2.2.19\";s:6:\"\0*\0dev\";b:0;}i:13;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:41:\"Laravel\\Roster\\Enums\\Packages:TAILWINDCSS\";s:14:\"\0*\0packageName\";s:11:\"tailwindcss\";s:10:\"\0*\0version\";s:6:\"4.1.17\";s:6:\"\0*\0dev\";b:0;}i:14;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:33:\"Laravel\\Roster\\Enums\\Packages:VUE\";s:14:\"\0*\0packageName\";s:3:\"vue\";s:10:\"\0*\0version\";s:6:\"3.5.25\";s:6:\"\0*\0dev\";b:0;}i:15;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";r:48;s:14:\"\0*\0packageName\";s:30:\"@laravel/vite-plugin-wayfinder\";s:10:\"\0*\0version\";s:5:\"0.1.7\";s:6:\"\0*\0dev\";b:1;}i:16;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:44:\"Laravel\\Roster\\Enums\\Packages:WAYFINDER_VITE\";s:14:\"\0*\0packageName\";s:30:\"@laravel/vite-plugin-wayfinder\";s:10:\"\0*\0version\";s:5:\"0.1.7\";s:6:\"\0*\0dev\";b:1;}i:17;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:36:\"Laravel\\Roster\\Enums\\Packages:ESLINT\";s:14:\"\0*\0packageName\";s:6:\"eslint\";s:10:\"\0*\0version\";s:6:\"9.39.1\";s:6:\"\0*\0dev\";b:1;}i:18;O:22:\"Laravel\\Roster\\Package\":6:{s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:10:\"\0*\0package\";E:38:\"Laravel\\Roster\\Enums\\Packages:PRETTIER\";s:14:\"\0*\0packageName\";s:8:\"prettier\";s:10:\"\0*\0version\";s:5:\"3.7.4\";s:6:\"\0*\0dev\";b:1;}}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:21:\"\0*\0nodePackageManager\";E:43:\"Laravel\\Roster\\Enums\\NodePackageManager:NPM\";}s:9:\"timestamp\";i:1767000805;}',1767087205);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Groceries','2025-12-27 07:45:00','2025-12-27 07:45:00'),(2,'Home Appliances','2025-12-27 07:45:00','2025-12-27 07:45:00'),(3,'Furniture','2025-12-27 07:45:00','2025-12-27 07:45:00'),(4,'Electronics','2025-12-27 07:45:00','2025-12-27 07:45:00'),(5,'Groceries','2025-12-27 07:45:00','2025-12-27 07:45:00'),(6,'Industrial Tools','2025-12-27 07:45:00','2025-12-27 07:45:00'),(7,'Industrial Tools','2025-12-27 07:45:00','2025-12-27 07:45:00'),(8,'Furniture','2025-12-27 07:45:00','2025-12-27 07:45:00'),(9,'Home Appliances','2025-12-27 07:45:00','2025-12-27 07:45:00'),(10,'Home Appliances','2025-12-27 07:45:00','2025-12-27 07:45:00');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_08_14_170933_add_two_factor_columns_to_users_table',1),(5,'2025_12_27_104408_create_permission_tables',1),(6,'2025_12_27_110000_create_categories_table',1),(7,'2025_12_27_110001_create_units_table',1),(8,'2025_12_27_115046_create_products_table',1),(9,'2025_12_29_074631_create_suppliers_table',2),(10,'2025_12_29_074632_create_purchases_table',2),(11,'2025_12_29_075316_create_purchase_items_table',2);
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
INSERT INTO `permissions` VALUES (1,'product.view','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(2,'product.create','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(3,'product.update','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(4,'product.delete','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(5,'stock.view','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(6,'purchase.view','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(7,'purchase.create','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(8,'purchase.update','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(9,'purchase.delete','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(10,'sale.view','web','2025-12-27 23:25:38','2025-12-27 23:25:38'),(11,'sale.create','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(12,'sale.update','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(13,'sale.delete','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(14,'report.stock','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(15,'report.sales','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(16,'report.purchase','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(17,'report.profit','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(18,'user.view','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(19,'user.create','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(20,'user.update','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(21,'user.delete','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(22,'role.manage','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(23,'supplier.view','web','2025-12-30 02:19:25','2025-12-30 02:19:25'),(24,'supplier.create','web','2025-12-30 02:19:25','2025-12-30 02:19:25'),(25,'supplier.update','web','2025-12-30 02:19:25','2025-12-30 02:19:25'),(26,'supplier.delete','web','2025-12-30 02:19:25','2025-12-30 02:19:25');
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_unit_id_foreign` (`unit_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4,'non','PROD-9274',9,1,86.17,131.34,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(5,'omnis','PROD-7618',2,1,34.60,39.12,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(6,'sequi','PROD-5723',10,2,9.84,189.78,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(7,'assumenda','PROD-3651',10,4,43.04,102.80,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(8,'numquam','PROD-5141',8,2,23.20,17.83,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(9,'nemo','PROD-1318',2,4,39.17,81.97,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(10,'dolore','PROD-6873',7,4,32.30,129.61,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(11,'sit','PROD-0131',5,1,55.77,178.49,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(13,'sunt','PROD-5929',5,1,52.56,116.09,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(14,'totam','PROD-5496',5,3,84.95,161.57,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(15,'eum','PROD-5122',10,4,74.24,42.21,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(17,'odit','PROD-1249',2,2,65.12,11.65,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(18,'facere','PROD-1962',8,4,46.04,105.37,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(19,'est','PROD-6285',10,1,63.76,73.65,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(20,'soluta','PROD-1380',3,4,24.74,64.53,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(21,'eaque','PROD-5744',3,1,14.42,86.81,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(22,'et','PROD-3506',4,3,97.47,117.19,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(23,'maxime','PROD-9686',8,2,80.45,64.91,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(24,'expedita','PROD-3608',4,3,45.18,44.83,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(25,'perspiciatis','PROD-6306',1,4,51.12,121.88,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(26,'quasi','PROD-0858',9,4,43.40,129.47,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(27,'nobis','PROD-4712',8,3,6.16,89.07,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(28,'id','PROD-9458',5,4,54.24,112.20,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(29,'dolores','PROD-0930',2,2,87.30,82.91,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(30,'aut','PROD-0438',4,1,91.47,75.84,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(31,'non','PROD-8110',8,1,70.94,71.50,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(32,'dignissimos','PROD-0074',5,1,90.16,176.93,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(33,'et','PROD-5150',3,2,61.58,84.83,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(34,'ea','PROD-7908',4,3,40.74,15.21,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(35,'a','PROD-3539',9,3,77.67,177.40,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(36,'voluptatem','PROD-8156',10,2,11.11,23.71,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(37,'iusto','PROD-7130',1,1,5.48,194.73,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(38,'expedita','PROD-0708',9,3,47.43,55.56,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(39,'ducimus','PROD-0337',1,1,78.08,74.86,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(40,'omnis','PROD-2989',2,4,48.03,34.01,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(41,'ducimus','PROD-4209',6,1,92.20,55.27,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(42,'dicta','PROD-2788',9,1,32.03,40.71,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(43,'sit','PROD-9647',9,4,55.55,134.48,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(44,'consequatur','PROD-1658',5,3,61.94,21.86,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(45,'rerum','PROD-6190',2,3,70.81,16.23,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(46,'voluptas','PROD-4941',10,2,74.80,70.40,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(47,'rem','PROD-9649',5,1,84.51,194.88,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(48,'dolorem','PROD-4751',10,2,11.31,109.26,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(49,'et','PROD-7555',9,3,52.78,50.03,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(50,'asperiores','PROD-6100',2,4,44.81,114.61,'2025-12-27 07:45:00','2025-12-27 07:45:00'),(52,'Sample Product','PROD-001',8,4,100.00,150.00,'2025-12-29 02:58:13','2025-12-29 02:58:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_items`
--

LOCK TABLES `purchase_items` WRITE;
/*!40000 ALTER TABLE `purchase_items` DISABLE KEYS */;
INSERT INTO `purchase_items` VALUES (5,2,15,1,180.45,180.45,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(6,2,15,7,158.92,1112.44,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(7,2,15,1,323.40,323.40,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(8,2,15,1,306.35,306.35,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(9,3,15,1,444.66,444.66,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(10,3,15,7,83.31,583.17,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(11,3,15,7,418.81,2931.67,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(12,3,15,3,222.57,667.71,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(13,3,15,4,106.38,425.52,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(24,6,21,1,14.42,14.42,'2025-12-29 03:29:10','2025-12-29 03:29:10'),(25,6,23,10,80.45,804.50,'2025-12-29 03:29:10','2025-12-29 03:29:10'),(30,8,20,1,24.00,24.00,'2025-12-29 03:41:24','2025-12-29 03:41:24'),(31,8,11,5,55.00,275.00,'2025-12-29 03:41:24','2025-12-29 03:41:24'),(32,7,18,1,46.04,46.04,'2025-12-29 03:41:27','2025-12-29 03:41:27'),(34,10,23,1,80.45,80.45,'2025-12-29 03:46:02','2025-12-29 03:46:02'),(41,4,50,10,80.91,809.10,'2025-12-29 04:47:15','2025-12-29 04:47:15'),(42,4,50,8,465.49,3723.92,'2025-12-29 04:47:15','2025-12-29 04:47:15'),(43,4,50,7,207.22,1450.54,'2025-12-29 04:47:15','2025-12-29 04:47:15'),(47,11,22,10,97.47,974.70,'2025-12-29 04:54:29','2025-12-29 04:54:29'),(48,11,21,15,14.42,216.30,'2025-12-29 04:54:29','2025-12-29 04:54:29'),(49,11,10,18,32.30,581.40,'2025-12-29 04:54:29','2025-12-29 04:54:29'),(54,13,21,1,14.42,14.42,'2025-12-30 03:02:20','2025-12-30 03:02:20'),(55,13,21,1,14.42,14.42,'2025-12-30 03:02:20','2025-12-30 03:02:20');
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
INSERT INTO `purchases` VALUES (2,'PO-GQ638',6,'1993-06-30',1922.64,'pending',1,NULL,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(3,'PO-BL615',5,'2008-11-11',5052.73,'pending',1,NULL,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(4,'PO-VA839',6,'1978-02-28',5983.56,'pending',1,NULL,'2025-12-29 02:58:21','2025-12-29 02:58:21'),(6,'PUR-695248BFBF329',2,'2025-12-29',818.92,'pending',2,NULL,'2025-12-29 03:24:15','2025-12-29 03:29:10'),(7,'PUR-69524A51C5C95',2,'2025-12-29',46.04,'pending',2,NULL,'2025-12-29 03:30:57','2025-12-29 03:30:57'),(8,'PO-1767001102',2,'2025-12-29',299.00,'pending',2,NULL,'2025-12-29 03:38:22','2025-12-29 03:41:24'),(10,'PO-1767001562',3,'2025-12-29',80.45,'pending',2,NULL,'2025-12-29 03:46:02','2025-12-29 03:46:02'),(11,'PO-1767001696',2,'2025-12-15',1772.40,'pending',2,NULL,'2025-12-29 03:48:16','2025-12-29 04:54:29'),(13,'PO-1767006005',2,'2025-12-29',28.84,'pending',2,NULL,'2025-12-29 05:00:05','2025-12-29 05:00:05');
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
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(1,2),(2,2),(3,2),(5,2),(6,2),(7,2),(8,2),(10,2),(11,2),(12,2),(14,2),(15,2),(16,2),(23,2),(24,2),(25,2),(26,2),(1,3),(5,3),(1,4),(10,4),(11,4),(14,5),(15,5),(16,5),(17,5),(23,5);
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
INSERT INTO `roles` VALUES (1,'Admin','web','2025-12-27 23:25:39','2025-12-28 22:44:22'),(2,'Manager','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(3,'Storekeeper','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(4,'Sales','web','2025-12-27 23:25:39','2025-12-27 23:25:39'),(5,'Accountant','web','2025-12-27 23:25:39','2025-12-27 23:25:39');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
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
INSERT INTO `sessions` VALUES ('cLyDShpB2f0lemFA5w6HpEfJ01YpE5FBSmW6Zbfe',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSVpiVW50SW1sNjlqVnVxbVNEbkRsWTZjZm9pWkhIamhVeWtjaEliRSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvc3VwcGxpZXJzIjtzOjU6InJvdXRlIjtzOjE1OiJzdXBwbGllcnMuaW5kZXgiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=',1767086660),('LJ05v13UgS0VaS1IBYds99a2mzq3OGMEpkF81l0G',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVzJxUUthOVBPTVBqbEd1OXhESnFwNDhkaW1XOURqc0hteFRPdnpMdiI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjtzOjU6InJvdXRlIjtzOjQ6ImhvbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1767081797);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (2,'Schmeler and Sons','isaias.renner@kris.org','1-913-376-4649','66778 Ambrose View\nSmithamborough, WA 76616','2025-12-29 02:57:39','2025-12-29 02:57:39'),(3,'Wisozk-Mann','bins.garland@nitzsche.com','+1-559-374-3110','496 Lewis Lock\nNorth Marcos, TN 69957-2282','2025-12-29 02:57:39','2025-12-29 02:57:39'),(4,'Miller Inc','qfeil@abernathy.com','539.618.1475','8688 Mante Garden Suite 196\nLake Sinceremouth, OR 20737','2025-12-29 02:57:39','2025-12-29 02:57:39'),(5,'Senger Ltd','maryse44@williamson.biz','1-980-257-0747','763 Thelma Shore\nBahringerberg, UT 01187','2025-12-29 02:57:39','2025-12-29 02:57:39'),(6,'Jacobi-Little','wisoky.caterina@sanford.net','228.899.0758','96134 Hauck Prairie\nAufderharfort, HI 27963-4374','2025-12-29 02:57:39','2025-12-29 02:57:39'),(7,'Sporer LLC','richie75@hamill.biz','1-458-979-4724','7041 Billie Ways Suite 353\nHintzville, MO 54863-4455','2025-12-29 02:57:39','2025-12-29 02:57:39'),(8,'Bogan Ltd','vhintz@hills.info','859-621-0461','74666 Mable Turnpike\nNorth Peterburgh, NM 26963-6809','2025-12-29 02:57:39','2025-12-29 02:57:39'),(9,'Paucek-Reichel','ignacio.ledner@gorczany.com','+1-458-391-1583','99228 Selina Drive Apt. 766\nPort Clemens, NH 97768','2025-12-29 02:57:39','2025-12-29 02:57:39'),(10,'Hilpert, Beahan and Hessel','bogan.arnoldo@waters.org','(832) 375-9742','350 Tom Villages\nLindashire, NH 30335-4138','2025-12-29 02:57:39','2025-12-29 02:57:39');
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'dz','2025-12-27 07:45:00','2025-12-27 07:45:00'),(2,'g','2025-12-27 07:45:00','2025-12-27 07:45:00'),(3,'ltr','2025-12-27 07:45:00','2025-12-27 07:45:00'),(4,'box','2025-12-27 07:45:00','2025-12-27 07:45:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Test User','test@example.com','2025-12-27 07:44:59','$2y$12$MimdEaXlw8rC9f5iEEbDFOUuPQF3BxvTWD6KtbYYbFPFLbjNmXhq2','4fikKKo4t1','yxXLlHBKre','2025-12-27 07:45:00','BmIgREjqCw','2025-12-27 07:45:00','2025-12-27 07:45:00'),(2,'AB','demo@localhost.com',NULL,'$2y$12$YE5RW5NBtZywG4/2iF9fjulmxUZXQt9fiWlZ8cLUucQ125v.HBykG',NULL,NULL,NULL,'0dEuoNv2y4sKtvhybFmPeIEpPkry6iznG0Yl6YWOWxOtieW8cXrqrSiAlTXx','2025-12-27 07:45:30','2025-12-27 07:45:30');
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

-- Dump completed on 2025-12-30 15:34:24
-- 1. Core Sales & Customer Tables
-- These tables handle the actual transactions and client records.
-- 1. Customers Table

CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `opening_balance` decimal(12,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Sales Table (The Header)
CREATE TABLE `sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(50) NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `sale_date` date NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `tax_amount` decimal(12,2) DEFAULT '0.00',
  `discount_amount` decimal(12,2) DEFAULT '0.00',
  `grand_total` decimal(12,2) NOT NULL,
  `paid_amount` decimal(12,2) DEFAULT '0.00',
  `due_amount` decimal(12,2) DEFAULT '0.00',
  `payment_status` enum('paid','partial','due') DEFAULT 'due',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sales_invoice_unique` (`invoice_no`),
  CONSTRAINT `sales_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `sales_user_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Sale Items Table (The Details)
CREATE TABLE `sale_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `quantity` int NOT NULL,
  `unit_price` decimal(12,2) NOT NULL,
  `item_total` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `sale_items_sale_fk` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sale_items_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Chart of Accounts (The categories of money)
CREATE TABLE `chart_of_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) UNIQUE NOT NULL, -- e.g., 1010 for Cash, 4000 for Sales Revenue
  `type` enum('asset','liability','equity','revenue','expense') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. General Ledger (The Journal)
CREATE TABLE `ledgers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `reference_type` varchar(50) NOT NULL, -- e.g., 'Sale', 'Purchase', 'Payment'
  `reference_id` bigint unsigned NOT NULL,
  `description` text,
  `debit` decimal(12,2) DEFAULT '0.00',
  `credit` decimal(12,2) DEFAULT '0.00',
  `transaction_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `ledger_account_fk` FOREIGN KEY (`account_id`) REFERENCES `chart_of_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- INSERT INTO `chart_of_accounts` (`name`, `code`, `type`) VALUES
-- ('Cash', '1000', 'asset'),
-- ('Accounts Receivable', '1200', 'asset'),
-- ('Inventory Asset', '1300', 'asset'),
-- ('Accounts Payable', '2000', 'liability'),
-- ('Sales Revenue', '4000', 'revenue'),
-- ('Cost of Goods Sold', '5000', 'expense');

