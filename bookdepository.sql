-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: bookdepository
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `ID` int(11) DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  `UUID` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (10086,'管理员','');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `ISBN` varchar(33) NOT NULL,
  `name` varchar(32) NOT NULL,
  `author` varchar(20) NOT NULL,
  `Press` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `introduction` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `classification` varchar(5) DEFAULT NULL,
  `Count` int(11) NOT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('00c447ca92264b37b886e8ce34f78105','十万个为什么','刁成','广西出版社',100,'为什么为什么为什么......',2,'科普类',3,'/img\\十万个为什么.jpg'),('0c69bf3124504b7f95d889e6d883af2e','C++','陈悦','电子工业出版社',101,'从入门到入土',10,'教学类',10,'/img\\u=1360912587,180969427&fm=11&gp=0.jpg'),('11f3fcca4cf04f6fbe43c83a15648faf','一拳超人','ONE','漫画出版社',102,'无敌是多么寂寞',5,'漫画类',10,'/img\\cartoon_1.jpg'),('26994419e68c498a9e69dc52190a8ce8','海贼王','尾田荣一郎','漫画出版社',20,'如何成为海贼王指南',2,'漫画类',3,'/img\\cartoon_3.jpg'),('3ff1df3d75e74e1db44ab765249ee8dd','Java入门教程','光华','上海出版社',103,'从入门到脱发,你值得拥有',9,'专业类',10,NULL),('72e55c1138604633bd634733dcf51e04','名侦探柯南','青山刚昌','漫画出版社',15,'死神的故事',0,'漫画类',1,'/img\\cartoon_5.jpg'),('85eb1f663444491e882a9f0793996081','Java程序猿的自身修养','BUG','随便出版社',1024,'学会戴假发,穿格子衫',1,'编程类',2,NULL),('8ed651d73bcd4cdb8d34f16bcb58b27b','PHP天下第一!','BUG','乱说出版社',8848,'学会如何在谈论中引战',2,'搞笑类',3,NULL),('bcba54810156443ea89b585d73dfb0b6','哆啦A梦','藤子不二雄','漫画出版社',50,'童年的奇妙幻想......',11,'漫画类',14,'/img\\cartoon_4.jpg'),('cfccb541104045bc96860fc2f2870605','书籍重复测试','张三','犯罪的一生出版社',68,'实现财富自由!',5,'科普类',5,NULL),('d5305d3c88b54ded862bb1f7f7a769c6','资本论','马克思, 恩格斯','人民出版社',99,'社会主义入门图书....',11,'人文类',12,'/img\\资本论.jpg'),('dde97a21c019414f9e41823b912d4049','Python入门','周雪','天津出版社',99,'学过的都说好',11,'科普类',11,'/img\\Python入门.jpg');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship`
--

DROP TABLE IF EXISTS `relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relationship` (
  `UserID` int(11) DEFAULT NULL,
  `BookName` varchar(20) DEFAULT NULL,
  `ISBN` varchar(32) DEFAULT NULL,
  `lend` datetime DEFAULT NULL,
  `back` datetime DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship`
--

LOCK TABLES `relationship` WRITE;
/*!40000 ALTER TABLE `relationship` DISABLE KEYS */;
INSERT INTO `relationship` VALUES (1,'Python入门','dde97a21c019414f9e41823b912d4049','2020-09-02 14:22:17','2021-07-06 15:46:50',0),(1,'海贼王','26994419e68c498a9e69dc52190a8ce8','2020-09-02 14:23:49','2020-12-27 21:12:47',0),(1,'资本论','d5305d3c88b54ded862bb1f7f7a769c6','2020-09-02 14:23:58','2021-07-03 17:01:08',0),(1,'名侦探柯南','72e55c1138604633bd634733dcf51e04','2020-12-28 21:41:29','2000-01-01 00:00:00',1),(1,'哆啦A梦','bcba54810156443ea89b585d73dfb0b6','2020-12-29 09:36:15','2020-12-29 09:36:29',1),(1,'资本论','d5305d3c88b54ded862bb1f7f7a769c6','2021-03-29 16:29:51','2021-07-03 17:01:08',0),(1,'资本论','d5305d3c88b54ded862bb1f7f7a769c6','2021-03-29 16:30:02','2021-07-03 17:01:08',1),(1,'海贼王','26994419e68c498a9e69dc52190a8ce8','2021-07-03 17:03:25','2021-07-03 17:03:30',0),(1,'Java程序猿的自身修养','85eb1f663444491e882a9f0793996081','2021-07-06 15:28:40','2000-01-01 00:00:00',1),(4,'哆啦A梦','bcba54810156443ea89b585d73dfb0b6','2021-07-06 15:39:13','2000-01-01 00:00:00',1),(2,'哆啦A梦','bcba54810156443ea89b585d73dfb0b6','2021-07-06 15:41:44','2000-01-01 00:00:00',1),(1,'Java入门教程','3ff1df3d75e74e1db44ab765249ee8dd','2021-07-06 15:42:44','2021-07-07 09:35:49',1),(1,'Python入门','dde97a21c019414f9e41823b912d4049','2021-07-06 15:43:56','2021-07-07 09:43:10',0),(1,'书籍重复测试','cfccb541104045bc96860fc2f2870605','2021-07-06 15:44:03','2021-07-07 09:35:19',0),(1,'PHP天下第一!','8ed651d73bcd4cdb8d34f16bcb58b27b','2021-07-06 15:44:28','2021-07-06 16:21:31',0),(17,'Java入门教程','3ff1df3d75e74e1db44ab765249ee8dd','2021-07-06 16:26:04','2021-07-06 16:26:30',0),(17,'海贼王','26994419e68c498a9e69dc52190a8ce8','2021-07-06 16:26:14','2021-07-06 16:26:24',0),(17,'PHP天下第一!','8ed651d73bcd4cdb8d34f16bcb58b27b','2021-07-06 16:26:42','2000-01-01 00:00:00',1),(17,'一拳超人','11f3fcca4cf04f6fbe43c83a15648faf','2021-07-06 16:27:01','2021-07-06 16:27:06',0),(1,'C++','0c69bf3124504b7f95d889e6d883af2e','2021-07-07 09:50:57','2021-07-07 09:51:16',0);
/*!40000 ALTER TABLE `relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UUID` varchar(32) NOT NULL,
  `name` varchar(10) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `occupation` varchar(15) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'4cf01c8fc2dc48f8b660eeeb919f7538','张三','瞎鸡儿大学','学生','1234'),(2,'bfbcb8d29aa14133b58e4bb450bdc9b9','李四','瞎鸡儿大学','学生','10086'),(3,'587748c265354b57bea5c576c1111441','黄六','瞎鸡儿大学','教师','10001'),(4,'7b105619bc4749d3aa0f934e8f7798da','四十五i','大学士','学生','123'),(17,'cd564f62317a46f0907259dafd7864bd','life','广西科技大学','教师','123zxc');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-16 10:17:01
