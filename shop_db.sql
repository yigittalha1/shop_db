-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: shop_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Elektronik'),(2,'Giyim'),(3,'Kitap'),(4,'Video Oyunları'),(5,'Spor Malzemeleri'),(6,'Bilgisayar Bileşenleri');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,35000.00),(2,1,2,1,500.00),(3,2,3,1,250.00),(4,2,4,1,150.00),(9,3,21,1,3200.00),(10,3,33,1,3800.00),(11,4,20,1,250.00),(12,4,31,1,140.00),(13,5,22,1,220.00),(14,5,27,1,190.00),(15,6,23,1,150.00),(16,6,28,1,80.00),(17,6,32,1,180.00),(18,7,29,1,350.00),(19,7,34,1,150.00),(20,7,25,1,120.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Pending','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,35500.00,'Shipped','2026-03-22 08:16:12'),(2,2,400.00,'Pending','2026-03-22 08:16:12'),(3,9,7000.00,'Shipped','2026-03-22 08:35:28'),(4,10,390.00,'Delivered','2026-03-22 08:35:28'),(5,11,410.00,'Pending','2026-03-22 08:35:28'),(6,12,410.00,'Shipped','2026-03-22 08:35:28'),(7,13,620.00,'Delivered','2026-03-22 08:35:28');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `stock` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Oyuncu Laptop','16GB RAM, 1TB SSD, RTX 4060',35000.00,10,'2026-03-22 08:16:12'),(2,1,'Kablosuz Mouse','Ergonomik ve şarj edilebilir',500.00,50,'2026-03-22 08:16:12'),(3,2,'Siyah Tişört','%100 Pamuklu, L Beden',250.00,100,'2026-03-22 08:16:12'),(4,3,'C# Programlama Kitabı','Sıfırdan ileri seviyeye',150.00,30,'2026-03-22 08:16:12'),(20,3,'İngilizce A2 Seviye Hikaye Seti','Başlangıç ve orta seviye için okuma kitapları',250.00,40,'2026-03-22 08:23:53'),(21,6,'Alüminyum Kasa Mini ITX','Kompakt sistemler için fırçalanmış alüminyum bilgisayar kasası',3200.00,15,'2026-03-22 08:23:53'),(22,3,'C# Uygulamalı Proje Rehberi','Adım adım C# projeleri geliştirme kitabı',220.00,50,'2026-03-22 08:23:53'),(23,5,'Futbol Antrenman Hunisi Seti','10 adet esnek antrenman hunisi',150.00,100,'2026-03-22 08:23:53'),(24,6,'Yüksek Performanslı Termal Macun','İşlemci ve ekran kartı soğutması için',300.00,80,'2026-03-22 08:23:53'),(25,1,'Klavye Temizleme Seti','Mekanik klavyeler için fırça ve tuş sökücü',120.00,60,'2026-03-22 08:23:53'),(26,4,'Oyun Konsolu Taşıma Çantası','Darbeye dayanıklı seyahat çantası',450.00,25,'2026-03-22 08:23:53'),(27,3,'SQL Veritabanı Optimizasyonu','Sorgu hızlandırma ve indeksleme teknikleri',190.00,30,'2026-03-22 08:23:53'),(28,5,'Profesyonel Hakem Düdüğü','Yüksek ses seviyeli, ipli',80.00,150,'2026-03-22 08:23:53'),(29,1,'128GB USB 3.2 Flash Bellek','Yüksek hızlı veri transferi',350.00,120,'2026-03-22 08:23:53'),(30,6,'Alüminyum M.2 SSD Soğutucu Blok','Isı düşürücü termal pad ile birlikte',200.00,45,'2026-03-22 08:23:53'),(31,3,'İngilizce Dilbilgisi Pratik Kartları','Günlük konuşma kalıpları ve gramer',140.00,70,'2026-03-22 08:23:53'),(32,5,'Yedek Krampon Çivisi Seti','Vidalı kramponlar için 12 adet alüminyum çivi',180.00,60,'2026-03-22 08:23:53'),(33,6,'850W Tam Modüler Güç Kaynağı','Sistem toplamaya uygun sessiz fanlı PSU',3800.00,20,'2026-03-22 08:23:53'),(34,1,'Ergonomik Mouse Pad','Bilek destekli, kaymaz tabanlı',150.00,90,'2026-03-22 08:23:53'),(35,1,'elektrikli süpürge','ergonomik',15000.00,40,'2026-03-23 09:06:27'),(36,1,'dffgghhhh','ffgghh',1444.00,0,'2026-06-03 15:36:22');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ahmet','Yılmaz','ahmet.yilmaz@email.com','2026-03-22 08:16:12'),(2,'Ayşe','Kaya','ayse.kaya@email.com','2026-03-22 08:16:12'),(3,'Can','Öztürk','can.ozturk@email.com','2026-03-22 08:16:12'),(4,'Mert','Korkmaz','mert.korkmaz@email.com','2026-03-22 08:20:32'),(5,'Selin','Arslan','selin.arslan@email.com','2026-03-22 08:20:32'),(6,'Oğuz','Doğan','oguz.dogan@email.com','2026-03-22 08:20:32'),(7,'Cemre','Tekin','cemre.tekin@email.com','2026-03-22 08:20:32'),(8,'Hakan','Avcı','hakan.avci@email.com','2026-03-22 08:20:32'),(9,'Büşra','Yavuz','busra.yavuz@email.com','2026-03-22 08:20:32'),(10,'Kaan','Erol','kaan.erol@email.com','2026-03-22 08:20:32'),(11,'Melis','Polat','melis.polat@email.com','2026-03-22 08:20:32'),(12,'Onur','Gül','onur.gul@email.com','2026-03-22 08:20:32'),(13,'Deniz','Şen','deniz.sen@email.com','2026-03-22 08:20:32'),(14,'Ahmet','Yılmaz','ahmet@email.com','2026-03-30 15:14:09');
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

-- Dump completed on 2026-10-18 17:36:53
