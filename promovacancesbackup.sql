-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: promovacances
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `a_date_de_commande`
--

DROP TABLE IF EXISTS `a_date_de_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_date_de_commande` (
  `id_voyage` int NOT NULL,
  `id_date` int NOT NULL,
  PRIMARY KEY (`id_voyage`,`id_date`),
  KEY `a_date_de_commande_dates1_fk` (`id_date`),
  CONSTRAINT `a_date_de_commande_dates1_fk` FOREIGN KEY (`id_date`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `a_date_de_commande_voyage0_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyages` (`id_voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_date_de_commande`
--

LOCK TABLES `a_date_de_commande` WRITE;
/*!40000 ALTER TABLE `a_date_de_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `a_date_de_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_moyen_de_transport`
--

DROP TABLE IF EXISTS `a_moyen_de_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_moyen_de_transport` (
  `id_transport_dispo` int NOT NULL,
  `id_etape` int NOT NULL,
  PRIMARY KEY (`id_transport_dispo`,`id_etape`),
  KEY `a_moyen_de_transport_etapes1_fk` (`id_etape`),
  CONSTRAINT `a_moyen_de_transport_etapes1_fk` FOREIGN KEY (`id_etape`) REFERENCES `etapes` (`id_etape`),
  CONSTRAINT `a_moyen_de_transport_transport_disponible0_fk` FOREIGN KEY (`id_transport_dispo`) REFERENCES `transports_disponibles` (`id_transport_dispo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_moyen_de_transport`
--

LOCK TABLES `a_moyen_de_transport` WRITE;
/*!40000 ALTER TABLE `a_moyen_de_transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `a_moyen_de_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_une_distance`
--

DROP TABLE IF EXISTS `a_une_distance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `a_une_distance` (
  `id_ville_depart` int NOT NULL,
  `id_ville_arrivee` int NOT NULL,
  `nombre_en_km` int NOT NULL,
  PRIMARY KEY (`id_ville_depart`,`id_ville_arrivee`),
  KEY `a_une_distance_ville_etapes1_fk` (`id_ville_arrivee`),
  CONSTRAINT `a_une_distance_ville_etapes0_fk` FOREIGN KEY (`id_ville_depart`) REFERENCES `villes` (`id_ville_etape`),
  CONSTRAINT `a_une_distance_ville_etapes1_fk` FOREIGN KEY (`id_ville_arrivee`) REFERENCES `villes` (`id_ville_etape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_une_distance`
--

LOCK TABLES `a_une_distance` WRITE;
/*!40000 ALTER TABLE `a_une_distance` DISABLE KEYS */;
INSERT INTO `a_une_distance` VALUES (1,6,250),(1,7,45),(1,9,1170),(3,9,230),(3,11,470),(3,28,9086),(4,10,560),(6,11,1595),(7,3,920),(7,20,1800),(9,14,9450),(10,35,105),(11,3,471),(12,12,10),(12,19,9471),(13,13,10),(15,28,2230),(16,17,2440),(17,17,10),(18,18,10),(19,28,7430),(21,20,2010),(23,23,10),(26,44,495),(29,31,435),(31,15,6870),(31,17,1260),(35,38,900),(40,40,10),(41,41,10),(42,42,10),(43,43,10),(44,45,7000),(45,45,10),(47,27,9446);
/*!40000 ALTER TABLE `a_une_distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresses`
--

DROP TABLE IF EXISTS `adresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresses` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `numero_de_voie` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `rue` varchar(70) COLLATE utf8mb4_bin NOT NULL,
  `residence` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `building` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `etage` int NOT NULL,
  `complements` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `id_ville_etape` int NOT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `adresse_ville_etapes0_fk` (`id_ville_etape`),
  CONSTRAINT `adresse_ville_etapes0_fk` FOREIGN KEY (`id_ville_etape`) REFERENCES `villes` (`id_ville_etape`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresses`
--

LOCK TABLES `adresses` WRITE;
/*!40000 ALTER TABLE `adresses` DISABLE KEYS */;
INSERT INTO `adresses` VALUES (1,'facturation','73889','Blaine','Firefly','3',12,NULL,12),(2,'livraison','4','Messerschmidt','Celica','2',77,NULL,23),(3,'livraison','80869','Roxbury','Camaro','8',96,NULL,22),(4,'livraison','575','Maple Wood','Ram 3500 Club','10',48,NULL,23),(5,'facturation','2','Comanche','Riviera','2',49,NULL,13),(7,'facturation','176','Briar Crest','Town Car','1',29,NULL,2),(8,'livraison','1650','Jenifer','Mazdaspeed6','10',5,NULL,44),(9,'livraison','917','Hanson','IS-F','7',1,NULL,39),(10,'facturation','53698','Beilfuss','Corvette','3',68,NULL,46),(11,'facturation','10416','Arkansas','SJ','8',86,NULL,25),(13,'facturation','9856','Westridge','Uplander','5',43,NULL,12),(15,'facturation','700','Rigney','C-Class','10',73,NULL,23),(16,'facturation','87','Coleman','F430 Spider','10',6,NULL,22),(17,'livraison','26579','Karstens','Chevette','10',37,NULL,29),(19,'livraison','7081','Saint Paul','Crown Victoria','6',58,NULL,35),(20,'facturation','386','Meadow Ridge','Thunderbird','8',8,NULL,6),(22,'livraison','823','Anderson','Touareg','4',11,NULL,40),(23,'livraison','8','Roxbury','rio','5',4,NULL,46),(24,'livraison','65025','Messerschmidt','Malibu','1',53,NULL,11),(25,'livraison','41','Pine View','Talon','7',14,NULL,2),(26,'livraison','64421','Arizona','C-Class','5',17,NULL,14),(27,'livraison','15','Everett','EV1','6',8,NULL,45),(28,'facturation','74','Surrey','Stratus','4',92,NULL,9),(29,'facturation','8198','Garrison','Ram','8',77,NULL,35),(30,'facturation','21086','Merrick','3 Series','7',96,NULL,10),(31,'facturation','23','Upham','GTI','8',53,NULL,12),(32,'facturation','663','Stoughton','Camry','8',34,NULL,40),(33,'livraison','39785','Bartillon','V70','2',61,NULL,15),(34,'livraison','641','Hanover','LS','3',11,NULL,2),(35,'livraison','82','Lunder','8 Series','9',44,NULL,16),(36,'livraison','65100','New Castle','Dakota','3',20,NULL,6),(38,'facturation','88','Susan','Crossfire Roadster','2',62,NULL,16),(39,'facturation','396','Sycamore','G37','8',92,NULL,41),(40,'facturation','295','Pearson','M5','1',51,NULL,29),(42,'facturation','062','West','X5','7',11,NULL,44),(45,'livraison','415','Canary','Fusion','3',69,NULL,42),(46,'facturation','6074','Hudson','Grand Prix','10',25,NULL,7),(47,'livraison','73','Katie','Acadia','3',77,NULL,18),(48,'livraison','2','Esch','Expedition EL','6',77,NULL,15),(49,'facturation','75','Miller','Focus','8',11,NULL,34),(50,'livraison','51057','Forest','RX Hybrid','2',7,NULL,31),(51,'facturation','89','Sylvilagus floridanus','Sprinter 2500','150',1,NULL,48),(52,'livraison','5157','Microcebus murinus','HS','3',110,'3e porte à droite',40),(53,'facturation','82062','Chamaelo sp.','9-3','156',24,NULL,20),(54,'livraison','88','Libellula quadrimaculata','Bravada','5',42,NULL,50),(55,'livraison','9587','Echimys chrysurus','Cherokee','177',118,NULL,11),(56,'livraison','8810','Pseudalopex gymnocercus','G35','134',15,NULL,22),(57,'livraison','8320','Acridotheres tristis','E250','0',97,'3e porte à droite',32),(58,'livraison','507','Cebus apella','Escort','3',39,'3e porte à droite',32),(59,'livraison','235','Trachyphonus vaillantii','X-Type','99',126,'3e porte à droite',50),(60,'facturation','627','Chlidonias leucopterus','Freelander','70',85,'2e porte',44),(61,'livraison','7','Meleagris gallopavo','Rainier','99',39,'2e porte',41),(62,'facturation','68050','Madoqua kirkii','Passat','203',95,NULL,18),(63,'livraison','9','Tragelaphus strepsiceros','XLR','124',5,'2e porte',30),(64,'facturation','130','Ninox superciliaris','Terraza','21',84,'au fond du couloir',12),(65,'facturation','42','Dasypus septemcincus','rio','98',36,'au fond du couloir',36),(66,'facturation','91','Laniarius ferrugineus','X5','135',45,NULL,6),(67,'livraison','08','Ephippiorhynchus mycteria','Suburban 1500','191',109,NULL,46),(69,'livraison','42','Otaria flavescens','Riviera','0',101,'au fond du couloir',49),(70,'facturation','4','Caiman crocodilus','Cirrus','138',31,'2e porte',28),(71,'facturation','6042','Anathana ellioti','A4','227',90,'2e porte',22),(72,'facturation','18','Gyps bengalensis','TL','4',129,NULL,34),(73,'livraison','1','Madoqua kirkii','Bronco II','64',12,'2e porte',24),(74,'facturation','262','Tadorna tadorna','Suburban 2500','213',17,'au fond du couloir',29),(75,'facturation','938','Microcebus murinus','Sonata','175',113,'au fond du couloir',1),(76,'facturation','4','unavailable','Capri','167',49,'3e porte à droite',19),(77,'livraison','25482','Bubalornis niger','Dakota','53',88,'au fond du couloir',32),(78,'livraison','74','Ciconia episcopus','XK','144',103,'2e porte',33),(79,'facturation','9409','Platalea leucordia','TrailBlazer','150',116,'au fond du couloir',46),(80,'livraison','35477','Centrocercus urophasianus','T100','29',121,'3e porte à droite',26),(81,'livraison','7','Upupa epops','Durango','177',25,'2e porte',30),(82,'livraison','8','Tachybaptus ruficollis','Passat','111',63,NULL,16),(83,'facturation','2','Chauna torquata','Pathfinder','157',47,'3e porte à droite',39),(84,'livraison','7','Isoodon obesulus','Forenza','65',118,NULL,12),(85,'livraison','6','Ardea cinerea','Ciera','209',24,NULL,38),(86,'livraison','8103','Acridotheres tristis','Accord','190',18,NULL,25),(87,'facturation','0641','Hystrix cristata','Escort','150',94,'2e porte',35),(88,'livraison','65849','Dasyurus maculatus','Suburban 1500','38',134,'3e porte à droite',40),(89,'facturation','23637','Grus canadensis','X6 M','230',104,'2e porte',27),(90,'livraison','33','Ploceus rubiginosus','Town & Country','3',73,'2e porte',23),(91,'livraison','65145','Taxidea taxus','Ram 1500','181',44,'2e porte',2),(92,'livraison','6158','Sula nebouxii','LTD Crown Victoria','58',72,'au fond du couloir',37),(93,'facturation','33969','Acridotheres tristis','9000','67',70,'3e porte à droite',31),(95,'livraison','8','Psittacula krameri','RSX','220',81,NULL,29),(96,'facturation','72','Junonia genoveua','Grand Voyager','202',79,'3e porte à droite',34),(97,'livraison','29','Nucifraga columbiana','Nubira','35',64,'au fond du couloir',4),(98,'livraison','2844','Cereopsis novaehollandiae','Celica','189',58,NULL,25),(99,'livraison','10','Cochlearius cochlearius','MKX','140',8,NULL,21),(100,'livraison','3','Meles meles','GL-Class','221',98,NULL,46),(101,'livraison','99998','Phoenicopterus ruber','S-Class','6',39,'2e porte',34),(102,'facturation','5','Canis aureus','CL-Class','195',43,NULL,3),(103,'facturation','3','Plocepasser mahali','Tahoe','150',78,'3e porte à droite',20),(104,'livraison','3','Mustela nigripes','Tucson','34',37,NULL,6),(105,'facturation','6162','unavailable','Cherokee','120',7,'2e porte',7),(106,'facturation','5','Tadorna tadorna','4Runner','71',100,'3e porte à droite',35),(107,'livraison','75077','Myotis lucifugus','Bonneville','183',94,NULL,23),(108,'facturation','24','Lama guanicoe','Murciélago','135',120,'au fond du couloir',21),(109,'livraison','8','Tyto novaehollandiae','Ranger','82',82,NULL,48),(110,'facturation','1314','Pterocles gutturalis','3500','27',66,'au fond du couloir',10),(111,'livraison','6','Laniaurius atrococcineus','H3T','111',62,'3e porte à droite',15),(112,'livraison','22','Amblyrhynchus cristatus','Camaro','53',118,'3e porte à droite',17),(113,'livraison','7872','Alopochen aegyptiacus','Sierra 1500','79',19,NULL,32),(115,'livraison','2','Aquila chrysaetos','Camry','140',75,'3e porte à droite',24),(117,'livraison','553','Ovibos moschatus','4Runner','65',65,'3e porte à droite',16),(118,'livraison','51','Aegypius occipitalis','Challenger','65',112,'2e porte',24),(119,'facturation','6','Tockus erythrorhyncus','Quest','70',89,'au fond du couloir',25),(121,'facturation','49','Phasianus colchicus','900','102',120,NULL,14),(122,'livraison','289','unavailable','Biturbo','93',21,'au fond du couloir',42),(123,'facturation','47659','Spermophilus lateralis','Mazdaspeed6','119',11,NULL,50),(125,'livraison','235','Ephippiorhynchus mycteria','S2000','178',76,'2e porte',12),(126,'facturation','01','Ephippiorhynchus mycteria','Galant','33',70,'2e porte',6),(127,'livraison','543','Cervus duvauceli','940','152',32,'2e porte',30),(128,'livraison','165','Snycerus caffer','Probe','198',113,'2e porte',45),(129,'facturation','543','Lutra canadensis','Titan','202',133,'au fond du couloir',37),(130,'livraison','774','Anthropoides paradisea','Forenza','91',23,'3e porte à droite',34),(131,'livraison','175','Lycaon pictus','V70','92',24,'2e porte',34),(132,'facturation','524','Pterocles gutturalis','RDX','57',92,NULL,11),(133,'facturation','8','Felis concolor','i-Series','61',31,'au fond du couloir',3),(134,'facturation','7','Ovis ammon','Caravan','80',31,'au fond du couloir',10),(135,'facturation','23','Eurocephalus anguitimens','A4','218',36,NULL,33),(136,'livraison','2126','unavailable','928','191',60,'au fond du couloir',35),(137,'livraison','86975','Picoides pubescens','Suburban 1500','209',18,NULL,44),(138,'livraison','52764','Casmerodius albus','Integra','34',48,NULL,18),(139,'facturation','336','Manouria emys','Mustang','166',79,'2e porte',33),(140,'facturation','25820','Calyptorhynchus magnificus','Altima','62',36,'au fond du couloir',45),(141,'facturation','38635','Meleagris gallopavo','GTI','140',71,'3e porte à droite',3),(142,'facturation','2','Macropus robustus','Vantage','34',29,'au fond du couloir',37),(143,'livraison','6442','Lamprotornis chalybaeus','Boxster','92',131,'2e porte',40),(144,'facturation','4998','Phalaropus lobatus','Wrangler','226',91,NULL,5),(145,'facturation','0','Phalaropus lobatus','SVX','67',40,NULL,49),(147,'facturation','622','Cervus duvauceli','Miata MX-5','99',76,'2e porte',13),(148,'facturation','1654','Pelecans onocratalus','1500','66',59,'au fond du couloir',17),(149,'livraison','4','Genetta genetta','Corolla','177',32,'2e porte',28),(151,'livraison','7','Delphinus delphis','Tribute','210',105,'3e porte à droite',26),(153,'facturation','0050','Colobus guerza','Mustang','63',78,NULL,49),(154,'facturation','5','Pelecans onocratalus','Avenger','73',34,'3e porte à droite',23),(156,'livraison','48','Plectopterus gambensis','G35','149',61,'2e porte',32),(157,'facturation','57145','Pavo cristatus','Grand Caravan','7',73,'au fond du couloir',20),(158,'facturation','8414','Dasyurus maculatus','Grand Marquis','144',76,'au fond du couloir',29),(159,'facturation','4871','Tamiasciurus hudsonicus','Esteem','100',75,NULL,42),(160,'livraison','62813','Genetta genetta','Town Car','22',56,'2e porte',19),(162,'livraison','447','Echimys chrysurus','Outback Sport','121',106,NULL,47),(163,'facturation','54','Ceryle rudis','Sportage','12',57,'2e porte',30),(164,'livraison','4','Toxostoma curvirostre','F350','85',136,NULL,32),(165,'facturation','057','Corvus albicollis','S40','101',9,'2e porte',31),(166,'facturation','05613','Milvus migrans','LHS','108',90,NULL,23),(167,'livraison','425','Erethizon dorsatum','LX','138',12,'au fond du couloir',39),(168,'facturation','63620','Canis mesomelas','R-Class','25',63,NULL,24),(169,'livraison','89944','Spizaetus coronatus','B-Series','53',1,'au fond du couloir',37),(170,'facturation','01','Toxostoma curvirostre','Spirit','95',60,NULL,32),(171,'livraison','43486','Felis silvestris lybica','1500 Club Coupe','137',3,'au fond du couloir',35),(172,'livraison','3','Aonyx capensis','3000GT','183',27,'2e porte',36),(174,'facturation','3','Bettongia penicillata','Routan','39',74,NULL,30),(175,'facturation','6823','Cebus apella','Taurus','90',133,'3e porte à droite',39),(176,'facturation','8','Canis aureus','LX','167',101,'au fond du couloir',30),(177,'facturation','71','Colaptes campestroides','Freelander','167',81,NULL,23),(178,'facturation','4074','Ara ararauna','Corvette','140',40,'2e porte',48),(179,'facturation','304','Numida meleagris','Passat','57',65,'3e porte à droite',24),(180,'livraison','9','Eudyptula minor','G25','164',7,'2e porte',23),(181,'facturation','6','Neophron percnopterus','Express 2500','13',7,'au fond du couloir',50),(182,'livraison','0','Vanellus chilensis','RL','8',126,NULL,35),(183,'livraison','4','Manouria emys','Nubira','183',91,'au fond du couloir',12),(184,'livraison','2','Myiarchus tuberculifer','Montero Sport','137',61,'2e porte',4),(185,'livraison','2','Fratercula corniculata','M-Class','7',40,'3e porte à droite',2),(187,'facturation','10','Martes americana','C70','227',4,'3e porte à droite',10),(188,'facturation','78','Acanthaster planci','Sierra 2500','2',8,'au fond du couloir',33),(189,'livraison','47','Ratufa indica','Vision','202',111,'au fond du couloir',20),(190,'facturation','035','Geochelone elephantopus','Jetta','8',79,'3e porte à droite',33),(191,'facturation','281','Macropus agilis','Topaz','163',76,NULL,42),(192,'livraison','42','Cervus duvauceli','Miata MX-5','50',137,'3e porte à droite',28),(193,'livraison','8','Geochelone elephantopus','del Sol','213',41,'au fond du couloir',45),(194,'facturation','0','Sceloporus magister','Express 1500','13',126,'2e porte',32),(195,'livraison','1','Erethizon dorsatum','Outlook','9',36,'au fond du couloir',25),(196,'facturation','0820','Choriotis kori','Echo','31',101,NULL,31),(197,'facturation','5153','Neophoca cinerea','Vigor','177',122,'3e porte à droite',32),(198,'livraison','08','Macaca nemestrina','QX','225',69,'3e porte à droite',38),(199,'facturation','21','Corvus albicollis','Solara','30',140,NULL,25),(200,'facturation','308','Dasyurus maculatus','Cherokee','216',90,NULL,2);
/*!40000 ALTER TABLE `adresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_personne` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `numero_de_telephone` int NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `id_adresse` int NOT NULL,
  `id_date` int NOT NULL,
  `id_adresse_livraison` int NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `client_adresse1_fk` (`id_adresse`),
  KEY `client_dates2_fk` (`id_date`),
  KEY `id_adresse_livraison` (`id_adresse_livraison`),
  CONSTRAINT `client_adresse1_fk` FOREIGN KEY (`id_adresse`) REFERENCES `adresses` (`id_adresse`),
  CONSTRAINT `client_dates2_fk` FOREIGN KEY (`id_date`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `client_personne0_fk` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id_personne`),
  CONSTRAINT `id_adresse_livraison` FOREIGN KEY (`id_adresse_livraison`) REFERENCES `adresses` (`id_adresse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commandes` (
  `id_voyage` int NOT NULL,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_voyage`,`id_personne`),
  KEY `commande_client1_fk` (`id_personne`),
  CONSTRAINT `commande_client1_fk` FOREIGN KEY (`id_personne`) REFERENCES `clients` (`id_personne`),
  CONSTRAINT `commande_voyage0_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyages` (`id_voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commandes`
--

LOCK TABLES `commandes` WRITE;
/*!40000 ALTER TABLE `commandes` DISABLE KEYS */;
/*!40000 ALTER TABLE `commandes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composer`
--

DROP TABLE IF EXISTS `composer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `composer` (
  `id_etape` int NOT NULL,
  `id_voyage` int NOT NULL,
  PRIMARY KEY (`id_etape`,`id_voyage`),
  KEY `composer_voyage1_fk` (`id_voyage`),
  CONSTRAINT `composer_etapes0_fk` FOREIGN KEY (`id_etape`) REFERENCES `etapes` (`id_etape`),
  CONSTRAINT `composer_voyage1_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyages` (`id_voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer`
--

LOCK TABLES `composer` WRITE;
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
INSERT INTO `composer` VALUES (1,1),(30,1),(55,2),(60,3),(25,5),(31,5),(39,5),(11,6),(41,7),(27,8),(53,9),(15,11),(19,12),(28,12),(27,13),(16,15),(27,18),(53,18),(7,19),(17,19),(48,19),(11,20),(39,20),(45,20),(39,22),(57,23),(27,24),(60,24),(45,25),(33,26),(69,26),(43,28),(45,28),(17,30),(63,30),(62,31),(4,32),(39,33),(55,33),(69,33),(24,35),(2,37),(19,37),(31,37),(40,37),(4,38),(23,39),(35,39),(52,39),(23,40),(3,42),(14,42),(29,42),(41,44),(9,46),(55,47),(14,48),(21,48),(51,48),(30,49),(30,51),(49,51),(18,53),(10,54),(54,54),(47,57),(19,58),(39,58),(41,59),(4,60),(12,60),(39,60),(13,62),(17,63),(29,63),(59,64),(66,64),(3,65),(34,65),(58,65),(31,66),(60,66),(69,66),(14,67),(40,67),(51,67),(8,68),(46,69),(60,69);
/*!40000 ALTER TABLE `composer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dates`
--

DROP TABLE IF EXISTS `dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dates` (
  `id_date` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id_date`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
INSERT INTO `dates` VALUES (1,'1940-06-16'),(2,'1956-11-11'),(3,'1957-06-28'),(4,'1959-09-19'),(5,'1959-11-21'),(6,'1965-04-21'),(7,'1965-06-19'),(8,'1968-10-10'),(9,'1969-07-24'),(10,'1970-02-24'),(11,'1970-04-04'),(12,'1970-06-17'),(13,'1970-10-17'),(14,'1974-01-21'),(15,'1975-09-01'),(16,'1976-12-29'),(17,'1977-06-17'),(18,'1979-12-06'),(19,'1983-09-10'),(20,'1985-09-23'),(21,'1986-06-09'),(22,'1988-08-12'),(23,'1993-01-07'),(24,'1997-05-12'),(25,'1998-08-19'),(26,'1942-07-17'),(27,'1945-12-27'),(28,'1949-07-06'),(29,'1964-11-02'),(30,'1967-05-25'),(31,'1967-05-31'),(32,'1972-11-28'),(33,'1973-10-07'),(34,'1976-07-09'),(35,'2012-02-24'),(36,'1984-03-18'),(37,'1991-12-07'),(38,'1997-06-25'),(39,'1998-09-18'),(40,'2000-04-01'),(41,'2002-05-04'),(42,'2005-03-17'),(43,'2006-11-21'),(44,'2008-05-15'),(45,'2009-09-28'),(46,'2009-10-24'),(47,'2013-01-29'),(48,'2015-10-05'),(49,'2019-03-31'),(50,'2020-06-17'),(51,'1943-06-19'),(52,'1954-03-19'),(53,'1954-11-27'),(54,'1954-11-30'),(55,'1958-06-30'),(56,'1958-07-04'),(57,'1958-10-22'),(58,'1960-09-05'),(59,'1961-09-03'),(60,'1965-05-16'),(61,'1968-05-30'),(62,'1970-03-20'),(63,'1972-03-26'),(64,'1976-07-25'),(65,'1980-08-26'),(66,'1984-05-08'),(67,'1988-12-12'),(68,'1998-11-10'),(69,'2000-12-21'),(70,'2004-03-11'),(71,'2009-04-08'),(72,'2012-10-14'),(73,'2013-03-31'),(74,'2013-11-07'),(75,'1993-08-09'),(76,'1941-01-19'),(77,'1947-06-29'),(78,'1948-06-25'),(79,'1950-07-14'),(80,'1956-08-06'),(81,'1958-04-19'),(82,'1974-09-11'),(83,'1978-04-09'),(84,'1978-06-13'),(85,'1983-03-24'),(86,'1986-09-06'),(87,'1988-02-04'),(88,'1992-11-28'),(89,'1993-06-27'),(90,'1999-02-06'),(91,'2000-11-15'),(92,'2005-12-17'),(93,'2008-11-20'),(94,'2009-02-02'),(95,'2016-08-03'),(96,'2016-12-18'),(97,'1994-04-01'),(98,'1995-01-28'),(99,'1998-04-12'),(100,'2002-08-24'),(101,'1942-02-15'),(102,'1950-08-22'),(103,'1953-07-10'),(104,'1954-03-18'),(105,'1967-07-08'),(106,'1967-11-27'),(107,'1969-04-18'),(108,'1971-08-09'),(109,'1972-11-23'),(110,'1976-11-01'),(111,'1987-09-08'),(112,'1991-09-11'),(113,'2003-04-23'),(114,'2006-03-21'),(115,'2008-04-22'),(116,'2008-05-09'),(117,'2011-05-22'),(118,'2015-11-06'),(119,'2018-01-13'),(120,'1974-01-26'),(121,'1979-09-10'),(122,'1981-01-19'),(123,'1983-11-26'),(124,'1985-11-01'),(125,'1991-04-19'),(126,'2000-06-20'),(127,'2000-07-06'),(128,'2001-09-20'),(129,'2007-11-24'),(130,'2008-01-15'),(131,'2009-05-27'),(132,'2010-11-15'),(133,'2010-12-08'),(134,'2012-09-05'),(135,'2012-09-22'),(136,'2014-04-21'),(137,'2014-09-02'),(138,'2015-02-10'),(139,'2015-06-27'),(140,'2015-08-15'),(141,'2015-10-01'),(142,'2016-03-17'),(143,'2018-05-28'),(144,'2018-09-17'),(145,'2021-04-30'),(146,'2019-06-10'),(147,'2020-09-09'),(148,'2021-04-14'),(149,'2021-04-02'),(150,'2013-02-23'),(151,'2001-12-14'),(152,'2002-01-22'),(153,'2002-09-04'),(154,'2002-10-03'),(155,'2002-12-28'),(156,'2004-08-25'),(157,'2004-10-29'),(158,'2004-12-18'),(159,'2005-02-22'),(160,'2005-06-11'),(161,'2005-07-07'),(162,'2006-12-04'),(163,'2007-11-08'),(164,'2008-08-14'),(165,'2009-06-11'),(166,'2010-03-06'),(167,'2010-08-28'),(168,'2013-09-29'),(169,'2013-12-28'),(170,'2014-11-09'),(171,'2016-04-21'),(172,'2016-04-24'),(173,'2018-11-19'),(174,'2019-10-13'),(175,'2020-07-13'),(176,'2004-09-08'),(177,'2020-06-18'),(178,'1991-09-12'),(179,'2010-08-29'),(180,'2014-11-10'),(181,'2018-09-19'),(182,'2016-04-23'),(183,'2012-09-07'),(184,'2010-12-10'),(185,'2019-04-02'),(186,'2009-06-13'),(187,'2004-10-31'),(188,'1998-11-12'),(189,'2002-12-30'),(190,'2014-11-11'),(191,'2012-10-16'),(192,'2009-05-29'),(193,'1991-04-21'),(194,'2004-10-31'),(195,'2006-12-06'),(196,'2010-03-08'),(197,'2004-03-13'),(198,'1985-11-03'),(199,'2009-04-10'),(200,'2012-09-24'),(201,'2010-08-30'),(202,'2016-04-23'),(203,'1993-06-29'),(204,'2001-09-22'),(205,'2015-11-08'),(206,'2004-10-31'),(207,'2005-03-19'),(208,'2012-10-16'),(209,'2012-09-24'),(210,'2004-08-27'),(211,'2015-10-07'),(212,'2006-03-23'),(213,'2019-06-01'),(214,'2020-09-11'),(215,'2013-12-30'),(216,'2018-09-19'),(217,'2016-04-23'),(218,'2012-09-07'),(219,'2010-12-10'),(220,'2019-04-02'),(221,'2009-06-13'),(222,'2004-10-31'),(223,'2006-11-23'),(224,'2002-12-30'),(225,'2014-11-11'),(226,'2012-10-16'),(227,'2009-05-29'),(228,'1991-04-21'),(229,'2006-12-06'),(230,'2010-08-30'),(231,'2018-10-19'),(232,'2016-05-23'),(233,'2012-10-07'),(234,'2004-11-30'),(235,'2003-01-30'),(236,'2009-06-29'),(237,'2004-11-30'),(238,'2012-10-24'),(239,'2005-04-19'),(240,'2004-09-27'),(241,'2006-04-23'),(242,'2018-10-19'),(243,'2016-05-23'),(244,'2012-10-07'),(245,'2004-11-30'),(246,'2003-01-30'),(247,'2009-06-29'),(248,'2007-01-06'),(249,'2019-11-19'),(250,'2006-05-23'),(251,'2018-11-19');
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echeances`
--

DROP TABLE IF EXISTS `echeances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echeances` (
  `id_echeance` int NOT NULL AUTO_INCREMENT,
  `paiement_montant` decimal(15,2) NOT NULL,
  `id_voyage` int NOT NULL,
  `id_moyen_paiement` int NOT NULL,
  `id_date` int NOT NULL,
  PRIMARY KEY (`id_echeance`),
  KEY `echeance_voyage0_fk` (`id_voyage`),
  KEY `echeance_moyen_de_paiement1_fk` (`id_moyen_paiement`),
  KEY `echeance_dates2_fk` (`id_date`),
  CONSTRAINT `echeance_dates2_fk` FOREIGN KEY (`id_date`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `echeance_moyen_de_paiement1_fk` FOREIGN KEY (`id_moyen_paiement`) REFERENCES `moyen_de_paiement` (`id_moyen_paiement`),
  CONSTRAINT `echeance_voyage0_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyages` (`id_voyage`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echeances`
--

LOCK TABLES `echeances` WRITE;
/*!40000 ALTER TABLE `echeances` DISABLE KEYS */;
INSERT INTO `echeances` VALUES (1,733.57,47,4,136),(2,475.58,78,4,85),(3,36.99,62,4,45),(4,874.36,41,3,5),(5,503.96,94,2,34),(6,160.95,38,2,185),(7,338.91,35,4,11),(8,336.18,58,3,86),(9,388.60,95,4,28),(10,401.62,69,4,131),(11,341.84,76,1,15),(12,819.91,12,1,219),(13,61.65,50,2,147),(14,232.68,28,2,141),(15,729.62,63,1,204),(16,264.16,69,4,123),(17,388.60,5,3,69),(18,859.68,56,4,5),(19,475.58,63,3,203),(20,360.78,91,1,34),(21,551.23,47,1,80),(22,105.76,15,4,28),(23,505.90,77,3,12),(25,220.90,9,2,226),(27,567.79,45,4,110),(28,397.43,22,4,68),(29,360.78,71,4,100),(30,102.63,79,2,100),(31,105.76,96,4,179),(32,123.70,66,2,204),(33,409.14,32,3,162),(34,764.14,84,2,36),(35,830.29,39,3,205),(36,764.14,91,4,70),(37,434.25,33,4,227),(38,498.87,34,4,113),(39,360.78,76,4,11),(40,628.64,69,3,150);
/*!40000 ALTER TABLE `echeances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etapes`
--

DROP TABLE IF EXISTS `etapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etapes` (
  `id_etape` int NOT NULL AUTO_INCREMENT,
  `type_d_etape` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `heure_de_depart` time NOT NULL,
  `heure_d_arrivee` time NOT NULL,
  `moyen_de_transport` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `id_ville_depart` int NOT NULL,
  `id_ville_arrivee` int NOT NULL,
  `id_date_depart` int NOT NULL,
  `id_date_arrivee` int NOT NULL,
  PRIMARY KEY (`id_etape`),
  KEY `etapes_ville_etapes0_fk` (`id_ville_depart`),
  KEY `etapes_ville_etapes1_fk` (`id_ville_arrivee`),
  KEY `etapes_dates2_fk` (`id_date_depart`),
  KEY `etapes_dates3_fk` (`id_date_arrivee`),
  CONSTRAINT `etapes_dates2_fk` FOREIGN KEY (`id_date_depart`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `etapes_dates3_fk` FOREIGN KEY (`id_date_arrivee`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `etapes_ville_etapes0_fk` FOREIGN KEY (`id_ville_depart`) REFERENCES `villes` (`id_ville_etape`),
  CONSTRAINT `etapes_ville_etapes1_fk` FOREIGN KEY (`id_ville_arrivee`) REFERENCES `villes` (`id_ville_etape`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapes`
--

LOCK TABLES `etapes` WRITE;
/*!40000 ALTER TABLE `etapes` DISABLE KEYS */;
INSERT INTO `etapes` VALUES (1,'interville','04:57:00','01:12:00','avion',47,16,175,154),(2,'intraville','22:09:00','11:51:00','car',37,49,65,170),(3,'interville','06:06:00','23:20:00','car',38,21,190,204),(4,'intraville','08:22:00','10:24:00','avion',26,13,136,93),(5,'interville','04:23:00','05:05:00','bateau',42,44,108,140),(7,'intraville','03:02:00','23:37:00','bateau',40,6,87,226),(8,'interville','23:33:00','23:19:00','avion',42,17,157,236),(9,'interville','22:02:00','13:38:00','bateau',26,9,146,197),(10,'interville','07:54:00','11:30:00','avion',20,27,148,161),(11,'intraville','13:19:00','07:48:00','avion',45,26,62,78),(12,'intraville','12:18:00','06:15:00','car',12,38,219,188),(13,'interville','08:14:00','15:50:00','car',18,3,175,6),(14,'intraville','17:24:00','12:29:00','avion',42,5,213,7),(15,'intraville','04:40:00','02:43:00','avion',41,32,162,245),(16,'interville','19:40:00','12:05:00','car',25,38,114,188),(17,'interville','18:06:00','20:42:00','bateau',23,14,246,158),(18,'intraville','18:14:00','01:25:00','bateau',36,16,46,55),(19,'interville','02:54:00','11:16:00','avion',20,39,55,184),(20,'interville','06:22:00','07:14:00','bateau',12,34,111,123),(21,'intraville','02:59:00','04:42:00','car',22,26,200,152),(22,'interville','00:08:00','23:10:00','train',44,49,150,132),(23,'interville','03:58:00','07:15:00','train',47,34,80,176),(24,'intraville','18:43:00','15:21:00','avion',34,33,204,228),(25,'interville','08:16:00','04:01:00','car',13,47,118,245),(26,'intraville','21:07:00','08:42:00','avion',44,28,109,111),(27,'interville','21:03:00','20:40:00','train',3,46,223,119),(28,'intraville','22:04:00','20:18:00','bateau',24,31,29,193),(29,'intraville','17:13:00','00:19:00','car',42,45,245,109),(30,'intraville','15:01:00','22:39:00','bateau',21,5,195,61),(31,'interville','17:19:00','12:54:00','train',40,23,57,118),(32,'intraville','22:42:00','22:46:00','car',41,4,43,80),(33,'interville','03:33:00','02:58:00','train',3,43,87,173),(34,'interville','15:57:00','00:58:00','avion',26,18,192,20),(35,'interville','16:06:00','12:13:00','train',50,31,246,77),(36,'intraville','20:39:00','20:33:00','avion',13,36,78,239),(39,'intraville','19:32:00','07:47:00','car',31,22,168,123),(40,'interville','22:19:00','23:35:00','train',49,4,247,76),(41,'intraville','14:21:00','23:09:00','avion',7,45,20,55),(42,'intraville','21:30:00','22:23:00','bateau',13,23,218,115),(43,'intraville','12:47:00','14:10:00','car',13,16,131,154),(44,'interville','23:15:00','20:52:00','train',33,6,133,171),(45,'intraville','18:11:00','21:47:00','train',17,18,190,126),(46,'intraville','06:10:00','09:59:00','bateau',37,44,4,156),(47,'interville','04:58:00','01:39:00','train',40,1,50,89),(48,'intraville','17:25:00','21:53:00','train',49,27,2,117),(49,'interville','20:16:00','13:19:00','avion',19,24,163,248),(50,'interville','06:54:00','09:12:00','train',21,17,143,120),(51,'intraville','11:26:00','23:15:00','train',2,28,118,17),(52,'interville','02:59:00','11:33:00','train',12,8,132,119),(53,'intraville','15:53:00','09:00:00','car',11,28,214,32),(54,'interville','12:54:00','14:12:00','avion',35,12,175,248),(55,'interville','20:18:00','04:29:00','bateau',21,13,162,39),(56,'intraville','00:34:00','10:23:00','car',31,19,29,116),(57,'interville','05:45:00','12:10:00','bateau',5,15,187,17),(58,'intraville','01:00:00','02:34:00','train',36,48,26,244),(59,'intraville','08:30:00','01:07:00','bateau',11,12,212,129),(60,'interville','19:01:00','20:05:00','car',13,40,1,121),(61,'interville','11:19:00','22:00:00','bateau',13,6,84,163),(62,'intraville','17:19:00','13:29:00','car',50,12,214,87),(63,'interville','05:42:00','04:58:00','avion',15,40,248,82),(65,'intraville','07:43:00','05:21:00','avion',30,21,180,39),(66,'interville','05:15:00','01:45:00','avion',50,27,36,196),(68,'interville','09:38:00','22:28:00','train',30,47,106,249),(69,'intraville','23:22:00','10:46:00','bateau',9,6,209,241),(70,'intraville','16:19:00','07:09:00','train',23,28,219,86),(71,'interville','22:11:00','07:22:00','car',39,19,55,59),(72,'intraville','11:16:00','14:52:00','train',6,45,202,30),(73,'interville','13:46:00','03:37:00','bateau',41,23,217,20),(74,'interville','21:55:00','11:08:00','train',22,28,189,188),(75,'intraville','14:04:00','14:50:00','train',17,33,212,202),(76,'interville','01:23:00','04:55:00','train',8,31,138,26),(77,'intraville','20:47:00','06:50:00','avion',46,25,139,193),(78,'interville','05:28:00','03:14:00','train',17,25,88,178),(79,'intraville','19:26:00','04:48:00','avion',44,20,181,229),(80,'interville','14:25:00','12:32:00','train',27,14,200,229),(81,'interville','20:27:00','10:41:00','train',18,48,198,20),(82,'intraville','22:50:00','13:04:00','avion',15,6,183,197),(83,'interville','14:58:00','20:41:00','bateau',21,16,206,58),(84,'interville','07:16:00','12:48:00','avion',30,12,26,246),(85,'intraville','12:23:00','19:43:00','bateau',42,48,8,71),(86,'interville','07:16:00','02:25:00','avion',20,5,56,184),(87,'intraville','07:52:00','01:21:00','train',19,18,56,238),(88,'interville','13:29:00','20:18:00','car',35,36,98,47),(89,'intraville','23:39:00','04:01:00','train',15,6,175,32),(90,'interville','06:17:00','14:47:00','bateau',20,13,227,63),(91,'intraville','06:22:00','12:17:00','car',8,49,42,212),(92,'intraville','01:03:00','06:53:00','car',50,18,207,114),(93,'interville','07:14:00','02:41:00','car',37,6,106,181),(94,'intraville','16:29:00','07:33:00','car',5,14,74,64),(95,'interville','06:57:00','12:58:00','car',42,8,218,50),(96,'intraville','16:13:00','19:15:00','avion',19,23,62,218),(97,'interville','13:44:00','16:33:00','avion',45,49,196,237),(98,'intraville','22:02:00','13:01:00','avion',35,41,82,184),(99,'interville','01:00:00','09:27:00','avion',40,47,74,221),(100,'interville','06:00:00','02:35:00','car',48,44,38,34),(101,'interville','17:33:00','16:05:00','bateau',34,40,232,231),(102,'interville','23:10:00','01:43:00','car',20,49,79,99),(103,'interville','12:28:00','13:56:00','train',29,14,246,76),(104,'interville','22:27:00','22:27:00','bateau',39,5,197,193),(105,'intraville','18:54:00','15:36:00','bateau',38,26,197,178),(106,'intraville','04:42:00','10:58:00','avion',4,26,177,39),(107,'intraville','03:32:00','22:04:00','car',25,8,209,145),(108,'intraville','02:19:00','22:33:00','car',44,21,67,150),(109,'intraville','18:07:00','08:39:00','train',29,26,22,210),(110,'intraville','09:04:00','09:03:00','avion',22,49,186,47),(111,'intraville','22:55:00','20:10:00','bateau',49,34,243,16),(112,'interville','11:47:00','00:38:00','avion',11,27,83,39),(113,'intraville','18:02:00','18:44:00','bateau',13,49,189,9),(114,'intraville','20:56:00','01:46:00','car',49,45,163,73),(115,'intraville','04:54:00','08:23:00','train',47,15,124,191),(116,'intraville','11:21:00','12:24:00','car',3,27,73,90),(117,'interville','18:15:00','14:52:00','bateau',2,18,228,241),(119,'interville','20:15:00','03:38:00','car',10,30,207,63),(120,'intraville','11:31:00','23:48:00','car',36,4,235,224),(121,'intraville','12:31:00','04:57:00','car',4,43,205,174),(122,'interville','14:18:00','16:56:00','avion',6,40,73,167),(123,'intraville','08:43:00','11:42:00','avion',24,4,218,50),(124,'intraville','17:25:00','06:06:00','bateau',19,38,55,140),(125,'interville','14:31:00','15:59:00','car',17,10,24,137),(126,'intraville','13:06:00','12:00:00','avion',34,13,187,207),(127,'intraville','01:59:00','20:12:00','train',29,14,83,105),(128,'intraville','15:34:00','18:46:00','avion',39,19,245,94),(129,'interville','13:27:00','10:34:00','train',44,2,46,85),(130,'interville','08:06:00','10:01:00','bateau',4,5,169,131),(131,'interville','07:04:00','13:14:00','avion',31,4,172,161),(132,'intraville','15:42:00','01:15:00','train',15,17,91,231),(133,'intraville','06:14:00','06:00:00','train',8,11,40,113),(134,'interville','06:17:00','14:02:00','car',25,42,72,30),(135,'interville','11:17:00','09:12:00','car',23,35,27,242),(136,'intraville','06:27:00','08:27:00','car',41,18,168,195),(138,'intraville','23:28:00','02:44:00','avion',4,8,245,3),(139,'interville','03:48:00','00:38:00','bateau',31,18,85,200),(140,'interville','04:24:00','05:00:00','train',10,28,183,248),(141,'interville','05:13:00','20:55:00','train',15,17,73,168),(142,'intraville','20:41:00','06:04:00','train',35,42,249,95),(143,'interville','08:42:00','02:48:00','avion',24,10,220,186),(144,'interville','06:42:00','12:52:00','avion',47,47,223,230),(145,'interville','15:48:00','00:00:00','car',34,7,112,188),(146,'intraville','17:17:00','13:57:00','avion',42,48,107,105),(147,'intraville','03:19:00','09:24:00','avion',12,12,109,239),(148,'interville','00:51:00','10:09:00','bateau',14,6,177,151),(149,'interville','22:12:00','09:24:00','car',40,37,4,179),(150,'intraville','01:22:00','14:08:00','bateau',25,15,144,41),(151,'interville','23:04:00','23:39:00','car',19,41,25,179),(152,'intraville','10:25:00','13:35:00','bateau',40,3,168,215),(153,'intraville','18:58:00','00:43:00','train',26,26,113,119),(154,'intraville','12:47:00','10:47:00','car',3,25,190,148),(155,'intraville','15:48:00','21:31:00','train',18,48,118,84),(156,'interville','19:36:00','20:17:00','avion',22,32,209,116),(157,'interville','19:53:00','13:11:00','train',31,11,15,115),(158,'interville','00:19:00','19:16:00','avion',39,29,41,22),(159,'interville','16:59:00','04:29:00','bateau',33,16,129,193),(160,'interville','20:08:00','19:14:00','bateau',23,8,77,24),(161,'intraville','18:25:00','05:24:00','train',7,39,52,178),(163,'intraville','13:31:00','12:58:00','car',20,3,165,197),(164,'intraville','11:34:00','22:08:00','bateau',41,12,78,94),(165,'interville','17:08:00','04:01:00','bateau',29,16,31,229),(166,'intraville','01:44:00','02:40:00','bateau',39,39,120,14),(167,'intraville','04:56:00','10:49:00','bateau',44,50,168,232),(168,'intraville','18:00:00','16:58:00','bateau',14,36,233,141),(169,'intraville','22:03:00','00:20:00','train',17,19,147,146),(170,'intraville','02:39:00','11:53:00','car',32,33,165,246),(171,'intraville','20:56:00','07:04:00','bateau',3,28,122,164),(172,'interville','07:20:00','14:39:00','bateau',12,20,149,172),(175,'intraville','15:46:00','23:24:00','bateau',22,36,60,221),(176,'interville','01:23:00','14:52:00','car',36,9,79,245),(177,'interville','21:17:00','01:31:00','avion',17,27,184,163),(178,'interville','06:13:00','21:19:00','car',40,10,200,186),(179,'intraville','13:51:00','11:35:00','avion',37,28,99,115),(180,'intraville','20:58:00','10:08:00','train',42,50,30,14),(181,'intraville','13:30:00','02:36:00','avion',26,21,161,140),(182,'interville','00:41:00','08:12:00','avion',10,45,136,227),(183,'intraville','05:28:00','11:22:00','avion',10,47,30,20),(184,'intraville','10:10:00','23:18:00','avion',24,41,178,194),(185,'interville','09:54:00','12:08:00','avion',40,4,195,46),(186,'intraville','05:20:00','23:10:00','avion',2,23,39,149),(187,'intraville','09:02:00','16:01:00','avion',6,12,148,77),(188,'interville','03:00:00','22:46:00','bateau',17,40,201,23),(189,'interville','20:17:00','06:55:00','avion',10,21,239,123),(191,'intraville','09:08:00','05:44:00','train',14,11,193,99),(192,'intraville','15:33:00','21:35:00','car',21,41,187,239),(193,'intraville','13:38:00','03:23:00','train',17,14,188,149),(194,'intraville','09:48:00','03:20:00','train',47,26,99,157),(195,'interville','15:14:00','19:39:00','bateau',8,8,228,102),(196,'interville','05:39:00','21:52:00','avion',25,5,243,224),(197,'intraville','04:51:00','03:55:00','train',33,25,39,167),(198,'interville','22:26:00','22:05:00','bateau',28,26,33,46),(199,'intraville','19:18:00','03:42:00','avion',3,31,186,83),(200,'intraville','03:53:00','00:07:00','car',38,8,18,236);
/*!40000 ALTER TABLE `etapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moyen_de_paiement`
--

DROP TABLE IF EXISTS `moyen_de_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moyen_de_paiement` (
  `id_moyen_paiement` int NOT NULL AUTO_INCREMENT,
  `moyen_disponible` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id_moyen_paiement`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moyen_de_paiement`
--

LOCK TABLES `moyen_de_paiement` WRITE;
/*!40000 ALTER TABLE `moyen_de_paiement` DISABLE KEYS */;
INSERT INTO `moyen_de_paiement` VALUES (1,'CB'),(2,'Liquide'),(3,'Cheque'),(4,'Paypal');
/*!40000 ALTER TABLE `moyen_de_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnes` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `numero_de_telephone` int NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `id_date_naissance` int NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `personne_dates0_fk` (`id_date_naissance`),
  CONSTRAINT `personne_dates0_fk` FOREIGN KEY (`id_date_naissance`) REFERENCES `dates` (`id_date`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnes`
--

LOCK TABLES `personnes` WRITE;
/*!40000 ALTER TABLE `personnes` DISABLE KEYS */;
INSERT INTO `personnes` VALUES (1,'MARTIN','Anthony',623458438,'Anthony.martin@gmail.com','M',1),(2,'GARNIER','Charles',678975345,'Garnier.charles@hotmail.fr','M',2),(3,'SUNIA','Malik',793497257,'Maliksunia3@yahoo.fr','M',3),(4,'PETIT','Edouard',621385930,'Edouard_Petit@laposte.net','M',4),(5,'GILLET','Jacob',609742912,'Gillet.Jacob@free.fr','M',5),(6,'DURAND','Laurence',793597120,'Laurencedurand@hotmail.com','F',6),(7,'DUBOIS','Justine',699845763,'Judubois@gmail.com','F',7),(8,'JOUBERT','Morgane',626537809,'morgane.joubert14@yahoo.fr','F',8),(9,'ROUSSEAU','Louis',690863486,'rousseau.louis@icloud.com','M',9),(10,'LAFFARGE','Thibaud',745280907,'Thibaud-laffarge@laposte.net','M',10),(11,'LEFEBVRE','Lea',651332698,'LefebvreL@gmail.com','F',11),(12,'LEROY','Nolwen',632556988,'LNolwen@hotmail.com','F',12),(13,'ROUX','Mathias',655668909,'Mathiasleroux@icloud.com','M',13),(14,'MOREL','Marina',688008453,'Morel.marina@free.fr','F',14),(15,'FOURNIER','Bastien',699424421,'fournier.bastien9@gmail.com','M',15),(16,'BEAULE','Sylvie',340271699,'SylvieBeaule@rhyta.com','F',16),(17,'Brunault','Susanne',426045962,'SusanneBrunault@armyspy.com','F',17),(18,'Fluet','Mathilde',132772801,'MathildeFluet@jourrapide.com','F',18),(19,'Berie','Estelle',392140730,'EstelleBerie@rhyta.com','F',19),(20,'Lafond','Adrian',575097160,'AdrianLafond@armyspy.com','M',20),(21,'Guay','Jeoffroi',357012191,'JeoffroiGuay@teleworm.us','M',21),(22,'Guérette','Stéphanie',367873173,'StephanieGuerette@jourrapide.com','F',22),(23,'Chartier','Timothée',460890442,'TimotheeChartier@jourrapide.com','M',22),(24,'Echeverri','Jérôme',153191349,'JeromeEcheverri@jourrapide.com','M',23),(25,'Primeau','Jacqueline',408885189,'JacquelinePrimeau@rhyta.com','F',24),(26,'Abril','Alain',101669462,'AlainAbril@dayrep.com','M',25),(27,'Talon','Laetitia',112850181,'LaetitiaTalon@dayrep.com','F',26),(28,'Sorel','Gaetan',239154661,'GaetanSorel@dayrep.com','M',27),(29,'Nadeau','Véronique',478380383,'VeroniqueNadeau@jourrapide.com','F',28),(30,'Rossignol','Gabrielle',148806181,'GabrielleRossignol@jourrapide.com','F',29),(31,'Briard','Alice',441588029,'AliceBriard@armyspy.com','F',30),(32,'Duffet','Juliette',179945743,'JulietteDuffet@dayrep.com','F',31),(33,'Lécuyer','Émile',212750745,'EmileLecuyer@rhyta.com','M',32),(34,'Guimond','Agnès',586054590,'AgnesGuimond@rhyta.com','F',33),(35,'LaGrande','Pauline',166577671,'PaulineLaGrande@jourrapide.com','F',34),(36,'Lacasse','Émilie',567341078,'EmilieLacasse@rhyta.com','F',35),(37,'Allaine','Anaïs',256831989,'AnaisAllain@teleworm.us','F',36),(38,'Bazinet','Maryse',589432860,'MaryseBazinet@armyspy.com','F',37),(39,'Mainville','Thibaut',538139257,'ThibautMainville@armyspy.com','M',38),(40,'Bouvier','Arnaud',419065303,'ArnaudBouvier@rhyta.com','M',39),(41,'Poisson','Romain',243155248,'RomainPoisson@teleworm.us','M',40),(42,'Pomerleau','Philip',118866428,'PhilipPomerleau@teleworm.us','M',41),(43,'Pichette','Christian',422636091,'ChristianPichette@teleworm.us','M',51),(44,'Crête','Gaspar',135482360,'GasparCrete@jourrapide.com','M',52),(45,'CinqMars','Franck',438554851,'FranckCinqMars@teleworm.us','M',53),(46,'Massé','Xavier',166686262,'XavierMasse@armyspy.com','M',54),(47,'Durepos','Geoffrey',102949999,'GeoffreyDurepos@armyspy.com','M',55),(48,'Marcil','Laurent',145348537,'LaurentMarcil@rhyta.com','M',56),(49,'Arnoux','Agnès',471431465,'AgnesArnoux@armyspy.com','F',57),(50,'Marquis','Amélie',107708512,'AmelieMarquis@teleworm.us','F',58),(51,'Léveillé','Roxanne',410542170,'RoxanneLeveille@jourrapide.com','F',58),(52,'Sirois','Artus',161961829,'ArtusSirois@rhyta.com','M',75),(53,'Davis','Henri',149830335,'HenriDavis@jourrapide.com','M',76),(54,'Pellerin','Jérôme',430524527,'JeromePellerin@dayrep.com','M',76),(55,'Martin','Yvonne',521364869,'Yvonne.martin@gmail.com','F',77),(56,'Dupond','Olivier',729384400,'Olivierdupond@hotmail.fr','M',78),(57,'Tollum','Jessica',301563878,'J.tlum@free.fr','F',78),(58,'Dermiche','Allan',426362869,'Dermiche.A@orange.fr','M',78),(59,'Bonnet','Carla',312469930,'C.Bonnet@icloud.com','F',79),(60,'Cuche','Armand',475723628,'Armand.cuche@yahoo.fr','M',82),(61,'Papin','Thomas',636260015,'Tompapin@free.fr','M',87),(62,'Bertin','Emma',712582936,'Emmabertin@gmail.com','F',88),(63,'Abel','Nicolas',436492312,'abel.nico@hotmail.com','M',89),(64,'Iourev','Stanislas',314462869,'Staniourev@iourev.com','M',90),(65,'Serre','Pierre',138990325,'SerrePierre@gmail.com','M',91);
/*!40000 ALTER TABLE `personnes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id_personne` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `numero_de_telephone` int NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `id_date_embauche` int NOT NULL,
  `id_date_naissance` int NOT NULL,
  `id_adresse_staff` int NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `staff_dates1_fk` (`id_date_embauche`),
  KEY `staff_dates2_fk` (`id_date_naissance`),
  KEY `id_adresse_staff` (`id_adresse_staff`),
  CONSTRAINT `id_adresse_staff` FOREIGN KEY (`id_adresse_staff`) REFERENCES `adresses` (`id_adresse`),
  CONSTRAINT `staff_dates1_fk` FOREIGN KEY (`id_date_embauche`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `staff_dates2_fk` FOREIGN KEY (`id_date_naissance`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `staff_personne0_fk` FOREIGN KEY (`id_personne`) REFERENCES `personnes` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (51,'Léveillé','Roxanne',410542170,'RoxanneLeveille@jourrapide.com','F',5,67,58),(52,'Sirois','Artus',161961829,'ArtusSirois@rhyta.com','M',10,94,75),(53,'Davis','Henri',149830335,'HenriDavis@jourrapide.com','M',15,82,76),(54,'Pellerin','Jérôme',430524527,'JeromePellerin@dayrep.com','M',18,105,76),(55,'Martin','Yvonne',521364869,'Yvonne.martin@gmail.com','F',27,30,77),(56,'Dupond','Olivier',729384400,'Olivierdupond@hotmail.fr','M',30,62,78),(57,'Tollum','Jessica',301563878,'J.tlum@free.fr','F',35,120,78),(58,'Dermiche','Allan',426362869,'Dermiche.A@orange.fr','M',36,121,78),(59,'Bonnet','Carla',312469930,'C.Bonnet@icloud.com','F',39,15,79),(60,'Cuche','Armand',475723628,'Armand.cuche@yahoo.fr','M',40,98,82),(61,'Papin','Thomas',636260015,'Tompapin@free.fr','M',41,116,87),(62,'Bertin','Emma',712582936,'Emmabertin@gmail.com','F',42,118,88),(63,'Abel','Nicolas',436492312,'abel.nico@hotmail.com','M',43,143,89),(64,'Iourev','Stanislas',314462869,'Staniourev@iourev.com','M',44,147,90),(65,'Serre','Pierre',138990325,'SerrePierre@gmail.com','M',45,175,91);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transports_disponibles`
--

DROP TABLE IF EXISTS `transports_disponibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transports_disponibles` (
  `id_transport_dispo` int NOT NULL AUTO_INCREMENT,
  `transport_dispo` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `prix_au_kilometre` decimal(15,3) NOT NULL,
  `prix_forfaitaire` decimal(15,3) NOT NULL,
  PRIMARY KEY (`id_transport_dispo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transports_disponibles`
--

LOCK TABLES `transports_disponibles` WRITE;
/*!40000 ALTER TABLE `transports_disponibles` DISABLE KEYS */;
INSERT INTO `transports_disponibles` VALUES (1,'avion',0.080,50.000),(2,'bateau',0.150,30.000),(3,'bus',0.050,10.000),(4,'train',0.130,15.000);
/*!40000 ALTER TABLE `transports_disponibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `villes`
--

DROP TABLE IF EXISTS `villes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `villes` (
  `id_ville_etape` int NOT NULL AUTO_INCREMENT,
  `code_postal` int NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `disponible_catalogue` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_ville_etape`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `villes`
--

LOCK TABLES `villes` WRITE;
/*!40000 ALTER TABLE `villes` DISABLE KEYS */;
INSERT INTO `villes` VALUES (1,6000,'Nice',1),(2,14114,'Ver sur mer',0),(3,75008,'Paris',1),(4,45000,'Orléans',1),(5,66190,'Collioure',0),(6,20200,'Bastia',1),(7,6150,'Cannes',1),(8,76000,'Rouen',0),(9,59000,'Lille',1),(10,38000,'Grenoble',1),(11,99,'Londres',1),(12,99,'Rome',1),(13,97300,'Cayenne',1),(14,97400,'Saint Denis',1),(15,99,'Miami',1),(16,99,'Moscou',1),(17,99,'Amsterdam',1),(18,99,'Bangkok',1),(19,99,'Sao Paulo',1),(20,99,'Alger',1),(21,33000,'Bordeaux',1),(22,42000,'Saint etienne',0),(23,67000,'Strasbourg',1),(24,69001,'Lyon',1),(25,99,'Monaco',1),(26,99,'Montréal',1),(27,99,'Tokyo',1),(28,99,'Mexico',1),(29,17000,'La Rochelle',1),(30,87000,'Limoges',0),(31,29200,'Brest',1),(32,72000,'Le Mans',0),(33,76600,'Le Havre',0),(34,89000,'Auxerre',0),(35,74000,'Annecy',1),(36,5000,'Gap',0),(37,86000,'Poitiers',0),(38,64200,'Biarritz',1),(39,84000,'Avignon',0),(40,99,'Le Caire',1),(41,99,'Pekin',1),(42,98714,'Papeete',1),(43,99,'Sydney',1),(44,99,'Boston',1),(45,99,'Los Angeles',1),(46,99,'Geneve',1),(47,99,'Bruxelles',1),(48,29000,'Quimper',0),(49,16000,'Angouleme',0),(50,83000,'Toulon',1);
/*!40000 ALTER TABLE `villes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voyages`
--

DROP TABLE IF EXISTS `voyages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voyages` (
  `id_voyage` int NOT NULL AUTO_INCREMENT,
  `id_calculer_prix` int DEFAULT NULL,
  PRIMARY KEY (`id_voyage`),
  KEY `voyage_voyage0_fk` (`id_calculer_prix`),
  CONSTRAINT `voyage_voyage0_fk` FOREIGN KEY (`id_calculer_prix`) REFERENCES `voyages` (`id_voyage`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyages`
--

LOCK TABLES `voyages` WRITE;
/*!40000 ALTER TABLE `voyages` DISABLE KEYS */;
INSERT INTO `voyages` VALUES (1,NULL),(2,NULL),(3,NULL),(4,NULL),(5,NULL),(6,NULL),(7,NULL),(8,NULL),(9,NULL),(10,NULL),(11,NULL),(12,NULL),(13,NULL),(14,NULL),(15,NULL),(16,NULL),(17,NULL),(18,NULL),(19,NULL),(20,NULL),(21,NULL),(22,NULL),(23,NULL),(24,NULL),(25,NULL),(26,NULL),(27,NULL),(28,NULL),(29,NULL),(30,NULL),(31,NULL),(32,NULL),(33,NULL),(34,NULL),(35,NULL),(36,NULL),(37,NULL),(38,NULL),(39,NULL),(40,NULL),(41,NULL),(42,NULL),(43,NULL),(44,NULL),(45,NULL),(46,NULL),(47,NULL),(48,NULL),(49,NULL),(50,NULL),(51,NULL),(52,NULL),(53,NULL),(54,NULL),(55,NULL),(56,NULL),(57,NULL),(58,NULL),(59,NULL),(60,NULL),(61,NULL),(62,NULL),(63,NULL),(64,NULL),(65,NULL),(66,NULL),(67,NULL),(68,NULL),(69,NULL),(70,NULL),(71,NULL),(72,NULL),(73,NULL),(74,NULL),(75,NULL),(76,NULL),(77,NULL),(78,NULL),(79,NULL),(80,NULL),(81,NULL),(82,NULL),(83,NULL),(84,NULL),(85,NULL),(86,NULL),(87,NULL),(88,NULL),(89,NULL),(90,NULL),(91,NULL),(92,NULL),(93,NULL),(94,NULL),(95,NULL),(96,NULL),(97,NULL),(98,NULL),(99,NULL),(100,NULL);
/*!40000 ALTER TABLE `voyages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17 11:45:45
