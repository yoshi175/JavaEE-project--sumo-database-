-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: sumo
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `club` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `starting_year` date DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES (1,'Miyagino','1960-01-01','Sumida'),(2,'Isegahama','1979-01-01','Koto'),(3,'Tagonoura','1989-01-01','Edogawa'),(4,'Izutsu','1972-01-01','Sumida'),(5,'Sakaigawa','1998-01-01','Adachi'),(6,'Dewanoumi','1862-01-01','Sumida'),(7,'Oguruma','1987-01-01','Edogawa'),(8,'Kataonami','1961-01-01','Sumida'),(9,'Kasugano','1925-01-01','Sumida'),(10,'Sadogatake','1955-01-01','Matsudo'),(11,'Hakkaku','1993-01-01','Sumida'),(12,'Onomatsu','1994-01-01','Narashino'),(13,'Kokonoe','1967-01-01','Sumida'),(14,'Nishonoseki','1990-01-01','Funabashi'),(15,'Kise','2003-01-01','Sumida'),(16,'Tokitsukaze','1941-01-01','Sumida'),(17,'Takanohana','1962-01-01','Koto'),(18,'Minato','1982-01-01','Kawaguchi'),(19,'Takadagawa','1974-01-01','koto'),(20,'Isenoumi','1949-01-01','Bunkyo'),(21,'Minezaki','1988-01-01','Nerima'),(22,'Oitekaze','1998-01-01','Soka'),(23,'Tomozuna','1941-01-01','Sumida'),(24,'Takasago','1871-01-01','Sumida'),(25,'xxx',NULL,NULL),(26,'xxx123','1111-11-11','Kooook'),(27,'xxxyxx','1891-08-09','Lambok'),(30,'yyy','1666-06-06','Stockholm'),(31,'zzasd','9999-11-11','QWE'),(33,'xzy','1888-08-08','London'),(34,'xzy','1888-08-08','London123'),(35,'yazza','1999-09-09','YamaYama'),(37,'xtestx','1998-07-15','JAAAASS');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `highest_rank` varchar(45) DEFAULT NULL,
  `competitive_matches` int(11) DEFAULT NULL,
  `competitive_wins` int(11) DEFAULT NULL,
  `competitive_losses` int(11) DEFAULT NULL,
  `retired_from_competing` date DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `club_id_fk_idx` (`club_id`),
  CONSTRAINT `club_id_fk` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1,'Koboyama','1957-08-15','Sekiwaki',1185,579,606,'1990-11-01',1),(2,'Kurosegawa','1951-05-13','Komusubi',1124,561,563,'1984-05-01',2),(3,'Takanotsuru','1976-06-18','Maegashira 8',757,393,364,'2006-05-01',3),(4,'Sakahoko','1961-06-18','Sekiwaki',1118,551,567,'1992-09-01',4),(5,'Hochiyama','1982-01-18','Maegashira 14',799,399,400,'2014-01-01',5),(6,'Dewanohana','1951-05-13','Sekiwaki',1158,572,586,'1988-01-01',6),(7,'Kotonishiki','1968-06-18','Sekiwaki',1220,663,557,'2000-09-01',7),(8,'Tamanofuji','1949-11-29','Sekiwaki',851,431,420,'1981-11-01',8),(9,'Banryuyama','1951-05-04','Komusubi',1170,579,591,'1984-11-01',9),(10,'Kotoinazuma','1962-04-26','Komusubi',1554,752,802,'1999-07-01',10),(11,'Fujinoshin','1960-11-06','Maegashira 1',794,408,386,'1990-09-01',11),(12,'Wakaoyu','1984-02-24','Komusubi',910,466,444,'2014-09-01',12),(13,'Chiyotaikai','1976-04-29','Ozeki',1295,771,524,'2010-01-01',13),(14,'Tamanoshima','1977-09-15','Sekiwaki',1140,557,583,'2011-11-01',14),(15,'Futeno','1980-08-28','Komusubi',673,326,347,'2011-05-01',15),(16,'Tosayutaka','1985-03-10','Maegashira 1',548,294,254,'2016-01-01',16),(17,'Kobo','1973-08-18','Maegashira 9',1154,582,572,'2008-01-01',17),(18,'Minatofuji','1968-06-06','Maegashira 2',1232,601,631,'2002-09-01',18),(19,'Akinoshima','1967-03-18','Sekiwaki',1579,822,757,'2003-05-01',19),(20,'Oikari','1972-06-16','Maegashira 11',692,356,336,'2204-11-01',20),(21,'Daijuyama','1959-04-11','Sekiwaki',1203,585,618,'1991-05-01',21),(22,'Asahisato','1965-11-09','Maegashira 14',1096,553,543,'1998-01-01',22),(23,'Tomonohana','1964-06-23','Komusubi',760,379,381,'2001-11-01',23),(24,'Asanowaka','1969-11-11','Maegashira 1',1145,547,598,'2005-05-01',24),(25,'ZZZtest','1999-09-09',NULL,500,250,250,'2005-05-05',18),(26,'ZZZtestigenkurwa','1999-09-01','Yokozuna',333,133,200,'2009-08-11',1),(28,'ZZZblyat','1859-04-15','Yokozuna',666,333,333,'1900-01-11',7),(29,'zTake','1992-09-15',NULL,123,122,1,'2005-05-05',13),(30,'zTake123','1992-09-15','Maegashira 2',123,122,1,'2005-05-05',13),(31,'ZZZtestigen55','1999-09-09','Yokozuna',3,3,5,'2005-05-05',6),(32,'zxtestxz','1859-04-15','Yokozuna',123,122,1,'1900-01-11',37);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `coach_join_club`
--

DROP TABLE IF EXISTS `coach_join_club`;
/*!50001 DROP VIEW IF EXISTS `coach_join_club`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `coach_join_club` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `birthdate`,
 1 AS `highest_rank`,
 1 AS `competitive_matches`,
 1 AS `competitive_wins`,
 1 AS `competitive_losses`,
 1 AS `retired_from_competing`,
 1 AS `club_id`,
 1 AS `club_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `height_cm` int(11) DEFAULT NULL,
  `weight_kg` int(11) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `native_city` varchar(45) DEFAULT NULL,
  `rank` varchar(45) DEFAULT NULL,
  `coach_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `coach_id_fk_idx` (`coach_id`),
  KEY `club_id_fk_idx` (`club_id`),
  CONSTRAINT `club_id_fk_in_table_player` FOREIGN KEY (`club_id`) REFERENCES `club` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `coach_id_fk` FOREIGN KEY (`coach_id`) REFERENCES `coach` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'Hakuho',193,151,'1985-03-11','Ulan-Bator','Yokozuna',1,1),(2,'Harumafuji',186,133,'1984-04-14','Ulan-Bator','Yokozuna',2,2),(3,'Kisenosato',188,177,'1986-07-03','Ushiku-shi','Yokozuna',3,3),(4,'Kakuryu',186,150,'1985-08-10','Ulan-Bator','Yokozuna',4,4),(5,'Takayasu',187,163,'1990-02-28','Tsuchiura-shi','Ozeki',3,3),(6,'Goeido',183,158,'1986-04-06','Neyagawa-shi','Ozeki',5,5),(7,'Terunofuji',192,159,'1991-11-29','Ulan-Bator','Ozeki',2,2),(8,'Mitakeumi',179,149,'1992-12-25','Agematsu-machi','Sekiwake',6,6),(9,'Yoshikaze',175,140,'1982-03-19','Saiki-shi','Sekiwake',7,7),(10,'Tamawashi',190,161,'1984-11-16','Ulan-Bator','Komusubi',8,8),(11,'Tochiozan',189,154,'1987-03-09','Aki-shi','Komusubi',9,9),(12,'Tochinoshin',192,162,'1987-10-13','Mtskheta','Maegashira 1',9,9),(13,'Kotoshogiku',180,177,'1984-01-30','Yanagawa-shi','Maegashira 1',10,10),(14,'Hokutofuji',182,158,'1992-07-15','Tokorozawa-shi','Maegashira 2',11,11),(15,'Aoiyama',192,193,'1986-06-19','Yambol','Maegashira 2',9,9),(16,'Onosho',176,149,'1996-07-04','Nakadomari-machi','Maegashira 3',12,12),(17,'Chiyotairyu',182,167,'1998-11-14','Arakawa-ku','Maegashira 3',13,13),(18,'Shohozan',17,135,'1984-02-09','Chikujo-cho','Maegashira 4',14,14),(19,'Ura',172,113,'1992-06-22','Neyagawa-shi','Maegashira 4',15,15),(20,'Shodai',182,150,'1991-11-05','Uto-shi','Maegashira 5',16,16),(21,'Takakeisho',173,149,'1996-08-05','Ashiya-shi','Maegashira 5',17,17),(22,'Ichinojo',190,183,'1993-04-07','Arkhangai','Maegashira 6',18,18),(23,'Kagayaki',193,144,'1994-06-01','Kanazawa-shi','Maegashira 6',19,19),(24,'Chiyonokuni',184,144,'1990-07-10','Iga-shi','Maegashira 7',13,13),(25,'Ikioi',195,157,'1986-10-11','Katano-shi','Maegashira 7',20,20),(26,'Chiyoshoma',183,118,'1991-07-20','Ulan-Bator','Maegashira 8',13,13),(27,'Takarafuji',186,161,'1987-02-18','Nakadomari-machi','Maegashira 8',2,2),(28,'Takanoiwa',181,146,'1990-02-26','Ulan-Bator','Maegashira 9',17,17),(29,'Arawashi',184,122,'1986-08-21','Ulan-Bator','Maegashira 9',21,21),(30,'Ishiura',173,104,'1990-01-10','Tottori-shi','Maegashira 10',1,1),(31,'Takekaze',170,144,'1979-06-21','Kitaakita-shi','Maegashira 10',7,7),(32,'Daieisho',179,136,'1993-11-10','Asaka-shi','Maegashira 11',22,22),(33,'Chiyomaru',178,176,'1991-04-17','Shibushi-shi','Maegashira 11',13,13),(34,'Daishomaru',175,153,'1991-07-10','Yao-shi','Maegashira 12',22,22),(35,'Sadanoumi',184,131,'1987-05-11','Higashi-ku','Maegashira 12',5,5),(36,'Nishikigi',185,150,'1990-08-25','Morioka-shi','Maegashira 13',20,20),(37,'Kaisei',195,189,'1986-12-18','Sao Paulo','Maegashira 13',23,23),(38,'Endo',183,146,'1990-10-19','Anamizu-machi','Maegashira 14',22,22),(39,'Okinoumi',190,154,'1985-07-29','Okinoshima-cho','Maegashira 14',11,11),(40,'Tokushoryu',182,171,'1986-08-22','Nara-shi','Maegashira 15',15,15),(41,'Yutakayama',185,171,'1993-09-22','Kita-ku','Maegashira 15',16,16),(42,'Asanoyama',189,158,'1994-03-01','Toyama-shi','Maegashira 16',24,24),(44,'Takeyoshi',164,63,'1992-09-15','Stockholm','Global Elite',26,NULL),(45,'zxctestcxz',123,23,'1888-08-04','geeeeeeee','Sekiwake',32,37),(46,'xxxxxxxxxxxxx',323,3333,'1999-09-09','Larreddd','Maegashira_10',19,6);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `player_join_coach_and_club`
--

DROP TABLE IF EXISTS `player_join_coach_and_club`;
/*!50001 DROP VIEW IF EXISTS `player_join_coach_and_club`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `player_join_coach_and_club` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `height_cm`,
 1 AS `weight_kg`,
 1 AS `birthdate`,
 1 AS `native_city`,
 1 AS `rank`,
 1 AS `coach_id`,
 1 AS `club_id`,
 1 AS `coach_name`,
 1 AS `club_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `coach_join_club`
--

/*!50001 DROP VIEW IF EXISTS `coach_join_club`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `coach_join_club` AS select `coach`.`id` AS `id`,`coach`.`name` AS `name`,`coach`.`birthdate` AS `birthdate`,`coach`.`highest_rank` AS `highest_rank`,`coach`.`competitive_matches` AS `competitive_matches`,`coach`.`competitive_wins` AS `competitive_wins`,`coach`.`competitive_losses` AS `competitive_losses`,`coach`.`retired_from_competing` AS `retired_from_competing`,`coach`.`club_id` AS `club_id`,`club`.`name` AS `club_name` from (`coach` join `club` on((`coach`.`club_id` = `club`.`id`))) group by `coach`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `player_join_coach_and_club`
--

/*!50001 DROP VIEW IF EXISTS `player_join_coach_and_club`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `player_join_coach_and_club` AS select `player`.`id` AS `id`,`player`.`name` AS `name`,`player`.`height_cm` AS `height_cm`,`player`.`weight_kg` AS `weight_kg`,`player`.`birthdate` AS `birthdate`,`player`.`native_city` AS `native_city`,`player`.`rank` AS `rank`,`player`.`coach_id` AS `coach_id`,`player`.`club_id` AS `club_id`,`coach`.`name` AS `coach_name`,`club`.`name` AS `club_name` from ((`player` join `coach` on((`player`.`coach_id` = `coach`.`id`))) join `club` on((`player`.`club_id` = `club`.`id`))) group by `player`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-16 20:25:31
