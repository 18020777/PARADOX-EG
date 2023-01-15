-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: paradox
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add scenario',7,'add_scenario'),(26,'Can change scenario',7,'change_scenario'),(27,'Can delete scenario',7,'delete_scenario'),(28,'Can view scenario',7,'view_scenario'),(29,'Can add image',8,'add_image'),(30,'Can change image',8,'change_image'),(31,'Can delete image',8,'delete_image'),(32,'Can view image',8,'view_image'),(33,'Can add room',9,'add_room'),(34,'Can change room',9,'change_room'),(35,'Can delete room',9,'delete_room'),(36,'Can view room',9,'view_room'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$tsGRoH0uIgMFkHHzZft70e$80NVisM5JuPtC4sIpfYXIlwgW8tnMibxJ6cIZhhYvUg=','2023-01-14 21:24:52.024552',1,'miles','','','selim.dleyssac@protonmail.com',1,1,'2022-10-16 14:34:49.229616'),(2,'pbkdf2_sha256$390000$pgHOp3b8wIdQ4v2bzSD6Gd$52xYk1bbInJf2+DImP+tf9ae+3/xyFrmUd7XWnmPfcc=','2022-10-18 21:28:02.698422',0,'admin','Administrateur','','',1,1,'2022-10-16 14:36:48.000000'),(3,'pbkdf2_sha256$390000$205c2ESlaQDn5V3vqK5gdI$ikQHCu+uip4HUfmtt4j3RLC6lZrjRhU6WAUsyeYzs10=','2023-01-14 21:27:40.000000',0,'FirstUser','First','User','firstuser@random.com',0,1,'2023-01-14 21:26:22.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (2,2,4),(3,2,8),(4,2,12),(5,2,16),(6,2,17),(7,2,18),(8,2,19),(9,2,20),(10,2,25),(11,2,26),(12,2,27),(13,2,28),(14,2,29),(15,2,30),(16,2,31),(1,2,32),(17,2,33),(18,2,34),(19,2,35),(20,2,36);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-10-16 14:36:48.220445','2','admin',1,'[{\"added\": {}}]',4,1),(2,'2022-10-16 14:37:56.547982','2','admin',2,'[{\"changed\": {\"fields\": [\"First name\", \"Staff status\"]}}]',4,1),(3,'2022-10-16 15:13:57.882155','1','Scenario object (1)',1,'[{\"added\": {}}]',7,1),(4,'2022-10-16 15:14:14.769903','1','Scenario object (1)',3,'',7,1),(5,'2022-10-16 15:14:37.920826','2','Scenario object (2)',1,'[{\"added\": {}}]',7,1),(6,'2022-10-16 15:14:44.188731','2','Scenario object (2)',3,'',7,1),(7,'2022-10-16 16:34:49.484925','1','Image object (1)',1,'[{\"added\": {}}]',8,1),(8,'2022-10-16 16:35:00.083442','1','Image object (1)',3,'',8,1),(9,'2022-10-16 16:49:52.113705','2','Image object (2)',1,'[{\"added\": {}}]',8,1),(10,'2022-10-16 16:50:11.938624','3','Scenario object (3)',1,'[{\"added\": {}}]',7,1),(11,'2022-10-16 16:50:20.012114','3','Scenario object (3)',3,'',7,1),(12,'2022-10-16 16:50:41.664675','2','Image object (2)',3,'',8,1),(13,'2022-10-16 16:52:00.680620','3','Image object (3)',1,'[{\"added\": {}}]',8,1),(14,'2022-10-16 16:52:13.365778','4','Scenario object (4)',1,'[{\"added\": {}}]',7,1),(15,'2022-10-16 16:52:57.862007','4','Scenario object (4)',3,'',7,1),(16,'2022-10-16 16:53:06.247108','3','Image object (3)',3,'',8,1),(17,'2022-10-16 17:03:29.714783','4','Image object (4)',1,'[{\"added\": {}}]',8,1),(18,'2022-10-16 17:03:57.368447','4','Image object (4)',3,'',8,1),(19,'2022-10-16 17:14:23.186976','5','Image object (5)',1,'[{\"added\": {}}]',8,1),(20,'2022-10-16 17:14:57.933784','6','Image object (6)',1,'[{\"added\": {}}]',8,1),(21,'2022-10-16 17:15:36.399852','5','Scenario object (5)',1,'[{\"added\": {}}]',7,1),(22,'2022-10-16 17:15:47.834094','5','Scenario object (5)',3,'',7,1),(23,'2022-10-16 17:15:56.807459','6','Image object (6)',3,'',8,1),(24,'2022-10-16 17:15:56.818244','5','Image object (5)',3,'',8,1),(25,'2022-10-16 17:18:42.077258','2','admin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(26,'2022-10-16 17:36:57.591114','7','Image object (7)',1,'[{\"added\": {}}]',8,2),(27,'2022-10-16 17:37:13.570553','8','Image object (8)',1,'[{\"added\": {}}]',8,2),(28,'2022-10-16 17:37:22.558711','9','Image object (9)',1,'[{\"added\": {}}]',8,2),(29,'2022-10-16 17:39:25.039834','6','Scenario object (6)',1,'[{\"added\": {}}]',7,2),(30,'2022-10-16 17:49:45.027673','7','Scenario object (7)',1,'[{\"added\": {}}]',7,2),(31,'2022-10-18 20:42:36.556577','1','Room object (1)',1,'[{\"added\": {}}]',9,1),(32,'2022-10-18 20:42:46.735703','2','Room object (2)',1,'[{\"added\": {}}]',9,1),(33,'2022-10-18 20:43:08.826202','2','Room object (2)',2,'[{\"changed\": {\"fields\": [\"Scenario\"]}}]',9,1),(34,'2022-10-18 20:43:14.909453','2','Room object (2)',3,'',9,1),(35,'2022-10-18 20:43:14.919069','1','Room object (1)',3,'',9,1),(36,'2022-10-18 20:43:51.583302','2','admin',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',4,1),(37,'2022-10-18 20:45:17.809502','8','Techno',1,'[{\"added\": {}}]',7,2),(38,'2022-10-18 20:45:48.991586','1','Room object (1)',1,'[{\"added\": {}}]',9,2),(39,'2022-10-18 20:45:57.043954','8','Techno',3,'',7,2),(40,'2022-10-18 20:46:08.203259','1','Room object (1)',3,'',9,2),(41,'2022-10-18 21:04:29.642118','9','Scenario object (9)',1,'[{\"added\": {}}]',7,1),(42,'2022-10-18 21:04:35.557918','9','Scenario object (9)',3,'',7,1),(43,'2022-10-18 21:29:16.776467','1','Room object (1)',1,'[{\"added\": {}}]',9,1),(44,'2022-10-18 21:29:32.315980','7','Le laboratoire explosif du Dr Schnapp.',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',7,1),(45,'2022-10-18 21:29:37.495820','7','Le laboratoire explosif du Dr Schnapp.',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',7,1),(46,'2022-10-18 21:29:59.306656','1','Room object (1)',2,'[{\"changed\": {\"fields\": [\"Scenario\"]}}]',9,1),(47,'2022-10-18 21:30:06.175347','10','Techno',1,'[{\"added\": {}}]',7,1),(48,'2022-10-18 21:30:24.135308','-1','Room object (-1)',1,'[{\"added\": {}}]',9,1),(49,'2022-10-18 21:30:35.832743','10','Techno',3,'',7,1),(50,'2022-10-18 21:31:36.018028','-1','Room object (-1)',3,'',9,1),(51,'2022-10-18 21:31:41.601123','1','Room object (1)',3,'',9,1),(52,'2022-10-22 19:03:32.655277','7','Le laboratoire explosif du Dr Schnapp.',2,'[]',7,1),(53,'2022-10-22 19:03:37.387860','7','Le laboratoire explosif du Dr Schnapp.',2,'[]',7,1),(54,'2022-10-22 19:03:40.288645','6','La prison maudite du Hollandais Volant',2,'[]',7,1),(55,'2022-12-18 14:26:50.037340','9','pegapp/uploads/images/gallery/schnapp_laboratoire.jpg',3,'',8,1),(56,'2022-12-18 14:28:26.279639','10','pegapp/uploads/images/gallery/schnapp_laboratoire_nVOaXwx.jpg',1,'[{\"added\": {}}]',8,1),(57,'2022-12-18 14:28:38.030777','7','Le laboratoire explosif du Dr Schnapp.',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',7,1),(58,'2022-12-18 14:29:29.053722','10','pegapp/uploads/images/gallery/schnapp_laboratoire_nVOaXwx.jpg',3,'',8,1),(59,'2022-12-18 14:30:30.513224','11','pegapp/uploads/images/gallery/schnapp_laboratoire.jpg',1,'[{\"added\": {}}]',8,1),(60,'2022-12-18 14:30:37.305171','7','Le laboratoire explosif du Dr Schnapp.',2,'[{\"changed\": {\"fields\": [\"Images\"]}}]',7,1),(61,'2022-12-18 21:31:00.820682','7','Le laboratoire explosif du Dr Schnapp.',2,'[{\"changed\": {\"fields\": [\"Scenery\"]}}]',7,1),(62,'2022-12-18 21:31:29.342153','6','La prison maudite du Hollandais Volant',2,'[{\"changed\": {\"fields\": [\"Scenery\"]}}]',7,1),(63,'2022-12-18 21:32:10.438326','11','pegapp/uploads/images/gallery/schnapp_laboratoire.jpg',3,'',8,1),(64,'2022-12-18 21:32:10.443090','7','pegapp/uploads/images/gallery/le-hollandais-volant.png',3,'',8,1),(65,'2022-12-18 21:35:34.136251','7','Le laboratoire explosif du Dr Schnapp',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',7,1),(66,'2022-12-27 19:45:37.155742','8','pegapp/uploads/images/gallery/le-hollandais-volant_prison.jpeg',2,'[{\"changed\": {\"fields\": [\"Name\", \"Scenario\"]}}]',8,1),(67,'2023-01-14 21:26:22.917447','3','FirstUser',1,'[{\"added\": {}}]',4,1),(68,'2023-01-14 21:27:45.688274','3','FirstUser',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Last login\"]}}]',4,1),(69,'2023-01-14 21:27:53.603079','3','FirstUser',2,'[]',4,1),(70,'2023-01-15 00:09:45.002918','1','Room: 1',1,'[{\"added\": {}}]',9,1),(71,'2023-01-15 00:10:08.605440','1','Room: 1',3,'',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'pegapp','image'),(9,'pegapp','room'),(7,'pegapp','scenario'),(10,'pegapp','user'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-10-16 14:26:16.792499'),(2,'auth','0001_initial','2022-10-16 14:26:17.656835'),(3,'admin','0001_initial','2022-10-16 14:26:17.871797'),(4,'admin','0002_logentry_remove_auto_add','2022-10-16 14:26:17.891095'),(5,'admin','0003_logentry_add_action_flag_choices','2022-10-16 14:26:17.906591'),(6,'contenttypes','0002_remove_content_type_name','2022-10-16 14:26:18.002092'),(7,'auth','0002_alter_permission_name_max_length','2022-10-16 14:26:18.096359'),(8,'auth','0003_alter_user_email_max_length','2022-10-16 14:26:18.195403'),(9,'auth','0004_alter_user_username_opts','2022-10-16 14:26:18.215373'),(10,'auth','0005_alter_user_last_login_null','2022-10-16 14:26:18.284902'),(11,'auth','0006_require_contenttypes_0002','2022-10-16 14:26:18.289982'),(12,'auth','0007_alter_validators_add_error_messages','2022-10-16 14:26:18.304917'),(13,'auth','0008_alter_user_username_max_length','2022-10-16 14:26:18.329989'),(14,'auth','0009_alter_user_last_name_max_length','2022-10-16 14:26:18.355653'),(15,'auth','0010_alter_group_name_max_length','2022-10-16 14:26:18.448534'),(16,'auth','0011_update_proxy_permissions','2022-10-16 14:26:18.468766'),(17,'auth','0012_alter_user_first_name_max_length','2022-10-16 14:26:18.494431'),(18,'sessions','0001_initial','2022-10-16 14:26:18.556516'),(19,'pegapp','0001_initial','2022-10-16 15:11:30.541896'),(20,'pegapp','0002_alter_scenario_duration','2022-10-16 15:13:02.582765'),(21,'pegapp','0003_image','2022-10-16 16:34:21.778914'),(22,'pegapp','0004_rename_img_path_image_image_scenario_images','2022-10-16 16:49:17.929238'),(23,'pegapp','0005_alter_image_image','2022-10-16 17:03:03.657480'),(24,'pegapp','0006_scenario_max_players_scenario_min_players_and_more','2022-10-16 17:13:42.140861'),(25,'pegapp','0007_alter_scenario_max_players_and_more','2022-10-16 17:13:42.153192'),(26,'pegapp','0008_room','2022-10-18 20:31:29.414265'),(27,'pegapp','0009_alter_room_num','2022-10-18 20:41:10.184422'),(28,'pegapp','0010_alter_room_num','2022-10-18 20:44:37.978537'),(29,'pegapp','0008_alter_scenario_images','2022-10-18 21:03:50.729451'),(30,'pegapp','0009_alter_scenario_images','2022-10-18 21:03:50.745387'),(31,'pegapp','0011_merge_0009_alter_scenario_images_0010_alter_room_num','2022-10-18 21:27:37.194986'),(32,'pegapp','0012_alter_room_scenario','2022-10-18 21:28:56.760108'),(33,'pegapp','0013_image_priority','2022-10-22 22:21:18.761322'),(34,'pegapp','0014_rename_images_scenario_gallery_scenario_scenery','2022-12-18 21:26:21.148906'),(35,'pegapp','0015_remove_image_priority_remove_scenario_gallery_and_more','2022-12-27 19:09:34.474930'),(36,'pegapp','0016_image_name','2022-12-27 19:44:47.784125');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('26w4wfge9xow8hdjt0qbtq3bhqhdkav8','.eJxVjDsOwjAQRO_iGlle_5eSnjNY6w84gGwpTirE3UmkFNCN5r2ZNwu0LjWso8xhyuzMgJ1-u0jpWdoO8oPavfPU2zJPke8KP-jg157L63K4fweVRt3WkYrRmJEMoUXjpPMSlLRGRLvlhDeI3jtZBGoEhV6QhmQxKRAJrWefL7eGNkM:1p6sqN:qGzVUAawMsqqJ_ENgaDVaFfwARc0H4guIY3X3K0LJyk','2023-01-01 12:32:39.281495'),('ls56ai774ehhqd6xd6y66u6uj3g2q559','.eJxVjDsOwjAQRO_iGlle_5eSnjNY6w84gGwpTirE3UmkFNCN5r2ZNwu0LjWso8xhyuzMgJ1-u0jpWdoO8oPavfPU2zJPke8KP-jg157L63K4fweVRt3WkYrRmJEMoUXjpPMSlLRGRLvlhDeI3jtZBGoEhV6QhmQxKRAJrWefL7eGNkM:1oku99:DnmolWYAryTXZoe2sLGH3YCM1CslbUaeJqmoaYqkMuw','2022-11-01 21:29:11.489088'),('tjj1p7km4ghdbv96yvrqtux0cca43tfk','.eJxVjDsOwjAQRO_iGlle_5eSnjNY6w84gGwpTirE3UmkFNCN5r2ZNwu0LjWso8xhyuzMgJ1-u0jpWdoO8oPavfPU2zJPke8KP-jg157L63K4fweVRt3WkYrRmJEMoUXjpPMSlLRGRLvlhDeI3jtZBGoEhV6QhmQxKRAJrWefL7eGNkM:1pGo1E:ppvy-VFBXKfK-7Nx_JFdwxDdazP4gIsWrxtpZAb8dx4','2023-01-28 21:24:52.028254');
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
  `scenario_id` bigint(20) DEFAULT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pegapp_image_scenario_id_9c6c8633_fk_pegapp_scenario_id` (`scenario_id`),
  CONSTRAINT `pegapp_image_scenario_id_9c6c8633_fk_pegapp_scenario_id` FOREIGN KEY (`scenario_id`) REFERENCES `pegapp_scenario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_image`
--

LOCK TABLES `pegapp_image` WRITE;
/*!40000 ALTER TABLE `pegapp_image` DISABLE KEYS */;
INSERT INTO `pegapp_image` VALUES (8,'pegapp/uploads/images/gallery/le-hollandais-volant_prison.jpeg',6,'HV_Prison');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `max_players` int(11) NOT NULL,
  `min_players` int(11) NOT NULL,
  `scenery` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegapp_scenario`
--

LOCK TABLES `pegapp_scenario` WRITE;
/*!40000 ALTER TABLE `pegapp_scenario` DISABLE KEYS */;
INSERT INTO `pegapp_scenario` VALUES (6,'La prison maudite du Hollandais Volant','Le Hollandais volant, parfois appelé dans le passé le « Voltigeur hollandais », est le plus célèbre des vaisseaux fantômes.',3600000000,4,6,2,'pegapp/uploads/images/scenery/le-hollandais-volant.png'),(7,'Le laboratoire explosif du Dr Schnapp','Le Dr Schnapp était un grand savant. Inventeur de génie dans tous les domaines, il était aussi fou qu\'intelligent. Sa spécialité était la chimie. Malheureusement, son obsession pour la fabrication d\'explosifs causa sa perte. A sa mort, on trouva son journal intime dans lequel il parle d\'une découverte extrêmement importante, et qui pourrait sauver l\'humanité. Il dit que son secret est caché dans son laboratoire, truffé de pièges !',2700000000,5,4,1,'pegapp/uploads/images/scenery/schnapp_laboratoire.jpg');
/*!40000 ALTER TABLE `pegapp_scenario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-15 11:52:22
