/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : myhib

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2015-04-22 15:43:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ablum`
-- ----------------------------
DROP TABLE IF EXISTS `ablum`;
CREATE TABLE `ablum` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `albumPic` varchar(255) DEFAULT NULL,
  `albumName` varchar(50) DEFAULT NULL,
  `albumAuthor` varchar(30) DEFAULT NULL,
  `ablumPrice` double(30,0) DEFAULT NULL,
  `fileLocation` varchar(255) DEFAULT NULL,
  `downloadNum` int(11) DEFAULT '0',
  `hot` int(1) DEFAULT NULL,
  PRIMARY KEY (`albumId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ablum
-- ----------------------------
INSERT INTO `ablum` VALUES ('1', 'upload/img/because we can.jpg', '专辑1', '作者1', '71', 'upload/ablum/华晨宇专辑.rar', '0', '1');
INSERT INTO `ablum` VALUES ('6', 'upload/img/avril.jpg', '专辑2', '作者22', '61', 'upload/ablum/华晨宇专辑.rar', '0', '1');
INSERT INTO `ablum` VALUES ('7', 'upload/img/GEM.jpg', '专辑4', '作者4', '11', 'upload/ablum/华晨宇专辑.rar', '7', '1');
INSERT INTO `ablum` VALUES ('8', 'upload/img/GEM2.jpg', '专辑3', '作者3', '11', 'upload/ablum/华晨宇专辑.rar', '8', '1');
INSERT INTO `ablum` VALUES ('14', 'upload/img/just A Kiss.jpg', '专辑5', '作者5', '11', 'upload/ablum/华晨宇专辑.rar', '6', '1');
INSERT INTO `ablum` VALUES ('15', 'upload/img/westlife.jpg', '专辑6', '作者6', '11', 'upload/ablum/华晨宇专辑.rar', '11', '1');
INSERT INTO `ablum` VALUES ('16', 'null', '山地车', 'sad', '213', 'upload/ablum/华晨宇专辑.rar', '0', '0');
INSERT INTO `ablum` VALUES ('26', 'upload/img/华晨宇.jpg', '华晨宇专辑', '华晨宇', '1321', 'upload/ablum/华晨宇专辑.rar', '0', '1');
INSERT INTO `ablum` VALUES ('27', 'upload/img/华晨宇.jpg', '华晨宇专辑111', '华晨宇111', '132', 'upload/ablum/华晨宇专辑.rar', '0', '1');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL DEFAULT '0',
  `adminname` varchar(30) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  `name` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', '1', '哈哈');

-- ----------------------------
-- Table structure for `bgimg`
-- ----------------------------
DROP TABLE IF EXISTS `bgimg`;
CREATE TABLE `bgimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bgimg
-- ----------------------------
INSERT INTO `bgimg` VALUES ('1', 'images/bg/test2.jpg');
INSERT INTO `bgimg` VALUES ('2', 'images/bg/551.jpg');
INSERT INTO `bgimg` VALUES ('3', 'images/bg/552.jpg');

-- ----------------------------
-- Table structure for `buyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `buyrecord`;
CREATE TABLE `buyrecord` (
  `brid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `musicid` int(11) DEFAULT NULL,
  `ablumid` int(11) DEFAULT NULL,
  `price` double(11,0) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `musicname` varchar(30) DEFAULT NULL,
  `ablumname` varchar(50) DEFAULT NULL,
  `ablumpic` varchar(255) DEFAULT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`brid`),
  KEY `brfk1` (`userid`),
  CONSTRAINT `brfk1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buyrecord
-- ----------------------------
INSERT INTO `buyrecord` VALUES ('12', '18', '0', '1', '1', '2015-02-20', null, '1', 'upload/img/because we can.jpg', '1');
INSERT INTO `buyrecord` VALUES ('13', '18', '0', '1', '1', '2015-01-19', null, '1', 'upload/img/because we can.jpg', '1');
INSERT INTO `buyrecord` VALUES ('15', '18', '1', '0', '1', '2014-12-20', '单曲', null, null, '1');
INSERT INTO `buyrecord` VALUES ('21', '18', '0', '1', '8', '2015-03-12', null, '专辑1', 'upload/img/because we can.jpg', '1');
INSERT INTO `buyrecord` VALUES ('22', '18', '0', '7', '8', '2015-03-12', null, '专辑4', 'upload/img/GEM.jpg', '1');
INSERT INTO `buyrecord` VALUES ('23', '18', '0', '1', '7', '2015-03-14', null, '专辑1', 'upload/img/because we can.jpg', '1');
INSERT INTO `buyrecord` VALUES ('33', '18', '0', '14', '1', '2015-04-02', null, '专辑5', 'upload/img/just A Kiss.jpg', '1');
INSERT INTO `buyrecord` VALUES ('44', '18', '0', '15', '11', '2015-04-02', null, '专辑6', 'upload/img/westlife.jpg', '0');
INSERT INTO `buyrecord` VALUES ('45', '18', '0', '8', '11', '2015-04-02', null, '专辑3', 'upload/img/GEM2.jpg', '0');
INSERT INTO `buyrecord` VALUES ('48', '18', '0', '14', '11', '2015-04-02', null, '专辑5', 'upload/img/just A Kiss.jpg', '1');
INSERT INTO `buyrecord` VALUES ('50', '18', '0', '14', '11', '2015-04-02', null, '专辑5', 'upload/img/just A Kiss.jpg', '1');
INSERT INTO `buyrecord` VALUES ('51', '18', '0', '15', '11', '2015-04-09', null, '专辑6', 'upload/img/westlife.jpg', '1');
INSERT INTO `buyrecord` VALUES ('52', '18', '0', '8', '22', '2015-04-09', null, '专辑3', 'upload/img/GEM2.jpg', '1');
INSERT INTO `buyrecord` VALUES ('53', '18', '0', '14', '22', '2015-04-09', null, '专辑5', 'upload/img/just A Kiss.jpg', '1');
INSERT INTO `buyrecord` VALUES ('54', '18', '0', '26', '1321', '2015-04-09', null, '华晨宇专辑', 'upload/img/华晨宇.jpg', '0');
INSERT INTO `buyrecord` VALUES ('55', '18', '6', '0', '1', '2015-04-22', '时间都去哪儿了', null, null, '1');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `createDate` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cartId`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('2', '16', '2015-01-04');
INSERT INTO `cart` VALUES ('3', '11', '2015-01-04');
INSERT INTO `cart` VALUES ('4', '17', '2015-01-05');
INSERT INTO `cart` VALUES ('5', '18', '2015-01-05');
INSERT INTO `cart` VALUES ('6', '19', '2015-01-05');
INSERT INTO `cart` VALUES ('7', '20', '2015-03-09');
INSERT INTO `cart` VALUES ('8', '21', '2015-03-11');
INSERT INTO `cart` VALUES ('9', '22', '2015-03-11');
INSERT INTO `cart` VALUES ('10', '23', '2015-03-11');
INSERT INTO `cart` VALUES ('11', '24', '2015-04-03');
INSERT INTO `cart` VALUES ('12', '25', '2015-04-03');
INSERT INTO `cart` VALUES ('13', '26', '2015-04-03');
INSERT INTO `cart` VALUES ('14', '27', '2015-04-03');
INSERT INTO `cart` VALUES ('15', '31', '2015-04-03');
INSERT INTO `cart` VALUES ('16', '32', '2015-04-03');
INSERT INTO `cart` VALUES ('17', '33', '2015-04-20');

-- ----------------------------
-- Table structure for `cartitem`
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `cartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `cartId` int(11) NOT NULL,
  `ablumId` int(11) NOT NULL,
  `price` double(11,0) DEFAULT NULL,
  `productName` varchar(50) DEFAULT NULL,
  `productPic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cartItemId`),
  KEY `fk1` (`cartId`),
  KEY `fk2` (`ablumId`),
  CONSTRAINT `fk1` FOREIGN KEY (`cartId`) REFERENCES `cart` (`cartId`),
  CONSTRAINT `fk2` FOREIGN KEY (`ablumId`) REFERENCES `ablum` (`albumId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('1', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('2', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('3', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('4', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('5', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('6', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('7', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('8', '17', '6', '61', '专辑2', 'upload/img/avril.jpg');
INSERT INTO `cartitem` VALUES ('9', '5', '6', '61', '专辑2', 'upload/img/avril.jpg');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `ablum_id` int(11) NOT NULL DEFAULT '0',
  `comment_time` date DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET gb2312 DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `ablum_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `music_id` (`ablum_id`),
  CONSTRAINT `commentfk1` FOREIGN KEY (`ablum_id`) REFERENCES `ablum` (`albumId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '6', '2014-05-23', '不错', '小东', 'Complicated.mp3');
INSERT INTO `comment` VALUES ('2', '6', '2014-05-23', 'nice', '小东', 'Complicated.mp3');
INSERT INTO `comment` VALUES ('3', '6', '2014-05-23', 'test', '小东', 'Complicated.mp3');
INSERT INTO `comment` VALUES ('4', '6', '2014-05-23', 'test', '小东', 'Complicated.mp3');
INSERT INTO `comment` VALUES ('7', '7', null, '第三方', '小东', 'Seems To Be The Hardest Word.mp3');
INSERT INTO `comment` VALUES ('8', '8', '2014-05-23', 'test', '小东', 'Surrender.mp3');
INSERT INTO `comment` VALUES ('9', '8', '2014-05-23', 'test', '小东', 'Surrender.mp3');
INSERT INTO `comment` VALUES ('10', '8', '2014-06-02', 'eded', '匿名', 'Surrender.mp3');
INSERT INTO `comment` VALUES ('11', '8', '2014-06-02', 'eded', '匿名', 'Surrender.mp3');
INSERT INTO `comment` VALUES ('12', '6', '2014-06-16', 'sedaa', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('13', '6', '2014-06-16', 'sedaa', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('14', '6', '2014-06-16', 'sedaa', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('15', '6', '2014-06-16', 'asd', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('16', '6', '2014-06-16', 'asd', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('17', '6', '2014-06-16', '', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('18', '6', '2014-06-16', 'qqqq', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('19', '1', '2014-06-16', 'qqqq', 'hrhrhr', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('20', '1', '2014-06-16', 'aaa', 'admin', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('21', '1', '2014-06-16', 'aaa', 'admin', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('22', '1', '2014-06-16', 'aaaaa', '匿名', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('23', '1', '2014-06-16', 'aaaaa', '匿名', 'Avril Lavigne-Complicated.mp3');
INSERT INTO `comment` VALUES ('31', '1', '2015-01-26', '啊啊啊啊啊', '3', '1');
INSERT INTO `comment` VALUES ('32', '1', '2015-01-27', '啊啊啊啊啊啊啊', '3', '1');
INSERT INTO `comment` VALUES ('33', '1', '2015-01-27', '      1231231', '3', '1');
INSERT INTO `comment` VALUES ('34', '1', '2015-03-11', '      阿斯顿', '3', '专辑1');
INSERT INTO `comment` VALUES ('35', '1', '2015-03-12', '      sad', '3', '专辑1');
INSERT INTO `comment` VALUES ('36', '6', '2015-04-22', '      QQ群', '3', '专辑2');
INSERT INTO `comment` VALUES ('37', '6', '2015-04-22', '      33', '3', '专辑2');
INSERT INTO `comment` VALUES ('38', '6', '2015-04-22', '      33\r\n', '3', '专辑2');
INSERT INTO `comment` VALUES ('39', '15', '2015-04-22', '      33', '3', '专辑6');
INSERT INTO `comment` VALUES ('40', '6', '2015-04-22', '      11', '3', '专辑2');
INSERT INTO `comment` VALUES ('41', '15', '2015-04-22', '      3\r\n', '3', '专辑6');
INSERT INTO `comment` VALUES ('42', '8', '2015-04-22', '      3', '3', '专辑3');
INSERT INTO `comment` VALUES ('43', '8', '2015-04-22', '      3', '3', '专辑3');
INSERT INTO `comment` VALUES ('44', '14', '2015-04-22', '      去', '3', '专辑5');

-- ----------------------------
-- Table structure for `creditcard`
-- ----------------------------
DROP TABLE IF EXISTS `creditcard`;
CREATE TABLE `creditcard` (
  `cardId` int(11) NOT NULL AUTO_INCREMENT,
  `cardnum` varchar(19) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `pwd` int(6) DEFAULT NULL,
  `gold` double(11,0) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`cardId`),
  KEY `cardnum` (`cardnum`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of creditcard
-- ----------------------------
INSERT INTO `creditcard` VALUES ('1', '5555555544444333333', '小东', '1', '999', '12345678901');
INSERT INTO `creditcard` VALUES ('2', '5555555544444333332', '小西', '1', '123', '12345678901');
INSERT INTO `creditcard` VALUES ('19', '2015041611012192383', '1试试', '1', '0', null);
INSERT INTO `creditcard` VALUES ('20', '2015041611063978238', '1111试试', '0', '0', null);
INSERT INTO `creditcard` VALUES ('21', '2015041611171828858', '1', '1', '0', null);
INSERT INTO `creditcard` VALUES ('22', '2015041611310560972', '1问问', '1', '0', null);
INSERT INTO `creditcard` VALUES ('23', '2015041611330315302', '1', '1', '111111', '13902840123');

-- ----------------------------
-- Table structure for `income`
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `incomeId` int(11) NOT NULL,
  `musicId` int(11) DEFAULT NULL,
  `ablumid` int(11) DEFAULT NULL,
  `income` double DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`incomeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of income
-- ----------------------------

-- ----------------------------
-- Table structure for `music`
-- ----------------------------
DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `musicId` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `price` double(11,0) DEFAULT NULL,
  `music_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `introdution` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `file_Location` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tmp_file_Location` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `album` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `album_id` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`musicId`),
  KEY `mfk1` (`album_id`),
  CONSTRAINT `mfk1` FOREIGN KEY (`album_id`) REFERENCES `ablum` (`albumId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of music
-- ----------------------------
INSERT INTO `music` VALUES ('1', '作死', '1', '单曲1', '哈哈', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', '1', '1', 'rock');
INSERT INTO `music` VALUES ('2', '歌曲', '1', '歌曲2', '歌曲', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', '1', '1', 'blue');
INSERT INTO `music` VALUES ('3', '歌曲', '1', '歌曲3', '歌曲', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', '1', '1', 'Popular');
INSERT INTO `music` VALUES ('4', '歌曲', '2', '歌曲4', '哈哈', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', '1', '1', 'rock');
INSERT INTO `music` VALUES ('5', '呵呵', '1', '你猜', '不告诉你', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', null, '1', 'rock');
INSERT INTO `music` VALUES ('6', '时间都去哪儿了', '1', '时间都去哪儿了', '时间都去哪儿了', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', null, '1', 'rock');
INSERT INTO `music` VALUES ('7', '时间都去哪儿了', '1', '时间都去哪儿了', '时间都去哪儿了', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', null, '1', 'rock');
INSERT INTO `music` VALUES ('8', '时间都去哪儿了', '1', '时间都去哪儿了', '时间都去哪儿了', 'upload/mp3/爱我中华.mp3', 'upload/mp3/爱我中华.mp3', null, '1', 'rock');
INSERT INTO `music` VALUES ('9', 'asd', '134', '请问', '区委区委请问', 'upload/mp3/Maksim Mrvica - Still Water - 澄镜之水.mp3', 'upload/mp3/Maksim Mrvica - Still Water - 澄镜之水.mp3', null, '6', 'rock');
INSERT INTO `music` VALUES ('10', '赵晗', '100', 'She‘s Gone', '好肉好肉', 'upload/mp3/赵晗-She‘s Gone(现场版).mp3', 'upload/mp3/Maksim Mrvica - Still Water - 澄镜之水.mp3', null, '1', 'rock');
INSERT INTO `music` VALUES ('11', '赵晗', '100', 'She‘s Gone', '区委区委请问', 'upload/mp3/林俊杰 - 翅膀.mp3', 'upload/mp3/Maksim Mrvica - Still Water - 澄镜之水.mp3', null, '1', 'rock');
INSERT INTO `music` VALUES ('12', '赵晗', '100', 'She‘s Gone', '区委区委请问', 'upload/mp3/林俊杰 - 翅膀.mp3', 'upload/mp3/林俊杰 - 翅膀.mp3', null, '26', 'blue');
INSERT INTO `music` VALUES ('13', '王企鹅我去额', '100', '请问', '区委区委请问', 'upload/mp3/林俊杰 - 翅膀.mp3', 'upload/mp3/林俊杰 - 翅膀.mp3', null, '27', 'blue');
INSERT INTO `music` VALUES ('14', '赵晗', '134', 'She‘s Gone', '区委区委请问', 'upload/mp3/华晨宇 - The Kill.mp3', 'upload/mp3/华晨宇 - The Kill.mp3', '专辑1', '1', 'rock');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `News_id` int(11) NOT NULL AUTO_INCREMENT,
  `News_title` varchar(50) CHARACTER SET gb2312 DEFAULT NULL,
  `News_content` text CHARACTER SET gb2312,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`News_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '林志炫重返《歌手》舞台 再唱Air Supply名曲', '  在《我是歌手》第一季第九期竞演中，林志炫演唱了Air Supply的经典歌曲《Make Love Out of Nothing at All》，清澈亮丽的声音将这首情歌演绎的淋漓精致。主持人海泉评价道：“是林志炫让这首老歌重新焕发了魅力。”而音乐评论家山河盛赞林志炫的此次表演：“可能大家都不知道歌词在写什么，不用说什么，节奏，旋律，音色，已经代表一切了。”甚至空中补给的主唱Russell Hitchcock也在Youtube连结上留言“Absolutely amazing job(唱的非常棒)”，这次翻唱如此成功并不令人意外，首先林志炫与Air Supply中罗素(Russell Hitchcock)的声音特色非常相似，都是清澈而具有穿透力的类型。翻唱起来并不会破坏歌曲原有的情感表现。特别是空中补给合唱团擅长演唱抒情歌曲，他们演绎的歌曲无论是曲调还是歌词，都很优美，而且配器精巧，大量采用钢琴、吉它、 弦乐等音色优美的传统乐器，因此音乐效果浪漫、抒情，非常迷人。而这也与林志炫的音乐风格不谋而合。事实上，他与李骥组成的组合优客李林也被称为是台湾“Air Supply”。\r\n\r\n	同时，林志炫对Air Supply的作品可谓非常熟悉。1993年优客李林发行了第一本英文翻唱专辑，当中就翻唱了Air Supply的《All out of Love》以及《Without You》。而此次4月11日的双年巅峰会上，林志炫将再次挑战Air Supply的名曲《I Can Wait Forever》。这首歌延续了Air Supply一贯的风格，非常适合林志炫来演绎。\r\n\r\n迎来事业第二春 演绎演唱会新歌\r\n除了《I Can Wait Forever》，林志炫还将演唱自己的新歌《瞬间永恒》。这首歌发布与2013年底“ONE take林志炫1314世界巡回演唱会”。在演唱会最后的安可部分里林志炫直接在现场发表并同步录制新歌《瞬间永恒》，这首歌也完全表明了林志炫演唱会的主旨：将现场演出以ONE take一次过形式，把每一个瞬间都在听众的心里化为永恒。而此次在4月11日的《我是歌手》特别节目双年巅峰会上，林志炫将再次演绎这首新歌。', '2014-05-26');
INSERT INTO `news` VALUES ('2', '潘玮柏秒拍动感舞蹈 《王者丑生》大卖', '  昨日,潘玮柏将自己新专辑主打歌《王者丑生》的舞蹈排练通过秒拍分享给大家，舞蹈动感十足，粉丝连称新作品很赞！\r\n\r\n  歌手兼演员的潘玮柏一直都是一嘻哈酷范儿示众，身上总是散发着年轻而又健康的优雅气质，最近即将发布的自出道以来的第十张新专辑自然也少不了潘帅最擅长的rap风格。秒拍中，潘玮柏宽松牛仔裤加黑色卫衣，运动范十足，舞蹈更是没得说，动作娴熟有力，节奏欢快，粉丝表示视频一开始潘玮柏的动作就有莫名的喜感，dancer们也不负众望，配合小丑搞怪表情。秒拍最后潘玮柏舞蹈动作也收的很利索，由此可见潘帅的舞蹈功底真不是盖的！\r\n\r\n  潘玮柏虽已不是新生代歌手了，但是他的不断进步和新专辑的面世让更多的群众喜欢上了这位优雅有才华的小王子，秒拍视频发布至目前播放量高达66万余次，潘玮柏是众所周知的音乐才子，高超的Rap技术，更是具有创作才能，再加上青春无厘头的个性，更广受大众的喜爱，新专辑主打歌MV《王者丑生》昨日首次发布便广受好评，小丑原本是可爱的造型，可是潘帅演绎的小丑有一种让人心疼伤感的情绪，秒拍中也可以听到这首歌，虽然依旧是潘帅擅长的快节奏歌曲，但可以看出潘帅为新专辑付出很多，进步很大。\r\n\r\n  歌迷们看到秒拍舞蹈后按捺不住激动的情绪粉粉评论到“怎么可以这么帅，哪里都有你，你是我生活中的必须品”“玮柏，真羡慕你这么简单真实，每次都是给我们满满的期待和惊喜，太帅了，棒死了,《王者丑生》大卖。”更有网友表示从来不后悔把潘帅作为自己的偶像，王者丑生，新作品真的很赞。想知道潘帅新专辑的动态和签售会，那就继续关注秒拍吧。', '2014-05-22');
INSERT INTO `news` VALUES ('3', '张敬轩邀黄伟文写新专辑主打歌与卫诗雅十年后再合作', '5月1日，张敬轩、黄秋生、方皓玟等出席舞台剧《EQUUS马》发布会，宣布舞台剧加开三场演出，更即席预演剧中两场剧目。受访时，黄秋生直言临近正式演出而感压力大，而张敬轩则透露会与方皓玟将近全裸演出，并与对方有火辣亲热戏。\r\n\r\n　　张敬轩、黄秋生、方皓玟、导演甄咏蓓等在香港出席舞台剧《EQUUS马》发布会，宣布因售票反应热烈，而加开三场演出，门票将于5月2日公开发售,发布会上演员们更即席预演剧中两场剧目,另外当天刚巧是方皓玟生日,众人为其安排生日蛋糕庆生。张敬轩在剧中饰演疯狂恋马的青年，挑战自己演技,受访时，他透露与对手方皓玟将会有火辣亲热戏，两人更会将近全裸演出：“我们会有将近全裸的戏份，裸露程度接近九成,而且会有火辣的亲密戏份，但不是卖弄色情,重要部位会被遮盖。”方皓玟更笑言张敬轩“秀色可餐”：“轩仔皮肤白滑，我代替了一众粉丝满足亲近他的欲望。排戏时,我们都流了很多汗,但轩仔完全没有汗臭,反而有体香。”问到采排亲热戏份时是否感到很大挑战？张敬轩表示：“排练时最大的压力来源是黄秋生老师，因为排练时他一直在后面看，本来大家也已经差不多脱光光了，而秋生对肢体动作是非常敏感的，所以一直担心他看得不够过瘾。”黄秋生闻言即表示：“我看得非常过瘾。”问到张敬轩是否需要节食减肥,务求以最佳体态示人?他表示：“因为我太瘦了,从开始排戏我就一直努力增磅,把体重增加了十二磅,但可惜早前我患病了,令我瘦了5磅,我很不开心,但不要紧,我会继续努力,而且最有看头的是另外扮演马匹的一众演员。”\r\n\r\n　　对于舞台剧将于于5月9日进行公演,离开演出大约只有一星期时间，心惰会否感到紧张？在剧中饰演精神科医生的黄秋生坦言压力大：“会,很紧张,需要背颂长篇的对白,也感到压力很大,届时还要配合剧场、观众,要顾及的东西很多。”张敬轩也表示：“因为本身这舞台剧是世界著名的著作,翻译的过程要很小心,在我们上台的一刻前还在优化剧本的对白。”\r\n\r\n　　由于舞台剧《EQUUS马》公演的时间刚巧与梁洛施演出的另一套舞台剧档期相撞,问到会否怕与好友“打对台”,张敬轩坦言：“不会，毕竟剧种不同，如果有时间,我也想去看她的演出，很期待她复出后的第一部作品，建议大家两套也看。”', '2014-05-18');
INSERT INTO `news` VALUES ('4', '\"亚洲流行天王\"周杰伦:\"最爱篮球 运动让我更有活力\"', '  “南京，我来过好几次，去年11月才在这里办过演唱会。”日前，周杰伦在接受本报记者采访时表示，每次来南京，都能感觉到这里的歌迷很热情、很有活力。\r\n   周杰伦，华语流行歌手、著名音乐人，有“亚洲流行天王”之称，是继张惠妹、滨崎步之后，第三位出现在美国时代杂志封面的亚洲艺人，也是首位获此殊荣的亚洲男歌手。\r\n   自出道以来，周杰伦一直给歌迷阳光、健康的形象，时刻充满了热情和活力。“运动可以让自己更健康，人的外表也会看起来更年轻。”周杰伦说，自己喜欢呼朋引伴一起运动，用互动、激励的方式给彼此鼓励，这也是运动的魅力所在。\r\n   说起与体育的不解之缘，周杰伦笑言，小时候最爱的运动是篮球，一下课就和同学们往篮球场冲去，后来还拍过有关篮球的电影。\r\n  “最近会有朋友找我打网球，也算是个新尝试。”谈起南京青奥会以及青奥会对青少年的影响，周杰伦说，南京举办青奥会，会让这座城市更加充满热情和活力，期待世界青少年相聚南京，一起感受运动带给大家的快乐。', '2014-05-27');
INSERT INTO `news` VALUES ('5', '王力宏预备当爸爸 粉丝爱屋及乌送红酒', '粉丝爱屋及乌，生日礼物中还有一瓶红酒，瓶身上金雕了王力宏和太太李靓蕾的照片，祝福偶像“幸福久久、快乐久久！”而因为有一段时间没有和台湾歌迷会的粉丝们见面，王力宏超兴奋，不但是对歌迷的问题有问必答，还留到最后和歌迷一起清理会场！他每年会在各地举办免费的福利秀，开放歌迷点歌，福利秀LIVE专辑28日开始预购，6月25日正式发行。', '2014-05-26');
INSERT INTO `news` VALUES ('6', '蔡依林加盟《中国好舞蹈》', '   《中国好舞蹈》拷贝《中国好声音》赛制，导师考核战役即将打响，郭富城力邀蔡依林作为自己的梦想导师。\r\n蔡依林19岁才开始接触舞蹈，弯腰手触不到地，还常常同手同脚，被断言根本不是跳舞的料。但凭借不断地练习，如今的蔡依林从hiphop、爵士、雷鬼，跳到芭蕾和现代舞，堪称“全能舞后”。节目组透露，蔡依林几乎是毫不犹豫地接受了自己偶像郭富城的邀请，她的最爱是新疆“小男神”苏来提。\r\n   海清和金星的梦想导师还未决定，孙红雷和李宇春都是热门人选。第五期节目中霹雳舞老男孩陈立江和孙琪在舞台上讲述了当年和孙红雷同在明星霹雳舞团跳舞的故事，第二天孙红雷转发并评论了陈立江的微博：“经常想念大家……”他与海清共同主演的电视剧于近日杀青，海清透露她打探过孙红雷的口风：“我跟他提过（好舞蹈），他说他非常愿意来。”这次观众也许有眼福看看孙红雷的霹雳舞英姿了？', '2014-05-27');
INSERT INTO `news` VALUES ('7', '侧田喜欢玩爵士', '香港歌手侧田现身佛山某品牌活动，为5月20日在佛山明珠体育馆举办的“侧田520我爱你”爵士音乐会造势。此次佛山演唱会将邀请爵士乐团M A PLEJA ZZBA N D及香港组合CA llStar前来助阵。侧田表示：“我的粉丝应该喝着红酒看我唱爵士版的《决战二世祖》，就是那种派对感觉，哈哈！”', '2014-05-20');
INSERT INTO `news` VALUES ('31', '很怀念', 'null哈哈哈哈哈', '2014-05-01');
INSERT INTO `news` VALUES ('37', '请问', '<p>请问请问企鹅全文</p>', '2015-03-24');
INSERT INTO `news` VALUES ('39', 'asdasdasd', '<p>asdasdasd</p>', '2015-03-28');
INSERT INTO `news` VALUES ('45', '姚贝娜追思会冯小刚致哀思 陈楚生隔空对唱', '<p>4月2日晚,姚贝娜追思会在北京751举行。姚贝娜众多亲友及华谊兄弟传媒股份有限公司总裁王中磊、导演冯小刚、华谊音乐董事总经理袁涛、深圳广电\r\n集团总编辑苏会军、音乐人捞仔陈楚生、崔迪、孙凌生到场缅怀,用音乐为姚贝娜送行以致哀思,姚贝娜父亲姚峰上台致辞。为了让更多无法前往现场的歌迷表达对\r\n姚贝娜的思念之情,深圳卫视将于4月5日全程转播此次追思会。</p><p>好友用歌声送别姚贝娜 父亲姚峰登台致辞</p><p>追思会用珍贵影像追述\r\n了姚贝娜的一生,视频中姚贝娜阳光活泼、笑声朗朗,如同未曾离去一样。“我是最短暂的花朵,也是最长久的琥珀”,姚贝娜曾用这首《心火》表达了自己对命运\r\n的不屈,而这首歌也成为她短暂而又不平凡一生的真实写照。当晚,《心火》的曲作者与制作人崔迪用钢琴演绎了这首歌曲,让大家在温暖又充满力量的歌声里缅怀\r\n这位用生命歌唱的灵魂歌者。歌手陈楚生则用特别的方式与姚贝娜隔空对唱了两人合作的歌曲《快乐不过是你想做的而已》,音乐响起,两道追光,一束映衬陈楚\r\n生,而另一束光芒则照向鲜花环绕的麦架,姚贝娜的原声在现场环响起来时,让人唏嘘不已。之后,果味VC主唱孙凌生献唱了姚贝娜首张专辑主打歌《小头发》,\r\n这也是姚贝娜生前钟爱的作品之一。</p><p>姚贝娜的父亲姚峰登台致辞,作为著名音乐人,他为女儿创作的《姐姐》由姚贝娜的妹妹李雨君在追思会最后深情献唱,借此表达了家人对她的思念与不舍之情。</p><p>去往另一个春天 永远温暖的思念</p><p>王\r\n中磊、冯小刚、袁涛、捞仔、深圳广电集团总编辑苏会军分别登台致辞以致哀思,在朋友们看来,对挚爱音乐的姚贝娜来说,音乐永远是最好的礼物。此次追思会场\r\n地选在姚贝娜生前最后一张专辑《1/2的我》首唱会的舞台,在这里姚贝娜曾与众多喜爱她的朋友分享自己的音乐人生,用撼动灵魂的音乐传递她的乐观与坚强。</p>', '2015-04-17');
INSERT INTO `news` VALUES ('46', '邓紫棋翻唱的《喜欢你》已加入广场舞豪华套餐', '邓紫棋在《我是歌手2》中翻唱的《喜欢你》最近突然大火起来，成为广场舞大妈们的必跳曲目。昨早有网友晒出相关微博截图，并总结道：“邓紫棋演唱的《喜欢你》火到什么程度，不妨来看看：不分地域，国内演唱会从南到北场场大合唱，就连西藏也有了藏语版本；漂洋过海到了美国马来西亚新加坡，依然大合唱；上到五六十岁大伯，下到两三岁小孩，甚至热衷广场舞的大妈们，也是这么喜欢邓版《喜欢你》！”\r\n\r\n\r\n　　邓紫棋版的《喜欢你》居然走进广场舞，让广场舞霸主凤凰传奇感觉到危机，玲花发微博表达忧伤：“莫名的感觉自己华丽丽的广场舞女神位置有点保不住了。现实太残酷，敌人太凶猛。”邓紫棋则转发安慰：“广场舞女神，你不必忧伤~你可是个传奇呢！人家只是个……泡沫……”\r\n\r\n网友们调侃：“你是我天边最美的泡沫，让我把你留下来！！！留下来！！！”“哈哈哈哈哈笑岔了！两个段子手，反正二十年后都要一起去跳广场舞的~~”“邓紫棋已加入广场舞豪华套餐。”', '2015-04-17');
INSERT INTO `news` VALUES ('47', '林俊杰凭借新曲《可惜没如果》夺双榜冠军', '“金曲歌王”林俊杰即将于明日(27日)推出2014年全新专辑《新地球》，受万众期待的新专辑蓄势待发;今日再传佳绩，专辑重磅情歌主打《可惜没如果》蝉联流行指数第一名两周后，于今日空降港台榜冠军。截至目前，已曝光的两首情歌均取得不凡的好成绩，再次体现出JJ对音乐的超高要求，专辑歌曲首首均为主打。\r\n\r\n　　JJ林俊杰的歌，总是可以让人触发内心最感性的那一面，并且与自己的感受互勉。首波以科幻寓言式体裁，借以对“未来”世界的想象，而触发人心保有最初温暖的气势主打歌《新地球》一举拿下数榜冠军?? “全球流行音乐金榜”、“城市至尊音乐榜”、“全球中文音乐榜上榜”、“东南音乐劲爆榜”、“QQ音乐巅峰榜港台”、“QQ音乐巅峰榜流行指数”。而大家最期盼的JJ式情歌??《可惜没如果》再度以温柔却真切的创作与嗓音，让每一个曾经有过“遗憾”的听者莫不心恸;也在推出首周便上升至QQ MUSIC流行指数第一名，更于推出一周的今日空降港台榜冠军。“林”式情歌于今冬再次强势侵袭华语乐坛。\r\n\r\n　　值得一提的是，圣诞节前夕在台北召开发片记者会的JJ收获了华纳音乐送上的“新地球圣诞树”，除了时间颇为应景，也有JJ继第1张专辑《乐行者》中《星球》一曲撒下种子后，至今总算长成茁壮《新地球》的意义!而这张让歌迷翘首期盼一年半的第十一张新专辑《新地球》即将于明日(27日)数位实体同步发行，这也将成为华语乐坛岁末又一重磅力作;华纳音乐诚意推荐，敬请期待!', '2015-04-17');
INSERT INTO `news` VALUES ('48', '测试', '测试', '2015-04-17');
INSERT INTO `news` VALUES ('49', '测试', '测试', '2015-04-17');
INSERT INTO `news` VALUES ('50', '测试', '测试', '2015-04-17');
INSERT INTO `news` VALUES ('51', 'test', '<p>Initial content</p>', '2015-04-20');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `creditcard` varchar(255) DEFAULT NULL,
  `identitycard` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `upic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userfk1` (`creditcard`),
  CONSTRAINT `userfk1` FOREIGN KEY (`creditcard`) REFERENCES `creditcard` (`cardnum`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('18', '3', '1', '5555555544444333333', '440654865412345678', '13902840585', 'upload/userimg/IMG_20140724_110954.jpg');
INSERT INTO `user` VALUES ('19', '4', '1', null, null, null, null);
INSERT INTO `user` VALUES ('23', '哈哈哈', '123', null, null, null, null);
INSERT INTO `user` VALUES ('31', '123456', '123', '5555555544444333332', '440682199210206016', '13902840123', null);
INSERT INTO `user` VALUES ('32', '1', '111', '5555555544444333332', '440682199210206016', '13902840123', null);
INSERT INTO `user` VALUES ('33', '22', '1', '5555555544444333332', '440682199210206016', '13902840123', null);
