-- MariaDB dump 10.19  Distrib 10.5.19-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: paradox_db
-- ------------------------------------------------------
-- Server version	10.5.19-MariaDB-0+deb11u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add scenario',6,'add_scenario'),(22,'Can change scenario',6,'change_scenario'),(23,'Can delete scenario',6,'delete_scenario'),(24,'Can view scenario',6,'view_scenario'),(25,'Can add room',7,'add_room'),(26,'Can change room',7,'change_room'),(27,'Can delete room',7,'delete_room'),(28,'Can view room',7,'view_room'),(29,'Can add image',8,'add_image'),(30,'Can change image',8,'change_image'),(31,'Can delete image',8,'delete_image'),(32,'Can view image',8,'view_image'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user'),(37,'Can add booking',10,'add_booking'),(38,'Can change booking',10,'change_booking'),(39,'Can delete booking',10,'delete_booking'),(40,'Can view booking',10,'view_booking'),(41,'Can add default price list',11,'add_defaultpricelist'),(42,'Can change default price list',11,'change_defaultpricelist'),(43,'Can delete default price list',11,'delete_defaultpricelist'),(44,'Can view default price list',11,'view_defaultpricelist'),(45,'Can add prices list',12,'add_priceslist'),(46,'Can change prices list',12,'change_priceslist'),(47,'Can delete prices list',12,'delete_priceslist'),(48,'Can view prices list',12,'view_priceslist'),(49,'Can add faq element',13,'add_faqelement'),(50,'Can change faq element',13,'change_faqelement'),(51,'Can delete faq element',13,'delete_faqelement'),(52,'Can view faq element',13,'view_faqelement'),(53,'Can add Token',14,'add_customtoken'),(54,'Can change Token',14,'change_customtoken'),(55,'Can delete Token',14,'delete_customtoken'),(56,'Can view Token',14,'view_customtoken'),(57,'Can add Token',15,'add_token'),(58,'Can change Token',15,'change_token'),(59,'Can delete Token',15,'delete_token'),(60,'Can view Token',15,'view_token'),(61,'Can add token',16,'add_tokenproxy'),(62,'Can change token',16,'change_tokenproxy'),(63,'Can delete token',16,'delete_tokenproxy'),(64,'Can view token',16,'view_tokenproxy');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_pegapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `pegapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('18e9f4fce81eb3c0b4fa8482308647bc480125f0','2023-07-16 14:11:26.077627',4),('2b2602ff1f85f135ee30dec2ac2351f91cc1de0e','2023-07-16 13:10:20.160643',7),('3f7b028bfb7796419e6eb0d280f6f0dfbca7fc75','2023-07-16 08:59:00.722425',6),('c2a7917fbfc8d00c9f92ffa279654015748d4d7e','2023-07-16 08:48:25.554556',2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_pegapp_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_pegapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `pegapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-15 17:07:27.257042','3','admin',1,'[{\"added\": {}}]',9,2),(2,'2023-05-20 01:53:06.216484','2','Labo-interieur-1',1,'[{\"added\": {}}]',8,2),(3,'2023-05-20 05:55:16.946401','1','Room: 1',1,'[{\"added\": {}}]',7,2),(4,'2023-05-20 05:55:26.610099','2','Room: 2',1,'[{\"added\": {}}]',7,2),(5,'2023-05-20 05:55:46.985296','1','Booking object (1)',1,'[{\"added\": {}}]',10,2),(6,'2023-05-20 05:56:03.581634','2','Booking object (2)',1,'[{\"added\": {}}]',10,2),(7,'2023-05-20 05:56:33.605082','2','Booking object (2)',3,'',10,2),(8,'2023-05-20 05:56:33.609571','1','Booking object (1)',3,'',10,2),(9,'2023-05-20 06:50:00.954637','3','Booking object (3)',1,'[{\"added\": {}}]',10,2),(10,'2023-05-20 06:54:44.062095','3','Booking object (3)',3,'',10,2),(11,'2023-05-20 06:54:54.903380','4','Booking object (4)',1,'[{\"added\": {}}]',10,2),(12,'2023-05-20 06:55:06.959417','5','Booking object (5)',1,'[{\"added\": {}}]',10,2),(13,'2023-05-20 06:55:30.150317','5','Booking object (5)',3,'',10,2),(14,'2023-05-20 06:55:30.161137','4','Booking object (4)',3,'',10,2),(15,'2023-05-20 07:12:50.506983','6','Booking object (6)',1,'[{\"added\": {}}]',10,2),(16,'2023-05-20 07:12:58.746872','6','Booking object (6)',3,'',10,2),(17,'2023-05-20 08:28:35.500106','7','Booking object (7)',1,'[{\"added\": {}}]',10,2),(18,'2023-05-20 08:28:47.295486','8','Booking object (8)',1,'[{\"added\": {}}]',10,2),(19,'2023-07-11 06:49:20.136648','2','Le laboratoire explosif du Dr Schnapp',2,'[{\"changed\": {\"fields\": [\"Min players\", \"Max players\"]}}]',6,2),(20,'2023-07-11 06:49:29.750567','1','La prison maudite du Hollandais Volant',2,'[{\"changed\": {\"fields\": [\"Min players\", \"Max players\"]}}]',6,2),(21,'2023-07-11 07:14:50.650238','13','2023-07-12 à 11:00:00 : La prison maudite du Hollandais Volant, 10 joueurs.',3,'',10,2),(22,'2023-07-11 07:14:50.655070','12','2023-07-13 à 11:00:00 : La prison maudite du Hollandais Volant, 56 joueurs.',3,'',10,2),(23,'2023-07-11 08:24:02.318555','1','DefaultPriceList object (1)',1,'[{\"added\": {}}]',11,2),(24,'2023-07-11 08:24:10.144808','1','DefaultPriceList object (1)',1,'[{\"added\": {}}]',11,2),(25,'2023-07-11 08:35:46.837383','1','PricesList object (1)',2,'[{\"changed\": {\"fields\": [\"Prices\"]}}]',12,2),(26,'2023-07-11 08:37:33.032437','1','PricesList object (1)',2,'[{\"changed\": {\"fields\": [\"Prices\"]}}]',12,2),(27,'2023-07-11 23:16:12.917669','1','Ça fait peur ?',1,'[{\"added\": {}}]',13,2),(28,'2023-07-11 23:18:39.436843','2','Est-ce qu’on est VRAIMENT enfermés ?',1,'[{\"added\": {}}]',13,2),(29,'2023-07-11 23:18:50.265722','2','Est-ce qu’on est VRAIMENT enfermés ?',2,'[{\"changed\": {\"fields\": [\"Answer\"]}}]',13,2),(30,'2023-07-12 22:22:50.590326','3','Room: 3',1,'[{\"added\": {}}]',7,2),(31,'2023-07-12 22:41:27.958531','15','2023-07-25 à 11:00:00 : Le laboratoire explosif du Dr Schnapp, 4 joueurs.',1,'[{\"added\": {}}]',10,2),(32,'2023-07-13 08:54:14.215523','2','Le laboratoire explosif du Dr Schnapp',2,'[{\"changed\": {\"fields\": [\"Min players\", \"Max players\"]}}]',6,2),(33,'2023-07-13 08:58:12.140924','16','2023-07-13 à 18:00:00 : Le laboratoire explosif du Dr Schnapp, 8 joueurs.',1,'[{\"added\": {}}]',10,2),(34,'2023-07-13 08:58:25.539129','17','2023-07-13 à 17:00:00 : Le laboratoire explosif du Dr Schnapp, 3 joueurs.',1,'[{\"added\": {}}]',10,2),(35,'2023-07-13 09:11:53.624388','18','2023-07-14 à 18:00:00 : Le laboratoire explosif du Dr Schnapp, 5 joueurs.',1,'[{\"added\": {}}]',10,2),(36,'2023-07-13 09:12:44.155235','19','2023-07-14 à 17:00:00 : Le laboratoire explosif du Dr Schnapp, 2 joueurs.',1,'[{\"added\": {}}]',10,2),(37,'2023-07-13 09:12:56.921473','20','2023-07-14 à 11:00:00 : Le laboratoire explosif du Dr Schnapp, 3 joueurs.',1,'[{\"added\": {}}]',10,2),(38,'2023-07-13 09:40:48.026996','3','schnapp_labo_2',1,'[{\"added\": {}}]',8,2),(39,'2023-07-13 09:41:02.462289','4','schnapp_labo_3',1,'[{\"added\": {}}]',8,2),(40,'2023-07-13 21:30:41.293326','21','2023-07-13 à 23:00:00 : Le laboratoire explosif du Dr Schnapp, 4 joueurs.',1,'[{\"added\": {}}]',10,2),(41,'2023-07-13 21:31:37.953484','21','2023-07-13 à 23:00:00 : Le laboratoire explosif du Dr Schnapp, 4 joueurs.',2,'[]',10,2),(42,'2023-07-13 21:31:46.238155','22','2023-07-13 à 22:00:00 : Le laboratoire explosif du Dr Schnapp, 4 joueurs.',1,'[{\"added\": {}}]',10,2),(43,'2023-07-13 21:45:47.438558','22','2023-07-13 à 22:00:00 : Le laboratoire explosif du Dr Schnapp, 4 joueurs.',3,'',10,2),(44,'2023-07-13 21:45:47.442773','21','2023-07-13 à 23:00:00 : Le laboratoire explosif du Dr Schnapp, 4 joueurs.',3,'',10,2),(45,'2023-07-16 08:51:12.570389','5','AdminUser',1,'[{\"added\": {}}]',9,2),(46,'2023-07-16 08:52:53.855090','5','AdminUser',2,'[{\"changed\": {\"fields\": [\"Password\"]}}]',9,2),(47,'2023-07-16 08:54:28.445973','5','AdminUser',2,'[{\"changed\": {\"fields\": [\"Last login\"]}}]',9,2),(48,'2023-07-16 08:57:12.383768','5','AdminUser',3,'',9,2),(49,'2023-07-16 08:57:12.394396','3','admin',3,'',9,2),(50,'2023-07-16 08:58:24.128368','6','admin',2,'[{\"changed\": {\"fields\": [\"Superuser status\", \"Staff status\"]}}]',9,2),(51,'2023-07-16 13:09:26.441484','7','staff',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',9,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(15,'authtoken','token'),(16,'authtoken','tokenproxy'),(4,'contenttypes','contenttype'),(10,'pegapp','booking'),(14,'pegapp','customtoken'),(11,'pegapp','defaultpricelist'),(13,'pegapp','faqelement'),(8,'pegapp','image'),(12,'pegapp','priceslist'),(7,'pegapp','room'),(6,'pegapp','scenario'),(9,'pegapp','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-15 16:22:51.483753'),(2,'contenttypes','0002_remove_content_type_name','2023-01-15 16:22:51.558512'),(3,'auth','0001_initial','2023-01-15 16:22:51.906520'),(4,'auth','0002_alter_permission_name_max_length','2023-01-15 16:22:51.985942'),(5,'auth','0003_alter_user_email_max_length','2023-01-15 16:22:51.997921'),(6,'auth','0004_alter_user_username_opts','2023-01-15 16:22:52.009713'),(7,'auth','0005_alter_user_last_login_null','2023-01-15 16:22:52.021986'),(8,'auth','0006_require_contenttypes_0002','2023-01-15 16:22:52.026936'),(9,'auth','0007_alter_validators_add_error_messages','2023-01-15 16:22:52.042333'),(10,'auth','0008_alter_user_username_max_length','2023-01-15 16:22:52.058111'),(11,'auth','0009_alter_user_last_name_max_length','2023-01-15 16:22:52.070435'),(12,'auth','0010_alter_group_name_max_length','2023-01-15 16:22:52.090044'),(13,'auth','0011_update_proxy_permissions','2023-01-15 16:22:52.103880'),(14,'auth','0012_alter_user_first_name_max_length','2023-01-15 16:22:52.115865'),(15,'pegapp','0001_initial','2023-01-15 16:22:52.744106'),(16,'admin','0001_initial','2023-01-15 16:22:52.937440'),(17,'admin','0002_logentry_remove_auto_add','2023-01-15 16:22:52.955007'),(18,'admin','0003_logentry_add_action_flag_choices','2023-01-15 16:22:52.971860'),(19,'sessions','0001_initial','2023-01-15 16:22:53.023727'),(20,'pegapp','0002_user_phone','2023-01-15 16:28:42.483326'),(21,'pegapp','0003_remove_user_phone','2023-01-15 16:32:06.197419'),(22,'pegapp','0002_booking','2023-05-20 05:49:39.004980'),(23,'pegapp','0003_alter_booking_time','2023-05-20 06:16:50.852244'),(24,'pegapp','0004_alter_booking_time','2023-05-20 06:44:28.809593'),(25,'pegapp','0001_initial_squashed_0004_alter_booking_time','2023-05-20 07:06:56.980171'),(26,'pegapp','0005_alter_booking_time','2023-05-20 07:11:48.870702'),(27,'pegapp','0006_alter_scenario_duration','2023-06-04 08:07:00.300153'),(28,'pegapp','0007_defaultpricelist','2023-07-11 08:22:13.182748'),(29,'pegapp','0008_priceslist_delete_defaultpricelist','2023-07-11 08:29:18.589573'),(30,'pegapp','0009_faqelement','2023-07-11 23:10:37.397846'),(31,'pegapp','0010_booking_price','2023-07-12 22:21:10.018869'),(32,'pegapp','0011_alter_booking_price','2023-07-12 22:25:46.031507'),(33,'pegapp','0012_customtoken','2023-07-16 07:49:54.325926'),(34,'authtoken','0001_initial','2023-07-16 08:44:08.776729'),(35,'authtoken','0002_auto_20160226_1747','2023-07-16 08:44:08.826495'),(36,'authtoken','0003_tokenproxy','2023-07-16 08:44:08.831948');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('b1j8fnqudnjdpl39jzj74dbw3j5753hp','.eJxVjLsOwjAMAP8lM4qcxm1qRna-oYodlxZQIvUxIf4dInWA9e50LzPEfZuGfdVlmJM5m8acfhlHeWiuIt1jvhUrJW_LzLYm9rCrvZakz8vR_g2muE51C9QLtX1DITkW9KQqbvwOOhQUInTKnXITInpoE4QRCFGBIXhPYN4f32o3dA:1q7PGP:P0uwhYPiVhZX38ttRQnqH6CN-yemt8CHUPAGW6acqfk','2023-06-22 23:41:57.848710'),('itb4vmc0rae2x5r0caq7lo6j0temm2nr','.eJxVjLsOwjAMAP8lM4qcxm1qRna-oYodlxZQIvUxIf4dInWA9e50LzPEfZuGfdVlmJM5m8acfhlHeWiuIt1jvhUrJW_LzLYm9rCrvZakz8vR_g2muE51C9QLtX1DITkW9KQqbvwOOhQUInTKnXITInpoE4QRCFGBIXhPYN4f32o3dA:1qL1Uy:ANsZZh-BJK2e43rMUGC40SJwTEpJJcs3jlCWS_BooRQ','2023-07-30 13:09:16.769688'),('v6s11ux6ezk105wmza10x1jddblxigvr','.eJxVjD0OwyAUg-_CXCF-HgQ6ds8ZEPCgpK1ACslU9e4lUoZ2sSx_tt_E-X0rbu9pdQuSKwFy-c2Cj89UD4APX--Nxla3dQn0qNCTdjo3TK_b2f07KL6Xsbaa6WSsNjFINJIHLiLjUgMDnIApn7UXXIahwwpQqHIyAoBNaGzm5PMFuu423w:1q0MBV:0BWMKVyScCtcQ08ygPiuNKmDumQu1pQGtS1hKPFvd-4','2023-06-03 12:59:45.965225'),('znlcr59s4bnhn0v7q207r6p7ka4w8yp5','.eJxVjLsOwjAMAP8lM4qcxm1qRna-oYodlxZQIvUxIf4dInWA9e50LzPEfZuGfdVlmJM5m8acfhlHeWiuIt1jvhUrJW_LzLYm9rCrvZakz8vR_g2muE51C9QLtX1DITkW9KQqbvwOOhQUInTKnXITInpoE4QRCFGBIXhPYN4f32o3dA:1pHArT:Mj91gIRScmGxrv80V3XHYiKQ4fto6xTqrzcQf-YzmZ0','2023-01-29 21:48:19.620031');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_booking`
--

DROP TABLE IF EXISTS `pegapp_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_booking` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `num_players` int(10) unsigned NOT NULL CHECK (`num_players` >= 0),
  `scenario_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pegapp_booking_scenario_id_0372ec53_fk_pegapp_scenario_id` (`scenario_id`),
  KEY `pegapp_booking_user_id_36039768_fk_pegapp_user_id` (`user_id`),
  CONSTRAINT `pegapp_booking_scenario_id_0372ec53_fk_pegapp_scenario_id` FOREIGN KEY (`scenario_id`) REFERENCES `pegapp_scenario` (`id`),
  CONSTRAINT `pegapp_booking_user_id_36039768_fk_pegapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `pegapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_booking`
--

LOCK TABLES `pegapp_booking` WRITE;
/*!40000 ALTER TABLE `pegapp_booking` DISABLE KEYS */;
INSERT INTO `pegapp_booking` VALUES (7,'2023-05-20','17:00:00.000000',5,1,4,0.00),(8,'2023-05-20','17:00:00.000000',5,1,4,0.00),(9,'2023-05-20','16:00:00.000000',5,1,4,0.00),(10,'2023-05-20','16:00:00.000000',5,1,4,0.00),(11,'2023-06-04','10:00:00.000000',4,1,2,0.00),(14,'2023-07-11','10:00:00.000000',3,1,2,0.00),(15,'2023-07-25','11:00:00.000000',4,2,4,108.00),(16,'2023-07-13','18:00:00.000000',8,2,4,152.00),(17,'2023-07-13','17:00:00.000000',3,2,4,96.00),(18,'2023-07-14','18:00:00.000000',5,2,2,115.00),(19,'2023-07-14','17:00:00.000000',2,2,2,76.00),(20,'2023-07-14','11:00:00.000000',3,2,4,96.00);
/*!40000 ALTER TABLE `pegapp_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_customtoken`
--

DROP TABLE IF EXISTS `pegapp_customtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_customtoken` (
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_customtoken`
--

LOCK TABLES `pegapp_customtoken` WRITE;
/*!40000 ALTER TABLE `pegapp_customtoken` DISABLE KEYS */;
INSERT INTO `pegapp_customtoken` VALUES (2);
/*!40000 ALTER TABLE `pegapp_customtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_faqelement`
--

DROP TABLE IF EXISTS `pegapp_faqelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_faqelement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `answer` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_faqelement`
--

LOCK TABLES `pegapp_faqelement` WRITE;
/*!40000 ALTER TABLE `pegapp_faqelement` DISABLE KEYS */;
INSERT INTO `pegapp_faqelement` VALUES (1,'Ça fait peur ?','Un peu ! Pour le moment Paradox propose des scénarios plutôt effrayants. L\'ambiance, ainsi que le stress du timing peut être anxiogène pour les personnes sensibles. Si vous êtes inquiets ou que vous souhaitez plus d\'informations, n\'hésitez pas à nous appeler. Nous travaillons actuellement à la création d\'une salle qui fait moins peur !'),(2,'Est-ce qu’on est VRAIMENT enfermés ?','Vous êtes en effet dans une salle close dans laquelle vous devez résoudre des énigmes pour en sortir. L\'Escape Game est déconseillé aux personnes claustrophobes. Cependant, en cas d\'urgence, nous pourrons bien sûr intervenir et vous faire sortir de la salle avant la fin de la partie.');
/*!40000 ALTER TABLE `pegapp_faqelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_image`
--

DROP TABLE IF EXISTS `pegapp_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `scenario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pegapp_image_scenario_id_9c6c8633_fk_pegapp_scenario_id` (`scenario_id`),
  CONSTRAINT `pegapp_image_scenario_id_9c6c8633_fk_pegapp_scenario_id` FOREIGN KEY (`scenario_id`) REFERENCES `pegapp_scenario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_image`
--

LOCK TABLES `pegapp_image` WRITE;
/*!40000 ALTER TABLE `pegapp_image` DISABLE KEYS */;
INSERT INTO `pegapp_image` VALUES (1,'pegapp/uploads/images/gallery/le-hollandais-volant_prison.jpeg','6',1),(2,'pegapp/uploads/images/gallery/laboratoire-interieur-1.png','Labo-interieur-1',2),(3,'pegapp/uploads/images/gallery/schnapp_laboratoire_2.jpg','schnapp_labo_2',2),(4,'pegapp/uploads/images/gallery/laboratoire-interieur-2.png','schnapp_labo_3',2);
/*!40000 ALTER TABLE `pegapp_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_priceslist`
--

DROP TABLE IF EXISTS `pegapp_priceslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_priceslist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prices` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`prices`)),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_priceslist`
--

LOCK TABLES `pegapp_priceslist` WRITE;
/*!40000 ALTER TABLE `pegapp_priceslist` DISABLE KEYS */;
INSERT INTO `pegapp_priceslist` VALUES (1,'{\"2\": 38, \"3\": 32, \"4\": 27, \"5\": 23, \"6\": 21, \"7\": 20, \"8\": 19, \"9\": 18, \"10\": 17}');
/*!40000 ALTER TABLE `pegapp_priceslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_room`
--

DROP TABLE IF EXISTS `pegapp_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_room` (
  `num` int(11) NOT NULL,
  `scenario_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `pegapp_room_scenario_id_c5e519f3_fk_pegapp_scenario_id` (`scenario_id`),
  CONSTRAINT `pegapp_room_scenario_id_c5e519f3_fk_pegapp_scenario_id` FOREIGN KEY (`scenario_id`) REFERENCES `pegapp_scenario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_room`
--

LOCK TABLES `pegapp_room` WRITE;
/*!40000 ALTER TABLE `pegapp_room` DISABLE KEYS */;
INSERT INTO `pegapp_room` VALUES (1,1),(2,1),(3,2);
/*!40000 ALTER TABLE `pegapp_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_scenario`
--

DROP TABLE IF EXISTS `pegapp_scenario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_scenario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `duration` bigint(20) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `min_players` int(11) NOT NULL,
  `max_players` int(11) NOT NULL,
  `scenery` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_scenario`
--

LOCK TABLES `pegapp_scenario` WRITE;
/*!40000 ALTER TABLE `pegapp_scenario` DISABLE KEYS */;
INSERT INTO `pegapp_scenario` VALUES (1,'La prison maudite du Hollandais Volant','Le Hollandais volant, parfois appelé dans le passé le « Voltigeur hollandais », est le plus célèbre des vaisseaux fantômes.',3600000000,4,2,6,'pegapp/uploads/images/scenery/le-hollandais-volant.png'),(2,'Le laboratoire explosif du Dr Schnapp','Le Dr Schnapp était un grand savant. Inventeur de génie dans tous les domaines, il était aussi fou qu\'intelligent. Sa spécialité était la chimie. Malheureusement, son obsession pour la fabrication d\'explosifs causa sa perte. A sa mort, on trouva son journal intime dans lequel il parle d\'une découverte extrêmement importante, et qui pourrait sauver l\'humanité. Il dit que son secret est caché dans son laboratoire, truffé de pièges !',2700000000,5,2,8,'pegapp/uploads/images/scenery/schnapp_laboratoire.jpg');
/*!40000 ALTER TABLE `pegapp_scenario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_user`
--

DROP TABLE IF EXISTS `pegapp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_user`
--

LOCK TABLES `pegapp_user` WRITE;
/*!40000 ALTER TABLE `pegapp_user` DISABLE KEYS */;
INSERT INTO `pegapp_user` VALUES (2,'pbkdf2_sha256$390000$vYcifsJdSFsQA6C6XGSfPL$fw5g+nvXurg7e8e10AhJx4FLIEu5nzGnsfOUzf8Y73M=','2023-07-16 13:09:16.760580',1,'miles','','','selim.dleyssac@protonmail.com',1,1,'2023-01-15 16:40:47.341201'),(4,'pbkdf2_sha256$390000$8P4wYt3wngBsFp5yqnDSSd$JSE2ULlo1nBwDdKqNuFIXTLiMVQFmQPgs0/w8w+qyzA=','2023-07-16 08:55:00.747666',0,'FirstUser','First','User','',0,1,'2023-05-19 09:32:50.001739'),(6,'pbkdf2_sha256$390000$QxzozwcuytktxQNczsC6rV$BTeZZX3csXUjUvoV6MkCg4Hxiwdhk2x+PzLoVOiZhSA=','2023-07-16 08:58:35.888404',1,'admin','','','',1,1,'2023-07-16 08:58:01.000000'),(7,'pbkdf2_sha256$390000$nMcwHlXtn4iwzIUKafNHMw$XhD0sc4bwG1nOQVW77FAQ3V9LdlDkF3q+eKkUEC/1j4=','2023-07-16 13:09:04.000000',0,'staff','','','',1,1,'2023-07-16 13:09:04.000000');
/*!40000 ALTER TABLE `pegapp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_user_groups`
--

DROP TABLE IF EXISTS `pegapp_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pegapp_user_groups_user_id_group_id_6e2ba37b_uniq` (`user_id`,`group_id`),
  KEY `pegapp_user_groups_group_id_cd82f278_fk_auth_group_id` (`group_id`),
  CONSTRAINT `pegapp_user_groups_group_id_cd82f278_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `pegapp_user_groups_user_id_627f4001_fk_pegapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `pegapp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_user_groups`
--

LOCK TABLES `pegapp_user_groups` WRITE;
/*!40000 ALTER TABLE `pegapp_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegapp_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegapp_user_user_permissions`
--

DROP TABLE IF EXISTS `pegapp_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegapp_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pegapp_user_user_permissions_user_id_permission_id_caaced48_uniq` (`user_id`,`permission_id`),
  KEY `pegapp_user_user_per_permission_id_aa723700_fk_auth_perm` (`permission_id`),
  CONSTRAINT `pegapp_user_user_per_permission_id_aa723700_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `pegapp_user_user_permissions_user_id_dded34c1_fk_pegapp_user_id` FOREIGN KEY (`user_id`) REFERENCES `pegapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_user_user_permissions`
--

LOCK TABLES `pegapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `pegapp_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `pegapp_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-16 23:09:44
