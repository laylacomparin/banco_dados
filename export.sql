# HeidiSQL Dump 
#
# --------------------------------------------------------
# Host:                         127.0.0.1
# Database:                     cadastro
# Server version:               5.1.59-community
# Server OS:                    Win32
# Target compatibility:         ANSI SQL
# HeidiSQL version:             4.0 RC1
# --------------------------------------------------------

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ANSI,NO_BACKSLASH_ESCAPES';*/
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;*/


#
# Database structure for database 'cadastro'
#

CREATE DATABASE /*!32312 IF NOT EXISTS*/ "cadastro" /*!40100 DEFAULT CHARACTER SET latin1 */;

USE "cadastro";


#
# Table structure for table 'pessoas'
#

CREATE TABLE /*!32312 IF NOT EXISTS*/ "pessoas" (
  "ID" int(11) NOT NULL AUTO_INCREMENT,
  "NOME" varchar(30) NOT NULL,
  "NASCIMENTO" date DEFAULT NULL,
  "SEXO" enum('M','F') DEFAULT NULL,
  "PESO" decimal(5,2) DEFAULT NULL,
  "ALTURA" decimal(3,2) DEFAULT NULL,
  "NACIONALIDADE" varchar(20) DEFAULT 'BRASIL',
  PRIMARY KEY ("ID")
);



#
# Dumping data for table 'pessoas'
#

# No data found.

/*!40101 SET SQL_MODE=@OLD_SQL_MODE;*/
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;*/
