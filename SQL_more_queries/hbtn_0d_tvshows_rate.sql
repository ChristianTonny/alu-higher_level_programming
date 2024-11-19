DROP TABLE IF EXISTS `tv_genres`;
CREATE TABLE `tv_genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
--
-- Dumping data for table `tv_genres`

LOCK TABLES `tv_genres` WRITE;
INSERT INTO `tv_genres` VALUES (1,'Drama'),(2,'Mystery'),(3,'Adventure'),(4,'Fantasy'),(5,'Comedy'),(6,'Crime'),(7,'Suspense'),(8,'Thriller');
UNLOCK TABLES;

--
-- Table structure for table `tv_show_genres`
DROP TABLE IF EXISTS `tv_show_genres`;

CREATE TABLE `tv_show_genres` (
  `show_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  KEY `show_id` (`show_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `tv_show_genres_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `tv_shows` (`id`),
  CONSTRAINT `tv_show_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `tv_genres` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tv_show_genres`
LOCK TABLES `tv_show_genres` WRITE;
INSERT INTO `tv_show_genres` VALUES (2,1),(2,2),(3,3),(3,1),(3,4),(4,5),(5,5),(6,5),(7,6),(7,1),(7,7),(7,8),(9,6),(9,1),(9,2),(9,7),(9,8),(11,5),(11,1);
UNLOCK TABLES;

--
-- Table structure for table `tv_show_ratings`
DROP TABLE IF EXISTS `tv_show_ratings`;

CREATE TABLE `tv_show_ratings` (
  `show_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL DEFAULT '0',
  KEY `show_id` (`show_id`),
  CONSTRAINT `tv_show_ratings_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `tv_shows` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tv_show_ratings`
LOCK TABLES `tv_show_ratings` WRITE;
INSERT INTO `tv_show_ratings` VALUES (2,0),(2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(3,0),(3,1),(3,2),(3,0),(3,0),(3,1),(3,2),(3,0),(3,0),(3,1),(3,2),(3,3),(3,4),(3,0),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),(3,8),(3,0),(3,1),(3,2),(3,0),(3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,0),(3,1),(3,2),(4,0),(5,0),(6,0),(6,0),(6,1),(6,2),(6,3),(6,4),(6,0),(6,0),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(6,0),(6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),(6,8),(7,0),(7,1),(7,2),(7,0),(7,1),(7,2),(7,3),(7,4),(7,0),(7,1),(7,2),(8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,0),(8,1),(8,2),(8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(8,0),(8,1),(8,2),(8,3),(8,4),(8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8),(9,0),(9,1),(9,2),(9,0),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,0),(10,0),(10,0),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,0),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,0),(10,0),(10,1),(10,2),(10,0),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,0),(10,1),(10,2),(10,3),(10,4),(10,0),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,0),(10,1),(10,2),(11,0),(11,1),(11,2),(11,3),(11,4);
UNLOCK TABLES;

--
-- Table structure for table `tv_shows`
DROP TABLE IF EXISTS `tv_shows`;
CREATE TABLE `tv_shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;


LOCK TABLES `tv_shows` WRITE;
INSERT INTO `tv_shows` VALUES (2,'House'),(3,'Game of Thrones'),(4,'The Big Bang Theory'),(5,'New Girl'),(6,'Silicon Valley'),(7,'Breaking Bad'),(8,'Better Call Saul'),(9,'Dexter'),(10,'Homeland'),(11,'The Last Man on Earth');

UNLOCK TABLES;
