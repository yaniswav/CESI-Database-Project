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
  CONSTRAINT `a_date_de_commande_voyage0_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyage` (`id_voyage`)
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
  CONSTRAINT `a_moyen_de_transport_transport_disponible0_fk` FOREIGN KEY (`id_transport_dispo`) REFERENCES `transport_disponible` (`id_transport_dispo`)
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
  `id_ville_etape` int NOT NULL,
  `id_ville_etape_ville_etapes` int NOT NULL,
  `nombre_en_km` int NOT NULL,
  PRIMARY KEY (`id_ville_etape`,`id_ville_etape_ville_etapes`),
  KEY `a_une_distance_ville_etapes1_fk` (`id_ville_etape_ville_etapes`),
  CONSTRAINT `a_une_distance_ville_etapes0_fk` FOREIGN KEY (`id_ville_etape`) REFERENCES `ville_etapes` (`id_ville_etape`),
  CONSTRAINT `a_une_distance_ville_etapes1_fk` FOREIGN KEY (`id_ville_etape_ville_etapes`) REFERENCES `ville_etapes` (`id_ville_etape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_une_distance`
--

LOCK TABLES `a_une_distance` WRITE;
/*!40000 ALTER TABLE `a_une_distance` DISABLE KEYS */;
/*!40000 ALTER TABLE `a_une_distance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adresse` (
  `id_adresse` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `numero_de_voie` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `rue` varchar(70) COLLATE utf8mb4_bin NOT NULL,
  `residence` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `building` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `etage` int NOT NULL,
  `complements` varchar(5) COLLATE utf8mb4_bin NOT NULL,
  `id_ville_etape` int NOT NULL,
  PRIMARY KEY (`id_adresse`),
  KEY `adresse_ville_etapes0_fk` (`id_ville_etape`),
  CONSTRAINT `adresse_ville_etapes0_fk` FOREIGN KEY (`id_ville_etape`) REFERENCES `ville_etapes` (`id_ville_etape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_personne` int NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `numero_de_telephone` int NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `age` int NOT NULL,
  `id_adresse` int NOT NULL,
  `id_date` int NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `client_adresse1_fk` (`id_adresse`),
  KEY `client_dates2_fk` (`id_date`),
  CONSTRAINT `client_adresse1_fk` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  CONSTRAINT `client_dates2_fk` FOREIGN KEY (`id_date`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `client_personne0_fk` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `id_voyage` int NOT NULL,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_voyage`,`id_personne`),
  KEY `commande_client1_fk` (`id_personne`),
  CONSTRAINT `commande_client1_fk` FOREIGN KEY (`id_personne`) REFERENCES `client` (`id_personne`),
  CONSTRAINT `commande_voyage0_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyage` (`id_voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
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
  CONSTRAINT `composer_voyage1_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyage` (`id_voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composer`
--

LOCK TABLES `composer` WRITE;
/*!40000 ALTER TABLE `composer` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echeance`
--

DROP TABLE IF EXISTS `echeance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `echeance` (
  `id_echeance` int NOT NULL AUTO_INCREMENT,
  `paiement_montant` int NOT NULL,
  `paiement_methode` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `id_voyage` int NOT NULL,
  `id_moyen_paiement` int NOT NULL,
  `id_date` int NOT NULL,
  PRIMARY KEY (`id_echeance`),
  KEY `echeance_voyage0_fk` (`id_voyage`),
  KEY `echeance_moyen_de_paiement1_fk` (`id_moyen_paiement`),
  KEY `echeance_dates2_fk` (`id_date`),
  CONSTRAINT `echeance_dates2_fk` FOREIGN KEY (`id_date`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `echeance_moyen_de_paiement1_fk` FOREIGN KEY (`id_moyen_paiement`) REFERENCES `moyen_de_paiement` (`id_moyen_paiement`),
  CONSTRAINT `echeance_voyage0_fk` FOREIGN KEY (`id_voyage`) REFERENCES `voyage` (`id_voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echeance`
--

LOCK TABLES `echeance` WRITE;
/*!40000 ALTER TABLE `echeance` DISABLE KEYS */;
/*!40000 ALTER TABLE `echeance` ENABLE KEYS */;
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
  `id_ville_etape` int NOT NULL,
  `id_ville_etape_ville_etapes` int NOT NULL,
  `id_date_depart` int NOT NULL,
  `id_date_arrivee` int NOT NULL,
  PRIMARY KEY (`id_etape`),
  KEY `etapes_ville_etapes0_fk` (`id_ville_etape`),
  KEY `etapes_ville_etapes1_fk` (`id_ville_etape_ville_etapes`),
  KEY `etapes_dates2_fk` (`id_date_depart`),
  KEY `etapes_dates3_fk` (`id_date_arrivee`),
  CONSTRAINT `etapes_dates2_fk` FOREIGN KEY (`id_date_depart`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `etapes_dates3_fk` FOREIGN KEY (`id_date_arrivee`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `etapes_ville_etapes0_fk` FOREIGN KEY (`id_ville_etape`) REFERENCES `ville_etapes` (`id_ville_etape`),
  CONSTRAINT `etapes_ville_etapes1_fk` FOREIGN KEY (`id_ville_etape_ville_etapes`) REFERENCES `ville_etapes` (`id_ville_etape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etapes`
--

LOCK TABLES `etapes` WRITE;
/*!40000 ALTER TABLE `etapes` DISABLE KEYS */;
/*!40000 ALTER TABLE `etapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habite`
--

DROP TABLE IF EXISTS `habite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habite` (
  `id_personne` int NOT NULL,
  `id_personne_staff` int NOT NULL,
  `id_adresse` int NOT NULL,
  PRIMARY KEY (`id_personne`,`id_personne_staff`,`id_adresse`),
  KEY `habite_staff1_fk` (`id_personne_staff`),
  KEY `habite_adresse2_fk` (`id_adresse`),
  CONSTRAINT `habite_adresse2_fk` FOREIGN KEY (`id_adresse`) REFERENCES `adresse` (`id_adresse`),
  CONSTRAINT `habite_client0_fk` FOREIGN KEY (`id_personne`) REFERENCES `client` (`id_personne`),
  CONSTRAINT `habite_staff1_fk` FOREIGN KEY (`id_personne_staff`) REFERENCES `staff` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habite`
--

LOCK TABLES `habite` WRITE;
/*!40000 ALTER TABLE `habite` DISABLE KEYS */;
/*!40000 ALTER TABLE `habite` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moyen_de_paiement`
--

LOCK TABLES `moyen_de_paiement` WRITE;
/*!40000 ALTER TABLE `moyen_de_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `moyen_de_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personne`
--

DROP TABLE IF EXISTS `personne`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `numero_de_telephone` int NOT NULL,
  `mail` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `age` int NOT NULL,
  `id_date_naissance` int NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `personne_dates0_fk` (`id_date_naissance`),
  CONSTRAINT `personne_dates0_fk` FOREIGN KEY (`id_date_naissance`) REFERENCES `dates` (`id_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personne`
--

LOCK TABLES `personne` WRITE;
/*!40000 ALTER TABLE `personne` DISABLE KEYS */;
/*!40000 ALTER TABLE `personne` ENABLE KEYS */;
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
  `age` int NOT NULL,
  `id_date_embauche` int NOT NULL,
  `id_date_naissance` int NOT NULL,
  PRIMARY KEY (`id_personne`),
  KEY `staff_dates1_fk` (`id_date_embauche`),
  KEY `staff_dates2_fk` (`id_date_naissance`),
  CONSTRAINT `staff_dates1_fk` FOREIGN KEY (`id_date_embauche`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `staff_dates2_fk` FOREIGN KEY (`id_date_naissance`) REFERENCES `dates` (`id_date`),
  CONSTRAINT `staff_personne0_fk` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_disponible`
--

DROP TABLE IF EXISTS `transport_disponible`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport_disponible` (
  `id_transport_dispo` int NOT NULL AUTO_INCREMENT,
  `transport_dispo` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `prix_au_kilometre` decimal(15,3) NOT NULL,
  `prix_forfaitaire` decimal(15,3) NOT NULL,
  PRIMARY KEY (`id_transport_dispo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_disponible`
--

LOCK TABLES `transport_disponible` WRITE;
/*!40000 ALTER TABLE `transport_disponible` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport_disponible` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ville_etapes`
--

DROP TABLE IF EXISTS `ville_etapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ville_etapes` (
  `id_ville_etape` int NOT NULL AUTO_INCREMENT,
  `code_postal` int NOT NULL,
  `ville` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `disponible_catalogue` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_ville_etape`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ville_etapes`
--

LOCK TABLES `ville_etapes` WRITE;
/*!40000 ALTER TABLE `ville_etapes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ville_etapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voyage`
--

DROP TABLE IF EXISTS `voyage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voyage` (
  `id_voyage` int NOT NULL AUTO_INCREMENT,
  `id_voyage_calculer_prix` int NOT NULL,
  PRIMARY KEY (`id_voyage`),
  KEY `voyage_voyage0_fk` (`id_voyage_calculer_prix`),
  CONSTRAINT `voyage_voyage0_fk` FOREIGN KEY (`id_voyage_calculer_prix`) REFERENCES `voyage` (`id_voyage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voyage`
--

LOCK TABLES `voyage` WRITE;
/*!40000 ALTER TABLE `voyage` DISABLE KEYS */;
/*!40000 ALTER TABLE `voyage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-11 17:01:16
