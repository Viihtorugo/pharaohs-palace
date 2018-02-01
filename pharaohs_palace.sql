-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: pharaohs_palace
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.29-MariaDB

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

DROP DATABASE IF EXISTS `pharaohs_palace`;

CREATE DATABASE IF NOT EXISTS `pharaohs_palace`;
USE `pharaohs_palace`;

--
-- Table structure for table `t_funcionario`
--

DROP TABLE IF EXISTS `t_funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_funcionario` (
  `COD_FUNC` tinyint(4) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `LOGIN` varchar(30) DEFAULT NULL,
  `SENHA` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`COD_FUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_funcionario`
--

LOCK TABLES `t_funcionario` WRITE;
/*!40000 ALTER TABLE `t_funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hospedagem`
--

DROP TABLE IF EXISTS `t_hospedagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_hospedagem` (
  `COD_HOSPEDAGEM` int(11) DEFAULT NULL,
  `NUM_QUARTO` int(11) DEFAULT NULL,
  `COD_RESERVA` int(11) DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT NULL,
  `DATA_ENTRADA` datetime DEFAULT NULL,
  `DATA_SAIDA` datetime DEFAULT NULL,
  `VALOR_TOTAL` decimal(7,2) DEFAULT NULL,
  KEY `FK_RESERVA_QUARTO` (`NUM_QUARTO`),
  KEY `FK_QUARTO_RESERVA` (`COD_RESERVA`),
  CONSTRAINT `FK_QUARTO_RESERVA` FOREIGN KEY (`COD_RESERVA`) REFERENCES `t_reserva` (`COD_RESERVA`),
  CONSTRAINT `FK_RESERVA_QUARTO` FOREIGN KEY (`NUM_QUARTO`) REFERENCES `t_quarto` (`NUM_QUARTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hospedagem`
--

LOCK TABLES `t_hospedagem` WRITE;
/*!40000 ALTER TABLE `t_hospedagem` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hospedagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hospede`
--

DROP TABLE IF EXISTS `t_hospede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_hospede` (
  `COD_HOSPEDE` int(11) NOT NULL,
  `TIPO_HOSPEDE` tinyint(4) DEFAULT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `TELEFONE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`COD_HOSPEDE`),
  KEY `FK_TIP_HOSP_HOSPEDE` (`TIPO_HOSPEDE`),
  CONSTRAINT `FK_TIP_HOSP_HOSPEDE` FOREIGN KEY (`TIPO_HOSPEDE`) REFERENCES `t_tipo_hospede` (`COD_TIP_HOSP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hospede`
--

LOCK TABLES `t_hospede` WRITE;
/*!40000 ALTER TABLE `t_hospede` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_hospede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_quarto`
--

DROP TABLE IF EXISTS `t_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_quarto` (
  `NUM_QUARTO` int(11) NOT NULL,
  `COD_TIP_QUARTO` tinyint(4) DEFAULT NULL,
  `VALOR_QUARTO` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`NUM_QUARTO`),
  KEY `FK_TIP_QUART_QUARTO` (`COD_TIP_QUARTO`),
  CONSTRAINT `FK_TIP_QUART_QUARTO` FOREIGN KEY (`COD_TIP_QUARTO`) REFERENCES `t_tipo_quarto` (`COD_TIP_QUARTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_quarto`
--

LOCK TABLES `t_quarto` WRITE;
/*!40000 ALTER TABLE `t_quarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_reserva`
--

DROP TABLE IF EXISTS `t_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_reserva` (
  `COD_RESERVA` int(11) NOT NULL,
  `COD_FUNC` tinyint(4) DEFAULT NULL,
  `COD_HOSP` int(11) DEFAULT NULL,
  `STATUS` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`COD_RESERVA`),
  KEY `FK_FUNC_RESERVA` (`COD_FUNC`),
  KEY `FK_HOSP_RESERVA` (`COD_HOSP`),
  CONSTRAINT `FK_FUNC_RESERVA` FOREIGN KEY (`COD_FUNC`) REFERENCES `t_funcionario` (`COD_FUNC`),
  CONSTRAINT `FK_HOSP_RESERVA` FOREIGN KEY (`COD_HOSP`) REFERENCES `t_hospede` (`COD_HOSPEDE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_reserva`
--

LOCK TABLES `t_reserva` WRITE;
/*!40000 ALTER TABLE `t_reserva` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tipo_hospede`
--

DROP TABLE IF EXISTS `t_tipo_hospede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tipo_hospede` (
  `COD_TIP_HOSP` tinyint(4) NOT NULL,
  `HOSP_DESC` varchar(30) DEFAULT NULL,
  `SEXO` char(1) DEFAULT NULL,
  PRIMARY KEY (`COD_TIP_HOSP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tipo_hospede`
--

LOCK TABLES `t_tipo_hospede` WRITE;
/*!40000 ALTER TABLE `t_tipo_hospede` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tipo_hospede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_tipo_quarto`
--

DROP TABLE IF EXISTS `t_tipo_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_tipo_quarto` (
  `COD_TIP_QUARTO` tinyint(4) NOT NULL,
  `QTD_PESSOAS` tinyint(4) DEFAULT NULL,
  `FRIGOBAR` char(1) DEFAULT NULL,
  `BANHEIRO` char(1) DEFAULT NULL,
  PRIMARY KEY (`COD_TIP_QUARTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_tipo_quarto`
--

LOCK TABLES `t_tipo_quarto` WRITE;
/*!40000 ALTER TABLE `t_tipo_quarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_tipo_quarto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-01 20:46:37
