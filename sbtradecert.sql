/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50510
Source Host           : localhost:3306
Source Database       : sbtradecert

Target Server Type    : MYSQL
Target Server Version : 50510
File Encoding         : 65001

Date: 2011-04-30 16:24:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `control`
-- ----------------------------
DROP TABLE IF EXISTS `control`;
CREATE TABLE `control` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `reading` int(10) NOT NULL,
  `converting` int(10) NOT NULL,
  `capturing` int(10) NOT NULL,
  `sending` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of control
-- ----------------------------
INSERT INTO `control` VALUES ('1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `email_info`
-- ----------------------------
DROP TABLE IF EXISTS `email_info`;
CREATE TABLE `email_info` (
  `id` int(10) NOT NULL,
  `host` varchar(20) NOT NULL DEFAULT '',
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of email_info
-- ----------------------------
INSERT INTO `email_info` VALUES ('1', 'pop.gmail.com', 'ivanren1989@gmail.com', '123456');
INSERT INTO `email_info` VALUES ('2', 'pop.gmail.com', 'ivanren1989@gmail.com', '123456');

-- ----------------------------
-- Table structure for `location_signature`
-- ----------------------------
DROP TABLE IF EXISTS `location_signature`;
CREATE TABLE `location_signature` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `imageWidth` int(10) NOT NULL,
  `imageHeight` int(10) NOT NULL,
  `cutTop` int(10) NOT NULL,
  `cutLeft` int(10) NOT NULL,
  `dropWidth` int(10) NOT NULL,
  `dropHeight` int(10) NOT NULL,
  `imageZoom` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of location_signature
-- ----------------------------
INSERT INTO `location_signature` VALUES ('18', '503', '711', '456', '276', '200', '100', '0.5065711670086436', 'barcode');
INSERT INTO `location_signature` VALUES ('29', '764', '1079', '649', '192', '120', '120', '0.769866926072443', 'signature');

-- ----------------------------
-- Table structure for `mailservice`
-- ----------------------------
DROP TABLE IF EXISTS `mailservice`;
CREATE TABLE `mailservice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mailcode` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mailservice
-- ----------------------------
INSERT INTO `mailservice` VALUES ('1', '123123123');
INSERT INTO `mailservice` VALUES ('2', '123123');
INSERT INTO `mailservice` VALUES ('5', '1tbiAQ0Un0usaaQxoAAAs8');
INSERT INTO `mailservice` VALUES ('6', '1tbiAQ0Un0usaaQxoAABs9');
INSERT INTO `mailservice` VALUES ('7', 'ZC1122hhPz6kohSEW_4WIR58W_1w87');
INSERT INTO `mailservice` VALUES ('8', 'ZC2223G7_5BkZWSfumA~qIvsQM0A61');
INSERT INTO `mailservice` VALUES ('9', 'ZC0704pQqTEU0qRkWyOXT3kSmHAg39');
INSERT INTO `mailservice` VALUES ('10', 'ZC0607Tg35PJ1kQZ6Tig6N5DuMBA57');
INSERT INTO `mailservice` VALUES ('11', 'ZC1407uPMeERLVT9e0kUkGdzyZ2w40');
INSERT INTO `mailservice` VALUES ('12', 'ZC2007o3P6TZr4R7G4B50C_HnhKQ06');
INSERT INTO `mailservice` VALUES ('13', 'ZC1107SIFhuvRET4iqRsTpFiRqPA95');
INSERT INTO `mailservice` VALUES ('14', 'ZC1709mIiRIilRRUyi2VxykOzcPQ13');
INSERT INTO `mailservice` VALUES ('15', 'ZC2502jo_pqtNuTu~tFqNKQoUr1Q06');
INSERT INTO `mailservice` VALUES ('16', 'ZC1314f7ds8EiJQemsjMeB64VKzA07');
INSERT INTO `mailservice` VALUES ('17', 'ZC1607Fdt4oiC5TXetUc~u9LmDMQ09');
INSERT INTO `mailservice` VALUES ('18', 'ZC2507JS0Lb1uNQMW1LF6ngGXKyQ09');
INSERT INTO `mailservice` VALUES ('19', 'ZC1108TMP2PJMdQ56zeJN0Klneow09');
INSERT INTO `mailservice` VALUES ('20', 'ZC1610Q6PnoipAS~SLpYlChlQktw09');
INSERT INTO `mailservice` VALUES ('21', 'ZL0917QxPfCmmeTpeLq4ln6XrZoQ09');
INSERT INTO `mailservice` VALUES ('22', 'ZL0112NlKGFHULTfG0WVFuImFlzw13');
INSERT INTO `mailservice` VALUES ('23', 'ZC2202-4pwJQKzVaNlPIDV441Erc14');
INSERT INTO `mailservice` VALUES ('24', 'ZC1010KbLGYfDmTeCFKhmljGQbUw14');
INSERT INTO `mailservice` VALUES ('25', 'ZL22107S1gxjxWQVGu3PPT0BKpxw14');
INSERT INTO `mailservice` VALUES ('26', 'GmailId12f79852626270cc');
INSERT INTO `mailservice` VALUES ('27', 'GmailId12f7985ad43db976');
INSERT INTO `mailservice` VALUES ('28', 'ZC2421-t8l5J8s80GHOZ3I_AbBKP14');
INSERT INTO `mailservice` VALUES ('29', 'ZC2621-zbMMZ4t8kyKNKz5zzSJdO14');
INSERT INTO `mailservice` VALUES ('30', 'ZC3022-fgCO4Q2ExXTEWE0AzPVrG14');
INSERT INTO `mailservice` VALUES ('31', 'GmailId12f79adc3e2f93ae');
INSERT INTO `mailservice` VALUES ('32', 'GmailId12f79b9ba556e23d');
INSERT INTO `mailservice` VALUES ('33', 'GmailId12f79ba0c02a7e00');

-- ----------------------------
-- Table structure for `member_image`
-- ----------------------------
DROP TABLE IF EXISTS `member_image`;
CREATE TABLE `member_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `imagename` varchar(20) NOT NULL,
  `received` int(10) NOT NULL DEFAULT '0',
  `converted` int(10) NOT NULL DEFAULT '0',
  `captured` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member_image
-- ----------------------------
INSERT INTO `member_image` VALUES ('58', '4', '20110421165213649', '1', '1', '1');
INSERT INTO `member_image` VALUES ('59', '4', '20110421165228448', '1', '1', '1');
INSERT INTO `member_image` VALUES ('60', '4', '20110421165234351', '1', '1', '1');
INSERT INTO `member_image` VALUES ('61', '5', '20110421165402247', '1', '1', '1');
INSERT INTO `member_image` VALUES ('62', '5', '20110421165405231', '1', '1', '1');
INSERT INTO `member_image` VALUES ('63', '5', '20110429003356808', '1', '1', '1');
INSERT INTO `member_image` VALUES ('64', '4', '20110429003925946', '1', '1', '1');

-- ----------------------------
-- Table structure for `member_info`
-- ----------------------------
DROP TABLE IF EXISTS `member_info`;
CREATE TABLE `member_info` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(15) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `lastname` varchar(20) NOT NULL,
  `firstname` varchar(30) CHARACTER SET gbk NOT NULL,
  `level` char(20) CHARACTER SET gbk NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of member_info
-- ----------------------------
INSERT INTO `member_info` VALUES ('4', 'wr', 'wr', 'Ren', 'W', 'Client', 'comforter1989@gmail.com');
INSERT INTO `member_info` VALUES ('2', 'test2', 'test2', 'Wei', 'Ren', 'Administrator', 'comforter1989@hotmail.com');
INSERT INTO `member_info` VALUES ('5', 'test', 'test', 'hh', 'gg', 'Client', 'ivanren1989@vip.qq.com');

-- ----------------------------
-- Table structure for `member_signature`
-- ----------------------------
DROP TABLE IF EXISTS `member_signature`;
CREATE TABLE `member_signature` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(4) NOT NULL,
  `name` varchar(20) NOT NULL,
  `issend` int(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member_signature
-- ----------------------------
INSERT INTO `member_signature` VALUES ('34', '4', '20110421165213649', '1');
INSERT INTO `member_signature` VALUES ('35', '4', '20110421165228448', '1');
INSERT INTO `member_signature` VALUES ('36', '4', '20110421165234351', '1');
INSERT INTO `member_signature` VALUES ('37', '5', '20110421165402247', '1');
INSERT INTO `member_signature` VALUES ('38', '5', '20110421165405231', '1');
INSERT INTO `member_signature` VALUES ('39', '0', '20110410212119937', '0');
INSERT INTO `member_signature` VALUES ('40', '0', '20110410212122296', '0');
INSERT INTO `member_signature` VALUES ('41', '0', '20110410212208671', '0');
INSERT INTO `member_signature` VALUES ('42', '0', '20110410212211109', '0');
INSERT INTO `member_signature` VALUES ('43', '4', '20110429003925946', '0');
