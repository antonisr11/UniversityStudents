CREATE DATABASE  IF NOT EXISTS `graduates` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `graduates`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: graduates
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `ID` varchar(15) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Creation_year` int NOT NULL,
  `Website` varchar(100) DEFAULT NULL,
  `Code` char(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code_UNIQUE` (`Code`),
  KEY `idx_department_id` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('bankfin','Department of Banking and Financial Management',1967,'https://bankfin.unipi.gr','x'),('cs','Department of Informatics',1991,'https://www.cs.unipi.gr','p'),('des','Department of International & European Studies',1998,'https://www.des.unipi.gr','u'),('ds','Department of Digital Systems',1999,'https://www.ds.unipi.gr','e'),('economics','Department of Economics',1997,NULL,'o'),('maritime','Department of Maritime Studies',1977,'https://maritime-unipi.gr/','n'),('ode','Department of Business Administration',1977,'https://www.ode.unipi.gr','d'),('statistics','Department of Statistics & Insurance Science',1997,NULL,'s'),('tex','Department of Industrial Management & Technology',1985,'https://www.tex.unipi.gr','t'),('tourism','Department of Tourism Studies',1999,'https://www.tourism.unipi.gr','r');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Student_ID` bigint NOT NULL,
  `Company_name` varchar(100) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Weekly_hours` int NOT NULL,
  `Leave_reason` varchar(1000) DEFAULT NULL,
  `Start` date NOT NULL,
  `End` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `jobs_StudentID_idx` (`Student_ID`),
  CONSTRAINT `jobs_StudentID` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,1,'Collier Inc','Expedita eligendi porro ut a.',24,'','1985-03-05','2006-01-21'),(2,2,'Lakin-Mante','Molestiae et qui dolore repudiandae aut sit sit.',37,'','1990-06-08','2006-11-23'),(3,3,'Casper-Lind','Consequatur est dolor aut ut occaecati.',40,'Sit aspernatur nesciunt excepturi perferendis possimus non rerum perspiciatis delectus maxime recusandae dicta dicta a vel veritatis explicabo labore.','1985-02-24','2007-09-08'),(4,4,'Brown, Bruen and O\'Connell','Dignissimos natus officiis officia sed.',40,'Quia quia id debitis nemo animi quia ipsa incidunt quis sint consequuntur ut et officiis quod qui reiciendis dolor vitae animi eligendi architecto soluta ducimus.','1994-02-01','2006-09-23'),(5,5,'Marks-Kuphal','Veritatis sit ullam ducimus quod sed.',25,'','1975-04-03','2001-10-01'),(6,6,'Mitchell and Sons','Quo deserunt facere similique explicabo voluptatum molestiae et.',36,'Alias et aut minima quisquam iure autem dolorem quia quod id corporis error hic qui rem voluptate temporibus et earum perspiciatis veritatis.','1984-07-12','1994-08-25'),(7,7,'Lebsack Ltd','Velit quis alias ratione minus quae veritatis incidunt dolores.',32,'','1994-06-26','1987-07-03'),(8,8,'Cronin-Grimes','Ex suscipit aut rerum omnis nihil voluptate nemo alias.',39,'','2016-06-11','1973-05-22'),(9,9,'O\'Kon PLC','Numquam ipsa exercitationem ut consequatur.',33,'Aliquam soluta voluptatem rerum quod fuga et ratione at quidem ex ut impedit minus distinctio perferendis et sed voluptas qui et numquam aperiam.','2013-03-25','1978-10-07'),(10,10,'Homenick, Walter and Schamberger','Qui aperiam fuga ut sapiente dicta nesciunt voluptas.',40,'','1987-09-11','2000-11-21'),(11,11,'Langosh-Koch','Commodi animi aliquam nisi quasi vitae.',26,'','2006-08-27','2001-05-16'),(12,12,'Daugherty-Okuneva','Provident accusantium repellendus veritatis non sit magnam.',28,'','1979-07-06','1977-12-06'),(13,13,'Johnston and Sons','Porro maiores ut enim quis consequatur eos.',31,'','1978-12-01','2006-03-01'),(14,14,'Kiehn, Buckridge and Jenkins','Aperiam repudiandae vero qui deserunt saepe vel aut.',23,'','2005-10-26','2015-06-29'),(15,15,'Jakubowski Inc','Mollitia perferendis aut temporibus animi assumenda magni.',34,'Saepe modi aut qui dolor reiciendis mollitia aut quas neque architecto aut praesentium beatae doloremque sint officia beatae doloremque quae dolorem nisi blanditiis excepturi et.','2012-05-23','2001-07-05'),(16,16,'Von-Haag','Eum impedit facilis libero.',24,'Veritatis et facilis officiis voluptate aut repudiandae voluptatem et voluptatem ut dolore ut reiciendis laborum repudiandae consectetur quo omnis nulla harum enim hic.','2013-05-26','1997-04-01'),(17,17,'Labadie, Pacocha and Goodwin','Esse et suscipit omnis cum.',39,'Est libero saepe voluptatum voluptatem quas nobis voluptatibus velit ut dignissimos necessitatibus omnis assumenda sunt ea beatae molestiae officia amet omnis veritatis vitae voluptates et sed incidunt provident.','1972-07-19','2020-10-02'),(18,18,'Hayes LLC','Natus nihil eos et voluptas.',34,'Enim ipsa enim sit fuga commodi architecto fugiat dolorum voluptatem omnis enim quaerat eos et et eveniet blanditiis ratione error est et qui dolores ipsam itaque deleniti sed.','1988-04-28','1991-01-28'),(19,19,'Okuneva, Kreiger and Hane','Eaque quidem accusantium officiis non.',34,'Fugiat nemo et reprehenderit architecto non at et officiis corrupti ullam aperiam quis temporibus.','1975-11-15','2018-01-12'),(20,20,'Weimann, Sporer and Runolfsdottir','Est maxime non qui sed sed recusandae labore.',33,'Quis doloribus enim exercitationem asperiores consequuntur rerum temporibus pariatur nemo debitis ea ratione quia dolores magni voluptas aut non dolorem sit eum esse non quibusdam voluptas modi.','1980-12-11','2002-12-18'),(21,21,'Ritchie, Lind and Leannon','Porro suscipit quos explicabo ratione vitae doloribus sunt.',33,'Molestias sed laboriosam quia soluta repellat nostrum animi sunt ratione assumenda id fugit vitae qui non repudiandae ad soluta ut deleniti nihil eveniet.','2021-01-27','2009-03-21'),(22,22,'Schaden PLC','Ducimus atque iste dolor eius enim.',20,'Aut explicabo autem commodi nemo perferendis consequuntur praesentium officia iste soluta ipsa amet qui accusamus assumenda labore nesciunt omnis illo eos tempora ad totam nisi consequatur eligendi.','1997-01-29','1984-11-28'),(23,23,'Konopelski, Feest and Kutch','Alias vel porro ut at sed.',39,'Sit eligendi delectus ut facere occaecati et nisi eum minima vero sit consequatur rem corporis nam voluptatem aut dolorem et sapiente dolores assumenda inventore et qui tempora ea cum.','1983-02-17','2010-11-21'),(24,24,'Strosin-Mills','Facere a sint molestiae quisquam quis corporis molestiae.',24,'','2015-10-03','2021-03-22'),(25,25,'Deckow, Armstrong and Lind','Cupiditate et ut et nobis.',33,'Ut qui voluptas cupiditate optio voluptatem provident esse modi ex et aliquam quis neque explicabo sunt unde quaerat est vero et quod molestiae itaque cumque reprehenderit.','1982-09-12','2003-03-26'),(26,26,'Mohr PLC','Dolorum voluptatibus ullam officiis minus occaecati.',31,'Fuga natus doloremque et aut qui aliquid dicta voluptas similique eos sed eum quae ut ducimus et ex autem et sint quod quia aspernatur.','1974-05-08','2006-07-11'),(27,27,'Sawayn-Abernathy','Necessitatibus repellendus in voluptatem iste.',35,'','1984-01-22','1987-11-03'),(28,28,'Wyman PLC','Sapiente nam facilis vel est ipsa hic et.',23,'','1978-04-13','1975-10-24'),(29,29,'Orn-Blanda','Ipsa rerum a eos qui aliquam enim iure.',22,'','1998-11-04','2013-02-08'),(30,30,'Lockman-Block','Quisquam praesentium laudantium ducimus reprehenderit quod et repellendus.',40,'Aut iure aut ad voluptas provident ut eius quidem tenetur dolorem fugiat repudiandae.','1998-04-06','1997-09-14'),(31,31,'Gottlieb and Sons','Libero minima et rerum aperiam.',33,'','2004-05-30','1978-06-01'),(32,32,'Bayer, Emmerich and Conn','Itaque cupiditate sapiente ut amet eius.',24,'Velit officiis cumque excepturi laboriosam ea provident rem rerum eum et assumenda rerum corrupti sit adipisci quae voluptatem dolore earum sint eos sed consectetur.','2020-10-01','1981-03-08'),(33,33,'Carroll-Tillman','Sint ipsum quas beatae.',35,'','2016-05-01','1988-04-13'),(34,34,'Dare-Okuneva','Et qui aut ipsa placeat aut vero.',27,'','2012-08-06','1996-11-24'),(35,35,'Anderson-Schmitt','Ipsum autem quam qui delectus.',27,'Autem aut libero explicabo quia nemo tenetur exercitationem fugit aut atque quod perferendis dolores sed doloremque mollitia tempore fugit dolorum ea dolorum.','1970-05-13','2020-02-16'),(36,36,'Emard, Jacobi and Blick','Ut explicabo ut numquam iure et repudiandae eum minus.',34,'Cumque quae voluptatem omnis nemo placeat nam dignissimos explicabo odit vel officiis repellat consequuntur dolorum eos quo odit in delectus deleniti enim saepe nostrum omnis odit ea non.','2000-05-21','1994-03-02'),(37,37,'Leuschke and Sons','Est dolor quidem autem aut at est.',26,'','1976-08-02','2020-02-07'),(38,38,'Jacobs Group','Corporis consequatur est ex.',30,'Alias sit dolor harum qui aspernatur ex consequuntur amet ex ipsam vel quia reiciendis labore enim.','1990-10-13','1973-05-03'),(39,39,'Murazik and Sons','Reiciendis numquam aut sit repellat.',38,'Cupiditate voluptas fuga dolores praesentium ipsum delectus dolores quibusdam corrupti veritatis et aut aspernatur perspiciatis accusamus possimus voluptatem et dicta explicabo et voluptatem ut et.','1989-04-12','2018-05-29'),(40,40,'Stracke, Cummings and Boyer','Ut et fugit est dolorem.',24,'','2011-08-07','1973-04-04'),(41,41,'Purdy LLC','Odio vel eius aliquid.',35,'','1995-08-14','1975-08-09'),(42,42,'Reichel-VonRueden','Vero mollitia qui aliquid voluptatibus qui aut.',32,'Qui rem quasi laboriosam nisi aliquid quisquam quia vel et sequi voluptatem cum voluptatum.','2006-05-03','2010-04-17'),(43,43,'Fay, Pollich and Barrows','Aspernatur harum cupiditate velit.',40,'Eaque corporis dolor reprehenderit laudantium eum minima aspernatur nihil et saepe ipsam et iure nam.','2009-12-03','1972-08-20'),(44,44,'Spencer and Sons','Repellendus quibusdam officia sunt.',22,'Quia aut voluptas molestiae est vitae eos sapiente consequatur sint doloremque vero qui saepe laudantium.','1970-06-29','2020-05-10'),(45,45,'Berge, Ruecker and Windler','Rem voluptas non voluptatibus vel quidem incidunt nam alias.',24,'','1990-12-31','2014-04-24'),(46,46,'Ortiz and Sons','Dolorum reiciendis quos sed mollitia.',37,'Enim velit aut aliquid omnis quia fugiat placeat mollitia iure maiores vel eos nisi aliquid commodi dolorem laudantium itaque qui et autem eaque quia ratione.','1997-03-09','1978-06-14'),(47,47,'Kemmer-Wuckert','Corrupti sit laboriosam quos voluptas fugiat dicta earum aliquid.',30,'Consequuntur debitis non et quo doloremque ut fuga debitis accusamus autem odit eum minus rem repudiandae alias ipsum fuga voluptas culpa sunt ut accusamus rerum cum expedita.','2022-08-31','1996-04-28'),(48,48,'Toy-Hilpert','Doloribus quod qui esse voluptatem dicta.',40,'','2013-06-15','1987-06-06'),(49,49,'Schinner LLC','Ratione sequi aut architecto voluptatibus illum eveniet.',27,'Rerum eaque est eos doloribus nulla aut doloribus quod doloremque in quisquam amet labore sit est eveniet aut ab voluptates.','2005-09-28','1971-10-09'),(50,50,'Marks Group','Aut quos a ad odit.',25,'Consequatur tenetur dolorum dolorem minima suscipit iste quod quo cumque quidem sit architecto officiis voluptatem ut in.','1977-03-31','2004-12-18'),(51,51,'Huels-O\'Connell','Velit iste fuga delectus reprehenderit et.',40,'','1982-07-03','1983-02-18'),(52,52,'Walker LLC','Sint qui enim aut molestias blanditiis.',27,'','2002-01-15','1999-02-13'),(54,54,'Haag-Abbott','Labore cupiditate sit inventore maiores ratione sit et.',34,'Quisquam est molestiae aut ipsam eius ipsa numquam rerum eveniet maiores non in aliquam optio sit voluptatem qui recusandae voluptatem cupiditate.','2018-11-22','2005-01-11'),(55,55,'Stehr Inc','Aspernatur doloribus autem et minima autem aut.',35,'Nisi reiciendis omnis debitis commodi aut doloribus similique asperiores optio quaerat dolorem et corporis consectetur ab facere ut autem perferendis quos saepe iste.','1984-10-19','2008-11-25'),(56,56,'Nienow-Sporer','Itaque rerum provident maxime qui dolores veniam.',36,'','1986-09-15','2004-08-01'),(57,57,'Kessler Inc','Eum mollitia vel nam suscipit.',26,'','2005-07-06','2020-06-27'),(58,58,'Streich, Hane and Ledner','Mollitia incidunt quidem quibusdam veritatis nam doloremque.',39,'','1979-06-21','1988-02-14'),(59,59,'Smith-Mills','Eveniet a ipsam facere molestiae.',37,'Eos iure et corporis soluta ea dolor aliquid odio tempore praesentium id inventore omnis iste quo qui velit harum id quod nulla doloribus.','1977-05-13','2009-06-13'),(60,60,'Hahn Inc','Sit quia itaque et veniam.',30,'','2022-08-07','1986-09-19'),(61,61,'Hirthe, Beatty and Rau','Dolores modi totam nostrum aut molestiae beatae.',27,'Ut nemo dicta ut perspiciatis doloremque qui aperiam molestiae perspiciatis laborum non sed adipisci quas sit assumenda voluptates ipsam ipsa consequatur perspiciatis.','1987-03-24','1995-12-18'),(62,62,'Bailey Inc','Voluptate delectus nihil pariatur ducimus eum.',25,'','1997-12-17','1987-03-20'),(63,63,'Hyatt Inc','Dolores eveniet enim reiciendis aut.',34,'','2020-05-31','1989-07-03'),(64,64,'Anderson-O\'Reilly','Et distinctio quia consequuntur.',20,'','1994-05-11','2006-03-27'),(65,65,'Nader-Considine','Ipsa rem ex maiores nemo mollitia ut.',27,'','1984-12-27','1984-02-03'),(66,66,'Leannon-Moen','In autem libero eveniet incidunt minus nesciunt.',29,'Ut quae necessitatibus sapiente neque atque reprehenderit consectetur voluptatem vel eveniet quaerat ipsum dignissimos omnis.','2002-03-06','1974-03-27'),(67,67,'Mante-Rice','Deleniti quo expedita rerum vero.',33,'','1982-03-11','1977-04-05'),(68,68,'Gottlieb, Goldner and Beier','Qui velit quidem in autem quia eos sed.',26,'Tempore quibusdam consequatur et dolorem qui quo animi in aperiam reiciendis maiores voluptatibus.','2006-02-02','2003-08-17'),(69,69,'Dietrich-Mann','Temporibus et sit delectus.',33,'','2013-01-05','1981-07-20'),(70,70,'Koelpin, Bednar and Fay','Odit eum aut in esse et nostrum repellendus.',30,'Quidem odit sit maiores quis dolorem quo amet maiores sit explicabo libero sit vel quisquam quia rem illo aliquam commodi consequatur et possimus totam est.','1978-09-19','1976-08-14'),(71,71,'Rutherford and Sons','Itaque dolore cupiditate consequatur perspiciatis sunt.',38,'Asperiores similique totam qui sint fuga explicabo impedit numquam sint qui ut sequi rerum consectetur ad unde sit aut facilis aut quasi.','1983-01-26','1989-08-23'),(72,72,'Emard-Hettinger','Rerum repudiandae harum facilis nulla inventore.',32,'Est dolore fugiat minus et nobis voluptatem ducimus qui aut culpa repudiandae quod necessitatibus numquam delectus dolores sit fuga aut dignissimos.','2011-11-17','1970-12-01'),(73,73,'Ondricka, O\'Reilly and Larkin','Natus dolor esse veritatis optio itaque similique doloremque.',35,'Earum dolorum ut rem facilis est architecto dolorem voluptatem qui enim aperiam dolor eum autem maiores.','1985-12-13','2003-05-07'),(74,74,'Harvey, Kihn and Barton','Enim et amet in temporibus omnis qui.',20,'Ea cumque voluptatum atque quo sed perspiciatis quidem dolores quidem ratione similique eum nostrum suscipit sed quae repellendus.','1970-02-18','2008-12-10'),(75,75,'Ferry-Donnelly','Qui et velit quibusdam omnis vitae.',20,'Sit vitae non vel enim veniam rerum tempora reprehenderit ducimus facilis fugiat et quidem nam dolorem quis odit velit debitis.','1975-03-18','2004-07-20'),(76,76,'Lynch LLC','Sint illo magni aut deserunt.',31,'Possimus ut qui possimus molestiae aperiam distinctio dolores ipsum voluptatem officiis quis sapiente et esse ut vel.','2003-11-02','1980-08-06'),(77,77,'Greenfelder Ltd','Quaerat voluptatum quod amet in.',28,'Molestiae qui repudiandae dolores quis corporis autem tempore possimus illo rem et illum sunt animi aut error occaecati consequuntur similique molestias non.','2010-12-03','1978-11-29'),(78,78,'Christiansen-Schiller','Fugiat voluptates necessitatibus facilis quibusdam.',26,'','1989-10-30','2014-09-10'),(79,79,'Borer-Dicki','Dolore tenetur voluptatibus eveniet possimus cupiditate non.',28,'','1984-12-27','2009-05-08'),(80,80,'Nienow PLC','Beatae quaerat officia maiores non.',40,'','1989-07-07','2002-09-10');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msc`
--

DROP TABLE IF EXISTS `msc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msc` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `Department_ID` varchar(15) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Creation` date NOT NULL,
  `Months_duration` int NOT NULL,
  `Cost` float NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DepartmentID_idx` (`Department_ID`),
  CONSTRAINT `DepartmentID` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msc`
--

LOCK TABLES `msc` WRITE;
/*!40000 ALTER TABLE `msc` DISABLE KEYS */;
INSERT INTO `msc` VALUES (1,'bankfin','Necessitatibus laudantium provident non libero quae id aut.','1992-05-11',28,3625),(2,'cs','Fuga quam amet a blanditiis natus ut.','1971-11-09',35,0),(3,'des','Aut nostrum porro nam ab aspernatur consequatur.','1988-07-31',30,3103),(4,'ds','Blanditiis veniam recusandae magnam nesciunt quia porro id.','2023-01-05',30,7269),(5,'economics','Repellendus beatae perferendis corrupti et voluptatibus voluptatem.','1996-01-04',34,5658),(6,'maritime','Et doloremque nam dolore doloremque aut corporis.','2021-12-18',20,0),(7,'ode','Inventore voluptas vitae dignissimos est voluptatem porro quia.','2005-01-29',32,7179),(8,'statistics','Qui et itaque et qui.','2014-11-02',7,7769),(9,'tex','Vel a velit placeat nobis non et.','1990-04-28',35,1271),(10,'tourism','Nostrum nihil impedit nemo possimus.','2016-12-13',35,6655),(11,'bankfin','Voluptates autem enim accusantium molestiae rem.','1972-09-12',30,2534),(12,'cs','Dolorum sed minima porro.','2021-02-01',11,7828),(13,'des','Officia facilis ullam minus eligendi nihil.','1976-08-02',13,1160),(14,'ds','Quidem id vel qui vero eum consequatur cum sit.','1990-05-10',8,2092),(15,'economics','Illo non et aspernatur.','2001-08-26',18,6093),(16,'maritime','Et corrupti maxime sunt voluptatem dolor distinctio omnis.','1975-10-25',17,0),(17,'ode','Iusto laboriosam laboriosam quibusdam vel cupiditate rerum.','2012-03-29',21,6432),(18,'statistics','Esse possimus quas impedit id quo delectus.','2009-11-21',26,9985),(19,'tex','Velit exercitationem quo voluptate minima.','2017-09-18',17,4169),(20,'tourism','Et fugiat eos non eligendi nam.','1970-01-17',22,537),(21,'bankfin','Et quaerat magni ex ullam ad dolor.','1983-12-28',7,6471),(22,'cs','Soluta reprehenderit est vitae aliquid et et minus ipsum.','2014-05-31',30,307),(23,'des','Eveniet dolorem sequi exercitationem laboriosam.','1987-04-02',12,9792),(24,'ds','Expedita excepturi nulla voluptates veritatis veritatis enim eum.','1997-06-05',7,3384),(25,'economics','Dicta voluptas omnis vel voluptas voluptas.','1996-06-16',7,440);
/*!40000 ALTER TABLE `msc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ID` bigint NOT NULL AUTO_INCREMENT,
  `First_name` varchar(50) NOT NULL,
  `Last_name` varchar(50) NOT NULL,
  `Father_name` varchar(50) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Birth` date NOT NULL,
  `Marital_status` enum('Unwed','Married','Divorced','Widower') NOT NULL,
  `Phone` char(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Palma','Green','','hkuvalis@example.org','2005-10-24','Unwed','6961396290'),(2,'Jamil','Steuber','Elliot','tyrel03@example.net','1996-05-26','Unwed','2101014983'),(3,'Richmond','Farrell','Jerod','bernier.kobe@example.net','1989-01-27','Married','6943235592'),(4,'Jazmyne','Romaguera','Keagan','miguel.carroll@example.net','1990-08-26','Married','6916968026'),(5,'Cheyanne','Mosciski','','faustino.muller@example.net','2017-04-17','Widower','6997024130'),(6,'Brant','Wolf','Napoleon','baby.osinski@example.com','1996-11-12','Unwed','6913844140'),(7,'Bo','Kuphal','Webster','king.linwood@example.org','1972-01-29','Unwed','6948765965'),(8,'Hollie','Kihn','','wkassulke@example.com','2022-08-03','Widower','6977650148'),(9,'Alberta','Fay','','bartell.jayme@example.org','2015-05-16','Widower','6908992611'),(10,'Milo','Cremin','Maximus','prohaska.wilton@example.org','1985-06-05','Divorced','6978209879'),(11,'Itzel','Rempel','Clifton','savannah.sauer@example.net','1971-08-27','Married','6951546961'),(12,'Hiram','Boehm','Jaylon','thomas.langosh@example.org','1998-01-27','Married','6961615227'),(13,'Corine','Anderson','Jon','gcarter@example.com','2008-04-19','Divorced','6975395689'),(14,'Roman','Crist','','abraham63@example.org','2005-02-08','Unwed','6982143267'),(15,'Landen','Jones','Tavares','ford.tillman@example.org','2017-03-03','Unwed','6969874193'),(16,'Lenny','Lesch','Neil','terry.jamir@example.net','2019-07-01','Married','6972468028'),(17,'Floy','Ward','Ariel','jadyn95@example.com','1983-09-04','Unwed','6954474096'),(18,'Cielo','Roob','Rocky','terry.morar@example.com','1980-05-01','Divorced','6971878527'),(19,'Britney','Stark','Grover','nitzsche.vallie@example.org','1995-03-17','Divorced','6915367309'),(20,'Avis','Kreiger','Lennie','ghirthe@example.com','1971-04-12','Married','6941814713'),(21,'Celia','Blanda','Rosario','kessler.mercedes@example.com','2006-10-21','Widower','6973008320'),(22,'Jacky','Nicolas','Landen','danielle55@example.org','2008-10-13','Married','6975413333'),(23,'Bella','Romaguera','Eusebio','rosella.jacobson@example.com','1988-10-30','Unwed','6937674664'),(24,'Adele','Boehm','Malcolm','brain51@example.com','1975-12-19','Widower','6975091018'),(25,'Scotty','Barrows','','kayley.bauch@example.com','1978-12-14','Widower','6971381802'),(26,'Gregg','Dickens','','ford.schiller@example.org','1988-05-13','Unwed','6983634731'),(27,'Bonita','Ratke','Rex','opredovic@example.org','1986-02-04','Widower','6996642608'),(28,'Fay','Hartmann','Elmo','lueilwitz.chloe@example.com','1996-02-13','Unwed','6972577890'),(29,'Erling','Leffler','Liam','wrowe@example.com','1996-02-24','Married','6968032110'),(30,'Jermain','Cruickshank','','domenica.gaylord@example.org','1987-01-06','Married','6907430009'),(31,'Jody','Gorczany','Graham','benny00@example.org','1990-01-16','Widower','6920763466'),(32,'Jamil','Romaguera','','altenwerth.simone@example.com','1980-07-20','Divorced','6933391099'),(33,'Myrtle','Reynolds','Elliott','guy.conroy@example.com','2004-02-25','Married','6946188262'),(34,'Zita','Stiedemann','','pryan@example.org','1984-12-05','Married','6978545883'),(35,'Murphy','Morar','Nicklaus','eleanore87@example.net','2001-08-14','Unwed','6905513873'),(36,'Bettie','Carter','Laron','hayes.conrad@example.org','2018-08-16','Unwed','6986509720'),(37,'Leilani','Larson','Pedro','berge.lyda@example.net','1987-04-26','Unwed','6942205812'),(38,'Stephen','Bednar','','vonrueden.deja@example.org','2021-08-29','Widower','6948997278'),(39,'Leif','Crona','Brook','nfadel@example.net','1978-10-08','Divorced','6972217056'),(40,'Reese','Little','','kuhlman.jacklyn@example.net','1995-02-01','Unwed','6914378787'),(41,'Makenna','Aufderhar','','prince91@example.com','2012-07-16','Divorced','6919246922'),(42,'Opal','Mosciski','','laverna.hegmann@example.com','2022-06-18','Widower','6995507612'),(43,'Jasmin','Kihn','','kcarroll@example.net','1976-07-16','Unwed','6989831463'),(44,'Koby','Zieme','','cordell36@example.org','2018-12-07','Widower','6963341313'),(45,'Gavin','Bogisich','','qwilkinson@example.net','1980-11-20','Unwed','6996345426'),(46,'Trycia','Borer','Eugene','kayleigh72@example.net','1972-04-07','Unwed','6994514720'),(47,'Garrick','Hartmann','Ben','dessie00@example.org','1988-02-13','Divorced','6964656483'),(48,'Alena','Rice','','gleichner.maverick@example.net','2002-06-18','Widower','6970788297'),(49,'Jamel','White','','runolfsdottir.kaitlin@example.net','1993-12-10','Widower','6978685333'),(50,'Blair','Crist','','tiara.gerhold@example.com','2013-01-19','Married','6981713908'),(51,'Neal','Huels','','ullrich.angelo@example.com','1981-05-08','Widower','6940889173'),(52,'Monica','VonRueden','Rowan','yhansen@example.net','2013-09-06','Married','6909573550'),(54,'Trevor','Schaden','','grover23@example.net','1986-05-04','Widower','6999276216'),(55,'Shanel','Murphy','Amari','brakus.carleton@example.net','1978-02-02','Unwed','6989928345'),(56,'Cary','Olson','Adrian','stamm.irma@example.org','2021-12-22','Divorced','6913864935'),(57,'Jade','D\'Amore','','nicolas.d\'angelo@example.com','2008-03-20','Unwed','6933269593'),(58,'Dashawn','Pfannerstill','','will.ottis@example.org','1991-07-12','Married','6910101707'),(59,'Lauryn','Metz','','torphy.dovie@example.com','2021-09-19','Married','6949279352'),(60,'Dallin','Breitenberg','Bill','lafayette.schimmel@example.com','2002-09-03','Widower','6912067077'),(61,'Emie','Gislason','Neal','riley.larkin@example.org','1985-10-22','Widower','6958620350'),(62,'Martine','Sipes','','kgottlieb@example.net','1996-06-30','Divorced','6908329847'),(63,'Aletha','Dibbert','','cmante@example.net','1994-09-28','Unwed','6977578358'),(64,'Valentina','Turner','','zmcglynn@example.com','1989-04-12','Divorced','6957813660'),(65,'Elizabeth','Hessel','','batz.danial@example.net','1972-10-10','Unwed','6920912568'),(66,'Elinor','Boyle','','raven76@example.net','2015-07-10','Unwed','6953928810'),(67,'Alec','Schuster','Edwardo','brekke.lacy@example.org','1973-02-18','Divorced','6948201604'),(68,'Olaf','Gulgowski','','skiles.marina@example.com','1999-02-05','Married','6992730556'),(69,'Jameson','Jacobi','','volkman.kaci@example.org','1996-08-23','Married','6985356912'),(70,'Trey','Emard','','bbernhard@example.org','2001-11-24','Unwed','6910107731'),(71,'Herbert','Bosco','Jermey','weber.darby@example.org','1974-02-10','Married','6903883191'),(72,'Oda','Stoltenberg','','shanny95@example.com','2005-05-08','Unwed','6945144907'),(73,'Bradly','Bartoletti','Consuelo','estelle.miller@example.net','1985-10-26','Married','6984996622'),(74,'Sandra','Dickens','Holden','luigi43@example.org','2005-06-30','Married','6928205315'),(75,'Lysanne','Skiles','Davion','hammes.jose@example.com','2011-01-28','Unwed','6935282791'),(76,'Braulio','Champlin','','ward.tomas@example.org','1982-06-02','Widower','6915134639'),(77,'Reva','Denesik','Clemens','enola68@example.net','2002-12-31','Divorced','6963981187'),(78,'Katharina','Keebler','Terence','obarrows@example.org','2001-12-26','Widower','6909931836'),(79,'Thurman','Blick','','dave58@example.com','1982-12-27','Divorced','6979051906'),(80,'Alta','Quigley','Tyrique','shessel@example.org','2018-10-25','Married','6965744008'),(81,'Santiago','Keeling','','schuppe.rebeca@example.com','1981-10-28','Married','6920867604'),(82,'Rollin','Schuster','','yframi@example.net','2000-04-13','Married','6987417059'),(83,'Lavada','Mante','Harmon','arne.reynolds@example.com','2019-07-23','Widower','6961635494'),(84,'Destiny','Wisoky','','ufeeney@example.net','1982-11-17','Widower','6904071583'),(85,'Else','Brown','Casey','parisian.anjali@example.com','1981-01-17','Widower','6962895716'),(86,'Christy','Goldner','Mustafa','mollie.lockman@example.com','1995-08-05','Divorced','6944320134'),(87,'Coby','Champlin','Jonathan','swift.delphine@example.com','2013-07-08','Unwed','6972154013'),(88,'Margarett','Watsica','','walsh.lizeth@example.org','2007-02-03','Married','6929441185'),(89,'Vicky','Mraz','Cruz','vwiza@example.net','2021-12-08','Unwed','6983089452'),(90,'Roscoe','Skiles','','mcclure.bertram@example.net','2021-04-24','Married','6984235248'),(91,'Elmore','Conn','Tom','oscar34@example.com','1979-10-17','Divorced','6977401281'),(92,'Foster','Parker','Jarvis','elisha39@example.net','2005-04-03','Widower','6922047877'),(93,'Lyla','Corkery','','mitchell.muhammad@example.com','1984-02-25','Unwed','6938709329'),(94,'Marie','Olson','Felipe','triston.prohaska@example.net','1978-01-15','Divorced','6919486253'),(95,'Jacklyn','Robel','Johnny','wilfred16@example.org','2019-07-24','Widower','6999281934'),(96,'Lexi','Lynch','Jed','damion.metz@example.org','2009-02-20','Married','6999669530'),(97,'Gregg','Romaguera','','thompson.lesly@example.com','1993-01-28','Divorced','6980028772'),(98,'Ella','Barton','Lincoln','genesis.murphy@example.org','1977-11-30','Married','6990281183'),(99,'Kareem','Kohler','','yheathcote@example.net','1989-08-31','Married','6934744428'),(100,'Salma','Corwin','','kolby.okuneva@example.com','1976-09-23','Married','6997115392');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_bachelor`
--

DROP TABLE IF EXISTS `student_bachelor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_bachelor` (
  `Student_code` char(6) NOT NULL,
  `Student_ID` bigint NOT NULL,
  `Department_ID` varchar(15) NOT NULL,
  `Registration` date NOT NULL,
  `Graduation` date DEFAULT NULL,
  `Grade` float DEFAULT NULL,
  PRIMARY KEY (`Student_code`),
  KEY `student_bachelor_StudentID_idx` (`Student_ID`),
  KEY `student_bachelor_DepartmentID_idx` (`Department_ID`),
  CONSTRAINT `student_bachelor_DepartmentID` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_bachelor_StudentID` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_bachelor`
--

LOCK TABLES `student_bachelor` WRITE;
/*!40000 ALTER TABLE `student_bachelor` DISABLE KEYS */;
INSERT INTO `student_bachelor` VALUES ('d06656',17,'ode','2006-11-22','2017-06-23',9.16),('d16322',57,'ode','2016-01-26','1975-05-07',6.66),('d71373',27,'ode','1971-12-05','1994-03-08',5.12),('d73895',7,'ode','1973-06-27','1988-10-21',5.37),('d75173',47,'ode','1975-10-04','1991-07-02',6.91),('d81175',67,'ode','1981-02-25','2009-05-30',9.03),('d94620',37,'ode','1994-08-16','2023-01-29',9.5),('e13349',74,'ds','2013-05-10','1992-05-14',5.03),('e21887',34,'ds','2021-02-06',NULL,NULL),('e73914',44,'ds','1973-06-23','2004-12-23',9.07),('e76375',14,'ds','1976-08-16','2013-11-13',8.56),('e79481',24,'ds','1979-04-11','2018-05-10',9.03),('e82500',4,'ds','1982-01-03','2007-07-18',8.48),('e92623',54,'ds','1992-08-07',NULL,NULL),('e93508',64,'ds','1993-12-25','1977-04-21',9.92),('n02665',36,'maritime','2002-06-09','2006-07-12',5.79),('n14177',56,'maritime','2014-03-23','1981-02-22',6.3),('n71408',46,'maritime','1971-06-09','2005-04-30',7.34),('n82450',6,'maritime','1982-09-24','1997-03-05',9.2),('n86764',26,'maritime','1986-10-13','2022-09-02',6.31),('n87907',66,'maritime','1987-04-07','2001-06-26',5.57),('n92539',16,'maritime','1992-04-07','2014-10-05',8.75),('o00246',75,'economics','2000-01-03','1995-06-09',6.52),('o14627',25,'economics','2014-03-26','1990-07-25',8.07),('o20146',45,'economics','2020-12-25',NULL,NULL),('o78462',55,'economics','1978-09-17','1973-08-11',5.6),('o89655',65,'economics','1989-10-05','1976-12-24',5.31),('o89987',15,'economics','1989-06-08','2001-12-16',6.05),('p13369',22,'cs','2013-08-16','1973-05-15',6.18),('p15204',32,'cs','2015-01-19','2006-12-14',5.12),('p70453',62,'cs','1970-03-26','1986-10-05',9.41),('p75474',42,'cs','1975-10-02','2001-01-20',5.18),('p84727',2,'cs','1984-01-12','2022-08-08',6.37),('p92720',52,'cs','1992-09-23','1972-09-08',5.12),('p93581',72,'cs','1993-03-23','2022-02-16',7.81),('p93667',12,'cs','1993-02-27','1989-03-21',5.72),('r07915',50,'tourism','2007-08-06','1999-07-29',8.5),('r20530',30,'tourism','2020-06-02','2010-01-30',6.19),('r71353',70,'tourism','1971-03-20','1994-07-25',9.76),('r81360',60,'tourism','1981-02-19','2010-02-25',9.76),('r94335',20,'tourism','1994-06-05','1995-12-11',6.49),('s09199',8,'statistics','2009-02-16',NULL,NULL),('s11115',28,'statistics','2011-11-26','2010-04-02',5.17),('s17638',68,'statistics','2017-04-02',NULL,NULL),('s73430',18,'statistics','1973-04-28','2021-12-19',5.58),('s79833',58,'statistics','1979-02-20','2000-12-21',9.38),('s89817',38,'statistics','1989-01-22','1977-08-06',8.37),('t03824',69,'tex','2003-02-05','1973-08-21',9.74),('t04297',29,'tex','2004-10-15',NULL,NULL),('t06401',19,'tex','2006-04-07','1974-07-07',9.15),('t10650',59,'tex','2010-04-01','2021-04-26',6.83),('t17929',49,'tex','2017-08-27','2004-06-09',5.58),('t18401',9,'tex','2018-05-05','1984-03-08',5.9),('t19141',39,'tex','2019-06-11',NULL,NULL),('u14837',73,'des','2014-08-07','1983-12-16',9.43),('u22462',43,'des','2022-02-08',NULL,NULL),('u87301',3,'des','1987-04-08','2014-04-15',9.07),('u90866',33,'des','1990-08-03','2013-02-12',9.16),('u91422',13,'des','1991-04-22','1971-11-26',6.97),('u94542',63,'des','1994-06-11','1995-03-04',8.84),('u98765',23,'des','1998-10-05','1993-05-28',5.22),('x03310',21,'bankfin','2003-05-27','1978-07-16',9.2),('x10552',51,'bankfin','2010-12-25','2001-12-14',5.1),('x11583',31,'bankfin','2011-11-09','1974-09-12',6.39),('x19298',71,'bankfin','2019-07-11','1993-05-23',8.44),('x73718',1,'bankfin','1973-05-31','1978-10-10',8.69),('x88194',41,'bankfin','1988-05-01','2013-03-10',9.32),('x89772',61,'bankfin','1989-10-29','2017-01-22',5.26),('x98588',11,'bankfin','1998-01-02','1970-07-23',5.12);
/*!40000 ALTER TABLE `student_bachelor` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_bachelorStudentCode` BEFORE INSERT ON `student_bachelor` FOR EACH ROW BEGIN
    DECLARE department_code CHAR(1);
    DECLARE registationYear CHAR(2);
    DECLARE first_character CHAR(1);
    DECLARE secondAndThird_character CHAR(2);
    DECLARE lastThree_characters CHAR(3);
    DECLARE error INT;
    DECLARE error_message CHAR(90);

	SET department_code = ( SELECT UPPER(department.Code) FROM department WHERE department.ID = NEW.Department_ID );
    SET registationYear = SUBSTR(YEAR(NEW.Registration), 3, 2);
    SET first_character = SUBSTR(NEW.student_code, 1, 1);
    SET secondAndThird_character = SUBSTR(NEW.student_code, 2, 2);
    SET lastThree_characters = SUBSTR(NEW.student_code, 4, 3);
    SET error = 0;
    SET error_message = CONCAT('Invalid student code (It must start with \'' , department_code, registationYear , '\', and the last 3 characters must be numbers)');
    
    IF (first_character != department_code) THEN
		SET error = 1;
    END IF;
    IF (secondAndThird_character != registationYear) THEN
		SET error = 1;
    END IF;
    IF (lastThree_characters NOT REGEXP '^[0-9]{3}$') THEN
		SET error = 1;
    END IF;
    IF (error = 1) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_msc`
--

DROP TABLE IF EXISTS `student_msc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_msc` (
  `Student_code` char(6) NOT NULL,
  `Student_ID` bigint NOT NULL,
  `MSc_ID` bigint NOT NULL,
  `Registration` date NOT NULL,
  `Graduation` date DEFAULT NULL,
  `Grade` float DEFAULT NULL,
  PRIMARY KEY (`Student_code`),
  KEY `student_msc_MScID_idx` (`MSc_ID`),
  KEY `student_msc_StudentID_idx` (`Student_ID`),
  CONSTRAINT `student_msc_MScID` FOREIGN KEY (`MSc_ID`) REFERENCES `msc` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_msc_StudentID` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_msc`
--

LOCK TABLES `student_msc` WRITE;
/*!40000 ALTER TABLE `student_msc` DISABLE KEYS */;
INSERT INTO `student_msc` VALUES ('Md1099',7,7,'2010-08-12',NULL,NULL),('Md7042',67,17,'1970-11-03','1975-07-29',5.74),('Md7794',57,7,'1977-09-25',NULL,NULL),('Md8187',17,17,'1981-05-30',NULL,NULL),('Md8810',92,17,'1988-12-17',NULL,NULL),('Md8949',42,17,'1989-10-26',NULL,NULL),('Md9714',82,7,'1997-11-15','1992-06-29',6.41),('Md9756',32,7,'1997-12-28',NULL,NULL),('Me0363',64,14,'2003-02-22','2013-12-29',9.56),('Me0450',49,24,'2004-04-05',NULL,NULL),('Me1120',79,4,'2011-08-09',NULL,NULL),('Me1247',39,14,'2012-02-29',NULL,NULL),('Me1842',99,24,'2018-01-29','1976-11-29',8.87),('Me7147',89,14,'1971-02-02','1998-03-11',8.09),('Me8054',24,24,'1980-06-17','2000-01-15',7.81),('Me8062',54,4,'1980-08-03','2011-03-08',7.4),('Me8334',74,24,'1983-12-09','2015-08-19',9.29),('Me8369',29,4,'1983-09-12','1975-09-28',8.41),('Me8697',4,4,'1986-11-27','1986-10-09',7.41),('Me8858',14,14,'1988-04-20','2022-06-07',8.88),('Mn0015',56,6,'2000-03-04','1978-05-07',5.66),('Mn0644',41,16,'2006-07-22','2003-01-07',8.65),('Mn0723',66,16,'2007-01-08','1985-08-01',9.06),('Mn1569',81,6,'2015-06-22',NULL,NULL),('Mn7881',31,6,'1978-05-30','1975-11-23',8.03),('Mn8262',6,6,'1982-02-01','2007-11-13',8.11),('Mn9165',16,16,'1991-03-18','1978-10-04',8.09),('Mn9234',91,16,'1992-08-25','1971-05-11',6),('Mo0564',40,15,'2005-07-07','2006-06-06',5.5),('Mo2013',80,5,'2020-07-29','2005-12-03',9.5),('Mo7011',65,15,'1970-05-27','2000-07-24',6.2),('Mo7119',15,15,'1971-04-28','1973-03-28',8.13),('Mo7137',25,25,'1971-09-28','2000-07-08',7.3),('Mo7543',75,25,'1975-12-18','2017-10-14',8.1),('Mo8688',55,5,'1986-06-14','2004-11-23',8.7),('Mo8697',90,15,'1986-01-22','1991-10-22',8.95),('Mo9493',100,25,'1994-03-18','2004-02-11',9.04),('Mp0113',47,22,'2001-02-14','1988-06-05',5.57),('Mp0486',62,12,'2004-08-17','1973-08-28',7.27),('Mp0723',97,22,'2007-06-28','2004-01-26',7.68),('Mp0883',37,12,'2008-12-12','2008-10-16',5.25),('Mp2167',27,2,'2021-09-26','1994-07-28',9.9),('Mp7048',72,22,'1970-07-07','1985-09-26',6.86),('Mp7821',2,2,'1978-07-22','2013-11-28',7),('Mp7848',12,12,'1978-05-18','2002-06-30',5.3),('Mp7849',22,22,'1978-03-16','1975-11-12',6.32),('Mp8359',77,2,'1983-04-23','1975-10-23',5.5),('Mp9215',52,2,'1992-04-17','1979-11-11',6.7),('Mp9413',87,12,'1994-06-25','1984-03-10',6.9),('Mr1517',35,10,'2015-02-05','1992-04-23',9.7),('Mr1896',45,20,'2018-07-20','1974-08-09',7.8),('Mr7013',60,10,'1970-07-17','1981-01-02',6.3),('Mr8420',85,10,'1984-10-09','2007-09-10',7.15),('Mr9182',70,20,'1991-11-11','1982-11-21',6.5),('Mr9687',95,20,'1996-04-07','1982-10-22',5.84),('Ms0645',8,8,'2006-08-23','1990-03-29',9.38),('Ms1116',33,8,'2011-05-15','2002-05-05',5.6),('Ms1540',18,18,'2015-04-25','2007-08-12',5.9),('Ms2016',58,8,'2020-10-14','2019-03-27',7.6),('Ms8226',83,8,'1982-09-14','2006-10-21',5.26),('Ms9474',43,18,'1994-07-10','1991-07-21',5.3),('Ms9566',93,18,'1995-04-12','1972-03-03',8.9),('Ms9567',68,18,'1995-03-13','2015-10-07',8.07),('Mt0640',69,19,'2006-02-02','1987-07-24',8.58),('Mt0983',34,9,'2009-11-27','2013-07-12',9.87),('Mt1667',44,19,'2016-07-23','1973-04-29',8.7),('Mt7090',9,9,'1970-07-17','1998-02-17',6.6),('Mt7127',84,9,'1971-08-28','2016-10-31',7.2),('Mt7432',59,9,'1974-08-04','1972-03-05',6.3),('Mt7847',94,19,'1978-10-01','2010-12-05',9.9),('Mt8182',19,19,'1981-01-09','1977-12-09',9.06),('Mu0018',88,13,'2000-11-04','1993-12-01',5.7),('Mu0665',48,23,'2006-03-21','2010-12-23',8.8),('Mu0799',98,23,'2007-03-26','1991-01-13',7.2),('Mu0826',78,3,'2008-09-20','2004-01-21',6.04),('Mu1861',73,23,'2018-04-14','1983-10-07',9.3),('Mu2096',28,3,'2020-05-25','2008-12-17',7.79),('Mu7486',13,13,'1974-01-31','1989-06-16',5),('Mu8135',38,13,'1981-01-11','1995-10-16',7.96),('Mu8377',63,13,'1983-01-08','2016-02-13',7.7),('Mu9356',23,23,'1993-11-22','1976-04-22',9.32),('Mu9779',3,3,'1997-04-08','2010-01-13',7.4),('Mx0147',11,11,'2001-01-11','1992-08-01',6.9),('Mx0632',1,1,'2006-09-03','1979-07-06',8.12),('Mx1751',86,11,'2017-11-16','2016-05-07',7.2),('Mx7334',96,21,'1973-11-09','1970-04-01',5.5),('Mx7692',71,21,'1976-10-21','1974-07-19',7.15),('Mx7822',21,21,'1978-08-14','1976-04-20',5.8),('Mx8480',46,21,'1984-10-26','1976-04-12',7.7),('Mx8718',36,11,'1987-07-23','2011-07-08',6.1),('Mx8892',76,1,'1988-04-27','2007-09-20',7.3),('Mx9322',51,1,'1993-10-26','1995-11-01',8.25),('Mx9398',26,1,'1993-11-20','1978-03-13',9.96);
/*!40000 ALTER TABLE `student_msc` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_mscStudentCode` BEFORE INSERT ON `student_msc` FOR EACH ROW BEGIN
    DECLARE department_code CHAR(1);
    DECLARE registationYear CHAR(2);
    DECLARE first_character CHAR(1);
    DECLARE second_character CHAR(1);
    DECLARE thirdAndFourth_character CHAR(2);
    DECLARE lastTwo_characters CHAR(4);
    DECLARE error INT;
    DECLARE error_message CHAR(91);
    
    SET department_code = ( SELECT UPPER(department.Code) FROM department JOIN msc on department.ID = msc.Department_ID WHERE msc.ID = NEW.MSc_ID );
    SET registationYear = SUBSTR(YEAR(NEW.Registration), 3, 2);
    SET first_character = SUBSTR(NEW.student_code, 1, 1);
    SET second_character = SUBSTR(NEW.student_code, 2, 1);
    SET thirdAndFourth_character = SUBSTR(NEW.student_code, 3, 2);
    SET lastTwo_characters = SUBSTR(NEW.student_code, 5, 2);
    SET error = 0;
    SET error_message = CONCAT('Invalid student code (It must start with \'M' , department_code, registationYear , '\', and the last 2 characters must be numbers)');
    
    IF (first_character != 'M') THEN
        SET error = 1;
    END IF;
    IF (second_character != department_code) THEN
        SET error = 1;
    END IF;
    IF (thirdAndFourth_character != registationYear) THEN
		SET error = 1;
    END IF;
    IF (lastTwo_characters NOT REGEXP '^[0-9]{2}$') THEN
        SET error = 1;
    END IF;
    IF (error = 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_phd`
--

DROP TABLE IF EXISTS `student_phd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_phd` (
  `Student_code` char(6) NOT NULL,
  `Student_ID` bigint NOT NULL,
  `Department_ID` varchar(15) NOT NULL,
  `Registration` date NOT NULL,
  `Graduation` date DEFAULT NULL,
  `Grade` float DEFAULT NULL,
  `Title` varchar(100) NOT NULL,
  `Minimum_years` int NOT NULL,
  `Maximum_years` int NOT NULL,
  PRIMARY KEY (`Student_code`),
  KEY `student_phd_StudentID_idx` (`Student_ID`),
  KEY `student_phd_Department_ID_idx` (`Department_ID`),
  CONSTRAINT `student_phd_Department_ID` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_phd_StudentID` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_phd`
--

LOCK TABLES `student_phd` WRITE;
/*!40000 ALTER TABLE `student_phd` DISABLE KEYS */;
INSERT INTO `student_phd` VALUES ('Dd1752',7,'ode','2017-10-01','1988-06-13',9.54,'Et omnis qui aliquam et sint reiciendis nemo.',3,10),('Dd2070',17,'ode','2020-02-20','1997-02-20',7.03,'Quia non cum ea quam ab omnis.',2,7),('De1421',14,'ds','2014-07-14','1971-08-27',9.68,'A cum corrupti qui provident et molestias perferendis.',4,12),('De2129',4,'ds','2021-06-10','1987-01-14',7.44,'Quis ipsum id voluptates culpa hic suscipit.',4,11),('De7645',24,'ds','1976-12-17','1973-10-15',7.44,'Non sed consectetur quo rem.',3,10),('Dn8467',6,'maritime','1984-03-03','1983-02-23',7.07,'Nemo unde molestiae praesentium recusandae.',3,9),('Do0699',15,'economics','2006-06-09',NULL,NULL,'Blanditiis et nemo reprehenderit dignissimos reprehenderit.',4,9),('Dp0548',12,'cs','2005-06-14',NULL,NULL,'Fugit odit consequatur labore asperiores et sint repellat.',2,10),('Dp1779',22,'cs','2017-02-26','1984-12-01',9.6,'Optio enim non amet est consequatur omnis ducimus.',2,5),('Dp7199',2,'cs','1971-04-21','2006-01-18',9.79,'Dolores quis cupiditate facilis mollitia quisquam.',3,5),('Ds0652',8,'statistics','2006-04-05','2012-11-22',7.1,'Laborum quis et nam repellat.',4,10),('Ds9881',18,'statistics','1998-11-01','1974-04-21',8.58,'Officiis distinctio minima nam quo.',2,9),('Dt1490',9,'tex','2014-12-30','1974-11-07',8.55,'Debitis voluptas doloribus dolores labore possimus cupiditate.',2,9),('Dt9132',19,'tex','1991-03-06','2007-07-14',7.62,'Pariatur excepturi libero occaecati est.',2,11),('Du0715',3,'des','2007-08-23','2022-08-28',8.86,'Distinctio quia accusantium sint explicabo non.',4,7),('Du7898',23,'des','1978-09-22','1971-12-01',9.45,'Perspiciatis illo vitae vel dolorum magni occaecati labore repellat.',4,12),('Du8990',13,'des','1989-12-13','2006-10-15',8.84,'Et voluptatem reprehenderit qui.',2,7),('Dx0992',21,'bankfin','2009-03-07','2017-01-31',8.59,'Aut deserunt voluptatum libero nemo impedit commodi repellat.',4,6),('Dx8083',1,'bankfin','1980-04-13','1999-11-09',7.73,'Accusamus quo perferendis iste et id.',4,6),('Dx8510',11,'bankfin','1985-01-19','1984-03-05',7.65,'Quis dolor qui omnis architecto maxime.',4,5);
/*!40000 ALTER TABLE `student_phd` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_phd_BEFORE_INSERT` BEFORE INSERT ON `student_phd` FOR EACH ROW BEGIN
	DECLARE department_code CHAR(1);
    DECLARE registationYear CHAR(2);
    DECLARE first_character CHAR(1);
    DECLARE second_character CHAR(1);
    DECLARE thirdAndFourth_character CHAR(2);
    DECLARE lastTwo_characters CHAR(4);
    DECLARE error INT;
    DECLARE error_message CHAR(91);
    
    SET department_code = ( SELECT UPPER(department.Code) FROM department WHERE department.ID = NEW.Department_ID );
    SET registationYear = SUBSTR(YEAR(NEW.Registration), 3, 2);
    SET first_character = SUBSTR(NEW.student_code, 1, 1);
    SET second_character = SUBSTR(NEW.student_code, 2, 1);
    SET thirdAndFourth_character = SUBSTR(NEW.student_code, 3, 2);
    SET lastTwo_characters = SUBSTR(NEW.student_code, 5, 2);
    SET error = 0;
    SET error_message = CONCAT('Invalid student code (It must start with \'D' , department_code, registationYear , '\', and the last 2 characters must be numbers)');
    
    IF (first_character != 'D') THEN
        SET error = 1;
    END IF;
    IF (second_character != department_code) THEN
        SET error = 1;
    END IF;
    IF (thirdAndFourth_character != registationYear) THEN
		SET error = 1;
    END IF;
    IF (lastTwo_characters NOT REGEXP '^[0-9]{2}$') THEN
        SET error = 1;
    END IF;
    IF (error = 1) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_message;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'graduates'
--
/*!50003 DROP PROCEDURE IF EXISTS `getCommonFirstName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCommonFirstName`()
BEGIN
SELECT First_name FROM student GROUP BY student.First_name ORDER BY COUNT(*) DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCommonLastName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCommonLastName`()
BEGIN
SELECT Last_name FROM student GROUP BY student.Last_name ORDER BY COUNT(*) DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCostPerMonthMscs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCostPerMonthMscs`()
BEGIN
SELECT * FROM msc ORDER BY Cost/Months_duration DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCountOfUniqueStudentsByDepartmentID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCountOfUniqueStudentsByDepartmentID`(IN depart_id varchar(15))
BEGIN
SELECT COUNT(*) FROM (SELECT distinct student.ID FROM student LEFT JOIN student_bachelor on student.ID = student_bachelor.Student_ID LEFT JOIN student_msc on student.ID = student_msc.Student_ID LEFT JOIN msc on student_msc.MSc_ID = msc.ID LEFT JOIN department AS mscDepartment on msc.Department_ID = mscDepartment.ID LEFT JOIN student_phd on student.ID = student_phd.Student_ID WHERE student_bachelor.Department_ID = depart_id or mscDepartment.ID = depart_id or student_phd.Department_ID = depart_id) AS students;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCurrentlyWorking` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCurrentlyWorking`()
BEGIN
SELECT DISTINCT student.* FROM student JOIN jobs on student.ID = jobs.Student_ID WHERE jobs.End IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDepartmentsWithMoreThan_UniqueStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartmentsWithMoreThan_UniqueStudents`(IN studentsCount INT)
BEGIN
SELECT department.* FROM department WHERE ( SELECT COUNT(*) FROM (SELECT distinct student.* FROM student LEFT JOIN student_bachelor on student.ID = student_bachelor.Student_ID LEFT JOIN student_msc on student.ID = student_msc.Student_ID LEFT JOIN msc on student_msc.MSc_ID = msc.ID LEFT JOIN department AS mscDepartment on msc.Department_ID = mscDepartment.ID LEFT JOIN student_phd on student.ID = student_phd.Student_ID WHERE student_bachelor.Department_ID = department.ID or mscDepartment.ID = department.ID or student_phd.Department_ID = department.ID) AS students ) > studentsCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDepartmentsWithSeriousMScs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartmentsWithSeriousMScs`(IN mscsCount INT, IN studentCountInEachMsc INT)
BEGIN
SELECT department.* FROM department JOIN msc on department.ID = msc.Department_ID WHERE msc.ID IN (SELECT msc.ID FROM msc JOIN student_msc on msc.ID = student_msc.MSc_ID GROUP BY msc.ID HAVING COUNT(*) >= studentCountInEachMsc) GROUP BY department.ID HAVING COUNT(department.ID) >= mscsCount;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDepartmentWhichItsBatchelorHasTheMostWorkedDays` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDepartmentWhichItsBatchelorHasTheMostWorkedDays`()
BEGIN
SELECT * FROM department WHERE id = (SELECT Department_ID FROM (SELECT student.id AS StudentID, Department_ID, SUM(DATEDIFF(IFNULL(End, CURDATE()), jobs.Start) * (jobs.Weekly_hours / 7)) AS total_hours FROM student JOIN student_bachelor on student.ID = student_bachelor.Student_ID JOIN jobs on student.ID = jobs.Student_ID JOIN department on student_bachelor.Department_ID = department.ID GROUP BY student.ID) AS StudentsWithTheirTotalWorkHours group by Department_ID ORDER BY SUM(total_hours) DESC LIMIT 1);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFreeMscs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getFreeMscs`()
BEGIN
	SELECT * 
    FROM msc 
    WHERE Cost=0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getMobileRate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getMobileRate`()
BEGIN
SELECT COUNT(*)/(SELECT COUNT(*) FROM student) AS Rate FROM student WHERE Phone LIKE '6%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStudentWorkedTheMost` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStudentWorkedTheMost`()
BEGIN
SELECT student.* FROM student JOIN jobs on student.ID = jobs.Student_ID GROUP BY student.ID ORDER BY SUM(DATEDIFF(IFNULL(End, CURDATE()), jobs.Start) * (jobs.Weekly_hours / 7)) DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getWidowsOrphans` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getWidowsOrphans`()
BEGIN
SELECT * FROM student WHERE (Father_name IS NULL OR Father_name = '') AND Marital_status = 'Widower';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getYearWithMostBachelorGraduates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getYearWithMostBachelorGraduates`()
BEGIN
SELECT YEAR(student_bachelor.Graduation) AS Year FROM student JOIN student_bachelor on student.ID = student_bachelor.Student_ID WHERE Graduation IS NOT NULL GROUP BY YEAR(student_bachelor.Graduation) ORDER BY COUNT(Student_ID) DESC LIMIT 1;
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
