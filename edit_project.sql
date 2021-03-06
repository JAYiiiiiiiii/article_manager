-- MySQL dump 10.13  Distrib 5.7.19, for Win64 (x86_64)
--
-- Host: localhost    Database: edit_project
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `photo_url` tinytext,
  `email` varchar(30) NOT NULL,
  `type` int(11) NOT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','admin','/upload/default/head_icon.jpg','admin1@qq.com',0,'濂?);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `best_post`
--

DROP TABLE IF EXISTS `best_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `best_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `apply_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `best_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `best_post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `best_post`
--

LOCK TABLES `best_post` WRITE;
/*!40000 ALTER TABLE `best_post` DISABLE KEYS */;
INSERT INTO `best_post` VALUES (1,1,1,'2017-12-11 09:08:12',2),(2,2,2,'2017-12-11 09:18:28',2),(3,3,2,'2017-12-11 09:26:55',3);
/*!40000 ALTER TABLE `best_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `black_list`
--

DROP TABLE IF EXISTS `black_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `black_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `black_list_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `black_list`
--

LOCK TABLES `black_list` WRITE;
/*!40000 ALTER TABLE `black_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `black_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followcard`
--

DROP TABLE IF EXISTS `followcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `follow_content` varchar(2000) DEFAULT NULL,
  `follow_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `send_id` (`send_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `followcard_ibfk_1` FOREIGN KEY (`send_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `followcard_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followcard`
--

LOCK TABLES `followcard` WRITE;
/*!40000 ALTER TABLE `followcard` DISABLE KEYS */;
INSERT INTO `followcard` VALUES (1,1,2,'<p>纭疄浼橀泤锛屽氨鏄笉鐭ラ亾涓轰粈涔堣冻鍚ф瘮杈冨銆?/p>','2017-12-11 17:14:34'),(2,2,1,'<p>濂借瘲濂借瘲銆?/p>','2017-12-11 17:30:42'),(4,3,3,'<p>杩欐槸鍏ㄧ珯鎼滅储鍏紑鏂囩珷</p>','2017-12-11 17:51:56'),(5,7,3,'<p>鍏紑鎴愬姛锛屾紨绀虹粨鏉?/p>','2017-12-11 17:55:29');
/*!40000 ALTER TABLE `followcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_forum`
--

DROP TABLE IF EXISTS `main_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `info` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_forum`
--

LOCK TABLES `main_forum` WRITE;
/*!40000 ALTER TABLE `main_forum` DISABLE KEYS */;
INSERT INTO `main_forum` VALUES (1,'鏃呮父鏃ュ織',NULL),(2,'璇稿瓙鐧惧',NULL),(3,'缇庡コ',NULL),(4,'姝﹁瘲鏉扮殑鐩綍',NULL);
/*!40000 ALTER TABLE `main_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `notice_date` datetime NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,1,'<p>鏂囩珷绠＄悊鍣ㄥ紑鍙戝洟闃熸杩庡ぇ瀹朵娇鐢ㄣ€?/p>','2017-12-11 17:09:11','娆㈣繋浣跨敤'),(2,1,'<p>灏嗕簬鏄庢棩鍑屾櫒4锛?0鍏ㄦ湇鍙戞斁澶хぜ鍖?/p>','2017-12-11 17:28:23','鐑儓搴嗙鏈珯娉ㄥ唽鐢ㄦ埛瓒呰繃1浜?),(3,1,'<p>鍏憡</p>','2017-12-11 17:52:29','娴嬭瘯鍏憡');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `card_content` varchar(8000) NOT NULL,
  `send_date` datetime NOT NULL,
  `post_type` int(11) DEFAULT NULL,
  `reply_num` int(11) DEFAULT NULL,
  `view_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum` (`forum`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`forum`) REFERENCES `sub_sub_forum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,1,'澶т笢鍖?- 浼橀泤鐨勫搱灏旀花','<p style=\"margin: 10px 0px; padding: 0px; word-break: break-all; word-wrap: break-word; line-height: 25px; color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, Tahoma, Arial, Helvetica, STHeiti; font-size: 14px;\">\r\n	缁堜簬鏉ュ埌鍟﹀搱灏旀花锛岃繖鍙槸鎴戜竴骞翠互鏉ヤ竴鐩存儲璁扮潃瑕佹潵娓哥帺鐨勫煄甯傘€傚墠浜涙棩瀛愬拰ZZ璋堣璧锋梾娓告椂锛孼Z杩橀棶鎴戞渶鎯冲幓娓哥帺鐨勫湴鏂规槸鍝噷銆傛垜鎯充簡涓€浼氬効锛屽憡璇変粬锛屽搱灏旀花锛屽綋鐒舵槸鍝堝皵婊ㄣ€?/p>\r\n<p style=\"margin: 10px 0px; padding: 0px; word-break: break-all; word-wrap: break-word; line-height: 25px; color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, Tahoma, Arial, Helvetica, STHeiti; font-size: 14px;\">\r\n	绂诲紑鍝堝皵婊ㄦ椂锛屾垜浠張璁ㄨ鍦ㄥ搱灏旀花娓歌鍚庣殑鎰熷彈锛屾渶鍚庢€荤粨鍑轰袱涓瓧---浼橀泤銆傚浜庢垜浠潵璇达紝铏界劧鍦ㄥ搱灏旀花娓哥帺鐨勬椂闂翠笉绠楅暱锛屼絾杩欎釜鍩庡競缁欐垜浠暀涓嬬殑鍏卞悓鍗拌薄灏辨槸---杩欐槸涓€搴у厖婊￠闊典紭闆呯殑鍩庡競銆?/p>\r\n','2017-12-11 17:06:23',1,1,6),(2,2,2,'鎴戠埍鍖椾含','<p>\r\n	<span style=\"color:#ff0000;\">鎴戠埍鍖椾含澶╁畨闂紝澶╁畨闂ㄤ笂澶槼鍗囥€?/span></p>\r\n<p>\r\n	<span style=\"color:#ff0000;\">浼熷ぇ鐨勯琚栨瘺涓诲腑锛屾寚寮曟垜浠悜鍓嶈繘銆?/span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	浣犺偗瀹氭病鏈夎杩囪繖涔堟爣鍑嗙殑鍗佷簲瀛?nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &mdash;&mdash;鏉ヨ嚜鍦熻豹閲慽Phone X璐村惂鎵嬫満瀹㈡埛绔?/p>\r\n','2017-12-11 17:18:20',1,1,6),(3,9,2,'鎴戞渶鍠滄鐨勪笁澶ф苯杞﹀搧鐗?,'<p>\r\n	浼楁墍鍛ㄧ煡锛屾垜鏈€鍠滄鐨勬苯杞﹀搧鐗屾槸鍑开鎷夊厠锛屽枩娆㈢殑鍘熷洜寰堢畝鍗曪細姣忔杞﹀睍涓婂嚡杩媺鍏嬬殑缇庡コ鑳搁儴鐨勪綋绉€绘槸鏈€澶х殑銆?/p>\r\n','2017-12-11 17:26:51',0,1,3),(7,10,3,'绉佹湁鏂囩珷','<h3 style=\"color:blue;\">\r\n	婕旂ず鏂囩珷鏍煎紡</h3>\r\n<p>\r\n	<u><strong>缁х画婕旂ず</strong></u></p>\r\n<p style=\"text-align: center;\">\r\n	<u><strong><span style=\"background-color:#008000;\">缁х画</span></strong></u></p>\r\n','2017-12-11 17:54:40',0,1,3);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_post`
--

DROP TABLE IF EXISTS `private_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forum` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `card_content` varchar(8000) NOT NULL,
  `send_date` datetime NOT NULL,
  `post_type` int(11) DEFAULT NULL,
  `reply_num` int(11) DEFAULT NULL,
  `view_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `forum` (`forum`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `private_post_ibfk_1` FOREIGN KEY (`forum`) REFERENCES `sub_sub_forum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `private_post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_post`
--

LOCK TABLES `private_post` WRITE;
/*!40000 ALTER TABLE `private_post` DISABLE KEYS */;
INSERT INTO `private_post` VALUES (1,8,1,'閫嶉仴娓?,'<p>\r\n	<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 瀹嬩綋, sans-serif, tahoma; font-size: 14px;\">鍖楀啣鏈夐奔锛屽叾鍚嶄负椴层€傞膊涔嬪ぇ锛屼笉鐭ュ叾鍑犲崈閲屼篃锛涘寲鑰屼负楦燂紝鍏跺悕涓洪箯銆傞箯涔嬭儗锛屼笉鐭ュ叾鍑犲崈閲屼篃锛涙€掕€岄锛屽叾缈艰嫢鍨傚ぉ涔嬩簯銆傛槸楦熶篃锛屾捣杩愬垯灏嗗緳浜庡崡鍐ャ€傚崡鍐ヨ€咃紝澶╂睜涔熴€?/span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 瀹嬩綋, sans-serif, tahoma; font-size: 14px;\" />\r\n	<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 瀹嬩綋, sans-serif, tahoma; font-size: 14px;\">銆婇綈璋愩€嬭€咃紝蹇楁€€呬篃銆傘€婅皭銆嬩箣瑷€鏇帮細&ldquo;楣忎箣寰欎簬鍗楀啣涔燂紝姘村嚮涓夊崈閲岋紝鎶熸壎鎽囪€屼笂鑰呬節涓囬噷锛屽幓浠ュ叚鏈堟伅鑰呬篃銆?rdquo;閲庨┈涔燂紝灏樺焹涔燂紝鐢熺墿涔嬩互鎭浉鍚逛篃銆傚ぉ涔嬭媿鑻嶏紝鍏舵鑹查偑锛熷叾杩滆€屾棤鎵€鑷虫瀬閭紵鍏惰涓嬩篃锛屼害鑻ユ槸鍒欏凡鐭ｃ€?/span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 瀹嬩綋, sans-serif, tahoma; font-size: 14px;\" />\r\n	<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 瀹嬩綋, sans-serif, tahoma; font-size: 14px;\">涓斿か姘翠箣绉篃涓嶅帤锛屽垯鍏惰礋澶ц垷涔熸棤鍔涖€傝鏉按浜庡澇鍫備箣涓婏紝鍒欒姤涓轰箣鑸燂紱缃澂鐒夊垯鑳讹紝姘存祬鑰岃垷澶т篃銆傞涔嬬Н涔熶笉鍘氾紝鍒欏叾璐熷ぇ缈间篃鏃犲姏銆傛晠涔濅竾閲岋紝鍒欓鏂湪涓嬬煟锛岃€屽悗涔冧粖鍩归锛涜儗璐熼潚澶╋紝鑰岃帿涔嬪き闃忚€咃紝鑰屽悗涔冧粖灏嗗浘鍗椼€?/span><br style=\"content: &quot;&quot;; display: block; width: 700px; height: 0px; margin: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 瀹嬩綋, sans-serif, tahoma; font-size: 14px;\" />\r\n	<span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 瀹嬩綋, sans-serif, tahoma; font-size: 14px;\">铚╀笌瀛﹂笭绗戜箣鏇帮細&ldquo;鎴戝喅璧疯€岄锛屾姠姒嗘瀷鑰屾锛屾椂鍒欎笉鑷筹紝鑰屾帶浜庡湴鑰屽凡鐭ｏ紝濂氫互涔嬩節涓囬噷鑰屽崡涓猴紵&rdquo;閫傝幗鑻嶈€咃紝涓夐鑰屽弽锛岃吂鐘规灉鐒讹紱閫傜櫨閲岃€咃紝瀹胯垈绮紱閫傚崈閲岃€咃紝涓夋湀鑱氱伯銆備箣浜岃櫕鍙堜綍鐭?</span></p>\r\n','2017-12-11 17:07:57',0,0,0),(2,5,2,'璁颁竴鍏瘬鐨勮煈铻?,'<p>\r\n	浼楁墍鍛ㄧ煡锛岃煈铻傛槸涓€绉嶅彲鐖辩殑鐢熺墿锛屼簨瀹炰笂浠栦滑宸茬粡鍦ㄦ垜浠殑鍦扮悆姣嶄翰韬笂鐢熸椿浜?00涓囧勾涔嬩箙銆?/p>\r\n<p>\r\n	杩欑鐝嶆儨鐨勪笂鍙ょ敓鐗╂渶杩戠幇韬搱灏旀花宸ヤ笟澶у绗竴瀛︾敓鍏瘬锛堝張鍚嶄竴鐩戯級锛屼粬浠憞鏇崇潃鏇煎鐨勮韩濮匡紝鐖浜庢垜鐐圭殑澶栧崠涔嬩笂銆?/p>\r\n','2017-12-11 17:22:37',0,0,1),(5,12,3,'姝﹁瘲鏉扮殑绉佹湁鏂囩珷','<p>\r\n	绉佹湁鏂囩珷涓嶈兘璇勮</p>\r\n','2017-12-11 17:49:08',0,0,2);
/*!40000 ALTER TABLE `private_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_forum`
--

DROP TABLE IF EXISTS `sub_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_forum` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `info` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_forum` (`main_forum`),
  CONSTRAINT `sub_forum_ibfk_1` FOREIGN KEY (`main_forum`) REFERENCES `main_forum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_forum`
--

LOCK TABLES `sub_forum` WRITE;
/*!40000 ALTER TABLE `sub_forum` DISABLE KEYS */;
INSERT INTO `sub_forum` VALUES (1,1,'鍥藉唴',NULL),(2,1,'鍥藉',NULL),(3,2,'鍎掑',NULL),(4,2,'閬撳',NULL),(5,3,'澶栧浗缇庡コ',NULL),(6,4,'瀛︿範',NULL),(7,4,'濞变箰',NULL);
/*!40000 ALTER TABLE `sub_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_sub_forum`
--

DROP TABLE IF EXISTS `sub_sub_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_sub_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_forum` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `info` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_forum` (`sub_forum`),
  CONSTRAINT `sub_sub_forum_ibfk_1` FOREIGN KEY (`sub_forum`) REFERENCES `sub_forum` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_sub_forum`
--

LOCK TABLES `sub_sub_forum` WRITE;
/*!40000 ALTER TABLE `sub_sub_forum` DISABLE KEYS */;
INSERT INTO `sub_sub_forum` VALUES (1,1,'榛戦緳姹?,NULL),(2,1,'鍖椾含',NULL),(3,2,'缇庡浗',NULL),(4,2,'寰峰浗',NULL),(5,3,'瀛斿瓙',NULL),(6,3,'瀛熷瓙',NULL),(7,4,'鑰佸瓙',NULL),(8,4,'搴勫瓙',NULL),(9,5,'澶栧浗姹借溅缇庡コ',NULL),(10,6,'杞欢宸ョ▼',NULL),(11,6,'鎿嶄綔绯荤粺',NULL),(12,7,'dota2',NULL);
/*!40000 ALTER TABLE `sub_sub_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `photo_url` tinytext,
  `email` varchar(30) NOT NULL,
  `type` int(11) NOT NULL,
  `register_date` datetime NOT NULL,
  `signature` varchar(50) DEFAULT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `active_code` varchar(32) DEFAULT NULL,
  `hasActive` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'鐜嬫櫤','123456','鐢?,'/upload/headImg/3/0/496CCCB1935E4CB7974B5F2BF5BEA4BB5.jpg','wangzhi@qq.com',1,'2017-12-11 17:03:22',NULL,1,NULL,NULL),(2,'钀借姳鍚归洩','123456','鐢?,'/upload/default/head_icon.jpg','flower@sb.com',1,'2017-12-11 17:13:23',NULL,1,NULL,NULL),(3,'姝﹁瘲鏉?,'123456','濂?,'/upload/headImg/5/6/E9A2C3D271E3458183809F97158C7F4E11.jpg','wushijie@163.com',1,'2017-12-11 17:45:44',NULL,1,NULL,NULL);
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

-- Dump completed on 2017-12-11 19:08:17
