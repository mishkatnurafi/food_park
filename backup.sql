-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: food_park
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_Id` bigint unsigned NOT NULL,
  `delivery_area_id` bigint unsigned NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_user_id_foreign` (`user_Id`),
  KEY `addresses_delivery_area_id_foreign` (`delivery_area_id`),
  CONSTRAINT `addresses_delivery_area_id_foreign` FOREIGN KEY (`delivery_area_id`) REFERENCES `delivery_areas` (`id`),
  CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_Id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
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
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `show_at_home` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Burger','burger',1,1,NULL,NULL),(2,'Sandwich','sandwich',1,1,NULL,NULL),(3,'Taco','taco',1,1,NULL,NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `min_purchase_amount` int NOT NULL DEFAULT '0',
  `expire_date` date NOT NULL,
  `discount_type` enum('percent','amount') COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

LOCK TABLES `coupons` WRITE;
/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
INSERT INTO `coupons` VALUES (1,'qui','fugit',50,10,'1972-01-31','percent',10,0,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(2,'impedit','minima',50,10,'1978-09-27','percent',10,1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(3,'nesciunt','velit',50,10,'2007-04-20','percent',10,0,'2024-08-28 03:33:49','2024-08-28 03:33:49');
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_areas`
--

DROP TABLE IF EXISTS `delivery_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_delivery_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_fee` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_areas`
--

LOCK TABLES `delivery_areas` WRITE;
/*!40000 ALTER TABLE `delivery_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_areas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (9,'2024_08_16_223727_create_catagories_table',4),(18,'2024_08_23_114411_create_delivery_areas_table',11),(27,'2024_08_28_065718_create_order_items_table',15),(48,'2014_10_12_000000_create_users_table',16),(49,'2014_10_12_100000_create_password_reset_tokens_table',16),(50,'2019_08_19_000000_create_failed_jobs_table',16),(51,'2019_12_14_000001_create_personal_access_tokens_table',16),(52,'2024_08_10_205149_create_sliders_table',16),(53,'2024_08_14_031730_create_why_choose_us_table',16),(54,'2024_08_14_032158_create_section_titles_table',16),(55,'2024_08_16_223727_create_categories_table',16),(56,'2024_08_17_225527_create_products_table',16),(57,'2024_08_18_064506_create_product_galleries_table',16),(58,'2024_08_18_190850_create_product_sizes_table',16),(59,'2024_08_18_202415_create_product_options_table',16),(60,'2024_08_19_030258_create_settings_table',16),(61,'2024_08_24_070540_create_coupons_table',16),(62,'2024_08_26_035223_create_delivery_areas_table',16),(63,'2024_08_26_050720_create_addresses_table',16),(64,'2024_08_28_065850_create_orders_table',16),(65,'2024_08_28_090230_create_order_items_table',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `unit_price` double NOT NULL,
  `qty` int NOT NULL,
  `product_size` json DEFAULT NULL,
  `product_option` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` double NOT NULL DEFAULT '0',
  `delivery_charge` double NOT NULL DEFAULT '0',
  `subtotal` double NOT NULL,
  `grand_total` double NOT NULL,
  `product_qty` int NOT NULL,
  `product_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_approve_date` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_info` json DEFAULT NULL,
  `currency_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_galleries`
--

DROP TABLE IF EXISTS `product_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_galleries_product_id_foreign` (`product_id`),
  CONSTRAINT `product_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_galleries`
--

LOCK TABLES `product_galleries` WRITE;
/*!40000 ALTER TABLE `product_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_options`
--

DROP TABLE IF EXISTS `product_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_options`
--

LOCK TABLES `product_options` WRITE;
/*!40000 ALTER TABLE `product_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_sizes_product_id_foreign` (`product_id`),
  CONSTRAINT `product_sizes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
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
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `offer_price` double NOT NULL DEFAULT '0',
  `quantity` int NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seo_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_at_home` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'voluptas','ratione-sequi-ipsum-et-mollitia-tenetur','/uploads/test.jpg',1,'Dolores corporis eos consectetur doloribus. Nihil ut dolores culpa est et dolorem. Dolorum et molestias aut et est.','Quam dolor dolorem praesentium ut placeat sunt. Reprehenderit occaecati molestiae veniam architecto labore. Id sed nihil magni quasi quo similique.',134.38,11.24,100,'0524751861760','Explicabo nostrum assumenda odit dolores distinctio.','Illum magni libero quam amet consequatur et. Sequi vero quisquam vitae animi enim enim dolor. Corporis non exercitationem qui quae.',0,0,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(2,'molestias','et-debitis-suscipit-iure-vero-odit-nostrum-ut','/uploads/test.jpg',1,'Dolorem expedita cumque occaecati sit sed. Id eum totam commodi nam. Architecto harum numquam omnis at.','Eaque consectetur ab et maxime corporis unde quas aperiam. Sit quasi impedit sapiente et voluptate aut. Laboriosam qui aliquid nobis eos neque.',98.44,56.48,100,'8160371377544','Enim culpa corporis praesentium autem dolorem nisi ut.','Reprehenderit ipsam consequatur non non reprehenderit. Iusto quas consequatur sit eum. Id non omnis in.',1,1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(3,'necessitatibus','eveniet-consequatur-nihil-aperiam-aut','/uploads/test.jpg',2,'Velit accusantium dolor est qui facere sed veritatis. Tempora quia voluptate illo reprehenderit et aut et. Impedit aut cum repellendus cumque qui.','Expedita similique quis eius sint aperiam. Tempore est veniam corrupti laudantium tempora et. Voluptas vero nam blanditiis culpa vitae.',22.61,185.75,100,'8341268852485','Asperiores et consequuntur et voluptatem incidunt animi.','Optio voluptas reiciendis voluptate quis. Deleniti fuga rerum qui et sit provident possimus. Architecto officia aut asperiores dignissimos distinctio aut. Fugit sit ea tempore nihil delectus. Et voluptates rerum ratione excepturi facere veritatis.',0,1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(4,'assumenda','optio-omnis-autem-aut-eos-voluptas-sit-facere','/uploads/test.jpg',1,'Dolore ut pariatur optio vel quo debitis quis. Harum sunt hic doloribus beatae. Maxime explicabo et velit ex dolor quod.','Qui autem dolor fugiat reprehenderit accusantium. Et repellat quaerat sunt.',163.72,196.84,100,'2777224307182','Dignissimos quis et quasi eum illo ab atque.','Quia corporis omnis facere voluptas dicta adipisci aut. Rem voluptas est omnis tenetur. Dolores tenetur ut quas.',0,0,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(5,'qui','error-deserunt-asperiores-illum-eos-accusamus-omnis-et','/uploads/test.jpg',3,'Reprehenderit accusantium quia ab doloremque cumque. Sed illum quidem dolorem. Maiores et qui fugiat sed sit assumenda quo.','Distinctio ex ut totam commodi molestiae. Fugiat assumenda est temporibus a aperiam. Laboriosam soluta itaque est animi illo. Mollitia eligendi sunt et aliquam quod reiciendis aut voluptas. Minus et molestiae voluptatem illum in.',84.14,135.14,100,'2303523688051','Adipisci ea consequuntur ipsam molestiae minus sed.','Adipisci odio aliquid pariatur. Itaque dolores accusantium qui qui autem. Voluptatem incidunt voluptatem impedit. Quis omnis ipsa eum dolorem placeat nemo ratione.',0,1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(6,'asperiores','ut-quia-et-temporibus','/uploads/test.jpg',1,'Tenetur voluptatibus totam quasi aut. Sed quidem nisi labore assumenda. Autem quia quaerat voluptas et.','Consequatur et earum minima id expedita cupiditate. Facilis nisi et doloribus temporibus. Ullam qui voluptas perferendis est.',186.71,85.95,100,'2862839907299','Velit aut sit in distinctio.','Minus eaque aut atque quaerat. Illum recusandae praesentium autem sed quisquam expedita. Deserunt facilis quia ut quae earum veniam.',0,0,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(7,'voluptas','sit-nihil-vitae-nostrum-id-autem-minus-ut','/uploads/test.jpg',3,'Et dolores nihil voluptatem et sint. Consequatur ea cum iure ipsum maiores. Ducimus voluptatibus accusamus nihil reiciendis ullam et.','Voluptatum in nihil sapiente sed soluta. Sed tempore labore quas fugit deleniti ut optio. Omnis odit dolores minima cum qui minima vel.',26.49,63.47,100,'4418191633024','Expedita qui esse ut exercitationem.','Eum iste quos vitae sint. Voluptas aut modi voluptates. Qui est qui et sint.',0,1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(8,'rerum','quibusdam-similique-quidem-commodi-qui-et-voluptas-nulla-nam','/uploads/test.jpg',2,'Est illum harum ut voluptatem. Et necessitatibus ullam unde mollitia nihil eum. Distinctio facere ad illum sint rerum ea vel. Similique enim perferendis sint est rerum aut quia. Eligendi odit quis natus et voluptatem odit.','Ipsam facere vel quam cupiditate voluptas dignissimos facere qui. Quia eius molestiae sint qui dolorem. Qui explicabo ab est aliquam unde ut. Minus ea et dolorem sapiente non. Quasi dolorem ratione unde rem.',88.52,8.74,100,'2357901660696','Possimus dignissimos incidunt nemo porro enim sunt nulla.','Eaque rerum iure at ut magnam veritatis. Perferendis natus aliquam ea velit. Impedit dicta harum voluptatum consequuntur dolorem iusto.',0,1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(9,'eveniet','dicta-sapiente-aut-eius-aut-deleniti','/uploads/test.jpg',2,'Ut in esse architecto. Vero atque omnis id et atque dignissimos sint. Qui dicta consectetur beatae nisi dolores ex.','Sed eum eos aspernatur quasi ratione modi. Deserunt autem aperiam quaerat porro facere velit. Pariatur blanditiis ipsum vitae.',13.54,100.09,100,'9056693560544','Dignissimos fuga voluptatem voluptas.','Commodi fugit eius et sunt omnis blanditiis et. Doloremque quam illo necessitatibus quo qui sint impedit. Est velit dolore dolor itaque. Illum dolores rem dolorem ut expedita. Perferendis rem nihil voluptas fugiat dolor.',1,0,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(10,'et','quidem-est-fugit-similique-deleniti-dolor-enim','/uploads/test.jpg',1,'Quis tenetur id repellat reprehenderit. Modi fugit a sit rerum et qui. Dolor aspernatur et sed dignissimos.','Enim animi aut dolorem non nisi saepe. Omnis neque nesciunt repellendus veniam ea sint. Sit deleniti fugit quia aut saepe. Ad eum beatae blanditiis qui eos suscipit.',114.95,12.5,100,'0052097620562','Rerum ut id aperiam vero possimus.','Delectus inventore sunt id rerum. Reiciendis unde ut voluptatibus id neque. Et eum rerum error quis sint ipsum id id.',0,1,'2024-08-28 03:33:49','2024-08-28 03:33:49');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section_titles`
--

DROP TABLE IF EXISTS `section_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section_titles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` text COLLATE utf8mb4_unicode_ci,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section_titles`
--

LOCK TABLES `section_titles` WRITE;
/*!40000 ALTER TABLE `section_titles` DISABLE KEYS */;
INSERT INTO `section_titles` VALUES (1,'why_choose_top_title','why choose us',NULL,NULL),(2,'why_choose_main_title','why choose us',NULL,NULL),(3,'why_choose_sub_title','Objectively pontificate quality models before intuitive information. Dramatically recaptiualize multifunctional materials.',NULL,NULL);
/*!40000 ALTER TABLE `section_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `offer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `button_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,'/uploads/test','50%','Quaerat corporis esse repellat veniam.','Veniam corporis voluptatem est est aut adipisci magnam est qui est rerum.','Nihil a molestias suscipit qui vitae non. Veritatis sint est nesciunt ipsam quia.','http://www.mayer.biz/',0,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(2,'/uploads/test','50%','Voluptate at assumenda quos magnam eos.','Doloribus quod temporibus sunt fugit mollitia sunt quo non sit quasi non ut eligendi.','Similique voluptas pariatur enim fuga. Quia in architecto illo et pariatur est nulla.','http://www.jenkins.com/',1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(3,'/uploads/test','50%','Est et voluptatem officia deserunt pariatur modi debitis.','Voluptas doloremque vel at dolorum excepturi in consectetur consectetur minima.','Dolor ipsum doloribus laudantium doloremque minus. Dignissimos nemo odit et numquam.','http://www.schoen.info/laborum-iste-mollitia-ut-blanditiis-hic-nulla-vel.html',0,'2024-08-28 03:33:49','2024-08-28 03:33:49');
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '/uploads/avatar.png',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('user','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `users` VALUES (1,'/uploads/avatar.png','Admin','admin@gmail.com','admin',NULL,'$2y$12$zYvHbLIEvRGyC4fK88O4h.i8OBNdG5jHYSRgngH2OEAEczISKTKx2',NULL,NULL,NULL),(2,'/uploads/avatar.png','User','user@gmail.com','user',NULL,'$2y$12$lfhYGD37PEURBc7.wKRIue.W1mhVcqROZsscdWzXCYO5Dax/Xqq8e',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `why_choose_us`
--

DROP TABLE IF EXISTS `why_choose_us`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `why_choose_us` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `why_choose_us`
--

LOCK TABLES `why_choose_us` WRITE;
/*!40000 ALTER TABLE `why_choose_us` DISABLE KEYS */;
INSERT INTO `why_choose_us` VALUES (1,'fas fa-shapes','Amet ullam officia fuga esse perferendis nesciunt sapiente.','Minus repellendus ea est aut quaerat harum et qui.',1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(2,'fas fa-shapes','Molestiae perferendis dolor sit minus unde.','Natus molestias reiciendis occaecati quia distinctio culpa.',1,'2024-08-28 03:33:49','2024-08-28 03:33:49'),(3,'fas fa-shapes','Est voluptas sit a quisquam ad.','Aliquid enim et totam et saepe reprehenderit.',1,'2024-08-28 03:33:49','2024-08-28 03:33:49');
/*!40000 ALTER TABLE `why_choose_us` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-28 15:36:24
