-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: escola_curso
-- ------------------------------------------------------
-- Server version	5.7.25-log

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
-- Table structure for table `alunos`
--

DROP TABLE IF EXISTS `alunos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos` (
  `idAluno` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Dta_Nascimento` date NOT NULL,
  `Endereço` varchar(255) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Estado` varchar(2) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  PRIMARY KEY (`idAluno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos`
--

LOCK TABLES `alunos` WRITE;
/*!40000 ALTER TABLE `alunos` DISABLE KEYS */;
INSERT INTO `alunos` VALUES (1,'Pedro Magalhães Martins','1987-07-17','Av. Ant. Carlos, 6673','BELO HORIZONTE','MG','12345678911'),(2,'Diego Mariano','1990-01-01','Av. Ant. Carlos, 6673','BELO HORIZONTE','MG','01234567891'),(3,'Fliper Ama','2017-01-01','Av. Ant. Carlos, 6600','BELO HORIZONTE','MG','11111111111'),(4,'Pedro Martins','1997-02-13','Av. Brasil, 1000','CABO FRIO','RJ','22222222222'),(5,'REGINA CAZÉ','1920-01-01','Rua do Mar','SALVADOR','BA','33333333333');
/*!40000 ALTER TABLE `alunos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alunos_cursos`
--

DROP TABLE IF EXISTS `alunos_cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alunos_cursos` (
  `idalunos_cursos` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  PRIMARY KEY (`idalunos_cursos`),
  KEY `fk_id_aluno_idx` (`id_aluno`),
  KEY `fk_id_curso_idx` (`id_curso`),
  CONSTRAINT `fk_id_aluno` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`idAluno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alunos_cursos`
--

LOCK TABLES `alunos_cursos` WRITE;
/*!40000 ALTER TABLE `alunos_cursos` DISABLE KEYS */;
INSERT INTO `alunos_cursos` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,3,1),(6,3,2),(7,4,1),(8,5,1),(9,1,1),(10,1,2),(11,2,1),(12,2,3),(13,3,1),(14,3,2),(15,4,1),(16,5,1);
/*!40000 ALTER TABLE `alunos_cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'codeigniter'),(2,'Phyton'),(3,'MySQL');
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas`
--

DROP TABLE IF EXISTS `notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `id_aluno_curso` int(11) NOT NULL,
  `descricao_atividade` varchar(100) NOT NULL,
  `vrl_nota` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `fk_id_aluno_curso_idx` (`id_aluno_curso`),
  CONSTRAINT `fk_id_aluno_curso` FOREIGN KEY (`id_aluno_curso`) REFERENCES `alunos_cursos` (`idalunos_cursos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas`
--

LOCK TABLES `notas` WRITE;
/*!40000 ALTER TABLE `notas` DISABLE KEYS */;
INSERT INTO `notas` VALUES (1,1,'Prova 1',28.00),(2,3,'Prova 1',25.00),(3,5,'Prova 1',28.00),(4,2,'Exercicio 1',10.00),(5,6,'Exercicio 2',12.00),(6,1,'Prova 2',22.00),(7,2,'Prova 2',20.00);
/*!40000 ALTER TABLE `notas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-28 11:22:22
