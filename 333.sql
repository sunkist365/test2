-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 192.168.0.156    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.31-0ubuntu0.18.04.1

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
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author` (
  `au_no` int(11) NOT NULL,
  `au_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`au_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookList`
--

DROP TABLE IF EXISTS `BookList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookList` (
  `book_no` int(10) NOT NULL,
  `b_genre` int(1) DEFAULT NULL,
  `b_title` varchar(12) NOT NULL,
  `b_author` int(2) DEFAULT NULL,
  `b_comp` int(2) DEFAULT NULL,
  `b_price` int(11) DEFAULT NULL,
  `b_year` int(4) DEFAULT NULL,
  `b_img` varchar(45) DEFAULT NULL,
  `b_list` varchar(45) DEFAULT NULL,
  `b_story` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`book_no`),
  KEY `fk_BookList_Author1_idx` (`b_author`),
  KEY `fk_BookList_Company1_idx` (`b_comp`),
  CONSTRAINT `fk_BookList_Author1` FOREIGN KEY (`b_author`) REFERENCES `Author` (`au_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_BookList_Company1` FOREIGN KEY (`b_comp`) REFERENCES `Company` (`comp_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookList`
--

LOCK TABLES `BookList` WRITE;
/*!40000 ALTER TABLE `BookList` DISABLE KEYS */;
INSERT INTO `BookList` VALUES (1,1,'1',NULL,NULL,12001,1989,'','1','1'),(2,2,'2',NULL,NULL,15001,2008,'','2','2'),(3,3,'3',NULL,NULL,18001,2011,'','3','3'),(4,4,'4',NULL,NULL,13001,2000,'','4','4'),(5,5,'5',NULL,NULL,12001,1989,'','5','5'),(6,6,'6',NULL,NULL,15001,2008,'','6','6'),(7,7,'7',NULL,NULL,18001,2011,'','7','7'),(8,8,'8',NULL,NULL,13001,2000,'','8','8'),(9,9,'9',NULL,NULL,13001,2011,'','9','9'),(10,1,'10',NULL,NULL,12002,1990,'','10','10'),(11,2,'11',NULL,NULL,15002,2009,'','11','11'),(12,3,'12',NULL,NULL,18002,2012,'','12','12'),(13,4,'13',NULL,NULL,13002,2001,'','13','13'),(14,5,'14',NULL,NULL,12002,1990,'','14','14'),(15,6,'15',NULL,NULL,15002,2009,'','15','15'),(16,7,'16',NULL,NULL,18002,2012,'','16','16'),(17,8,'17',NULL,NULL,13002,2001,'','17','17'),(18,9,'18',NULL,NULL,13002,2012,'','18','18'),(19,2,'19',NULL,NULL,12003,1991,'','19','19'),(20,3,'20',NULL,NULL,15003,2010,'','20','20'),(21,4,'21',NULL,NULL,18003,2013,'','21','21'),(22,5,'22',NULL,NULL,13003,2002,'','22','22'),(23,6,'23',NULL,NULL,12003,1991,'','23','23'),(24,7,'24',NULL,NULL,15003,2010,'','24','24'),(25,8,'25',NULL,NULL,18003,2013,'','25','25'),(26,9,'26',NULL,NULL,13003,2002,'','26','26'),(27,2,'27',NULL,NULL,13003,2013,'','27','27'),(28,7,'28',NULL,NULL,12004,1992,'','28','28'),(29,6,'29',NULL,NULL,15004,2011,'','29','29'),(30,5,'30',NULL,NULL,18004,2014,'','30','30'),(31,3,'31',NULL,NULL,13004,2003,'','31','31'),(32,2,'32',NULL,NULL,12004,1992,'','32','32'),(33,2,'33',NULL,NULL,15004,2011,'','33','33'),(34,2,'34',NULL,NULL,18004,2014,'','34','34'),(35,3,'35',NULL,NULL,13004,2003,'','35','35'),(36,2,'36',NULL,NULL,13004,2014,'','36','36'),(37,3,'37',NULL,NULL,12005,1993,'','37','37'),(38,4,'38',NULL,NULL,15005,2012,'','38','38'),(39,5,'39',NULL,NULL,18005,2015,'','39','39'),(40,6,'40',NULL,NULL,13005,2004,'','40','40'),(41,7,'41',NULL,NULL,12005,1993,'','41','41'),(42,8,'42',NULL,NULL,15005,2012,'','42','42'),(43,9,'43',NULL,NULL,18005,2015,'','43','43'),(44,1,'44',NULL,NULL,13005,2004,'','44','44'),(45,2,'45',NULL,NULL,13005,2015,'','45','45'),(46,3,'46',NULL,NULL,12006,1994,'','46','46'),(47,4,'47',NULL,NULL,15006,2013,'','47','47'),(48,5,'48',NULL,NULL,18006,2016,'','48','48'),(49,6,'49',NULL,NULL,13006,2005,'','49','49'),(50,7,'50',NULL,NULL,12006,1994,'','50','50'),(51,8,'51',NULL,NULL,15006,2013,'','51','51'),(52,9,'52',NULL,NULL,18006,2016,'','52','52'),(53,1,'1',NULL,NULL,13006,2005,'','53','53'),(54,3,'54',NULL,NULL,13006,2016,'','54','54'),(55,4,'55',NULL,NULL,12007,1995,'','55','55'),(56,5,'56',NULL,NULL,15007,2014,'','56','56'),(57,6,'57',NULL,NULL,18007,2017,'','57','57'),(58,7,'58',NULL,NULL,13007,2006,'','58','58'),(59,8,'59',NULL,NULL,12007,1995,'','59','59'),(60,9,'60',NULL,NULL,15007,2014,'','60','60'),(61,1,'61',NULL,NULL,18007,2017,'','61','61'),(62,3,'62',NULL,NULL,13007,2006,'','62','62'),(63,8,'63',NULL,NULL,13007,2017,'','63','63'),(64,7,'64',NULL,NULL,12008,1996,'','64','64'),(65,6,'65',NULL,NULL,15008,2015,'','65','65'),(66,4,'66',NULL,NULL,18008,2018,'','66','66'),(67,3,'67',NULL,NULL,13008,2007,'','67','67'),(68,3,'68',NULL,NULL,12008,1996,'','68','68'),(69,3,'69',NULL,NULL,15008,2015,'','69','69'),(70,4,'70',NULL,NULL,18008,2018,'','70','70'),(71,3,'71',NULL,NULL,13008,2007,'','71','71'),(72,4,'72',NULL,NULL,13008,2018,'','72','72'),(73,5,'73',NULL,NULL,12009,1997,'','73','73'),(74,6,'74',NULL,NULL,15009,2016,'','74','74'),(75,7,'75',NULL,NULL,18009,2019,'','75','75'),(76,8,'76',NULL,NULL,13009,2008,'','76','76'),(77,9,'77',NULL,NULL,12009,1997,'','77','77'),(78,2,'78',NULL,NULL,15009,2016,'','78','78'),(79,1,'79',NULL,NULL,18009,2019,'','79','79'),(80,3,'80',NULL,NULL,13009,2008,'','80','80'),(81,4,'81',NULL,NULL,13009,2019,'','81','81'),(82,5,'82',NULL,NULL,12010,1998,'','82','82'),(83,6,'83',NULL,NULL,15010,2017,'','83','83'),(84,7,'84',NULL,NULL,18010,2020,'','84','84'),(85,8,'85',NULL,NULL,13010,2009,'','85','85'),(86,9,'86',NULL,NULL,12010,1998,'','86','86'),(87,1,'87',NULL,NULL,15010,2017,'','87','87'),(88,2,'88',NULL,NULL,18010,2020,'','88','88'),(89,4,'89',NULL,NULL,13010,2009,'','89','89'),(90,5,'90',NULL,NULL,13010,2020,'','90','90'),(91,6,'91',NULL,NULL,12011,1999,'','91','91'),(92,7,'92',NULL,NULL,15011,2018,'','92','92'),(93,8,'93',NULL,NULL,18011,2021,'','93','93'),(94,9,'94',NULL,NULL,13011,2010,'','94','94'),(95,1,'95',NULL,NULL,12011,1999,'','95','95'),(96,2,'96',NULL,NULL,15011,2018,'','96','96'),(97,4,'97',NULL,NULL,18011,2021,'','1','1'),(98,9,'98',NULL,NULL,13011,2010,'','2','2'),(99,8,'99',NULL,NULL,13011,2021,'','3','3'),(100,7,'100',NULL,NULL,12012,2000,'','4','4'),(101,5,'101',NULL,NULL,15012,2019,'','5','5'),(102,4,'102',NULL,NULL,18012,2022,'','6','6'),(103,4,'103',NULL,NULL,13012,2011,'','7','7'),(104,4,'104',NULL,NULL,12012,2000,'','7','7'),(105,5,'105',NULL,NULL,15012,2019,'','8','8'),(106,4,'106',NULL,NULL,18012,2022,'','1','1'),(107,5,'107',NULL,NULL,13012,2011,'','2','2'),(108,6,'108',NULL,NULL,13012,2022,'','3','3'),(109,7,'109',NULL,NULL,12013,2001,'','4','4'),(110,8,'110',NULL,NULL,15013,2020,'','5','5'),(111,9,'111',NULL,NULL,18013,2023,'','6','6'),(112,1,'112',NULL,NULL,13013,2012,'','7','7'),(113,2,'113',NULL,NULL,12013,2001,'','8','8'),(114,1,'114',NULL,NULL,15013,2020,'','9','9'),(115,4,'115',NULL,NULL,18013,2023,'','10','10'),(116,5,'116',NULL,NULL,13013,2012,'','11','11'),(117,6,'117',NULL,NULL,13013,2023,'','12','12'),(118,7,'118',NULL,NULL,12014,2002,'','13','13'),(119,8,'119',NULL,NULL,15014,2021,'','14','14'),(120,9,'120',NULL,NULL,18014,2024,'','15','15'),(121,4,'121',NULL,NULL,13014,2013,'','16','16'),(122,5,'122',NULL,NULL,12014,2002,'','17','17'),(123,4,'123',NULL,NULL,15014,2021,'','18','18'),(124,5,'124',NULL,NULL,18014,2024,'','19','19'),(125,6,'125',NULL,NULL,13014,2013,'','20','20'),(126,7,'126',NULL,NULL,13014,2024,'','21','21'),(127,8,'127',NULL,NULL,12015,2003,'','22','22'),(128,9,'128',NULL,NULL,15015,2022,'','23','23'),(129,1,'129',NULL,NULL,18015,2025,'','24','24'),(130,2,'130',NULL,NULL,13015,2014,'','25','25'),(131,1,'131',NULL,NULL,12015,2003,'','26','26'),(132,4,'132',NULL,NULL,15015,2022,'','27','27'),(133,5,'133',NULL,NULL,18015,2025,'','28','28'),(134,6,'134',NULL,NULL,13015,2014,'','29','29'),(135,7,'135',NULL,NULL,13015,2025,'','30','30'),(136,8,'136',NULL,NULL,12016,2004,'','31','31'),(137,5,'137',NULL,NULL,15016,2023,'','32','32'),(138,5,'138',NULL,NULL,18016,2026,'','33','33'),(139,5,'139',NULL,NULL,13016,2015,'','34','34'),(140,6,'140',NULL,NULL,12016,2004,'','35','35'),(141,5,'141',NULL,NULL,15016,2023,'','36','36'),(142,6,'142',NULL,NULL,18016,2026,'','37','37'),(143,4,'143',NULL,NULL,13016,2015,'','38','38'),(144,5,'144',NULL,NULL,13016,2026,'','39','39'),(145,4,'145',NULL,NULL,12017,2005,'','40','40'),(146,5,'146',NULL,NULL,15017,2024,'','41','41'),(147,6,'147',NULL,NULL,18017,2027,'','42','42'),(148,7,'148',NULL,NULL,13017,2016,'','43','43'),(149,8,'149',NULL,NULL,12017,2005,'','44','44'),(150,9,'150',NULL,NULL,15017,2024,'','45','45'),(151,1,'151',NULL,NULL,18017,2027,'','46','46'),(152,2,'152',NULL,NULL,13017,2016,'','47','47'),(153,1,'153',NULL,NULL,13017,2027,'','48','48'),(154,4,'154',NULL,NULL,12018,2006,'','49','49'),(155,5,'155',NULL,NULL,15018,2025,'','50','50'),(156,6,'156',NULL,NULL,18018,2028,'','51','51'),(157,7,'157',NULL,NULL,13018,2017,'','1','1'),(158,8,'158',NULL,NULL,12018,2006,'','2','2'),(159,6,'159',NULL,NULL,15018,2025,'','3','3'),(160,7,'160',NULL,NULL,18018,2028,'','4','4'),(161,4,'161',NULL,NULL,13018,2017,'','5','5'),(162,5,'162',NULL,NULL,13018,2028,'','6','6'),(163,4,'163',NULL,NULL,12019,2007,'','7','7'),(164,5,'164',NULL,NULL,15019,2026,'','7','7'),(165,6,'165',NULL,NULL,18019,2029,'','8','8'),(166,7,'166',NULL,NULL,13019,2018,'','1','1'),(167,8,'167',NULL,NULL,12019,2007,'','2','2'),(168,9,'168',NULL,NULL,15019,2026,'','3','3'),(169,1,'169',NULL,NULL,18019,2029,'','4','4'),(170,2,'170',NULL,NULL,13019,2018,'','5','5'),(171,1,'171',NULL,NULL,13019,2029,'','6','6'),(172,4,'172',NULL,NULL,12020,2008,'','7','7'),(173,5,'173',NULL,NULL,15020,2027,'','8','8'),(174,6,'174',NULL,NULL,18020,2030,'','9','9'),(175,7,'175',NULL,NULL,13020,2019,'','10','10'),(176,8,'176',NULL,NULL,12020,2008,'','11','11'),(177,7,'177',NULL,NULL,15020,2027,'','12','12'),(178,8,'178',NULL,NULL,18020,2030,'','13','13'),(179,4,'179',NULL,NULL,13020,2019,'','14','14'),(180,5,'180',NULL,NULL,13020,2030,'','15','15'),(181,4,'181',NULL,NULL,12021,2009,'','16','16'),(182,5,'182',NULL,NULL,15021,2028,'','17','17'),(183,6,'183',NULL,NULL,18021,2031,'','18','18'),(184,7,'184',NULL,NULL,13021,2020,'','19','19'),(185,8,'185',NULL,NULL,12021,2009,'','20','20'),(186,9,'186',NULL,NULL,15021,2028,'','21','21'),(187,1,'187',NULL,NULL,18021,2031,'','22','22'),(188,2,'188',NULL,NULL,13021,2020,'','23','23'),(189,1,'189',NULL,NULL,13021,2031,'','24','24'),(190,4,'190',NULL,NULL,12022,2010,'','25','25'),(191,5,'191',NULL,NULL,15022,2029,'','26','26'),(192,6,'192',NULL,NULL,18022,2032,'','27','27'),(193,7,'193',NULL,NULL,13022,2021,'','28','28'),(194,8,'194',NULL,NULL,12022,2010,'','29','29'),(195,8,'195',NULL,NULL,15022,2029,'','30','30'),(196,4,'196',NULL,NULL,18022,2032,'','31','31'),(197,5,'197',NULL,NULL,13022,2021,'','32','32'),(198,4,'198',NULL,NULL,13022,2032,'','33','33'),(199,5,'199',NULL,NULL,12023,2011,'','34','34'),(200,6,'200',NULL,NULL,15023,2030,'','35','35'),(201,7,'201',NULL,NULL,18023,2033,'','36','36'),(202,8,'202',NULL,NULL,13023,2022,'','37','37'),(203,9,'203',NULL,NULL,12023,2011,'','38','38'),(204,1,'204',NULL,NULL,15023,2030,'','39','39'),(205,2,'205',NULL,NULL,18023,2033,'','40','40'),(206,1,'206',NULL,NULL,13023,2022,'','41','41'),(207,4,'207',NULL,NULL,13023,2033,'','42','42'),(208,5,'208',NULL,NULL,12024,2012,'','43','43'),(209,6,'209',NULL,NULL,15024,2031,'','44','44'),(210,7,'210',NULL,NULL,18024,2034,'','45','45'),(211,4,'211',NULL,NULL,13024,2023,'','46','46'),(212,5,'212',NULL,NULL,12024,2012,'','47','47'),(213,4,'213',NULL,NULL,15024,2031,'','48','48'),(214,5,'214',NULL,NULL,18024,2034,'','49','49'),(215,6,'215',NULL,NULL,13024,2023,'','50','50'),(216,7,'216',NULL,NULL,13024,2034,'','51','51'),(217,8,'217',NULL,NULL,12025,2013,'','1','1'),(218,9,'218',NULL,NULL,15025,2032,'','2','2'),(219,1,'219',NULL,NULL,18025,2035,'','3','3'),(220,2,'220',NULL,NULL,13025,2024,'','4','4'),(221,1,'221',NULL,NULL,12025,2013,'','5','5'),(222,4,'222',NULL,NULL,15025,2032,'','6','6'),(223,5,'223',NULL,NULL,18025,2035,'','7','7'),(224,6,'224',NULL,NULL,13025,2024,'','7','7'),(225,7,'225',NULL,NULL,13025,2035,'','8','8'),(226,8,'226',NULL,NULL,12026,2014,'','1','1'),(227,4,'227',NULL,NULL,15026,2033,'','2','2'),(228,5,'228',NULL,NULL,18026,2036,'','3','3'),(229,4,'229',NULL,NULL,13026,2025,'','4','4'),(230,5,'230',NULL,NULL,12026,2014,'','5','5'),(231,6,'231',NULL,NULL,15026,2033,'','6','6'),(232,7,'232',NULL,NULL,18026,2036,'','7','7'),(233,8,'233',NULL,NULL,13026,2025,'','8','8'),(234,9,'234',NULL,NULL,13026,2036,'','9','9'),(235,1,'235',NULL,NULL,12027,2015,'','10','10'),(236,2,'236',NULL,NULL,15027,2034,'','11','11'),(237,1,'237',NULL,NULL,18027,2037,'','12','12'),(238,4,'238',NULL,NULL,13027,2026,'','13','13'),(239,5,'239',NULL,NULL,12027,2015,'','14','14'),(240,6,'240',NULL,NULL,15027,2034,'','15','15'),(241,7,'241',NULL,NULL,18027,2037,'','16','16'),(242,8,'242',NULL,NULL,13027,2026,'','17','17'),(243,7,'243',NULL,NULL,13027,2037,'','18','18'),(244,4,'244',NULL,NULL,12028,2016,'','19','19'),(245,5,'245',NULL,NULL,15028,2035,'','20','20'),(246,4,'246',NULL,NULL,18028,2038,'','21','21'),(247,5,'247',NULL,NULL,13028,2027,'','22','22'),(248,6,'248',NULL,NULL,12028,2016,'','23','23'),(249,7,'249',NULL,NULL,15028,2035,'','24','24'),(250,8,'250',NULL,NULL,18028,2038,'','25','25'),(251,9,'251',NULL,NULL,13028,2027,'','26','26'),(252,1,'252',NULL,NULL,13028,2038,'','27','27'),(253,2,'253',NULL,NULL,12029,2017,'','28','28'),(254,1,'254',NULL,NULL,15029,2036,'','29','29'),(255,4,'255',NULL,NULL,18029,2039,'','30','30'),(256,5,'256',NULL,NULL,13029,2028,'','31','31'),(257,6,'257',NULL,NULL,12029,2017,'','32','32'),(258,7,'258',NULL,NULL,15029,2036,'','33','33'),(259,8,'259',NULL,NULL,18029,2039,'','34','34'),(260,4,'260',NULL,NULL,13029,2028,'','35','35'),(261,5,'261',NULL,NULL,13029,2039,'','36','36'),(262,4,'262',NULL,NULL,12030,2018,'','37','37'),(263,5,'263',NULL,NULL,15030,2037,'','38','38'),(264,6,'264',NULL,NULL,18030,2040,'','39','39'),(265,7,'265',NULL,NULL,13030,2029,'','40','40'),(266,8,'266',NULL,NULL,12030,2018,'','41','41'),(267,9,'267',NULL,NULL,15030,2037,'','42','42'),(268,1,'268',NULL,NULL,18030,2040,'','43','43'),(269,2,'269',NULL,NULL,13030,2029,'','44','44'),(270,1,'270',NULL,NULL,13030,2040,'','45','45'),(271,4,'271',NULL,NULL,12031,2019,'','46','46'),(272,5,'272',NULL,NULL,15031,2038,'','47','47'),(273,6,'273',NULL,NULL,18031,2041,'','48','48'),(274,7,'274',NULL,NULL,13031,2030,'','49','49'),(275,8,'275',NULL,NULL,12031,2019,'','50','50'),(276,4,'276',NULL,NULL,15031,2038,'','51','51'),(277,5,'277',NULL,NULL,18031,2041,'','1','1'),(278,4,'278',NULL,NULL,13031,2030,'','2','2'),(279,5,'279',NULL,NULL,13031,2041,'','3','3'),(280,6,'280',NULL,NULL,12032,2020,'','4','4'),(281,7,'281',NULL,NULL,15032,2039,'','5','5'),(282,8,'282',NULL,NULL,18032,2042,'','6','6'),(283,9,'283',NULL,NULL,13032,2031,'','7','7'),(284,1,'284',NULL,NULL,12032,2020,'','7','7'),(285,2,'285',NULL,NULL,15032,2039,'','8','8'),(286,1,'286',NULL,NULL,18032,2042,'','1','1'),(287,4,'287',NULL,NULL,13032,2031,'','2','2'),(288,5,'288',NULL,NULL,13032,2042,'','3','3'),(289,6,'289',NULL,NULL,12033,2021,'','4','4'),(290,7,'290',NULL,NULL,15033,2040,'','5','5'),(291,8,'291',NULL,NULL,18033,2043,'','6','6'),(292,4,'292',NULL,NULL,13033,2032,'','7','7'),(293,5,'293',NULL,NULL,12033,2021,'','8','8'),(294,4,'294',NULL,NULL,15033,2040,'','9','9'),(295,5,'295',NULL,NULL,18033,2043,'','10','10'),(296,6,'296',NULL,NULL,13033,2032,'','11','11'),(297,7,'297',NULL,NULL,13033,2043,'','12','12'),(298,8,'298',NULL,NULL,12034,2022,'','13','13'),(299,9,'299',NULL,NULL,15034,2041,'','14','14'),(300,1,'300',NULL,NULL,18034,2044,'','15','15'),(301,2,'301',NULL,NULL,13034,2033,'','16','16'),(302,1,'302',NULL,NULL,12034,2022,'','17','17'),(303,4,'303',NULL,NULL,15034,2041,'','18','18'),(304,5,'304',NULL,NULL,18034,2044,'','19','19'),(305,6,'305',NULL,NULL,13034,2033,'','20','20'),(306,7,'306',NULL,NULL,13034,2044,'','21','21'),(307,8,'307',NULL,NULL,12035,2023,'','22','22'),(308,4,'308',NULL,NULL,15035,2042,'','23','23'),(309,5,'309',NULL,NULL,18035,2045,'','24','24'),(310,4,'310',NULL,NULL,13035,2034,'','25','25'),(311,5,'311',NULL,NULL,12035,2023,'','26','26'),(312,6,'312',NULL,NULL,15035,2042,'','27','27'),(313,7,'313',NULL,NULL,18035,2045,'','28','28'),(314,8,'314',NULL,NULL,13035,2034,'','29','29'),(315,9,'315',NULL,NULL,13035,2045,'','30','30'),(316,1,'316',NULL,NULL,12036,2024,'','31','31'),(317,2,'317',NULL,NULL,15036,2043,'','32','32'),(318,1,'318',NULL,NULL,18036,2046,'','33','33'),(319,4,'319',NULL,NULL,13036,2035,'','34','34'),(320,5,'320',NULL,NULL,12036,2024,'','35','35'),(321,6,'321',NULL,NULL,15036,2043,'','36','36'),(322,7,'322',NULL,NULL,18036,2046,'','37','37'),(323,8,'323',NULL,NULL,13036,2035,'','38','38'),(324,4,'324',NULL,NULL,13036,2046,'','39','39'),(325,5,'325',NULL,NULL,12037,2025,'','40','40'),(326,4,'326',NULL,NULL,15037,2044,'','41','41'),(327,5,'327',NULL,NULL,18037,2047,'','42','42'),(328,6,'328',NULL,NULL,13037,2036,'','43','43'),(329,7,'329',NULL,NULL,12037,2025,'','44','44'),(330,8,'330',NULL,NULL,15037,2044,'','45','45'),(331,9,'331',NULL,NULL,18037,2047,'','46','46'),(332,1,'332',NULL,NULL,13037,2036,'','47','47'),(333,2,'333',NULL,NULL,13037,2047,'','48','48'),(334,1,'334',NULL,NULL,12038,2026,'','49','49'),(335,4,'335',NULL,NULL,15038,2045,'','50','50'),(336,5,'336',NULL,NULL,18038,2048,'','51','51'),(337,6,'337',NULL,NULL,13038,2037,'','1','1'),(338,7,'338',NULL,NULL,12038,2026,'','2','2'),(339,8,'339',NULL,NULL,15038,2045,'','3','3'),(340,4,'340',NULL,NULL,18038,2048,'','4','4'),(341,5,'341',NULL,NULL,13038,2037,'','5','5'),(342,4,'342',NULL,NULL,13038,2048,'','6','6'),(343,5,'343',NULL,NULL,12039,2027,'','7','7'),(344,6,'344',NULL,NULL,15039,2046,'','7','7'),(345,7,'345',NULL,NULL,18039,2049,'','8','8'),(346,8,'346',NULL,NULL,13039,2038,'','1','1'),(347,9,'347',NULL,NULL,12039,2027,'','2','2'),(348,1,'348',NULL,NULL,15039,2046,'','3','3'),(349,2,'349',NULL,NULL,18039,2049,'','4','4'),(350,1,'350',NULL,NULL,13039,2038,'','5','5'),(351,4,'351',NULL,NULL,13039,2049,'','6','6'),(352,5,'352',NULL,NULL,12040,2028,'','7','7'),(353,6,'353',NULL,NULL,15040,2047,'','8','8'),(354,7,'354',NULL,NULL,18040,2050,'','9','9'),(355,8,'355',NULL,NULL,13040,2039,'','10','10'),(356,4,'356',NULL,NULL,12040,2028,'','11','11'),(357,5,'357',NULL,NULL,15040,2047,'','12','12'),(358,4,'358',NULL,NULL,18040,2050,'','13','13'),(359,5,'359',NULL,NULL,13040,2039,'','14','14'),(360,6,'360',NULL,NULL,13040,2050,'','15','15'),(361,7,'361',NULL,NULL,12041,2029,'','16','16'),(362,8,'362',NULL,NULL,15041,2048,'','17','17'),(363,9,'363',NULL,NULL,18041,2051,'','18','18'),(364,1,'364',NULL,NULL,13041,2040,'','19','19'),(365,2,'365',NULL,NULL,12041,2029,'','20','20'),(366,1,'366',NULL,NULL,15041,2048,'','21','21'),(367,4,'367',NULL,NULL,18041,2051,'','22','22'),(368,5,'368',NULL,NULL,13041,2040,'','23','23'),(369,6,'369',NULL,NULL,13041,2051,'','24','24'),(370,7,'370',NULL,NULL,12042,2030,'','25','25'),(1109060601,1,'토지',NULL,NULL,15000,2007,'1109060601.jpg','0','0'),(1201080101,2,'난중일기',NULL,NULL,13000,2010,'1201080101.jpg','0','0'),(1208050501,2,'나의 문화유산답사기',NULL,NULL,12000,1988,'1208050501.jpg','0','0'),(1415040201,4,'예술하는 습관',NULL,NULL,13000,1999,'1415040201.jpg','0','0'),(1513030301,5,'코스모스',NULL,NULL,18000,2010,'1513030301.jpg','0','0'),(1611020201,6,'경제학콘서트',NULL,NULL,15000,2007,'1611020201.jpg','0','0'),(2103010101,1,'어린왕자',NULL,NULL,12000,1988,'2103010101.jpg','0','0'),(2117070401,1,'해리포터1',NULL,NULL,18000,2010,'2117070401.jpg','0','0'),(2117070402,1,' 해리포터2',NULL,NULL,13000,1999,'2117070402.jpg','0','0');
/*!40000 ALTER TABLE `BookList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `comp_no` int(11) NOT NULL,
  `comp_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`comp_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `cs_no` int(11) NOT NULL AUTO_INCREMENT,
  `cs_id` varchar(12) NOT NULL,
  `cs_pwd` varchar(20) NOT NULL,
  `cs_name` varchar(10) NOT NULL,
  `cs_tel` varchar(20) DEFAULT NULL,
  `cs_address` varchar(50) DEFAULT NULL,
  `cs_email` varchar(50) DEFAULT NULL,
  `cs_favorite` varchar(20) DEFAULT NULL,
  `cs_grade` varchar(45) DEFAULT NULL,
  `cs_point` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`cs_no`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'sailer01','a1234','김동완','01055427979','부산시 수영로 784-22','dongwan@naver.com','과학','S',0000005000),(2,'moon99','a1234','박성희','01077852153','부산시 영도구 784-13','shpark99@naver.com','예술','G',0000012000),(3,'taka72','a1234','임시완','01077852154','부산시 영도구 784-14','dongwan@naver.com','정치','B',0000001000),(4,'samsam34','a1234','임영웅','01077852155','부산시 영도구 784-15','shpark99@naver.com','경제','S',0000005000),(5,'gugu33','a1234','이순철','01077852156','부산시 수영로 784-22','dongwan@naver.com','예술','G',0000012000),(6,'sono2','a1234','박성식','01077852155','부산시 영도구 784-17','shpark99@naver.com','과학','B',0000002000),(7,'gaga7','1111','김희관','01077852158','부산시 영도구 784-18','dongwan@naver.com','예술','G',0000012000),(8,'papa33','a1234','마동석','01077852159','부산시 수영로 784-22','shpark99@naver.com','정치','B',0000001500),(9,'bird74','a1234','진희철','01077852155','부산시 영도구 784-20','dongwan@naver.com','경제','S',0000005000),(10,'paldo88','1111','박미영','01077852161','부산시 영도구 784-21','shpark99@naver.com','예술','G',0000012000),(11,'rail33','a1234','김순영','01077852162','부산시 수영로 784-22','dongwan@naver.com','과학','G',0000012000),(12,'rabit1','a1234','진시몬','01077852163','부산시 영도구 784-23','shpark99@naver.com','예술','B',0000000500),(13,'carot22','a1234','박광진','01077852155','부산시 영도구 784-24','dongwan@naver.com','정치','S',0000005000),(14,'mountain3','1111','김희영','01077852165','부산시 수영로 784-22','shpark99@naver.com','경제','G',0000012000),(15,'gain22','a1234','오수영','01077852166','부산시 영도구 784-26','dongwan@naver.com','예술','G',0000012000),(16,'sachil3','a1234','이관희','01077852167','부산시 영도구 784-27','shpark99@naver.com','과학','B',0000002000),(17,'paper12','abcd1234','임선희','01077852168','부산시 영도구 784-28','dongwan@naver.com','예술','S',0000005000),(18,'mouse1','a1234','김희선','01077852155','부산시 영도구 784-29','shpark99@naver.com','정치','G',0000012000),(19,'pet78','a1234','마진성','01077852170','부산시 영도구 784-30','dongwan@naver.com','경제','G',0000012000),(20,'cola94','a1234','곽진언','01077852171','부산시 수영로 784-22','shpark99@naver.com','예술','S',0000005000),(21,'asdf','1111','김진화','01022334453','부산시 수영로 123-123','asdf@naver.com','관리자','A',0000001234),(22,'aaaa','1111','김희자','01023322332','부산시 우암로 23','adf@naver.com','김씨','S',0000012000),(23,'zxcvb','qwer','qwer','qwer','qwer','qwer',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `o_no` varchar(45) NOT NULL,
  `cs_no` int(11) NOT NULL,
  `b_no` int(11) NOT NULL,
  `o_date` date NOT NULL,
  `o_price` int(11) NOT NULL,
  PRIMARY KEY (`o_no`),
  KEY `fk_Order_Customer_idx` (`cs_no`),
  KEY `fk_Order_BookList1_idx` (`b_no`),
  CONSTRAINT `fk_Order_BookList1` FOREIGN KEY (`b_no`) REFERENCES `BookList` (`book_no`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Customer` FOREIGN KEY (`cs_no`) REFERENCES `Customer` (`cs_no`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-27 11:56:59
