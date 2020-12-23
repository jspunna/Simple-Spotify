CREATE DATABASE  IF NOT EXISTS `simple_spotify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `simple_spotify`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: simple_spotify
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `album_id` int NOT NULL,
  `album_name` varchar(50) NOT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (0,'Single/No Album'),(1,'Shawn Mendes'),(2,'Emmanuel'),(3,'No.6 Collaborations Project'),(4,'Hollywood\'s Bleeding'),(5,'We Love You Tecca'),(6,'Love Goes'),(7,'7'),(8,'When We All Fall Asleep, Where Do We Go?'),(9,'Carte Blanche'),(10,'Divinely Uninspired to a Hellish Extent'),(11,'Suenos'),(12,'The Best in the World Pack'),(13,'Indigo'),(14,'Oasis'),(15,'Spider-Man: Into the Spider-Verse'),(16,'Cuz I Love You'),(17,'Famouz'),(18,'Epico'),(19,'The Kids Are Coming'),(20,'You'),(21,'El Disco Duro'),(22,'World War Joy');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `artist_id` int NOT NULL,
  `artist_name` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Shawn Mendes','Canada'),(2,'Camila Cabello','United States'),(3,'Anuel AA','Puerto Rico'),(4,'J Balvin','Colombia'),(5,'Ozuna','Puerto Rico'),(6,'Daddy Yankee','Puerto Rico'),(7,'KAROL G','Colombia'),(8,'Ariana Grande','United States'),(9,'Social House','United States'),(10,'Ed Sheeran','United Kingdom'),(11,'Khalid','United States'),(12,'Post Malone','United States'),(13,'Young Thug','United States'),(14,'Justin Bieber','Canada'),(15,'Lil Tecca','United States'),(16,'Sam Smith','United Kingdom'),(17,'Lil Nas X','United States'),(18,'Billy Ray Cyrus','United States'),(19,'Billie Eilish','United States'),(20,'Bad Bunny','Puerto Rico'),(21,'Tainy','Puerto Rico'),(22,'DJ Snake','France'),(23,'Tyga','United States'),(24,'Lewis Capaldi','United Kingdom'),(25,'Sech','Panama'),(26,'Darell','Puerto Rico'),(27,'Nicky Jam','United States'),(28,'Drake','Canada'),(29,'Rick Ross','United States'),(30,'Chris Brown','United States'),(31,'Swae Lee','United States'),(32,'Y2K','United States'),(33,'bbno$','Canada'),(34,'Lizzo','United States'),(35,'MEDUZA','Italy'),(36,'Goodboys','United Kingdom'),(37,'Jhay Cortez','Puerto Rico'),(38,'Lunay','Puerto Rico'),(39,'Tones and I','Australia'),(40,'Ali Gatie','Yemen'),(41,'Snow','Canada'),(42,'The Chainsmokers','United States'),(43,'ILLENIUM','United States'),(44,'Lennon Stella','Canada');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistsong`
--

DROP TABLE IF EXISTS `artistsong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistsong` (
  `artist_id` int NOT NULL,
  `song_id` int NOT NULL,
  PRIMARY KEY (`artist_id`,`song_id`),
  KEY `artistsong_fk_song` (`song_id`),
  CONSTRAINT `artistsong_fk_artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `artistsong_fk_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistsong`
--

LOCK TABLES `artistsong` WRITE;
/*!40000 ALTER TABLE `artistsong` DISABLE KEYS */;
INSERT INTO `artistsong` VALUES (1,1),(2,1),(3,2),(4,2),(5,2),(6,2),(7,2),(8,3),(9,3),(10,4),(11,4),(12,5),(13,5),(10,6),(14,6),(15,7),(16,8),(17,9),(18,9),(19,10),(20,11),(21,11),(4,12),(22,12),(23,12),(24,13),(3,14),(5,14),(25,14),(26,14),(27,14),(28,15),(29,15),(28,16),(30,16),(4,17),(20,17),(12,18),(31,18),(32,19),(33,19),(34,20),(35,21),(36,21),(17,22),(4,23),(20,23),(37,23),(6,24),(20,24),(38,24),(1,25),(39,26),(40,27),(6,28),(41,28),(4,29),(20,29),(42,30),(43,30),(44,30);
/*!40000 ALTER TABLE `artistsong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `genre_id` int NOT NULL,
  `genre_type` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Pop'),(2,'Hip-hop/Rap'),(3,'Country'),(4,'Dance/EDM'),(5,'Rock'),(6,'Latin/Reggaeton'),(7,'Indie/Alternative'),(8,'Christian'),(9,'Classical'),(10,'Jazz'),(11,'Folk'),(12,'Soul/Funk'),(13,'Punk'),(14,'Blues'),(15,'Metal'),(16,'R&B');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `playlist_id` int NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `playlist_fk_user` (`user_name`),
  CONSTRAINT `playlist_fk_user` FOREIGN KEY (`user_name`) REFERENCES `user_info` (`user_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlistsong`
--

DROP TABLE IF EXISTS `playlistsong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlistsong` (
  `playlist_id` int NOT NULL,
  `song_id` int NOT NULL,
  PRIMARY KEY (`playlist_id`,`song_id`),
  KEY `playlistsong_fk_song` (`song_id`),
  CONSTRAINT `playlistsong_fk_playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `playlistsong_fk_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlistsong`
--

LOCK TABLES `playlistsong` WRITE;
/*!40000 ALTER TABLE `playlistsong` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlistsong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `song_id` int NOT NULL,
  `song_name` varchar(50) NOT NULL,
  `total_streams` bigint NOT NULL,
  `beats_per_minute` int NOT NULL,
  `energy` int NOT NULL,
  `danceability` int NOT NULL,
  `loudness` int NOT NULL,
  `positivity` int NOT NULL,
  `song_length` int NOT NULL,
  `popularity` int NOT NULL,
  `album_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `song_fk_album` (`album_id`),
  KEY `song_fk_genre` (`genre_id`),
  CONSTRAINT `song_fk_album` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `song_fk_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Senorita',1658465555,117,55,76,-6,75,191,79,1,1),(2,'China',772006676,105,81,79,-4,61,302,92,2,6),(3,'boyfriend',385153513,190,80,40,-4,70,186,85,0,4),(4,'Beautiful People',892029694,93,65,64,-8,55,198,86,3,1),(5,'Goodbyes',774460201,150,65,58,-4,18,175,94,4,2),(6,'I Don\'t Care',1202105568,102,68,80,-5,84,220,84,3,1),(7,'Ransom',761164153,180,64,75,-6,23,131,92,5,2),(8,'How Do You Sleep?',645067011,111,68,48,-5,35,202,90,6,1),(9,'Old Town Road - Remix',1089385833,136,62,88,-6,64,157,87,7,3),(10,'bad guy',1605537737,135,43,70,-11,56,194,95,8,1),(11,'Callaita',722176101,176,62,61,-5,24,251,93,0,6),(12,'Loco Contigo',55687676,96,71,82,-4,38,185,86,9,4),(13,'Someone You Loved',1628623719,110,41,50,-6,45,182,88,10,1),(14,'Otro Trago - Remix',367116995,176,79,73,-2,76,288,87,11,4),(15,'Money In The Grave',583042492,101,50,83,-4,10,205,92,12,2),(16,'No Guidance',549522968,93,45,70,-7,14,261,82,13,16),(17,'LA CANCION',620798305,176,65,75,-6,43,243,90,14,6),(18,'Sunflower - Spider-Man: Into the Spider-Verse',1726789502,90,48,76,-6,91,158,91,15,2),(19,'Lalala',688997855,130,39,84,-8,50,161,88,0,2),(20,'Truth Hurts',652153493,158,62,72,-3,41,173,91,16,1),(21,'Piece Of Your Heart',641051165,124,74,68,-7,63,153,91,0,4),(22,'Panini',511459284,154,59,70,-6,48,115,91,7,2),(23,'No Me Conoce - Remix',632619651,92,79,81,-4,58,309,83,17,6),(24,'Soltera - Remix',579357907,92,78,80,-4,80,266,91,18,6),(25,'If I Can\'t Have You',633286300,124,82,69,-4,87,191,70,1,1),(26,'Dance Monkey',1960673053,98,59,82,-6,54,210,83,19,1),(27,'It\'s You',583185388,96,46,73,-7,40,213,89,20,2),(28,'Con Calma',903745736,94,86,74,-3,66,193,91,21,6),(29,'QUE PRETENDES',380193050,93,79,64,-4,94,222,89,14,6),(30,'Takeaway',388254101,85,51,29,-8,36,210,84,22,4);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_info` (
  `user_name` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'punnapuzha_final_report'
--
/*!50003 DROP FUNCTION IF EXISTS `check_playlistsong_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `check_playlistsong_exists`(user_name_input VARCHAR(50), playlist_name_input VARCHAR(50), song_ranking INT) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
		DECLARE playlistsong_playid INT;
        DECLARE playlistsong_songid INT;
        
        SELECT playlist_id INTO playlistsong_playid FROM playlist
			WHERE user_name = user_name_input and playlist_name = playlist_name_input;
            
		SELECT song_id INTO playlistsong_songid FROM playlistsong
			WHERE playlist_id = playlistsong_playid and song_id = song_ranking;
            
		IF playlistsong_songid = song_ranking THEN
			RETURN 1;
		ELSE
			RETURN 0;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `confirm_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `confirm_login`(username_input VARCHAR(255), password_input VARCHAR(255)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
		DECLARE username VARCHAR(255);
        DECLARE pass VARCHAR(255);
        
        SELECT user_name INTO username FROM user_info
			WHERE user_name = username_input and user_password = password_input;
		SELECT user_password INTO pass FROM user_info
			WHERE user_name = username_input and user_password = password_input;
            
		IF username_input = username and password_input = pass THEN
			RETURN 1;
		ELSE
			RETURN 0;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `playlist_exists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `playlist_exists`(user_name_input VARCHAR(50), playlist_name_input VARCHAR(50)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
		DECLARE playlist_check VARCHAR(255);
        
        SELECT playlist_name INTO playlist_check FROM playlist
			WHERE user_name = user_name_input and playlist_name = playlist_name_input;
            
		IF playlist_check = playlist_name_input THEN
			RETURN 1;
		ELSE
			RETURN 0;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `user_check` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `user_check`(username_input VARCHAR(255)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
		DECLARE username VARCHAR(255);
        
        SELECT user_name INTO username FROM user_info
			WHERE user_name = username_input;
            
		IF username_input = username THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_to_playlistsong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_to_playlistsong`(IN user_name_input VARCHAR(50), IN playlist_name_input VARCHAR(50), IN song_ranking INT)
BEGIN
		DECLARE playlistsong_id INT;
        
        SELECT playlist_id INTO playlistsong_id FROM playlist
			WHERE user_name = user_name_input and playlist_name = playlist_name_input;
        
		INSERT INTO playlistsong
			(playlist_id, song_id)
            VALUES (playlistsong_id, song_ranking);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(IN user_name_input VARCHAR(50), IN password_input VARCHAR(50), IN first_name_input VARCHAR(50), IN last_name_input VARCHAR(50), IN email_input VARCHAR(50))
BEGIN
		INSERT INTO user_info
			(user_name, user_password, first_name, last_name, email)
            VALUES (user_name_input, password_input, first_name_input, last_name_input, email_input);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_playlist`(IN user_name_input VARCHAR(50), IN playlist_name_input VARCHAR(50))
BEGIN
		INSERT INTO playlist
			(playlist_name, user_name)
            VALUES (playlist_name_input, user_name_input);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_from_playlistsong` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_from_playlistsong`(IN user_name_input VARCHAR(50), IN playlist_name_input VARCHAR(50), IN song_ranking INT)
BEGIN
        DECLARE playlistsong_id INT;
        
        SELECT playlist_id INTO playlistsong_id FROM playlist
			WHERE user_name = user_name_input and playlist_name = playlist_name_input;
        
		DELETE FROM playlistsong
			WHERE playlist_id = playlistsong_id and song_id = song_ranking;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_playlist`(IN user_name_input VARCHAR(50), IN playlist_name_input VARCHAR(50))
BEGIN
		DELETE FROM playlist 
			WHERE playlist_name = playlist_name_input and user_name = user_name_input;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(IN user_name_input VARCHAR(50))
BEGIN
		DELETE FROM user_info 
			WHERE user_name = user_name_input;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_avg_artist_streams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_avg_artist_streams`()
BEGIN
		SELECT artist_name as Artist, COUNT(song_id) as Number_of_Songs, Format(AVG(total_streams), '#,0') as Average_Song_Streams  FROM song 
			JOIN (SELECT song_id, artist_name, nationality FROM artistsong
				JOIN artist USING (artist_id)) as t
		USING (song_id)
		GROUP BY Artist
		ORDER BY Artist;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_genre_song_avg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_genre_song_avg`()
BEGIN
		SELECT genre_type as Genre, COUNT(*) as Number_of_Songs, Format(AVG(total_streams), '#,0') as Average_Streams_Per_Song FROM song
			JOIN genre USING (genre_id)
			GROUP BY genre_type
			ORDER BY genre_type;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_popular_artists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_popular_artists`()
BEGIN
		SELECT artist_name as Artist, ROUND(AVG(popularity), 2) as Average_Song_Popularity FROM song
			JOIN (SELECT song_id, artist_name FROM artistsong
				JOIN artist USING (artist_id)) as t
			USING (song_id)
			GROUP BY artist_name
			HAVING Average_Song_Popularity >= 90.00
			ORDER BY Average_Song_Popularity DESC;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_positive_albums` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_positive_albums`()
BEGIN
		SELECT album_name as Album, GROUP_CONCAT(DISTINCT artist_name) as Artists_on_Album, ROUND(AVG(positivity), 2) as Top_Positive_Albums FROM song
			JOIN album USING (album_id)
			JOIN (SELECT song_id, artist_name, nationality FROM artistsong
				JOIN artist USING (artist_id)) as t
			USING (song_id)
			GROUP BY album_name
			ORDER BY Top_Positive_Albums DESC
			LIMIT 5;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_song_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_song_details`(IN input_song INT)
BEGIN
		SELECT song_id as Ranking, song_name as Track, GROUP_Concat(artist_name) as Artist, RIGHT(SEC_TO_TIME(song_length), 5) as Length, Format(total_streams, '#,0') as Total_Streams, 
		beats_per_minute as BPM, energy as Energy, danceability as Danceability, loudness as Loudness, positivity as Positive_Vibes, popularity as Popularity  FROM song
			JOIN (SELECT song_id, artist_name FROM artistsong
				JOIN artist USING (artist_id)) as t
			USING (song_id)
			GROUP BY song_id
			HAVING song_id = input_song;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_streams_country` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_streams_country`()
BEGIN
		SELECT nationality as Country, COUNT(DISTINCT artist_name) as Number_of_Artists, Format(SUM(total_streams), '#,0') as Total_Streams FROM song 
			JOIN (SELECT song_id, artist_name, nationality FROM artistsong
				JOIN artist USING (artist_id)) as t
			USING (song_id)
			GROUP BY nationality
			ORDER BY Country;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_top_danceable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_danceable`()
BEGIN
		SELECT song_name as Track, GROUP_CONCAT(DISTINCT artist_name) as Artists, danceability as Danceability FROM song
			JOIN (SELECT song_id, artist_name, nationality FROM artistsong
				JOIN artist USING (artist_id)) as t
			USING (song_id)
			GROUP BY Track
			ORDER BY danceability DESC
			LIMIT 5;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_top_songs_chart` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_top_songs_chart`()
BEGIN
		SELECT song_id as Ranking , song_name as Track, GROUP_Concat(artist_name) as Artist FROM song 
			JOIN (SELECT song_id, artist_name FROM artistsong
				JOIN artist USING (artist_id)) as t
		USING (song_id)
		GROUP BY song_id;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search`(IN search_input VARCHAR(100))
BEGIN
		SELECT song_id as Ranking, song_name as Track, GROUP_CONCAT(artist_name) as Artist, album_name as Album FROM song
			JOIN (SELECT song_id, artist_name, nationality FROM artistsong
				JOIN artist USING (artist_id)) as t
		USING (song_id)
		JOIN album USING (album_id)
		WHERE artist_name LIKE CONCAT(search_input, '%') or song_name LIKE CONCAT(search_input, '%') or album_name LIKE CONCAT(search_input, '%')
		GROUP BY Ranking;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_email` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_email`(IN user_name_input VARCHAR(50), IN new_email VARCHAR(50))
BEGIN
		UPDATE user_info
        SET email = new_email
        WHERE user_name = user_name_input;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_first` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_first`(IN user_name_input VARCHAR(50), IN update_first VARCHAR(50))
BEGIN
		UPDATE user_info
        SET first_name = update_first
        WHERE user_name = user_name_input;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_last` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_last`(IN user_name_input VARCHAR(50), IN new_last VARCHAR(50))
BEGIN
		UPDATE user_info
        SET last_name = new_last
        WHERE user_name = user_name_input;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_password`(IN user_name_input VARCHAR(50), IN new_password VARCHAR(50))
BEGIN
		UPDATE user_info
        SET user_password = new_password
        WHERE user_name = user_name_input;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_playlist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_playlist`(IN user_name_input VARCHAR(50), IN old_name_input VARCHAR(50), IN new_name_input VARCHAR(50))
BEGIN
		UPDATE playlist
        SET playlist_name = new_name_input
        WHERE user_name = user_name_input and playlist_name = old_name_input;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_playlists` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_playlists`(IN user_name_input VARCHAR(50))
BEGIN
        SELECT playlist_name FROM playlist
			WHERE user_name = user_name_input ;
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_playlist_songs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_playlist_songs`(IN user_name_input VARCHAR(50))
BEGIN
        SELECT playlist_name as Playlist_Name, song_id as Song_ID, song_name as Track FROM playlistsong as m
			JOIN (SELECT * FROM playlist
					WHERE user_name = user_name_input) as t
				USING (playlist_id)
			JOIN (SELECT song_id, song_name FROM song) as s
				USING (song_id);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-10 15:55:14
