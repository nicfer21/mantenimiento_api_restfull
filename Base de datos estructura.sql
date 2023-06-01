-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mantenimiento
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'MAQUINA O EQUIPO'),(2,'HERRAMIENTA'),(3,'REFACCION'),(4,'INSUMO'),(5,'EPPS');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `idWorker` int(11) NOT NULL,
  `image` varchar(150) NOT NULL,
  `pass` varchar(10) NOT NULL,
  `levelWork` tinyint(4) NOT NULL,
  PRIMARY KEY (`idClient`),
  KEY `worker` (`idWorker`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idWorker`) REFERENCES `worker` (`idWorker`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,4,'mantenimiento.png','1234',1),(2,3,'mantenimiento.png','1234',2),(3,6,'tecnico.png','1234',3),(4,5,'tecnico.png','1234',3),(5,2,'tecnico.png','1234',3);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `idInventory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `costu` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `idCategory` int(11) DEFAULT NULL,
  `idManufacturer` int(11) DEFAULT NULL,
  `idSupplier` int(11) DEFAULT NULL,
  `idTypeelement` int(11) DEFAULT NULL,
  `idUnitelement` int(11) DEFAULT NULL,
  PRIMARY KEY (`idInventory`),
  KEY `idCategory` (`idCategory`),
  KEY `idManufacturer` (`idManufacturer`),
  KEY `idSupplier` (`idSupplier`),
  KEY `idTypeelement` (`idTypeelement`),
  KEY `idUnitelement` (`idUnitelement`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`idCategory`) REFERENCES `category` (`idCategory`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`idManufacturer`) REFERENCES `manufacturer` (`idManufacturer`),
  CONSTRAINT `inventory_ibfk_3` FOREIGN KEY (`idSupplier`) REFERENCES `supplier` (`idSupplier`),
  CONSTRAINT `inventory_ibfk_4` FOREIGN KEY (`idTypeelement`) REFERENCES `typeelement` (`idTypeElement`),
  CONSTRAINT `inventory_ibfk_5` FOREIGN KEY (`idUnitelement`) REFERENCES `unitelement` (`idUnitElement`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'PINZA DE PRECISION PLANA',0.20,2,2,3,2,2,1),(2,'GUANTE DE LATEX TALLA M',0.30,8730,5,2,2,1,1),(3,'ULTRACHROME DS - TINTA CIAN',0.08,60000,4,1,1,1,3),(4,'ULTRACHROME DS - TINTA MAGENTA',0.08,110000,4,1,1,1,3),(5,'ULTRACHROME DS - TINTA AMARILLA',0.08,60000,4,1,1,1,3),(6,'ULTRACHROME DS - TINTA NEGRA',0.09,110000,4,1,1,1,3),(7,'EPSON CHIP PARA CARTUCHO DE TINTA',15.60,49,3,1,1,1,1),(10,'MECANISMO DE CUCHILLA',8.00,39,3,7,4,1,1),(11,'GARFIOS',40.00,20,3,7,4,1,1),(12,'MECANISMO DIFERENCIAL',35.00,19,3,7,4,1,1),(13,'BRAZO DEL PRENSATELA',38.00,19,3,7,4,1,1),(15,'PINZA',0.10,2,2,7,4,2,1),(16,'DESARMADOR',0.10,2,2,7,4,2,1),(17,'LENTES DE SEGURIDAD',0.10,5,5,7,4,2,1),(19,'CEPILLO FLIYEONG DE LIMPIEZA',0.10,5,1,10,7,2,1),(20,'PLUMERO MODELO TT29518 DE LIMPIEZA',0.10,5,2,11,8,2,1),(21,'DESTORNILLADOR PUNTA PLANA',0.05,5,2,14,11,2,1),(22,'TENSOR DE HILO',19.70,40,3,15,4,1,1),(23,'ZAPATO DE SEGURIDAD',1.40,2,5,13,12,2,1),(24,'ACEITE PARA MANTENIMIENTO',0.18,119700,4,6,3,1,3),(27,'AGUJA ESPECIAL',2.90,500,3,6,5,1,1),(28,'AGUJA UNIVERSAL',1.16,998,3,6,3,1,1),(29,'FRANELA',2.50,9497,2,6,3,1,1),(30,'VOLANTE ',96.47,19,3,6,4,1,1),(31,'PRENSATELA',0.30,30,3,5,13,1,1),(32,'MASCARILLA',0.20,9789,5,12,10,1,1),(33,'BOBINA',0.20,28,3,5,13,1,1),(34,'PLANCHUELA',0.23,30,3,5,13,1,1),(36,'CABLE PARA CIRCUITO',4.50,100,3,17,4,1,1),(37,'BANDA',65.00,20,3,6,4,1,1),(38,'GARFIO AEREO',20.00,20,3,16,4,1,1),(39,'SOPORTE',12.00,20,3,6,4,1,1),(40,'POLEA',120.00,20,3,6,4,1,1),(41,'BARRILLA DE EMBRIAGUE',15.00,20,3,6,4,1,1),(42,'GRASA LUBRICANTE',0.03,143880,4,14,11,1,5),(44,'DESTORNILLADOR ESTRELLA',0.06,4,2,14,11,2,1),(45,'GRASA BLANCA',1.20,4000,4,14,11,1,5),(47,'KIT DE LLAVES',0.49,2,2,18,5,2,1),(48,'OVEROL',0.33,3,5,15,5,2,1),(49,'TOALLITAS DE LIMPIEZA',0.20,9788,4,1,1,1,1),(50,'LIMPIADOR DE TINTA',0.05,16850,4,1,1,1,3),(51,'TAZA DE LIMPIEZA',0.02,1,2,1,1,2,1),(52,'BASTONCITO DE LIMPIEZA',1.00,2298,4,1,1,1,1),(53,'HERRAMIENTA DE ENGRASE',0.25,1,2,1,1,2,1),(54,'ALMOHADILLA A',0.75,246,4,1,1,1,1),(55,'ALMOHADILLA B',1.00,246,4,1,1,1,1),(56,'GUIAS LATERALES EPSON',7.50,56,3,1,1,1,1),(57,'DEPOSITO DE TINTA SOBRANTE',98.00,9,3,1,1,1,1),(58,'ALMOHADILLA DE ACLARADO',12.50,40,3,1,1,1,1),(59,'ROLLO DE PAPEL ',110.00,20,3,1,1,1,1),(60,'BANDEJA DE LIMPIEZA',0.25,1,2,3,4,2,1),(61,'CALIBRADOR',0.14,2,2,19,4,2,1),(62,'TENSIOMETRO',3.09,1,2,20,5,2,1),(63,'ALINEADOR',0.35,11,2,21,4,2,1),(64,'MULTIMETRO',0.30,1,2,22,5,2,1),(65,'PULVERIZADOR',0.20,1,2,23,4,2,1),(66,'GOMA SUJETADORA',2.00,120,3,24,5,1,1),(67,'COBERTOR',25.00,60,3,26,5,1,1),(68,'CONECTOR DE FUERZA',40.00,30,3,27,5,1,1),(69,'VASTAGO',13.00,10,1,26,9,1,1),(70,'TIJERA',7.00,10,2,24,9,1,1),(71,'TAPA DE CUBIERTA',35.00,10,1,5,13,1,1);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine`
--

DROP TABLE IF EXISTS `machine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `machine` (
  `idMachine` varchar(25) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `dataSheet` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idMachine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine`
--

LOCK TABLES `machine` WRITE;
/*!40000 ALTER TABLE `machine` DISABLE KEYS */;
INSERT INTO `machine` VALUES ('BCO_01','BROTHER','PR-655','MAQUINA BORDADORA COMPUTARIZADA DE UN CABEZAL','MAQUINA COMPUTARIZADA PARA MALLOR AVANSE Y BUEN AC','BCO_01.JPG','https://docs.google.com/document/d/1-1BiUZI_WbzbC-LevpqkodC4jZ8mmrWr/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true'),('BOR_01','JUKI','ZK-34','MÁQUINA BORDADORA','BORDADORA DE HILOS PARA LOS DISEÑOS','BOR_01.JPG','https://docs.google.com/document/d/1-6xVnH_0f5NEu-xsX7sK_40Srbyh4HZu/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true'),('COS_01','JUKI','N430-2','MAQUINA DE COSER','MAQUINA QUE SIRVE PARA DAR FACILIDAD A LA OPERACIO','COS_01.JPG','https://docs.google.com/document/d/1-Ecdoo8TQCO9R_IUOVTBMyuXdppeD1DJ/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true'),('IMP_01','EPSON','F9470','IMPRESORA DE SUBLIMADOS','IMPRESORA DE SUBLIMACION DE GRAN CALIDAD PARA ESTA','IMP_01.jpg','https://docs.google.com/document/d/1-EgYDYfMVZXwkdZfRG0AzTerSyWRxZaH/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true'),('REC_01','YAMATO','CF2303-156','MAQUINA RECUBRIDORA','RECUBRIDORA PARA DARLE EL TOQUE FINAL A LOS BORDES','REC_01.JPG','https://docs.google.com/document/d/18NEPSnyswVJS9yZ1RLJqI5Xpzq60P75C/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true'),('REM_01','SIRUBA','747K','MAQUINA REMALLADORA','REMALLADORA COSE EL CANTO DE LAS TELAS, SELLÁNDOLO','REM_01.JPG','https://docs.google.com/document/d/1jbSIhShesGHM8IjtR2vF_Vd8giniV4EV/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true');
/*!40000 ALTER TABLE `machine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenanceorder`
--

DROP TABLE IF EXISTS `maintenanceorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenanceorder` (
  `idMaintenanceOrder` int(11) NOT NULL AUTO_INCREMENT,
  `description` longtext DEFAULT NULL,
  `stepValue` tinyint(4) DEFAULT NULL,
  `startOrder` datetime DEFAULT NULL,
  `finishOrder` datetime DEFAULT NULL,
  `idMaintenanceProcedure` int(11) DEFAULT NULL,
  `idWorker` int(11) DEFAULT NULL,
  `idPriority` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMaintenanceOrder`),
  KEY `idMaintenanceProcedure` (`idMaintenanceProcedure`),
  KEY `idWorker` (`idWorker`),
  KEY `idPriority` (`idPriority`),
  CONSTRAINT `maintenanceorder_ibfk_1` FOREIGN KEY (`idMaintenanceProcedure`) REFERENCES `maintenanceprocedure` (`idMaintenanceProcedure`),
  CONSTRAINT `maintenanceorder_ibfk_2` FOREIGN KEY (`idWorker`) REFERENCES `worker` (`idWorker`),
  CONSTRAINT `maintenanceorder_ibfk_3` FOREIGN KEY (`idPriority`) REFERENCES `priority` (`idPriority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenanceorder`
--

LOCK TABLES `maintenanceorder` WRITE;
/*!40000 ALTER TABLE `maintenanceorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenanceorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenanceprocedure`
--

DROP TABLE IF EXISTS `maintenanceprocedure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenanceprocedure` (
  `idMaintenanceProcedure` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `workload` int(11) DEFAULT NULL,
  `roadmaps` varchar(350) DEFAULT NULL,
  `law` varchar(350) DEFAULT NULL,
  `idSubPart` varchar(25) DEFAULT NULL,
  `idStrategy` int(11) DEFAULT NULL,
  `idPlace` int(11) DEFAULT NULL,
  `idWorker` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMaintenanceProcedure`),
  KEY `idStrategy` (`idStrategy`),
  KEY `idWorker` (`idWorker`),
  KEY `idPlace` (`idPlace`),
  KEY `maintenanceprocedure_FK` (`idSubPart`),
  CONSTRAINT `maintenanceprocedure_FK` FOREIGN KEY (`idSubPart`) REFERENCES `subpart` (`idSubPart`),
  CONSTRAINT `maintenanceprocedure_ibfk_2` FOREIGN KEY (`idStrategy`) REFERENCES `strategy` (`idStrategy`),
  CONSTRAINT `maintenanceprocedure_ibfk_3` FOREIGN KEY (`idWorker`) REFERENCES `worker` (`idWorker`),
  CONSTRAINT `maintenanceprocedure_ibfk_4` FOREIGN KEY (`idPlace`) REFERENCES `place` (`idPlace`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenanceprocedure`
--

LOCK TABLES `maintenanceprocedure` WRITE;
/*!40000 ALTER TABLE `maintenanceprocedure` DISABLE KEYS */;
INSERT INTO `maintenanceprocedure` VALUES (8,'REC_01 ALINEADO DEL CONJUNTO TENSOR',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A01',3,4,5),(10,'REC_01 INSPECCION DEL CONJUNTO TENSOR',8,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A01',6,3,5),(13,'IMP_01 LIMPIEZA DE CABEZALES DE IMPRESIóN ',35,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01A01',1,1,6),(14,'IMP_01 LIMPIEZA DE INYECTORES',30,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01A02',2,1,6),(15,'IMP_01 ENGRASAMIENTO DEL VáSTAGO DEL CARRO',45,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01B01',2,1,6),(16,'IMP_01 LIMPIEZA TAPA FRONTAL',20,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01B02',5,1,6),(17,'IMP_01 LIMPIEZA DE PANEL DE CONTROL',20,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01B03',5,1,6),(18,'IMP_01 LIMPIEZA DE PLATINAS',10,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01B04',2,1,6),(19,'IMP_01 REEMPLAZO DE LAS GUíAS LATERALES DE IMPRESIóN',30,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01B05',2,1,6),(20,'IMP_01 CAMBIO DE CHIP DE LOS CARTUCHOS DE TINTA',30,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01C01',2,4,6),(21,'IMP_01 RELLENAR LOS CARTUCHOS DE TINTA',15,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01C02',1,1,6),(22,'IMP_01 CAMBIO DE ALMOHADILLA DE ACLARADO',45,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01C03',2,4,6),(23,'IMP_01 CAMBIO DE DEPóSITO DE TINTA DE DESECHO',10,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01C04',1,1,6),(24,'IMP_01 LIMPIEZA PROTECTOR TERMICO',15,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01C05',2,4,6),(25,'IMP_01 LIMPIEZA DEL SOPORTE MOVIL',15,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01D01',2,1,6),(26,'IMP_01 CAMBIO DEL ROLLO DE PAPEL',15,'https://docs.google.com/spreadsheets/d/1-IzCrOVUKPamUa1SFb5Bh1PAetNaCrf5/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','IMP_01D02',1,1,6),(27,'REC_01 CALIBRADO DE LA PRESION DE LA TELA ',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A02',2,4,5),(28,'REC_01 INSPECCION DEL REGULADOR DE PRESATELA',8,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A02',6,3,5),(29,'REC_01 CABIO DE PRESATELA',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A02',9,4,5),(30,'REC_01 AJUSTADO DE PERNOS DE LA BARRA DE AGUJA',6,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A03',5,3,5),(31,'REC_01 INSPECCION DE LA BARRA DE AGUJA',8,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A03',6,3,5),(33,'REC_01 ALIANEADO DE AGUJA',6,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A04',3,3,5),(34,'REC_01 CAMBIO DE AGUJA',5,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A04',7,3,2),(35,'REC_01 REEMPLAZO DE AGUJA',6,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A04',9,3,5),(37,'REC_01 CALIBRADO DEL VOLANTE ',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A05',3,4,5),(38,'REC_01 REFACCION DEL VOLANTE',12,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A05',1,4,5),(39,'REC_01 CAMBIO DE ZAPATA',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A06',4,4,5),(41,'REC_01 REEMPLAZO DE GARFIO AEREO',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01A06',9,4,5),(42,'REFACCION DE CIRCUITOS DEL TABLERO',12,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01B01',1,4,6),(43,'REC_01 CALIBRADO DE CIRCUITOS',12,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01B01',2,4,2),(45,'REC_01 AJUSTE DE PERNOS DEL SOPORTE DE CABZAL',5,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01B02',5,3,2),(46,'REC_01 ALINEADO DE SOPORTE DE CABEZAL',12,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01B02',2,4,5),(47,'REC_01 REPARADO DE BANDA ',12,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C01',1,4,5),(48,'REC_01 CALIBRADO DE BANDA ',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C01',2,4,5),(53,'REC_01 REEMPLAZO DE BANDA',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C01',9,4,5),(55,'REC_01 CALIBRADO DE LA POLEA DE MOTOR ',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C02',2,4,5),(56,'REC_01 REPARADO DE POLEA DE MOTOR ',12,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C02',1,4,5),(57,'REC_01 CAMBIO DE COBERTOR',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C02',4,4,5),(58,'REC_01 CALIBRADO DE PEDAL',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C03',3,4,5),(60,'REC_01 INSPECCION DEL PEDAL',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C03',6,3,5),(61,'REC_01 REPARADO DE LA VARRILLA DE EMBRIAGUE ',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C04',1,4,5),(62,'REC_01 CAMBIO DE CONECTOR',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C04',4,4,5),(63,'REC_01 INSPECCION DE VARRILLA DE EMBRIAGUE',10,'https://docs.google.com/spreadsheets/d/1Yg5Wsu1dRoq8Pvw47UMt1BWeL_Vf49bM/edit#gid=1654504749','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REC_01C04',6,3,5),(66,'COS_01 LIMPIEZA PALANCA TIRA E HILO',25,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01B02',2,4,5),(68,'COS_01 TENSOR HILO',6,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01B01',2,4,5),(69,'COS_01 CAMBIO DE LA BARRA DE AGUJA',22,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01B03',2,4,6),(71,'BOR_01 LIMPIEZA DE LA BASE DE ACEITE',10,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01A01',2,4,5),(72,'COS_01 AJUSTE DE BARRA PRENSATELA',22,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01B04',2,4,6),(73,'COS_01 CAMBIO DEL PRENSATELA',25,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01B05',2,4,5),(74,'BOR_01 CAMBIO DE CORREA',8,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01B01',2,4,6),(75,'BOR_01 LUBRICACIóN DE POLEA',2,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01B02',2,4,5),(77,'COS_01 MANTENIMIENTO GUIA HILOS',15,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A01',2,4,5),(78,'BOR_01 PERILLA REGULADORA DEL ANCHO DEL ZIG ZAG',6,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01B03',2,4,6),(80,'BOR_01 GRADUADORA DEL ANCHO DEL ZIGZAG',4,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01B04',2,4,6),(81,'COS_01 MANTENIMIENTO DEL REGULADOR LARGO PUNTADA',20,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A02',2,4,5),(82,'COS_01 MANTENIMIENTO DEL FRENO DEVANADOR',19,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A03',2,4,5),(84,'BOR_01 VáSTAGO PARA EL CARRETE DE HILO',3,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01B06',2,4,5),(85,'COS_01 PALANCA DE RETROCESOS',25,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A04',2,4,5),(86,'BOR_01 LUBRICAR EL VOLANTE',3,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01C03',2,4,6),(88,'COS_01 MANTENIMIENTO DEL VOLANTE',15,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A05',2,4,5),(89,'BOR_01 CAMBIO DE TAPA DE CUBIERTA',3,'https://docs.google.com/spreadsheets/d/1-Lapf0-lF7wiyx499i3Rl6SYwMoNhlzT/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','BOR_01C02',2,4,5),(90,'COS_01 PLANCHA DE AGUJA',20,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A06',2,4,5),(91,'COS_01 MANTENIMIENTO CAJA BOBINA',20,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A07',2,4,5),(92,'COS_01 CAMBIO DE BOBINA',20,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01A08',2,4,5),(93,'COS_01 MANTENIMIENTO DEL PORTACONOS',5,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01C01',2,4,5),(94,'COS_01 MANTENIMIENTO EMBRAGUE',18,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01C02',2,4,5),(95,'COS_01 MANTENIEMINTO DE LA CORREA',15,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01C03',2,4,5),(96,'COS_01 MANTENIMIENTO DE POLEA',23,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01C03',2,4,5),(97,'COS_01 MANTENIMIENTO DE LA RODILLERA',24,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01C05',2,4,5),(98,'COS_01 MANTENIMIENTO DEL PEDAL',22,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01C06',2,4,5),(99,'COS_01 INTERRUPTOR',8,'https://docs.google.com/spreadsheets/d/1-HvmYChDf-xiZI4L3oEW-GfTOuYk9ZJU/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','COS_01C07',2,4,5),(100,'BCO_01 MANTENIMIENTO DEL PANEL DE OPERACIONES',22,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A01',2,4,6),(101,'BCO_01 MANTENIMEINTO DE BOTON INCIO Y APAGADO',22,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A02',2,4,6),(102,'BCO_01 MANTENIMEINTO DE LA GUIA DE HILOS SUPERIORES',20,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A06',2,4,6),(103,'BCO_MANTENIMEINTO DE LA GUIA DE HILOS INFERIORES',23,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A07',2,4,6),(105,'BCO_01 CAMBIO DE LAS AGUJAS',8,'https://gestion-mantenimiento-2022.herokuapp.com/accion/guardarProcedimiento.php','a','BCO_01A08',2,4,6),(106,'BCO_01 MANTENIMIENTO DE LAS PORTACARRETAS',15,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A09',2,4,6),(107,'BCO_01 MANTENIMEINTO DE LAS POLEAS',26,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A10',2,4,6),(108,'BCO_01 MANTENIMEINTO DE LA BOBINA Y CAJA BOBINA',25,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A11',2,4,5),(109,'BCO_01 MANTENIMEINTO DEL BASTIDOR Y HOJAS DE BORDADOS',21,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A12',2,4,6),(110,'BCO_01 MANTENIMIENTO DEL SOPORTE DEL BASTIDOR',23,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01A13',2,4,6),(111,'BCO_01 LIMPIEZA DELK TABLERO PRINCIPAL',15,'https://docs.google.com/spreadsheets/d/1-RmcWA9Pv5ysCC0zdNpSsRou-myrBCZv/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','a','BCO_01B01',2,4,6),(112,'REM_01 CAMBIAR EL MECANISMO DE CUCHILLAS ',13,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A01',3,4,5),(113,'REM_01 ALINEADO DEL BRAZO PRéNSATELA',15,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A04',2,4,5),(114,'REM_01 CAMBIAR EL GARFIO',19,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A07',3,4,5),(115,'REM_01 ALINEAR LA POLEA',10,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A02',2,4,5),(116,'REM_01 AJUSTAR LA BARRA DE AGUJA',10,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A05',2,4,5),(117,'REM_01 CALIBRADO DEL REGULADOR DE PUNTADA',20,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A09',2,4,5),(118,'REM_01 CAMBIO DEL MECANISMO DIFERENCIAL ',20,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A06',3,4,5),(119,'REM_01 AJUSTAR EL CONJUNTO DE TENSORES',17,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A08',3,4,5),(120,'REM_01 CAMBIO DE VOLANTE',16,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A03',3,4,5),(121,'REM_01 CALIBRADO DEL TABLERO',19,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01B01',2,4,5),(123,'REM_01 CALIBRADO DEL BOTON DE FUNCIONAMIENTO',19,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01C01',3,4,5),(124,'REM_01 CALIBRADO DEL PEDAL',19,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01C02',3,4,5),(125,'REM_ 01 INSPECCIóN DEL MECANISMO DE CUCHILLA',12,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A01',6,3,5),(126,'REM_01 INSPECCIóN DEL BRAZO PRéNSATELA',10,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A04',6,3,5),(127,'REM_01 INSPECCIóN DEL GARFIO',11,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A07',6,4,5),(128,'REM_01 REEMPLAZO DE LA POLEA',15,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A02',9,3,5),(129,'REM_01 INSPECCIóN DE LA BARRA DE AGUJA',10,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A05',6,3,5),(130,'REM_01 INSPECCIóN DE REGULADOR DE PUNTADAS',10,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A09',6,3,5),(131,'REM_01 REFACCIóN DEL MECANISMO DIFERENCIAL',15,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A06',1,3,5),(132,'REM_01 INSPECCIóN DE CONJUNTO DE TENSORES',16,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01A08',6,3,5),(133,'REM_01 REFACCIóN DEL BOTON DE FUNCIONAMIENTO',22,'https://docs.google.com/spreadsheets/d/1-PMiHYnH5L1cin-g0CoLN4iPST-cEiJ_/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','https://docs.google.com/document/d/1-XLf8wN4pNGPjElJhXs9KbWZBC4laHOA/edit?usp=sharing&ouid=109391035547211356346&rtpof=true&sd=true','REM_01C01',1,3,5);
/*!40000 ALTER TABLE `maintenanceprocedure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancereport`
--

DROP TABLE IF EXISTS `maintenancereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancereport` (
  `idMaintenanceReport` int(11) NOT NULL AUTO_INCREMENT,
  `startReport` datetime DEFAULT NULL,
  `finishReport` datetime DEFAULT NULL,
  `timeCount` int(11) DEFAULT NULL,
  `observation` longtext DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `idMaintenanceOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMaintenanceReport`),
  KEY `idMaintenanceOrder` (`idMaintenanceOrder`),
  CONSTRAINT `maintenancereport_ibfk_1` FOREIGN KEY (`idMaintenanceOrder`) REFERENCES `maintenanceorder` (`idMaintenanceOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancereport`
--

LOCK TABLES `maintenancereport` WRITE;
/*!40000 ALTER TABLE `maintenancereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenancereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancerequest`
--

DROP TABLE IF EXISTS `maintenancerequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancerequest` (
  `idMaintenanceRequest` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `requestDate` datetime NOT NULL DEFAULT current_timestamp(),
  `requestState` int(11) DEFAULT NULL,
  `idWorker` int(11) DEFAULT NULL,
  `idPlace` int(11) DEFAULT NULL,
  `idMachine` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idMaintenanceRequest`),
  KEY `idWorker` (`idWorker`),
  KEY `idPlace` (`idPlace`),
  KEY `maintenancerequest_FK` (`idMachine`),
  CONSTRAINT `maintenancerequest_FK` FOREIGN KEY (`idMachine`) REFERENCES `machine` (`idMachine`),
  CONSTRAINT `maintenancerequest_ibfk_1` FOREIGN KEY (`idWorker`) REFERENCES `worker` (`idWorker`),
  CONSTRAINT `maintenancerequest_ibfk_2` FOREIGN KEY (`idPlace`) REFERENCES `place` (`idPlace`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancerequest`
--

LOCK TABLES `maintenancerequest` WRITE;
/*!40000 ALTER TABLE `maintenancerequest` DISABLE KEYS */;
INSERT INTO `maintenancerequest` VALUES (1,'Titulo 1','testo descripcion','Captura de pantalla 2023-05-14 131340-1684695484197.png','2022-02-01 05:00:01',1,3,2,'BCO_01');
/*!40000 ALTER TABLE `maintenancerequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `idManufacturer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`idManufacturer`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'EPSON'),(2,'ALKHOFAR'),(3,'VETUS'),(4,'YAMATO'),(5,'JUKI'),(6,'SINGER'),(7,'HONEYSEW'),(8,'FAMATEX FW'),(9,'REDLINE'),(10,'FLIYEONG '),(11,'TOOLTRON INC.'),(12,'BOREAL S.A.C'),(13,'WELLCO PERUANA'),(14,'HOME SIERSAC'),(15,'SAIDA TEX'),(16,'KANSAI'),(17,'WGGE'),(18,'URREA'),(19,'MAGTOTO'),(20,'LANDTECK'),(21,'AIKTRYEE'),(22,'UNI-T'),(23,'TRUPER'),(24,'FSTE'),(26,'EMPI'),(27,'DILLASUR');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `part`
--

DROP TABLE IF EXISTS `part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `part` (
  `idPart` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `idMachine` varchar(25) NOT NULL,
  PRIMARY KEY (`idPart`),
  KEY `part_FK` (`idMachine`),
  CONSTRAINT `part_FK` FOREIGN KEY (`idMachine`) REFERENCES `machine` (`idMachine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `part`
--

LOCK TABLES `part` WRITE;
/*!40000 ALTER TABLE `part` DISABLE KEYS */;
INSERT INTO `part` VALUES ('BCO_01A','CUERPO - MC','PARTE PRINCIPAL DE LA MAQUINA  YA QUE CONTIENE TOD','i','BCO_01'),('BCO_01B','TABLERO','PARTE DONDE SE COLOCA LA MAQUINA PARA SU BUEN TRAB','i','BCO_01'),('BOR_01A','BASE DE LA MÁQUINA','PARTE FUNDAMENTAL PARA EL SOSTEN DE BORDADORA','i','BOR_01'),('BOR_01B','CABEZAL DE LA MÁQUINA','PARTE SUPERIOR CON EL MAYOR CONJUNTO DE SUB PARTES','i','BOR_01'),('BOR_01C','BRAZO DE LA MÁQUINA','PARTE QUE SOTIENE A LA BARRA DE AGUJA Y SUS COMPON','i','BOR_01'),('COS_01A','CABEZAL PRINCIPAL','PARTE SUPERIOR DE LA MAQUINA Y PRINCIPAL','i','COS_01'),('COS_01B','BRAZO CABEZAL','AL COSTADO DEL CABEZAL, EL BRAZO ES LA QUE ES MANI','i','COS_01'),('COS_01C','MOTOR','EL QUE DA EL FUNCIONAMIENTO A LA MAQUINA','i','COS_01'),('IMP_01A','CUBIERTA DE MANTENIMIENTO IZQUIERDA','PARTE IZQ DE LA MAQUINA','i','IMP_01'),('IMP_01B','CUERPO','PARTE DE LA MAQUINA DONDE SE EFECTUA LA IMPRESIÓN','i','IMP_01'),('IMP_01C','CUBIERTA DE MANTENIMIENTO DERECHA','PARTE DONDE SE ENCUENTRA LAS TINTAS','i','IMP_01'),('IMP_01D','SOPORTE','BASE DE LA MAQUINA','i','IMP_01'),('REC_01A','CABEZAL','PARTE SUPERIOR CON EL MAYOR CONJUNTO DE SUB PARTES','i','REC_01'),('REC_01B','MUEBLE','SOPORTE Y ENCENDIDO DE LA MAQUINA','i','REC_01'),('REC_01C','MOTOR','PARTE ESCENCIAL DE LA MAQUINA PARA BRINDAR EL MOVI','i','REC_01'),('REM_01A','CABEZAL','PARTE SUPERIOR QUE CONTIENE MAYOR CANTIDAD DE SUBP','i','REM_01'),('REM_01B','MUEBLE','SOPORTE Y ENCENDIDO DE LA MAQUINA','i','REM_01'),('REM_01C','ESTANTE','GGG','i','REM_01');
/*!40000 ALTER TABLE `part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `idPlace` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`idPlace`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'AREA DE ESTAMPADOS'),(2,'AREA DE CORTE Y DISEÑOS'),(3,'AREA DE COSTURAS'),(4,'AREA DE MANTENIMIENTO');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priority`
--

DROP TABLE IF EXISTS `priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priority` (
  `idPriority` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `color` varchar(10) NOT NULL,
  PRIMARY KEY (`idPriority`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priority`
--

LOCK TABLES `priority` WRITE;
/*!40000 ALTER TABLE `priority` DISABLE KEYS */;
INSERT INTO `priority` VALUES (1,'EMERGENCIA','#E74C3C'),(2,'URGENCIA','#F1C40F'),(3,'NORMAL','#008f39'),(4,'PROGRAMADA','#00aae4');
/*!40000 ALTER TABLE `priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesion` (
  `idProfesion` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`idProfesion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES (1,'INGENIERO INDUSTRIAL'),(2,'TECNICO ELECTRO MECANICO'),(3,'TECNICO MECANICO'),(4,'OPERARIO');
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `idPurchase` int(11) NOT NULL AUTO_INCREMENT,
  `purchaseDate` datetime DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `observation` varchar(300) DEFAULT NULL,
  `idInventory` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPurchase`),
  KEY `idInventory` (`idInventory`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`idInventory`) REFERENCES `inventory` (`idInventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quality`
--

DROP TABLE IF EXISTS `quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quality` (
  `idQuality` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `dateTest` date DEFAULT NULL,
  PRIMARY KEY (`idQuality`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quality`
--

LOCK TABLES `quality` WRITE;
/*!40000 ALTER TABLE `quality` DISABLE KEYS */;
INSERT INTO `quality` VALUES (1,'Limpieza',85,'2022-07-01'),(2,'Seguridad',75,'2022-07-01'),(3,'Orden',70,'2022-07-01'),(4,'Puntualidad',80,'2022-07-01'),(5,'Limpieza',88,'2022-08-01'),(6,'Seguridad',70,'2022-08-01'),(7,'Orden',81,'2022-08-01'),(8,'Puntualidad',75,'2022-08-01'),(9,'Limpieza',90,'2022-09-01'),(10,'Seguridad',72,'2022-09-01'),(11,'Orden',83,'2022-09-01'),(12,'Puntualidad',80,'2022-09-01'),(13,'Limpieza',85,'2022-10-01'),(14,'Seguridad',81,'2022-10-01'),(15,'Orden',76,'2022-10-01'),(16,'Puntualidad',85,'2022-10-01'),(17,'Limpieza',80,'2022-11-01'),(18,'Seguridad',85,'2022-11-01'),(19,'Orden',80,'2022-11-01'),(20,'Puntualidad',85,'2022-11-01');
/*!40000 ALTER TABLE `quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirements`
--

DROP TABLE IF EXISTS `requirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirements` (
  `idRequirements` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `cost` decimal(10,3) DEFAULT NULL,
  `idInventory` int(11) DEFAULT NULL,
  `idMaintenanceProcedure` int(11) DEFAULT NULL,
  PRIMARY KEY (`idRequirements`),
  KEY `idInventory` (`idInventory`),
  KEY `idMaintenanceProcedure` (`idMaintenanceProcedure`),
  CONSTRAINT `requirements_ibfk_1` FOREIGN KEY (`idInventory`) REFERENCES `inventory` (`idInventory`),
  CONSTRAINT `requirements_ibfk_2` FOREIGN KEY (`idMaintenanceProcedure`) REFERENCES `maintenanceprocedure` (`idMaintenanceProcedure`)
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirements`
--

LOCK TABLES `requirements` WRITE;
/*!40000 ALTER TABLE `requirements` DISABLE KEYS */;
INSERT INTO `requirements` VALUES (15,1,0.020,15,8),(16,1,0.080,47,8),(17,1,0.020,17,8),(18,1,0.230,23,8),(26,1,0.120,23,10),(27,1,0.010,17,10),(28,1,0.030,48,10),(29,2,0.600,2,10),(30,1,0.040,47,10),(31,1,0.010,15,10),(40,2,0.600,2,13),(41,50,2.500,50,13),(42,2,0.400,49,13),(43,2,2.000,52,13),(44,1,0.010,51,13),(45,1,0.060,17,13),(46,1,0.200,32,13),(47,10,0.300,42,15),(48,1,0.190,53,15),(49,2,1.500,54,15),(50,2,2.000,55,15),(51,1,1.000,52,15),(52,2,0.600,2,15),(53,1,2.500,29,16),(54,100,5.000,50,16),(55,2,0.600,2,16),(56,1,0.200,32,16),(57,1,0.010,51,16),(58,1,0.080,60,16),(59,1,2.500,29,17),(60,1,0.080,60,17),(61,1,0.010,51,17),(62,30,1.500,50,17),(63,1,0.200,32,17),(64,2,0.600,2,17),(65,1,0.000,51,18),(66,1,0.040,60,18),(67,10,0.500,50,18),(68,2,0.400,49,18),(69,2,0.600,2,18),(70,1,0.200,32,18),(71,2,15.000,56,19),(72,2,0.600,2,19),(73,1,0.100,1,20),(74,1,15.600,7,20),(75,2,0.600,2,20),(76,2,0.600,2,21),(77,2,25.000,58,22),(78,2,0.600,2,22),(79,1,0.020,51,22),(80,50,2.500,50,22),(81,2,0.400,49,22),(82,2,0.600,2,23),(83,1,98.000,57,23),(84,2,0.400,49,24),(85,100,5.000,50,24),(86,2,0.600,2,24),(87,1,0.200,32,24),(88,1,0.020,44,24),(89,2,0.600,2,25),(90,1,2.500,29,25),(91,1,110.000,59,26),(92,2,0.600,2,26),(93,1,0.020,17,27),(94,1,0.060,48,27),(95,2,0.600,2,27),(96,1,0.230,23,27),(97,1,0.080,47,27),(98,1,0.020,16,27),(99,1,0.070,47,28),(100,1,0.010,16,28),(101,1,0.190,23,28),(102,1,0.010,17,28),(103,1,0.040,48,28),(104,2,0.600,2,28),(105,1,0.300,31,29),(106,1,0.080,47,29),(107,1,0.020,16,29),(108,1,0.020,17,29),(109,1,0.060,48,29),(110,1,0.230,23,29),(111,2,0.600,2,29),(112,1,0.010,17,30),(113,2,0.600,2,30),(114,1,0.030,48,30),(115,1,0.140,23,30),(116,1,0.050,47,30),(117,1,0.010,16,30),(118,1,0.010,17,31),(119,2,0.600,2,31),(120,1,0.040,48,31),(121,1,0.190,23,31),(122,1,0.070,47,31),(123,1,0.010,16,31),(125,1,0.030,63,33),(126,1,0.010,17,33),(127,1,0.300,2,33),(128,1,0.030,48,33),(129,1,0.140,23,33),(130,1,0.010,16,33),(131,1,2.900,27,34),(132,1,0.010,16,34),(133,1,0.010,17,34),(134,2,0.600,2,34),(135,1,0.030,63,35),(136,1,1.160,28,35),(137,1,0.010,16,35),(138,1,0.010,17,35),(139,2,0.600,2,35),(140,1,0.030,48,35),(141,1,0.140,23,35),(149,10,1.800,24,37),(150,1,0.080,47,37),(151,1,0.020,16,37),(152,1,0.020,17,37),(153,2,0.600,2,37),(154,1,0.060,48,37),(155,1,0.230,23,37),(156,1,96.470,30,38),(157,10,1.800,24,38),(158,1,0.100,47,38),(159,1,0.020,16,38),(160,1,0.280,23,38),(161,1,0.020,17,38),(162,1,0.070,48,38),(163,1,0.300,2,38),(164,1,0.060,63,39),(165,1,0.080,47,39),(166,1,0.020,16,39),(167,1,0.020,17,39),(168,1,0.230,23,39),(169,1,0.060,48,39),(170,2,0.600,2,39),(178,1,20.000,38,41),(179,1,0.080,47,41),(180,1,0.020,16,41),(181,1,0.060,48,41),(182,1,0.230,23,41),(183,2,0.600,2,41),(184,1,0.020,17,41),(185,1,4.500,36,42),(186,1,0.020,16,42),(187,1,0.020,17,42),(188,2,0.600,2,42),(189,1,0.280,23,42),(190,1,0.070,48,42),(191,1,0.060,64,43),(192,1,0.020,16,43),(193,1,0.280,23,43),(194,1,0.070,48,43),(195,2,0.600,2,43),(196,1,4.500,36,43),(202,1,0.040,47,45),(203,1,0.010,16,45),(204,1,0.120,23,45),(205,1,0.010,17,45),(206,2,0.600,2,45),(207,1,0.070,63,46),(208,1,0.100,47,46),(209,1,0.020,16,46),(210,1,0.280,23,46),(211,2,0.600,2,46),(212,1,0.070,48,46),(213,1,0.100,47,47),(214,1,0.020,16,47),(215,1,0.620,62,47),(216,1,19.700,22,47),(217,1,0.280,23,47),(218,2,0.600,2,47),(219,1,0.070,48,47),(220,1,0.510,62,48),(221,1,0.080,47,48),(230,1,65.000,37,53),(231,1,0.080,47,53),(232,1,0.510,62,53),(233,1,0.020,15,53),(234,1,0.230,23,53),(235,2,0.600,2,53),(236,1,0.060,48,53),(237,1,0.020,17,53),(246,10,1.800,24,55),(247,1,0.510,62,55),(248,1,0.230,23,55),(249,2,0.600,2,55),(250,1,0.020,17,55),(251,1,0.060,48,55),(252,1,0.080,47,55),(253,1,0.020,16,55),(254,1,120.000,40,56),(255,10,1.800,24,56),(256,1,0.100,47,56),(257,1,0.020,16,56),(258,1,0.620,62,56),(259,1,0.280,23,56),(260,1,0.070,48,56),(261,2,0.600,2,56),(262,1,0.020,17,56),(263,1,25.000,67,57),(264,10,0.300,42,57),(265,1,0.020,16,57),(266,1,0.080,47,57),(267,1,0.230,23,57),(268,1,0.060,48,57),(269,1,0.020,17,57),(270,2,0.600,2,57),(271,1,0.020,61,58),(272,1,0.080,47,58),(273,1,0.020,16,58),(274,1,0.230,23,58),(275,1,0.060,48,58),(276,2,0.600,2,58),(283,1,0.020,61,60),(284,1,0.080,47,60),(285,1,0.020,16,60),(286,1,0.060,48,60),(287,1,0.230,23,60),(288,1,0.300,2,60),(289,1,15.000,41,61),(290,1,0.080,47,61),(291,1,0.020,16,61),(292,1,0.230,23,61),(293,1,0.060,48,61),(294,2,0.600,2,61),(295,1,40.000,68,62),(296,1,0.080,47,62),(297,1,0.020,16,62),(298,10,1.800,24,62),(299,1,0.230,23,62),(300,1,0.060,48,62),(301,2,0.600,2,62),(302,1,0.080,47,63),(303,1,0.020,16,63),(304,2,0.600,2,63),(305,1,0.060,48,63),(306,1,0.230,23,63),(309,1,0.040,16,66),(310,1,2.500,29,66),(316,1,0.020,1,68),(317,1,2.900,27,68),(318,1,0.010,21,68),(319,1,2.500,29,68),(320,2,0.600,2,68),(321,1,19.700,22,68),(322,1,0.010,17,68),(323,1,0.020,21,69),(324,1,2.500,29,69),(325,2,0.600,2,69),(329,80,14.400,24,71),(330,1,0.020,17,71),(331,2,0.600,2,71),(332,1,0.200,32,71),(333,1,2.500,29,71),(334,1,0.010,21,71),(335,2,0.600,2,72),(336,1,0.020,21,72),(337,70,12.600,24,72),(338,1,0.040,17,72),(339,1,0.300,31,72),(340,2,0.600,2,73),(341,1,0.020,21,73),(342,1,0.300,31,73),(343,1,2.500,29,73),(344,1,0.200,32,73),(345,1,0.040,19,73),(346,1,0.040,17,73),(347,1,0.010,16,74),(348,1,8.000,10,74),(349,1,0.030,1,74),(350,1,0.010,17,74),(351,1,0.300,2,75),(352,1,0.000,44,75),(355,2,0.600,2,77),(356,80,14.400,24,77),(357,1,0.200,32,77),(358,1,0.020,44,77),(359,1,0.010,21,77),(360,1,0.030,17,77),(361,15,0.450,42,78),(362,1,0.010,44,78),(363,1,0.010,15,78),(364,1,0.010,17,78),(369,1,0.010,1,80),(370,1,0.020,21,81),(371,1,0.200,32,81),(372,80,14.400,24,81),(373,1,1.160,28,81),(374,2,0.600,2,81),(375,1,0.030,15,82),(376,50,9.000,24,82),(377,50,1.500,42,82),(378,2,0.600,2,82),(379,1,0.030,17,82),(380,1,0.200,32,82),(381,1,0.030,16,82),(389,1,13.000,69,84),(390,1,7.000,70,84),(391,5,0.150,42,84),(392,1,19.700,22,84),(393,2,0.600,2,85),(394,1,0.080,1,85),(395,1,0.020,21,85),(396,1,0.200,32,85),(397,1,0.040,17,85),(398,60,10.800,24,85),(399,1,2.500,29,85),(400,1,96.470,30,86),(401,1,0.300,2,86),(402,1,0.000,21,86),(403,1,0.010,20,86),(404,10,1.800,24,86),(405,1,0.010,53,86),(413,2,0.600,2,88),(414,1,0.200,32,88),(415,1,0.030,17,88),(416,1,0.010,21,88),(417,50,9.000,24,88),(418,50,1.500,42,88),(419,1,2.500,29,88),(420,1,96.470,30,88),(421,1,35.000,71,89),(422,1,0.020,21,90),(423,1,2.900,27,90),(424,1,0.200,32,90),(425,2,0.600,2,90),(426,70,12.600,24,90),(427,1,2.500,29,90),(428,1,0.030,17,90),(429,1,0.030,20,90),(430,1,0.020,21,91),(431,1,2.500,29,91),(432,1,0.030,17,91),(433,1,0.200,32,91),(434,2,0.600,2,91),(435,1,0.200,33,92),(436,1,2.500,29,92),(437,1,0.200,32,92),(438,1,0.030,17,92),(439,1,1.160,28,92),(440,2,0.600,2,92),(441,1,0.030,19,92),(442,60,10.800,24,92),(443,1,0.020,21,92),(444,2,0.600,2,93),(445,1,2.500,29,93),(446,1,0.010,20,93),(447,1,0.200,32,93),(448,2,0.600,2,93),(449,1,0.010,17,93),(450,1,0.030,17,94),(451,2,0.600,2,94),(452,70,12.600,24,94),(453,1,2.500,29,94),(454,1,0.200,32,94),(455,50,1.500,42,94),(456,2,0.600,2,95),(457,1,0.030,17,95),(458,1,2.500,29,95),(459,50,1.500,42,95),(460,1,0.200,32,95),(461,70,12.600,24,95),(462,60,1.800,42,96),(463,60,72.000,45,96),(464,1,2.500,29,96),(465,1,120.000,40,96),(466,2,0.600,2,96),(467,1,0.040,17,96),(468,1,0.080,1,96),(469,1,2.900,27,96),(470,100,18.000,24,96),(471,80,14.400,24,97),(472,1,2.500,29,97),(473,1,0.100,53,97),(474,2,0.600,2,97),(475,1,0.040,17,97),(476,50,1.500,42,97),(477,50,60.000,45,97),(478,1,0.040,17,98),(479,2,0.600,2,98),(480,1,0.200,32,98),(481,90,16.200,24,98),(482,60,1.800,42,98),(483,1,0.040,19,98),(484,1,2.500,29,98),(485,2,0.600,2,99),(486,1,2.500,29,99),(487,90,16.200,24,99),(488,1,2.500,29,100),(489,2,0.600,2,100),(490,1,0.040,20,100),(491,2,0.600,2,101),(492,1,2.500,29,101),(493,1,0.040,16,101),(494,1,0.040,19,101),(495,10,1.800,24,101),(496,1,2.500,29,102),(497,1,0.030,19,102),(498,2,0.600,2,102),(499,1,1.030,62,102),(500,1,0.200,32,102),(501,1,2.500,29,103),(503,12,34.800,27,105),(504,1,2.500,29,105),(505,1,0.010,19,105),(506,1,2.500,29,105),(507,2,0.600,2,105),(508,1,2.500,29,106),(509,2,0.600,2,106),(510,1,2.500,29,107),(511,1,0.200,32,107),(512,2,0.600,2,107),(513,1,1.340,62,107),(514,30,5.400,24,107),(515,1,0.040,19,107),(516,1,0.040,20,107),(517,1,0.200,33,108),(518,1,2.500,29,108),(519,1,0.040,19,108),(520,40,7.200,24,108),(521,30,0.900,42,108),(522,1,0.040,20,108),(523,2,0.600,2,108),(524,1,0.040,17,108),(525,1,0.040,16,108),(526,1,2.500,29,109),(527,30,5.400,24,109),(528,1,0.030,42,109),(529,20,1.000,50,109),(530,1,0.010,51,109),(531,1,1.160,28,109),(532,2,0.600,2,109),(533,1,0.030,17,109),(534,1,0.030,20,109),(535,1,2.500,29,110),(536,1,12.000,39,110),(537,1,0.010,51,110),(538,2,0.400,49,110),(539,1,0.200,32,110),(540,2,0.600,2,110),(541,1,0.040,16,110),(542,1,0.080,1,110),(543,1,0.040,17,110),(544,1,2.500,29,111),(545,1,0.200,49,111),(546,1,0.010,51,111),(547,1,1.000,52,111),(548,1,0.030,19,111),(549,50,9.000,24,111),(550,2,0.600,2,111),(551,1,0.030,16,111),(552,1,1.160,28,111),(553,1,0.200,32,111),(554,1,0.120,47,111),(555,1,0.060,53,111),(556,1,8.000,10,112),(557,1,0.030,16,112),(558,1,0.100,48,112),(559,1,0.420,23,112),(560,1,0.300,2,112),(561,1,0.030,17,112),(562,1,38.000,13,113),(563,1,0.120,47,113),(564,1,0.030,15,113),(565,1,0.080,48,113),(566,1,0.350,23,113),(567,1,0.300,2,113),(568,1,0.030,17,113),(569,1,40.000,11,114),(570,1,0.110,63,114),(571,1,0.160,47,114),(572,1,0.030,16,114),(573,1,0.100,48,114),(574,1,0.440,23,114),(575,1,0.030,17,114),(576,1,0.300,2,114),(577,1,120.000,40,115),(578,1,0.030,65,115),(579,1,0.080,47,115),(580,1,0.060,48,115),(581,1,0.230,23,115),(582,1,0.300,2,115),(583,1,0.020,17,115),(584,1,0.120,47,116),(585,1,0.030,15,116),(586,1,0.080,48,116),(587,1,0.350,23,116),(588,1,0.030,17,116),(589,1,0.300,2,116),(590,1,0.050,61,117),(591,1,0.110,48,117),(592,1,0.470,23,117),(593,1,0.300,2,117),(594,1,0.030,17,117),(595,1,0.160,47,117),(596,1,0.070,1,117),(597,1,35.000,12,118),(598,1,0.050,61,118),(599,1,0.160,47,118),(600,1,0.030,15,118),(601,1,0.110,48,118),(602,1,0.470,23,118),(603,1,0.030,17,118),(604,1,0.300,2,118),(605,1,0.040,61,119),(606,1,0.140,47,119),(607,1,0.030,15,119),(608,1,0.090,48,119),(609,1,0.400,23,119),(610,1,0.030,17,119),(611,1,0.300,2,119),(612,1,96.470,30,120),(613,1,0.130,47,120),(614,1,0.030,16,120),(615,1,0.090,48,120),(616,1,0.370,23,120),(617,1,0.030,17,120),(618,1,0.300,2,120),(619,1,0.030,16,121),(620,1,0.110,63,121),(621,1,0.100,48,121),(622,1,0.440,23,121),(623,1,0.030,17,121),(624,1,0.300,2,121),(625,1,4.500,36,121),(633,1,0.090,64,123),(634,1,0.160,47,123),(635,1,0.030,15,123),(636,1,0.100,48,123),(637,1,0.440,23,123),(638,1,0.030,17,123),(639,1,0.300,2,123),(640,1,0.040,61,124),(641,1,0.160,47,124),(642,1,0.030,16,124),(643,1,0.100,48,124),(644,1,0.440,23,124),(645,1,0.030,17,124),(646,1,0.300,2,124),(647,100,3.000,42,124),(648,1,0.020,16,125),(649,1,0.070,48,125),(650,1,0.280,23,125),(651,1,0.020,17,125),(652,1,0.300,2,125),(653,1,0.080,47,126),(654,1,0.020,15,126),(655,1,0.060,48,126),(656,1,0.230,23,126),(657,1,0.020,17,126),(658,1,0.300,2,126),(659,1,0.060,63,127),(660,1,0.090,47,127),(661,1,0.020,16,127),(662,1,0.060,48,127),(663,1,0.260,23,127),(664,1,0.020,17,127),(665,1,0.300,2,127),(666,1,0.050,65,128),(667,1,0.120,47,128),(668,1,0.080,48,128),(669,1,0.350,23,128),(670,1,0.030,17,128),(671,1,0.300,2,128),(672,1,0.080,47,129),(673,1,0.020,15,129),(674,1,0.060,48,129),(675,1,0.230,23,129),(676,1,0.300,2,129),(677,1,0.020,17,129),(678,1,0.020,61,130),(679,1,0.080,47,130),(680,1,0.020,15,130),(681,1,0.060,48,130),(682,1,0.230,23,130),(683,1,0.300,2,130),(684,1,0.020,17,130),(685,1,35.000,12,131),(686,1,0.040,61,131),(687,1,0.120,47,131),(688,1,0.050,1,131),(689,1,0.080,48,131),(690,1,0.350,23,131),(691,1,0.300,2,131),(692,1,0.030,17,131),(693,1,0.040,61,132),(694,1,0.130,47,132),(695,1,0.030,15,132),(696,1,0.090,48,132),(697,1,0.370,23,132),(698,1,0.030,17,132),(699,1,0.300,2,132),(700,1,0.110,64,133),(701,1,0.180,47,133),(702,1,0.040,15,133),(703,1,0.120,48,133),(704,1,0.510,23,133),(705,1,0.300,2,133),(706,1,0.040,17,133);
/*!40000 ALTER TABLE `requirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessionclient`
--

DROP TABLE IF EXISTS `sessionclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessionclient` (
  `idSessionClient` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `datesession` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idSessionClient`),
  KEY `client` (`idClient`),
  CONSTRAINT `sessionclient_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessionclient`
--

LOCK TABLES `sessionclient` WRITE;
/*!40000 ALTER TABLE `sessionclient` DISABLE KEYS */;
INSERT INTO `sessionclient` VALUES (2,1,'2023-05-01 05:00:02'),(3,1,'2023-05-01 06:01:02'),(4,3,'2023-05-01 16:11:11'),(5,3,'0000-00-00 00:00:00'),(7,2,'2011-11-11 16:11:11'),(8,1,'2099-09-09 08:03:03');
/*!40000 ALTER TABLE `sessionclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `strategy`
--

DROP TABLE IF EXISTS `strategy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `strategy` (
  `idStrategy` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`idStrategy`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `strategy`
--

LOCK TABLES `strategy` WRITE;
/*!40000 ALTER TABLE `strategy` DISABLE KEYS */;
INSERT INTO `strategy` VALUES (1,'Mantenimiento correctivo'),(2,'Mantenimiento preventivo con base en el tiempo'),(3,'Mantenimiento preventivo con base en el uso'),(4,'Mantenimiento preventivo con base en las condiciones o mantenimiento predictivo'),(5,'Mantenimiento de oportunidad'),(6,'Detección de fallas'),(7,'Modificación del diseño'),(8,'Reparación General'),(9,'Reemplazo');
/*!40000 ALTER TABLE `strategy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subpart`
--

DROP TABLE IF EXISTS `subpart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subpart` (
  `idSubPart` varchar(25) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `idPart` varchar(25) NOT NULL,
  PRIMARY KEY (`idSubPart`),
  KEY `subpart_FK` (`idPart`),
  CONSTRAINT `subpart_FK` FOREIGN KEY (`idPart`) REFERENCES `part` (`idPart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subpart`
--

LOCK TABLES `subpart` WRITE;
/*!40000 ALTER TABLE `subpart` DISABLE KEYS */;
INSERT INTO `subpart` VALUES ('BCO_01A01','PANEL DE OPERACIONES','SIRVE PARA PODER REALIZAR LAS OPERACIONES MEDIANTE','i','BCO_01A'),('BCO_01A02','BOTON INICIO Y APAGADO ','SIRVE  PARA  PRENDER  Y APAGAR LA MAQUINA','i','BCO_01A'),('BCO_01A03','BOTON DE CORTE DE HILO ','SIRVE PARA CORTAR EL HILO  ENEBRADO ','i','BCO_01A'),('BCO_01A04','BOTON NEBRADO AUTOMATICO ','SIRVE PARA QUE AUTOMATICAMENTE SE ENEMBRE EL HILO ','i','BCO_01A'),('BCO_01A05','BOTON DE TENSIONES DE HILO','SIRVE PARA VER LA  POSISCION Y VER EL GIRO DE HILO','i','BCO_01A'),('BCO_01A06','GUIAS DE  HILOS SUPERIORES ','SIRVE PARA POEDER VER  EL CORRECTO ABASTECIMIENTO ','i','BCO_01A'),('BCO_01A07','GUIAS DE HILOS  INFERIORES ','SIRVE PARA VER EL HILO INFERIO  CORRECTAMENTE  ','i','BCO_01A'),('BCO_01A08','AGUJAS ','SON LAS PIESAS MAS NIMPORTANTES PARA SU USO DE  CO','i','BCO_01A'),('BCO_01A09','PORTA CARRETES','ES DONDE SE PONE LAS CARRETAS DE HILOS ','i','BCO_01A'),('BCO_01A10','POLEA','LA  AMNIJA PARA GRADUAR LA POSICION  DE LA MAQUINA','i','BCO_01A'),('BCO_01A11','TAPA DE BOBINA Y CAJA DE BOBINAS ','ES DONDE SE PONE LAS  BOBILLAS ','i','BCO_01A'),('BCO_01A12','BASTIDOS Y HOJA DE BORDADOS ','ES LLA PIESA DONDE  SE PONE LA PRENDA PARA QUE SEA','i','BCO_01A'),('BCO_01A13','SOPORTE Y BASTIDOSR A Y B ','ES UNA PIESA DONDE SE  COLOCA  LOS BASTIDORES ANTE','i','BCO_01A'),('BCO_01B01','TABLERO ','ES DONDE SE PONE LA QUINA ','i','BCO_01B'),('BOR_01A01','BASE DE ACEITE','LUBRICANTE PARA LOS TENSORES','i','BOR_01A'),('BOR_01B01','CORREA','CORREA DE TRANSMISION DE MOVIMIENTO','i','BOR_01B'),('BOR_01B02','POLEA','POLEA DE TRASMISION DE MOVIMIENTO','i','BOR_01B'),('BOR_01B03','PERILLA REGULADORA DEL ANCHO DEL ZIG ZAG','REGULADOR DE COSIDO','i','BOR_01B'),('BOR_01B04','PALANCA REGULADORA DEL ANCHO DEL ZIG ZAG','REGULADOR DE COSIDO','i','BOR_01B'),('BOR_01B05','GRADUADORA DEL ANCHO DEL ZIGZAG','REGULADOR DE COSIDO','i','BOR_01B'),('BOR_01B06','VASTAGO PARA EL CARRETE DE HILO','TUBO SOSTENEDOR DE HILO','i','BOR_01B'),('BOR_01B07','VOLANTE','CONTROL MANUAL DE LA MÁQUINA ','i','BOR_01B'),('BOR_01C01','BOBINADORA','ORDENADOR DE HILO','i','BOR_01C'),('BOR_01C02','TAPA DE CUBIERTA','TAPA DE CUBIERTA','i','BOR_01C'),('BOR_01C03','VOLANTE','CONTROL MANUAL DE LA MÁQUINA ','i','BOR_01C'),('COS_01A01','GUIA HILOS','ESTO NOS SIIVE PARA PERIMITIR EL PASO DEL HILO A L','i','COS_01A'),('COS_01A02','REGULADOR DE LARGO PUNTADA','PARA REGULAR LA PUNTADA QUE SE HARA EN LA OPERACIO','i','COS_01A'),('COS_01A03','FRENO DEVANADOR','PERMITE CARGAR LA CANILLA DE MANERA RAPIDA','i','COS_01A'),('COS_01A04','PALANCA DE RETROCESO','ES LA QUE HACE EL REMATE AL INICIAR LA PRENDA Y TE','i','COS_01A'),('COS_01A05','VOLANTE','ES EL QUE SE ACCIONA MANUALMENTE PARA DARLE MOVIMI','i','COS_01A'),('COS_01A06','PLANCHA DE AGUJA','SIRVE PARA DARLE SOPORTE A LA TELA','i','COS_01A'),('COS_01A07','CAJA BOBINA','DONDE SE ALMACENA EL CARRETEL','i','COS_01A'),('COS_01A08','BOBINA','ARTEFACTO PARA EL FUNCIONAMIENTO DE LA MAQUINA','i','COS_01A'),('COS_01B01','TENSOR DE HILO','AYUDA A REGULAR LA TENSION DEL HILO','i','COS_01B'),('COS_01B02','PALANCA TIRA HILO','SIRVE PARA TENSIONAR EL HILO QUE VA HACIA LA AGUJA','i','COS_01B'),('COS_01B03','BARRA DE AGUJA','ES LA QUE SOSTIENE LA AGUJA POR MEDIO DE UN TORNIL','i','COS_01B'),('COS_01B04','BARRA PRENSATELA','ES DONDE SE COLOCA EL PIE PRENSATELA','i','COS_01B'),('COS_01B05','PIE PRENSATELA','PERMITE SOSTENER LA TELA EN EL MOMENTO DE COSER','i','COS_01B'),('COS_01C01','PORTACONOS','DONDE SE COLOCAN LOS CONOS','i','COS_01C'),('COS_01C02','EMBRAGUE','CUANDO SE ACCIONA PONE LA MAQUINA EN MARCHA','i','COS_01C'),('COS_01C03','CORREA','TRANSMITE EL MOVIMIENTO DELMOTOR A LA MAQUINA','i','COS_01C'),('COS_01C04','POLEA','PARTE DEL MOTOR QUE GENERA MOVIMIENTO A LA MAQUINA','i','COS_01C'),('COS_01C05','RODILLERA','SIRVE PARA ACCIONAR EL PIE PRENSATELA SUBIENDOLO Y','i','COS_01C'),('COS_01C06','PEDAL','PARTE INFERIOR DE LA MAQUINA QUE AYUDA A CONTROLAR','i','COS_01C'),('COS_01C07','INTERRUPTOR','SIRVE PARA PRENDER O APAGAR LA MAQUINA.','i','COS_01C'),('IMP_01A01','CABEZAL DE IMPRESIÓN','CABEZAL DE LA IMPRESIÓN','i','IMP_01A'),('IMP_01A02','INYECTORES','INYECCIONA LA TINTA','i','IMP_01A'),('IMP_01B01','VASTAGO DEL CARRO','GUIAS PARA EL CABEZAL DE IMPRESIÓN','i','IMP_01B'),('IMP_01B02','TAPA FRONTAL','CUBIERTA MOVIBLE','i','IMP_01B'),('IMP_01B03','PANEL DE CONTROL','PANEL ELECTRONICO DE CONTROL','i','IMP_01B'),('IMP_01B04','PLATINAS','PARTE DEBAJO DEL CABEZAL','i','IMP_01B'),('IMP_01B05','GUIAS LATERALES DEL PAPEL','AYUDA AL PAPEL A ESTAR ESTABLE','i','IMP_01B'),('IMP_01C01','CARTUCHO DE TINTA','CHIP QUE SE ENCUENTRA UBICADO EN LOS CARTUCHOS DE ','i','IMP_01C'),('IMP_01C02','TANQUE DE TINTA','LOS CARTUCHOS DE TINTA DE COLORES MAGENTA, CYAN, Y','i','IMP_01C'),('IMP_01C03','ALMOHADILLA DE ACLARADO','ALMOHADILLA PARA CONTROLAR EL FLUJO DE TINTA','i','IMP_01C'),('IMP_01C04','DEPOSITO DE TINTA DE DESECHO','DEPOSITO DONDE SE DESECHA LA TINTA SOBRANTE','i','IMP_01C'),('IMP_01C05','PROTECTOR TERMICO','PROTEGE EL TANQUE DE TINTA','i','IMP_01C'),('IMP_01D01','SOPORTE MOVIL','SOPORTE DE LA IMPRESORA','i','IMP_01D'),('IMP_01D02','ROLLO DE PAPEL','PAPEL SUBLIMABLE','i','IMP_01D'),('REC_01A01','CONJUNTO TENSOR','PARTE PARA LA CORRECTA TENSIÓN DEL HILO','i','REC_01A'),('REC_01A02','REGULADOR DE PRÉNSATELA','PARTE PARA AVANZAR LA TELA','i','REC_01A'),('REC_01A03','BARRA DE AGUJA','PARTE QUE SUJETA LA AGUJA','i','REC_01A'),('REC_01A04','AGUJA','PARTE PARA SUJETAR LA AGUJA','i','REC_01A'),('REC_01A05','VOLANTE','PARTE PARA EL CONTROL MANUAL DE LA RECUBRIDORA','i','REC_01A'),('REC_01A06','GARFIO AÉREO','PARTE QUE SUJETA Y CORRIGE LA TELA','i','REC_01A'),('REC_01B01','TABLERO','PARTE DE LOS INTERRUPTORES','i','REC_01B'),('REC_01B02','SOPORTE DE CABEZAL','SOPORTE DEL CABEZAL','i','REC_01B'),('REC_01C01','BANDA','BANDA INTEGRADA AL MOTOR','i','REC_01C'),('REC_01C02','POLEA DE MOTOR','POLEA DEL MOTOR','i','REC_01C'),('REC_01C03','PEDAL','PARTE PARA CONTROLAR LA MÁQUINA','i','REC_01C'),('REC_01C04','VARRILLLA DE EMBRAGUE','PARTE PARA DETENER LA MÁQUINA','i','REC_01C'),('REM_01A01','MECANISCO DE CUCHILLAS','FACILITA EL CORTE DEL TEJIDO','i','REM_01A'),('REM_01A02','POLEA','ES UNA PARTE DEL MOTOR QUE GENERA MOVIMIENTO A LA ','i','REM_01A'),('REM_01A03','VOLANTE','MECANISMO QUE HACE FUNCIONAR DE FORMA SINCRONIZADA','i','REM_01A'),('REM_01A04','BRAZO DEL PRENSATELA','IMPLIFICAR Y AHORRAR TIEMPO EN LAS LABORES DE COST','i','REM_01A'),('REM_01A05','BARRA DE AGUJA','SIRVE PARA TRANSPORTAR LA AGUJA DE ARRIBA HACIA AB','i','REM_01A'),('REM_01A06','MECANISMO DIFERENCIAL','DETERMINARÁ LOS TEJIDOS DE COSTURA ONDEADAS, COSTU','i','REM_01A'),('REM_01A07','GARFIOS','TEJER LOS HILOS PARA LA FORMACIÓN DE LAS PUNTADAS','i','REM_01A'),('REM_01A08','CONJUNTO DE TENSORES','AJUSTAR Ó DISMINUIR EL LIBRE DESPLAZAMIENTO DEL HI','i','REM_01A'),('REM_01A09','REGULADOR DE PUNTADAS',' CAMBIO DE PUNTADAS DEL  MINIMO Y MÁXIMO DEPUNTADA','i','REM_01A'),('REM_01B01','TABLERO','ESTRUCTURA QUE SOSTIENE','i','REM_01B'),('REM_01C01','BOTON DE FUNCIONAMIENTO','SIRVE PARA PRENDER O APAGAR LA MAQUINA.','i','REM_01B'),('REM_01C02','PEDAL','PARTE INFERIOR DE LA MAQUINA QUE AYUDA A CONTROLAR','i','REM_01C');
/*!40000 ALTER TABLE `subpart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`idSupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'EPSON PERU'),(2,'M&M IMPORTS'),(3,'SINGER PERU'),(4,'J&S'),(5,'M&G'),(6,'YAMATO'),(7,'FLIYEONG PERU'),(8,'TOOLTRON INC. AMERICAN'),(9,'AKTOO'),(10,'BOREAL'),(11,'SIERSAC'),(12,'VELSUR'),(13,'JUKI PÈRU');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeelement`
--

DROP TABLE IF EXISTS `typeelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typeelement` (
  `idTypeElement` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`idTypeElement`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeelement`
--

LOCK TABLES `typeelement` WRITE;
/*!40000 ALTER TABLE `typeelement` DISABLE KEYS */;
INSERT INTO `typeelement` VALUES (1,'CONSUMIBLE'),(2,'USO X HORA');
/*!40000 ALTER TABLE `typeelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unitelement`
--

DROP TABLE IF EXISTS `unitelement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unitelement` (
  `idUnitElement` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`idUnitElement`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unitelement`
--

LOCK TABLES `unitelement` WRITE;
/*!40000 ALTER TABLE `unitelement` DISABLE KEYS */;
INSERT INTO `unitelement` VALUES (1,'pieza'),(2,'litro'),(3,'ml'),(4,'kg'),(5,'gramo'),(8,'metro'),(9,'cm');
/*!40000 ALTER TABLE `unitelement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usedinventory`
--

DROP TABLE IF EXISTS `usedinventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usedinventory` (
  `idUsedInventory` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `cost` decimal(10,3) DEFAULT NULL,
  `idInventory` int(11) DEFAULT NULL,
  `idMaintenanceReport` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsedInventory`),
  KEY `idInventory` (`idInventory`),
  KEY `usedinventory_FK` (`idMaintenanceReport`),
  CONSTRAINT `usedinventory_FK` FOREIGN KEY (`idMaintenanceReport`) REFERENCES `maintenancereport` (`idMaintenanceReport`),
  CONSTRAINT `usedinventory_ibfk_1` FOREIGN KEY (`idInventory`) REFERENCES `inventory` (`idInventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usedinventory`
--

LOCK TABLES `usedinventory` WRITE;
/*!40000 ALTER TABLE `usedinventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `usedinventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_searchworkerclient`
--

DROP TABLE IF EXISTS `view_searchworkerclient`;
/*!50001 DROP VIEW IF EXISTS `view_searchworkerclient`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_searchworkerclient` AS SELECT 
 1 AS `id`,
 1 AS `dni`,
 1 AS `largename`,
 1 AS `name`,
 1 AS `image`,
 1 AS `pass`,
 1 AS `levelWork`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `idWorker` int(11) NOT NULL AUTO_INCREMENT,
  `dni` varchar(8) NOT NULL,
  `lastname` varchar(120) DEFAULT NULL,
  `firstname` varchar(120) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `idProfesion` int(11) NOT NULL,
  `idWorkType` int(11) NOT NULL,
  PRIMARY KEY (`idWorker`),
  UNIQUE KEY `dni` (`dni`),
  KEY `profesion` (`idProfesion`),
  KEY `worktype` (`idWorkType`),
  CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`idProfesion`) REFERENCES `profesion` (`idProfesion`),
  CONSTRAINT `worker_ibfk_2` FOREIGN KEY (`idWorkType`) REFERENCES `worktype` (`idWorkType`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (2,'00000000','OPERARIO','INDUSTRIAL',25,1,4,2),(3,'11223344','JEFE','MANTENIMIENTO',2750,1,1,1),(4,'12345678','ADMINISTRADOR','GENERAL',0,1,1,1),(5,'55555555','DEPP QUISPE ','JHONNY',42.5,1,3,2),(6,'99999999','CARRY MESAS','JIM',55,1,2,2);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worktype`
--

DROP TABLE IF EXISTS `worktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worktype` (
  `idWorkType` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idWorkType`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worktype`
--

LOCK TABLES `worktype` WRITE;
/*!40000 ALTER TABLE `worktype` DISABLE KEYS */;
INSERT INTO `worktype` VALUES (1,'PAGO MENSUAL'),(2,'PAGO PARCIAL'),(3,'EXTERNO');
/*!40000 ALTER TABLE `worktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mantenimiento'
--

--
-- Dumping routines for database 'mantenimiento'
--

--
-- Final view structure for view `view_searchworkerclient`
--

/*!50001 DROP VIEW IF EXISTS `view_searchworkerclient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_searchworkerclient` AS select `w`.`idWorker` AS `id`,`w`.`dni` AS `dni`,concat(`w`.`lastname`,', ',`w`.`firstname`) AS `largename`,`p`.`name` AS `name`,`c`.`image` AS `image`,`c`.`pass` AS `pass`,`c`.`levelWork` AS `levelWork` from (((`worker` `w` join `client` `c` on(`w`.`idWorker` = `c`.`idWorker`)) join `worktype` `w2` on(`w`.`idWorkType` = `w2`.`idWorkType`)) join `profesion` `p` on(`w`.`idProfesion` = `p`.`idProfesion`)) */;
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

-- Dump completed on 2023-05-29 21:11:49
