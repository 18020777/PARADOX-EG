-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: paradox_db
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-0+deb11u1

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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add scenario',6,'add_scenario'),(22,'Can change scenario',6,'change_scenario'),(23,'Can delete scenario',6,'delete_scenario'),(24,'Can view scenario',6,'view_scenario'),(25,'Can add room',7,'add_room'),(26,'Can change room',7,'change_room'),(27,'Can delete room',7,'delete_room'),(28,'Can view room',7,'view_room'),(29,'Can add image',8,'add_image'),(30,'Can change image',8,'change_image'),(31,'Can delete image',8,'delete_image'),(32,'Can view image',8,'view_image'),(33,'Can add user',9,'add_user'),(34,'Can change user',9,'change_user'),(35,'Can delete user',9,'delete_user'),(36,'Can view user',9,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-15 17:07:27.257042','3','admin',1,'[{\"added\": {}}]',9,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'pegapp','image'),(7,'pegapp','room'),(6,'pegapp','scenario'),(9,'pegapp','user'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-15 16:22:51.483753'),(2,'contenttypes','0002_remove_content_type_name','2023-01-15 16:22:51.558512'),(3,'auth','0001_initial','2023-01-15 16:22:51.906520'),(4,'auth','0002_alter_permission_name_max_length','2023-01-15 16:22:51.985942'),(5,'auth','0003_alter_user_email_max_length','2023-01-15 16:22:51.997921'),(6,'auth','0004_alter_user_username_opts','2023-01-15 16:22:52.009713'),(7,'auth','0005_alter_user_last_login_null','2023-01-15 16:22:52.021986'),(8,'auth','0006_require_contenttypes_0002','2023-01-15 16:22:52.026936'),(9,'auth','0007_alter_validators_add_error_messages','2023-01-15 16:22:52.042333'),(10,'auth','0008_alter_user_username_max_length','2023-01-15 16:22:52.058111'),(11,'auth','0009_alter_user_last_name_max_length','2023-01-15 16:22:52.070435'),(12,'auth','0010_alter_group_name_max_length','2023-01-15 16:22:52.090044'),(13,'auth','0011_update_proxy_permissions','2023-01-15 16:22:52.103880'),(14,'auth','0012_alter_user_first_name_max_length','2023-01-15 16:22:52.115865'),(15,'pegapp','0001_initial','2023-01-15 16:22:52.744106'),(16,'admin','0001_initial','2023-01-15 16:22:52.937440'),(17,'admin','0002_logentry_remove_auto_add','2023-01-15 16:22:52.955007'),(18,'admin','0003_logentry_add_action_flag_choices','2023-01-15 16:22:52.971860'),(19,'sessions','0001_initial','2023-01-15 16:22:53.023727'),(20,'pegapp','0002_user_phone','2023-01-15 16:28:42.483326'),(21,'pegapp','0003_remove_user_phone','2023-01-15 16:32:06.197419');
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
INSERT INTO `django_session` VALUES ('znlcr59s4bnhn0v7q207r6p7ka4w8yp5','.eJxVjLsOwjAMAP8lM4qcxm1qRna-oYodlxZQIvUxIf4dInWA9e50LzPEfZuGfdVlmJM5m8acfhlHeWiuIt1jvhUrJW_LzLYm9rCrvZakz8vR_g2muE51C9QLtX1DITkW9KQqbvwOOhQUInTKnXITInpoE4QRCFGBIXhPYN4f32o3dA:1pHArT:Mj91gIRScmGxrv80V3XHYiKQ4fto6xTqrzcQf-YzmZ0','2023-01-29 21:48:19.620031');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_image`
--

LOCK TABLES `pegapp_image` WRITE;
/*!40000 ALTER TABLE `pegapp_image` DISABLE KEYS */;
INSERT INTO `pegapp_image` VALUES (1,'pegapp/uploads/images/gallery/le-hollandais-volant_prison.jpeg','6',1);
/*!40000 ALTER TABLE `pegapp_image` ENABLE KEYS */;
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
INSERT INTO `pegapp_scenario` VALUES (1,'La prison maudite du Hollandais Volant','Le Hollandais volant, parfois appelé dans le passé le « Voltigeur hollandais », est le plus célèbre des vaisseaux fantômes.',3600000000,4,6,2,'pegapp/uploads/images/scenery/le-hollandais-volant.png'),(2,'Le laboratoire explosif du Dr Schnapp','Le Dr Schnapp était un grand savant. Inventeur de génie dans tous les domaines, il était aussi fou qu\'intelligent. Sa spécialité était la chimie. Malheureusement, son obsession pour la fabrication d\'explosifs causa sa perte. A sa mort, on trouva son journal intime dans lequel il parle d\'une découverte extrêmement importante, et qui pourrait sauver l\'humanité. Il dit que son secret est caché dans son laboratoire, truffé de pièges !',2700000000,5,4,1,'pegapp/uploads/images/scenery/schnapp_laboratoire.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_user`
--

LOCK TABLES `pegapp_user` WRITE;
/*!40000 ALTER TABLE `pegapp_user` DISABLE KEYS */;
INSERT INTO `pegapp_user` VALUES (2,'pbkdf2_sha256$390000$vYcifsJdSFsQA6C6XGSfPL$fw5g+nvXurg7e8e10AhJx4FLIEu5nzGnsfOUzf8Y73M=','2023-01-15 21:48:19.614540',1,'miles','','','selim.dleyssac@protonmail.com',1,1,'2023-01-15 16:40:47.341201'),(3,'tiapfpEG2022','2023-01-15 17:06:09.000000',0,'admin','','','',1,1,'2023-01-15 17:05:34.000000');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_user_user_permissions`
--

LOCK TABLES `pegapp_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `pegapp_user_user_permissions` DISABLE KEYS */;
INSERT INTO `pegapp_user_user_permissions` VALUES (2,3,13),(3,3,14),(4,3,15),(5,3,16),(6,3,21),(7,3,22),(8,3,23),(9,3,24),(10,3,25),(11,3,26),(12,3,27),(13,3,28),(14,3,29),(15,3,30),(16,3,31),(1,3,32);
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

-- Dump completed on 2023-02-01  7:49:16
