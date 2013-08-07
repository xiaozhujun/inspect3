/*
MySQL Data Transfer
Source Host: localhost
Source Database: inspect2
Target Host: localhost
Target Database: inspect2
Date: 2013/8/5 15:06:06
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ao06wunawb79tv8k153deuffs` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `devname` varchar(255) DEFAULT NULL,
  `numbers` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4x06iikus7mjhywnn6bbqbogr` (`devname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for device_inspect_rec
-- ----------------------------
DROP TABLE IF EXISTS `device_inspect_rec`;
CREATE TABLE `device_inspect_rec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rvalue` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `device` bigint(20) DEFAULT NULL,
  `item` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_du7etx4eyeowqeb1r0qp9ev1d` (`device`),
  KEY `FK_qf3gttybim1q1rl6y3bpp2yet` (`item`),
  CONSTRAINT `FK_du7etx4eyeowqeb1r0qp9ev1d` FOREIGN KEY (`device`) REFERENCES `device` (`id`),
  CONSTRAINT `FK_qf3gttybim1q1rl6y3bpp2yet` FOREIGN KEY (`item`) REFERENCES `inspect_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_item
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item`;
CREATE TABLE `inspect_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_input` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `numbers` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `inspecttable` bigint(20) DEFAULT NULL,
  `tag` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h0c2pfh5tlc0a7bi2i9qlw2b3` (`inspecttable`),
  KEY `FK_3c40lacsh8tgd6hx7lmp48njf` (`tag`),
  KEY `UK_k5ssfu64ttmdgxoekhscaifcp` (`name`),
  CONSTRAINT `FK_3c40lacsh8tgd6hx7lmp48njf` FOREIGN KEY (`tag`) REFERENCES `inspect_tag` (`id`),
  CONSTRAINT `FK_h0c2pfh5tlc0a7bi2i9qlw2b3` FOREIGN KEY (`inspecttable`) REFERENCES `inspect_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_item_rec
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item_rec`;
CREATE TABLE `inspect_item_rec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `ivalue` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `inspecttable` bigint(20) DEFAULT NULL,
  `inspecttablerecord` bigint(20) DEFAULT NULL,
  `item` bigint(20) DEFAULT NULL,
  `tag` bigint(20) DEFAULT NULL,
  `worker` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6aaepgs4cp4oa971wr1ydk4k` (`inspecttable`),
  KEY `FK_1ph99j2bn6ue1pyaclfhnpy6n` (`inspecttablerecord`),
  KEY `FK_h4dwsl17l6wrjb3457nijp2qr` (`item`),
  KEY `FK_iku4nx03nc7lyu2dulyedrb23` (`tag`),
  KEY `FK_s68fs290hou07u7jtkphl6umi` (`worker`),
  CONSTRAINT `FK_1ph99j2bn6ue1pyaclfhnpy6n` FOREIGN KEY (`inspecttablerecord`) REFERENCES `inspect_table_record` (`id`),
  CONSTRAINT `FK_6aaepgs4cp4oa971wr1ydk4k` FOREIGN KEY (`inspecttable`) REFERENCES `inspect_table` (`id`),
  CONSTRAINT `FK_h4dwsl17l6wrjb3457nijp2qr` FOREIGN KEY (`item`) REFERENCES `inspect_item` (`id`),
  CONSTRAINT `FK_iku4nx03nc7lyu2dulyedrb23` FOREIGN KEY (`tag`) REFERENCES `inspect_tag` (`id`),
  CONSTRAINT `FK_s68fs290hou07u7jtkphl6umi` FOREIGN KEY (`worker`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_item_record
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item_record`;
CREATE TABLE `inspect_item_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `ivalue` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `inspecttable` bigint(20) DEFAULT NULL,
  `inspecttablerec` bigint(20) DEFAULT NULL,
  `item` bigint(20) DEFAULT NULL,
  `tag` bigint(20) DEFAULT NULL,
  `worker` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kjj7eackk2snu4wykrjlta8qb` (`inspecttable`),
  KEY `FK_rdglc9tqbmgt7uege9y5y4vmd` (`inspecttablerec`),
  KEY `FK_rm05qmyx6msx2yl6udavd9vpv` (`item`),
  KEY `FK_n9y4xwnqha8dmd2ui95wmgf1x` (`tag`),
  KEY `FK_g2y51nqaubnfhot9sgcws53sq` (`worker`),
  CONSTRAINT `FK_g2y51nqaubnfhot9sgcws53sq` FOREIGN KEY (`worker`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_kjj7eackk2snu4wykrjlta8qb` FOREIGN KEY (`inspecttable`) REFERENCES `inspect_table` (`id`),
  CONSTRAINT `FK_n9y4xwnqha8dmd2ui95wmgf1x` FOREIGN KEY (`tag`) REFERENCES `inspect_tag` (`id`),
  CONSTRAINT `FK_rdglc9tqbmgt7uege9y5y4vmd` FOREIGN KEY (`inspecttablerec`) REFERENCES `inspect_table_record` (`id`),
  CONSTRAINT `FK_rm05qmyx6msx2yl6udavd9vpv` FOREIGN KEY (`item`) REFERENCES `inspect_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3363 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_item_tvalues
-- ----------------------------
DROP TABLE IF EXISTS `inspect_item_tvalues`;
CREATE TABLE `inspect_item_tvalues` (
  `inspect_item` bigint(20) NOT NULL,
  `tvalues` bigint(20) NOT NULL,
  PRIMARY KEY (`inspect_item`,`tvalues`),
  KEY `FK_8jxa1h431p7tqs4b2wanrm8oe` (`tvalues`),
  KEY `FK_4da1bkas688u4n2k0bu96yvc7` (`inspect_item`),
  CONSTRAINT `FK_4da1bkas688u4n2k0bu96yvc7` FOREIGN KEY (`inspect_item`) REFERENCES `inspect_item` (`id`),
  CONSTRAINT `FK_8jxa1h431p7tqs4b2wanrm8oe` FOREIGN KEY (`tvalues`) REFERENCES `tvalue` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_table
-- ----------------------------
DROP TABLE IF EXISTS `inspect_table`;
CREATE TABLE `inspect_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `trole` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_trtmbfd3ggm0rl42arffggs2x` (`tname`),
  KEY `FK_lq8vjkib67191ykl59kudee54` (`trole`),
  CONSTRAINT `FK_lq8vjkib67191ykl59kudee54` FOREIGN KEY (`trole`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_table_record
-- ----------------------------
DROP TABLE IF EXISTS `inspect_table_record`;
CREATE TABLE `inspect_table_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `faultcount` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `inspecttable` bigint(20) DEFAULT NULL,
  `worker` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pwp9mcl0v0jryu3vlapanxsvx` (`inspecttable`),
  KEY `FK_c4ieqdxf51jx6ektjbxcl91pu` (`worker`),
  CONSTRAINT `FK_c4ieqdxf51jx6ektjbxcl91pu` FOREIGN KEY (`worker`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pwp9mcl0v0jryu3vlapanxsvx` FOREIGN KEY (`inspecttable`) REFERENCES `inspect_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2491 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for inspect_tag
-- ----------------------------
DROP TABLE IF EXISTS `inspect_tag`;
CREATE TABLE `inspect_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `numbers` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cmrpfajlnt3jedb9oj02j08aa` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jdhyvh8di85ai37phukfemdnx` (`rolename`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tvalue
-- ----------------------------
DROP TABLE IF EXISTS `tvalue`;
CREATE TABLE `tvalue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tvalue` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `birth` datetime DEFAULT NULL,
  `useraddress` varchar(255) DEFAULT NULL,
  `userage` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userpwd` varchar(255) DEFAULT NULL,
  `usersex` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `dept` bigint(20) DEFAULT NULL,
  `urole` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`),
  KEY `FK_nlyejtjg4m0mas1rn2pa7rb2w` (`dept`),
  KEY `FK_8v6by5ucw8v8q5be6n615iylc` (`urole`),
  CONSTRAINT `FK_8v6by5ucw8v8q5be6n615iylc` FOREIGN KEY (`urole`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_nlyejtjg4m0mas1rn2pa7rb2w` FOREIGN KEY (`dept`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '2013-07-16 00:00:00', '部门1的描述', '部门1', '0');
INSERT INTO `dept` VALUES ('2', '2011-07-03 00:00:00', '部门2的描述', '部门2', '0');
INSERT INTO `dept` VALUES ('3', '2008-08-03 00:00:00', '部门3的描述', '部门3', '0');
INSERT INTO `dept` VALUES ('4', '2009-07-27 00:00:00', '部门4的描述', '部门4', '0');
INSERT INTO `dept` VALUES ('5', '2013-07-21 00:00:00', '部门5的描述', '部门5', '0');
INSERT INTO `inspect_item` VALUES ('53', 'false', '2011-07-10 00:00:00', '', '手动铁鞋、锚定', '12212', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('54', 'false', '2013-07-14 00:00:00', '', '行走台车', '123132312', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('55', 'false', '2009-07-15 00:00:00', '', '电动铁鞋', '121212', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('56', 'false', '2010-07-20 00:00:00', '', '行走防撞缓冲器', '21221', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('57', 'false', '2007-07-09 00:00:00', '', '行走电机护栏', '121312', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('58', 'false', '2008-07-15 00:00:00', '', '行走减速箱', '123121', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('59', 'false', '2007-07-18 00:00:00', '', '行走开式齿轮', '121312', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('60', 'false', '2007-07-12 00:00:00', '', '抓斗', '1213123', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('61', 'false', '2009-07-22 00:00:00', '', '钢丝绳及卸扣', '12312312', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('62', 'false', '2007-07-17 00:00:00', '', '旋转齿轮、齿圈', '1211', '', '0', '5', '2');
INSERT INTO `inspect_item` VALUES ('63', 'false', '2005-07-12 00:00:00', '', '旋转制动器', '12112123', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('64', 'false', '2013-07-08 00:00:00', '', '旋转减速器', '2131221', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('65', 'false', '2006-07-04 00:00:00', '', '旋转电机、风机', '21212', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('66', 'false', '2002-07-10 00:00:00', '', '起升制动器', '211212', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('67', 'false', '2006-07-14 00:00:00', '', '卷筒及钢丝绳', '1221', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('68', 'false', '2013-07-17 00:00:00', '', '起升减速箱', '121312', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('69', 'false', '2009-07-07 00:00:00', '', '起升电机、风机', '12312', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('70', 'false', '2008-08-11 00:00:00', '', '起升钢丝绳', '1212221', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('71', 'false', '2009-07-12 00:00:00', '', '集中滑油', '12121', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('72', 'false', '2006-07-06 00:00:00', '', '附属工具', '1221', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('73', 'false', '2013-07-11 00:00:00', '', '机房顶出绳口', '1221312', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('74', 'false', '2008-07-08 00:00:00', '', '变幅电机、风机', '121123', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('75', 'false', '2013-07-11 00:00:00', '', '变幅制动器', '12121', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('76', 'false', '2008-07-08 00:00:00', '', '变幅减速器', '1212133', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('77', 'false', '2008-07-14 00:00:00', '', '变幅齿轮、齿条、压轮', '12121', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('78', 'false', '2007-07-16 00:00:00', '', '变幅联轴节', '12312', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('79', 'false', '2002-07-09 00:00:00', '', 'S轮处', '1212', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('80', 'false', '2007-07-16 00:00:00', '', '各主要绞点', '123123', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('81', 'false', '2011-07-11 00:00:00', '', '各主要绞点', '122123', '', '0', '5', '2');
INSERT INTO `inspect_item` VALUES ('82', 'false', '2005-07-06 00:00:00', '', '各主要绞点', '12121', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('83', 'false', '2013-07-17 00:00:00', '', '各主要绞点', '1211', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('84', 'false', '2013-07-26 00:00:00', '', '梯子及栏杆', '12321', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('85', 'false', '2013-07-18 00:00:00', '', '梯子及栏杆', '112', '', '0', '5', '2');
INSERT INTO `inspect_item` VALUES ('86', 'false', '2013-07-18 00:00:00', '', '梯子及栏杆', '121312', '', '0', '5', '2');
INSERT INTO `inspect_item` VALUES ('87', 'false', '2013-07-11 00:00:00', '', '梯子及栏杆', '12121', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('88', 'false', '2013-07-17 00:00:00', '', '梯子及栏杆', '131212', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('89', 'false', '2013-07-17 00:00:00', '', '机房司机室卫生', '1221', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('90', 'false', '2013-07-17 00:00:00', '', '支持、开闭上升限位', '1221312', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('91', 'false', '2013-07-18 00:00:00', '', '变幅增幅、减幅限位', '11312', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('92', 'false', '2013-07-18 00:00:00', '', '高压电缆及电缆坑', '12312', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('93', 'false', '2005-07-05 00:00:00', '', '联动台指示灯', '21312312', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('94', 'false', '2013-07-26 00:00:00', '', '电气室空调', '1122', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('95', 'false', '2006-07-12 00:00:00', '', '行走声光报警', '12312', '', '0', '5', '1');
INSERT INTO `inspect_item` VALUES ('96', 'false', '2007-07-11 00:00:00', '', '机上照光灯', '11212', '', '0', '5', '2');
INSERT INTO `inspect_item` VALUES ('97', 'false', '2007-07-12 00:00:00', '', ' 机上照光灯', '2112', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('98', 'false', '2008-07-17 00:00:00', '', ' 机上照光灯', '11212', '', '0', '5', '4');
INSERT INTO `inspect_item` VALUES ('99', 'false', '2013-07-08 00:00:00', '', '行走左行、右行限位', '1212', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('100', 'false', '2007-07-15 00:00:00', '', '行走锚定限位', '122132', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('101', 'false', '2008-07-07 00:00:00', '', '行走防爬限位', '1212312', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('102', 'false', '2013-07-22 00:00:00', '', '行走电机', '121', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('103', 'false', '2008-07-07 00:00:00', '', '行走部分线管', '131312', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('104', 'false', '2013-07-11 00:00:00', '', '高压电缆及电缆架', '1221231', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('105', 'false', '2013-07-18 00:00:00', '', '电缆卷盘及导缆架', '1212', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('106', 'false', '2013-07-10 00:00:00', '', '行走声光报警', '123213', '', '0', '3', '1');
INSERT INTO `inspect_item` VALUES ('107', 'false', '2009-07-06 00:00:00', '', '中心受电器', '1212', '', '1', '3', '2');
INSERT INTO `inspect_item` VALUES ('108', 'false', '2008-07-07 00:00:00', '', '起升/开闭制动器打开限位', '12112', '', '1', '3', '3');
INSERT INTO `inspect_item` VALUES ('109', 'false', '2013-07-08 00:00:00', '', '起升/开闭上升、下降限位', '121231', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('110', 'false', '2013-07-09 00:00:00', '', '起升/开闭电机及风机', '2112', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('111', 'false', '2013-07-10 00:00:00', '', '各电器柜', '121', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('112', 'false', '2013-07-17 00:00:00', '', '电器柜照明', '112', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('113', 'false', '2013-07-12 00:00:00', '', '照明变压器', '231212', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('114', 'false', '2013-07-10 00:00:00', '', '旋转电机及风机', '1121', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('115', 'false', '2013-07-09 00:00:00', '', '旋转电机刹车', '1122', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('116', 'false', '2013-07-10 00:00:00', '', '联动台', '1221', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('117', 'false', '2013-07-09 00:00:00', '', '司机室空调', '11212', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('118', 'false', '2013-07-18 00:00:00', '', '监控器及重量幅度显示器', '1221', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('119', 'false', '2013-07-11 00:00:00', '', '电气空调', '1212', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('120', 'false', '2013-07-12 00:00:00', '', '机上照明灯', '21321', '', '0', '3', '4');
INSERT INTO `inspect_item` VALUES ('121', 'false', '2013-07-11 00:00:00', '', '航空灯', '122', '', '0', '3', '4');
INSERT INTO `inspect_item` VALUES ('122', 'false', '2013-07-12 00:00:00', '', '变幅增幅、减幅限位', '1221', '', '0', '3', '4');
INSERT INTO `inspect_item` VALUES ('123', 'false', '2013-07-11 00:00:00', '', '变幅电机及风机', '1231', '', '0', '3', '4');
INSERT INTO `inspect_item` VALUES ('124', 'false', '2013-07-10 00:00:00', '', '高压房', '1212', '', '0', '3', '2');
INSERT INTO `inspect_item` VALUES ('125', 'false', '2013-07-09 00:00:00', '', '司机室配电箱', '12124', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('126', 'false', '2013-07-18 00:00:00', '', '开闭斗脚踏', '12211', '', '0', '3', '3');
INSERT INTO `inspect_item` VALUES ('127', 'false', '2013-07-04 00:00:00', '', '1#走行减速箱', '123131', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('128', 'false', '2007-07-10 00:00:00', '', '2#减速机', '123123', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('129', 'false', '2013-07-12 00:00:00', '', '3#走行减速机', '2113', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('130', 'false', '2013-07-11 00:00:00', '', '4#走行减速机', '12212', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('131', 'false', '2013-07-11 00:00:00', '', '5#走行减速机', '1232312', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('132', 'false', '2013-07-11 00:00:00', '', '6#走行减速机', '21214', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('133', 'false', '2013-07-05 00:00:00', '', '7#走行减速机', '122112', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('134', 'false', '2013-07-04 00:00:00', '', '8#走行减速机', '12123', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('135', 'false', '2013-07-05 00:00:00', '', '左回转减速机', '12123', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('136', 'false', '2013-07-11 00:00:00', '', '右回转减速机', '2123', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('137', 'false', '2013-07-11 00:00:00', '', '支持绳减速机', '12331', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('138', 'false', '2013-07-11 00:00:00', '', '开闭绳减速机', '123123', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('139', 'false', '2013-07-17 00:00:00', '', '变幅用减速机', '21123', '', '0', '4', '1');
INSERT INTO `inspect_item` VALUES ('140', 'false', '2013-07-09 00:00:00', '', '铁鞋、锚定', '', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('141', 'false', '2006-07-10 00:00:00', '', '电动铁鞋', '1231', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('142', 'false', '2007-07-10 00:00:00', '', '卷缆装置', '12323', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('143', 'false', '2007-07-13 00:00:00', '', '行走台车', '1212', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('144', 'false', '2007-07-08 00:00:00', '', '驱动装置', '1211231', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('145', 'false', '2004-07-08 00:00:00', '', '行走轮', '11221', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('146', 'false', '2006-07-17 00:00:00', '', '极限开关', '11212', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('147', 'false', '2006-07-06 00:00:00', '', '报警装置', '11221', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('148', 'false', '2013-07-10 00:00:00', '', '齿轮齿圈', '112321', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('149', 'false', '2005-07-08 00:00:00', '', '旋转大轴承', '123122', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('150', 'false', '2003-07-17 00:00:00', '', '旋转大轴承', '123211', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('151', 'false', '2013-07-18 00:00:00', '', '极限联轴器', '212112', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('152', 'false', '2004-07-12 00:00:00', '', '电机及风机', '111212', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('153', 'false', '2013-07-16 00:00:00', '', '减速箱', '123123', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('154', 'false', '2005-07-11 00:00:00', '', '旋转制动器', '121212', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('155', 'false', '2007-07-10 00:00:00', '', '旋转锚定', '131212', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('156', 'false', '2009-07-16 00:00:00', '', '钢丝绳', '', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('157', 'false', '2008-07-15 00:00:00', '', '钢丝绳', '1221', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('158', 'false', '2007-07-17 00:00:00', '', '钢丝绳绳端', '1211', '', '1', '1', '1');
INSERT INTO `inspect_item` VALUES ('159', 'false', '2007-07-15 00:00:00', '', '滑轮', '1121221', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('160', 'false', '2004-07-12 00:00:00', '', '吊钩', '1111', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('161', 'false', '2013-07-18 00:00:00', '', '抓斗', '12242', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('162', 'false', '2008-07-14 00:00:00', '', '卷筒', '12424', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('163', 'false', '2008-07-09 00:00:00', '', '减速箱', '224242', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('164', 'false', '2004-07-12 00:00:00', '', '联轴器', '12322', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('165', 'false', '2002-07-22 00:00:00', '', '制动器', '42445', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('166', 'false', '2007-07-16 00:00:00', '', '电机及风机', '1122', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('167', 'false', '2005-07-05 00:00:00', '', '齿轮齿条', '4242', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('168', 'false', '2003-07-14 00:00:00', '', '减速箱', '4544654', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('169', 'false', '2004-07-08 00:00:00', '', '联轴器', '24542', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('170', 'false', '2005-07-07 00:00:00', '', '制动器', '56757', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('171', 'false', '2002-07-10 00:00:00', '', '电机及风机', '46546', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('172', 'false', '2013-07-08 00:00:00', '', '绞点', '2242', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('173', 'false', '2013-07-18 00:00:00', '', '绞点', '546434', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('174', 'false', '2006-07-06 00:00:00', '', '绞点', '645654', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('175', 'false', '2013-07-18 00:00:00', '', '绞点', '2423431', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('176', 'false', '2013-07-10 00:00:00', '', '栏杆及踏板', '34535', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('177', 'false', '2013-07-15 00:00:00', '', '栏杆及踏板', '435435', '', '1', '1', '2');
INSERT INTO `inspect_item` VALUES ('178', 'false', '2013-07-19 00:00:00', '', '栏杆及踏板', '6456456', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('179', 'false', '2013-07-19 00:00:00', '', '栏杆及踏板', '46456', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('180', 'false', '2013-07-17 00:00:00', '', '钢结构', '24234', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('181', 'false', '2013-07-18 00:00:00', '', '钢结构', '24454', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('182', 'false', '2013-07-26 00:00:00', '', '钢结构', '4523', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('183', 'false', '2006-07-10 00:00:00', '', '钢结构', '453454', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('184', 'false', '2007-07-12 00:00:00', '', '梯子栏杆', '55345', '', '0', '1', '1');
INSERT INTO `inspect_item` VALUES ('185', 'false', '2013-07-12 00:00:00', '', '梯子栏杆', '42424', '', '0', '1', '2');
INSERT INTO `inspect_item` VALUES ('186', 'false', '2013-07-12 00:00:00', '', '梯子栏杆', '3452', '', '0', '1', '3');
INSERT INTO `inspect_item` VALUES ('187', 'false', '2013-07-19 00:00:00', '', '梯子栏杆', '4555', '', '0', '1', '4');
INSERT INTO `inspect_item` VALUES ('188', 'false', '2013-07-03 00:00:00', '', '1#走行减速机', '2241', '', '1', '6', '1');
INSERT INTO `inspect_item` VALUES ('189', 'false', '2013-07-11 00:00:00', '', '2#走行减速机', '12442', '', '2', '6', '1');
INSERT INTO `inspect_item` VALUES ('190', 'false', '2013-07-19 00:00:00', '', '3#走行减速机', '42424', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('191', 'false', '2013-07-11 00:00:00', '', '4#走行减速机', '242424', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('192', 'false', '2013-07-11 00:00:00', '', '5#走行减速机', '2424', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('193', 'false', '2013-07-18 00:00:00', '', '6#走行减速机', '2424', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('194', 'false', '2013-07-11 00:00:00', '', '7#走行减速机', '11231', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('195', 'false', '2013-07-11 00:00:00', '', '8#走行减速机', '132112', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('196', 'false', '2013-07-04 00:00:00', '', '左回转减速机', '12321', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('197', 'false', '2013-07-12 00:00:00', '', '右回转减速机', '1224', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('198', 'false', '2013-07-11 00:00:00', '', '支持绳减速机', '1221', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('199', 'false', '2013-07-03 00:00:00', '', '开闭绳减速机', '1212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('200', 'false', '2013-07-12 00:00:00', '', '变幅用减速机', '13121', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('201', 'false', '2013-07-04 00:00:00', '', '压板左开闭', '42224', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('202', 'false', '2013-07-11 00:00:00', '', 'S轮段 磨损 左开闭', '22421', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('203', 'false', '2013-07-05 00:00:00', '', 'S轮段 断丝 左开闭', '452542', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('204', 'false', '2008-07-07 00:00:00', '', '象鼻梁端 左开闭 磨损', '21421', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('205', 'false', '2013-07-11 00:00:00', '', '象鼻梁端 左开闭 断丝', '542542', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('206', 'false', '2013-07-23 00:00:00', '', '绳头 左开闭', '', '', '1', '6', '1');
INSERT INTO `inspect_item` VALUES ('207', 'false', '2013-07-05 00:00:00', '', '卸扣 左开闭', '23121', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('208', 'false', '2013-07-09 00:00:00', '', '压板 右开闭', '2424', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('209', 'false', '2013-07-02 00:00:00', '', '压板 右支持', '12131', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('210', 'false', '2013-07-11 00:00:00', '', '压板 左支持', '12211', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('211', 'false', '2013-07-11 00:00:00', '', 'S轮段 磨损 右开闭', '13112111', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('212', 'false', '2008-07-14 00:00:00', '', ' S轮段 磨损 左支持', '21121', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('213', 'false', '2013-07-12 00:00:00', '', ' S轮段 磨损 右支持', '13112', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('214', 'false', '2013-07-17 00:00:00', '', ' S轮段 断丝 右开闭', '1121', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('215', 'false', '2013-07-12 00:00:00', '', ' S轮段 断丝 左支持', '121212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('216', 'false', '2007-07-15 00:00:00', '', ' S轮段 断丝 右支持', '2112', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('217', 'false', '2013-07-12 00:00:00', '', '象鼻梁段 磨损 右开闭', '1121', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('218', 'false', '2013-07-19 00:00:00', '', '象鼻梁段 磨损 左支持', '123121', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('219', 'false', '2007-07-16 00:00:00', '', '象鼻梁段 磨损 右支持', '1244', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('220', 'false', '2008-07-21 00:00:00', '', '象鼻梁段 断丝 右开闭', '1123', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('221', 'false', '2013-07-10 00:00:00', '', '象鼻梁段 断丝 左支持', '131231', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('222', 'false', '2013-07-12 00:00:00', '', '象鼻梁段 断丝 右支持', '11222', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('223', 'false', '2013-07-18 00:00:00', '', '绳头 右开闭', '1211', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('224', 'false', '2013-07-19 00:00:00', '', '绳头 左支持', '1121', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('225', 'false', '2013-07-10 00:00:00', '', '绳头 右支持', '21112', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('226', 'false', '2013-07-18 00:00:00', '', '卸扣 右开闭', '1212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('227', 'false', '2013-07-04 00:00:00', '', '卸扣 左支持', '1312123', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('228', 'false', '2013-07-18 00:00:00', '', '卸扣 右支持', '1211', '', '0', '5', '3');
INSERT INTO `inspect_item` VALUES ('229', 'false', '2007-07-16 00:00:00', '', '集中润滑油箱', '13311', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('230', 'false', '2013-07-09 00:00:00', '', '集中润滑管路泄露检查', '123121', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('231', 'false', '2013-07-12 00:00:00', '', '大齿圈', '131231', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('232', 'false', '2005-07-11 00:00:00', '', '变幅齿圈', '1312312', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('233', 'false', '2007-07-15 00:00:00', '', '行走驱动齿轮', '131212', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('234', 'false', '2013-07-18 00:00:00', '', '开闭减速箱输入输出轴', '1212312', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('235', 'false', '2004-07-12 00:00:00', '', '支持减速箱输入输出轴', '121221', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('236', 'false', '2013-07-25 00:00:00', '', '变幅减速箱输入输出轴', '1231231', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('237', 'false', '2007-07-16 00:00:00', '', '开闭减速箱高速联轴箱', '11212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('238', 'false', '2006-07-24 00:00:00', '', '开闭卷筒联轴箱', '213123', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('239', 'false', '2006-07-18 00:00:00', '', '支持减速箱高速联轴箱', '1112', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('240', 'false', '2013-07-10 00:00:00', '', '支持卷筒联轴器', '1231123', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('241', 'false', '2013-07-10 00:00:00', '', '开闭卷筒压绳器', '11212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('242', 'false', '2013-07-18 00:00:00', '', '支持卷筒压绳器', '123112', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('243', 'false', '2013-07-11 00:00:00', '', '象鼻梁钢丝绳托辊', '1221', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('244', 'false', '2013-07-17 00:00:00', '', '负荷取力装置绞点', '12111', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('245', 'false', '2006-07-10 00:00:00', '', '起升制动器绞点', '1211', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('246', 'false', '2013-07-23 00:00:00', '', '开闭制动器绞点', '112312', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('247', 'false', '2009-07-12 00:00:00', '', '变幅制动器绞点', '1231321', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('248', 'false', '2009-07-12 00:00:00', '', '回转制动器绞点', '11231', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('249', 'false', '2007-07-23 00:00:00', '', '脚踏制动器绞点', '1212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('250', 'false', '2007-07-10 00:00:00', '', '各电动铁鞋绞点', '11221', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('251', 'false', '2013-07-09 00:00:00', '', '大臂支座下左绞点开裂', '1211', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('252', 'false', '2007-07-09 00:00:00', '', '大臂支座下右绞点开裂', '121', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('253', 'false', '2005-07-13 00:00:00', '', '大臂上右绞点开裂', '', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('254', 'false', '2005-07-08 00:00:00', '', '大臂上左绞点开裂', '1211', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('255', 'false', '2013-07-17 00:00:00', '', '机房底根部开裂', '12111', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('256', 'false', '2007-07-18 00:00:00', '', '大齿圈根部开裂', '1212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('257', 'false', '2007-07-16 00:00:00', '', '象鼻梁尾部各U型槽根部开裂', '12112', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('258', 'false', '2004-07-22 00:00:00', '', '象鼻梁头部各U型槽根部开裂', '', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('259', 'false', '2003-07-22 00:00:00', '', '各机构制动器底座螺栓', '121123', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('260', 'false', '2013-07-08 00:00:00', '', '各机构制动器底座螺栓', '13121', '', '0', '6', '2');
INSERT INTO `inspect_item` VALUES ('261', 'false', '2006-07-10 00:00:00', '', '各机构制动器底座螺栓', '1122', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('262', 'false', '2003-07-23 00:00:00', '', '各机构制动器底座螺栓', '13121', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('263', 'false', '2005-07-14 00:00:00', '', '各机构电机底座螺栓', '121212', '', '0', '6', '1');
INSERT INTO `inspect_item` VALUES ('264', 'false', '2007-07-10 00:00:00', '', '各机构电机底座螺栓', '1221', '', '0', '6', '2');
INSERT INTO `inspect_item` VALUES ('265', 'false', '2005-07-12 00:00:00', '', '各机构电机底座螺栓', '121221', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('266', 'false', '2007-07-17 00:00:00', '', '各机构电机底座螺栓', '112212', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('267', 'false', '2006-07-10 00:00:00', '', '各机构电机底座螺栓', '1212', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('268', 'false', '2003-07-21 00:00:00', '', '支持开闭卷筒支座及轴承盖螺栓', '131221', '', '0', '6', '3');
INSERT INTO `inspect_item` VALUES ('269', 'false', '2008-07-21 00:00:00', '', '变幅摇架支座及轴承盖螺栓', '23112', '', '0', '6', '4');
INSERT INTO `inspect_item` VALUES ('270', 'false', '2013-07-22 00:00:00', '', '合斗时无异响，斗口无变形', '1121', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('271', 'false', '2006-07-03 00:00:00', '', '平衡梁、平衡块平衡良好，抓斗斗体无变形', '1231212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('272', 'false', '2013-07-23 00:00:00', '', '钢丝绳头连接处铝套、重型套环、卸扣无变形', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('273', 'false', '2008-07-14 00:00:00', '', '检查钢丝绳无断丝，楔头处无断丝', '131212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('274', 'false', '2009-07-13 00:00:00', '', '钢丝绳无断丝，绳头检查同上，钩头无变形', '11121', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('275', 'false', '2007-07-17 00:00:00', '', '电缆卷盘无变形，行走时可靠卷放缆', '111212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('276', 'false', '2007-07-17 00:00:00', '', '行走电机风机无变形，无松动', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('277', 'false', '2003-07-14 00:00:00', '', '行走电机、惯性制动器无异响', '111212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('278', 'false', '2005-07-12 00:00:00', '', '行走减速箱无漏油', '11122', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('279', 'false', '2005-07-18 00:00:00', '', '行走开式齿轮无缺油', '1121', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('280', 'false', '2005-07-12 00:00:00', '', '电动防炮器动作可靠', '13112', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('281', 'false', '2002-07-14 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('282', 'false', '2006-07-10 00:00:00', '', '防撞缓冲器无变形及损坏', '121221', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('283', 'false', '2005-07-10 00:00:00', '', '手动锚定能可靠锚定', '121221', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('284', 'false', '2006-07-10 00:00:00', '', '电气箱无碰撞变形', '12312', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('285', 'false', '2001-07-23 00:00:00', '', '行走电机风机无变形、无松动', '11221', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('286', 'false', '2008-07-14 00:00:00', '', '行走减速箱无漏油', '12112', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('287', 'false', '2006-07-12 00:00:00', '', '行走开式齿轮无缺油', '12112', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('288', 'false', '2013-07-15 00:00:00', '', '电动防跑器动作可靠', '13112', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('289', 'false', '2013-07-22 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '12121', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('290', 'false', '2004-07-12 00:00:00', '', '防撞缓冲器无变形及损坏', '21212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('291', 'false', '2007-07-17 00:00:00', '', '行走电机风机无变形、无松动', '1212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('292', 'false', '2007-07-17 00:00:00', '', '行走电机、惯性制动器无异响', '1312312', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('293', 'false', '2009-07-14 00:00:00', '', '行走减速箱无漏油', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('294', 'false', '2008-07-21 00:00:00', '', '行走开式齿轮无漏油', '2112312', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('295', 'false', '2006-07-11 00:00:00', '', '电动防跑器动作可靠', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('296', 'false', '2006-07-11 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '11121', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('297', 'false', '2007-07-26 00:00:00', '', '防撞缓冲器无变形及损坏', '1112', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('298', 'false', '2007-07-15 00:00:00', '', '手动锚定可靠锚定动作', '13121', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('299', 'false', '2004-07-14 00:00:00', '', '电气箱无碰撞变形', '11131', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('300', 'false', '2005-07-13 00:00:00', '', '行走电机风机无变形', '13131', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('301', 'false', '2005-07-20 00:00:00', '', '行走电机、惯性制动器无异响', '11121', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('302', 'false', '2005-07-12 00:00:00', '', '行走减速箱无漏油', '121212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('303', 'false', '2008-07-15 00:00:00', '', '行走开式齿轮无缺油', '12112', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('304', 'false', '2008-07-14 00:00:00', '', '电动防跑器动作可靠', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('305', 'false', '2006-07-10 00:00:00', '', '手动铁楔无丢失，防风拉锁无锈蚀', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('306', 'false', '2013-07-15 00:00:00', '', '防撞缓冲器无变形及损坏', '131231', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('307', 'false', '2008-07-15 00:00:00', '', '梯子、栏杆无变形，无松动', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('308', 'false', '2013-07-15 00:00:00', '', '大法兰M42螺栓无松动', '1211', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('309', 'false', '2008-07-15 00:00:00', '', '门架内无漏水，无异物，各箱柜无晃动', '11212', '', '0', '2', '1');
INSERT INTO `inspect_item` VALUES ('310', 'false', '2013-07-15 00:00:00', '', '齿圈，小齿轮啮合良好，无漏油，无异响', '1112', '', '0', '2', '2');
INSERT INTO `inspect_item` VALUES ('311', 'false', '2013-07-22 00:00:00', '', 'M42双头螺杆无松动', '1112', '', '0', '2', '2');
INSERT INTO `inspect_item` VALUES ('312', 'false', '2008-07-22 00:00:00', '', '旋转及小齿轮接油盘污物不过多', '12312', '', '0', '2', '2');
INSERT INTO `inspect_item` VALUES ('313', 'false', '2013-07-09 00:00:00', '', '旋转刹车使用正常', '121', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('314', 'false', '2013-07-15 00:00:00', '', '司机室及机器房门和门锁活动灵活，使用可靠', '112312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('315', 'false', '2013-07-09 00:00:00', '', '进门处旋转电机、风机无异响', '1312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('316', 'false', '2013-07-15 00:00:00', '', '旋转刹车片间隙均匀且不过薄，缓冲胶圈无老化', '212131', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('317', 'false', '2007-07-19 00:00:00', '', '旋转减速机油位正常且无漏油', '2112', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('318', 'false', '2013-07-15 00:00:00', '', '旋转减速箱地脚螺栓无松动', '13131', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('319', 'false', '2013-07-22 00:00:00', '', '油桶内不缺油，且机房内各润滑管道接口无漏油', '112312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('320', 'false', '2013-07-18 00:00:00', '', '集中润滑参数设置正确且运行一个循环工作正常', '131312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('321', 'false', '2013-07-09 00:00:00', '', '旋转电机、风机无异响', '1112', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('322', 'false', '2013-07-08 00:00:00', '', '旋转刹车片间隙均匀且不过薄，缓冲胶圈无老化', '21312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('323', 'false', '2013-07-09 00:00:00', '', '旋转减速机油位正常且无漏油', '131212', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('324', 'false', '2013-07-08 00:00:00', '', '旋转减速箱地脚螺栓无松动', '12122', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('325', 'false', '2013-07-08 00:00:00', '', '盘式制动器两侧间隙均匀且制动片不过薄', '1112', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('326', 'false', '2013-07-09 00:00:00', '', '制动器各绞点润滑良好', '1112', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('327', 'false', '2013-07-09 00:00:00', '', '减速箱油位正常，油颜色正常，地脚螺栓无松动', '1123123', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('328', 'false', '2013-07-10 00:00:00', '', '电机、风机及输入联轴节无异响', '1312312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('329', 'false', '2013-07-16 00:00:00', '', '输出轴联轴器无异响', '112312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('330', 'false', '2013-07-18 00:00:00', '', '钢板绳压板无松动，卷轴轴承支座螺栓无松动，挡板无间隙', '1112', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('331', 'false', '2013-07-18 00:00:00', '', '压绳轮位置正确，无变形', '1231212', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('332', 'false', '2013-07-09 00:00:00', '', '卷桶上钢丝绳无断丝、跳槽现象', '12312312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('333', 'false', '2013-07-08 00:00:00', '', '盘式制动器两侧间隙均匀且制动片不过薄', '1212312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('334', 'false', '2013-07-15 00:00:00', '', '制动器各绞点润滑良好', '111', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('335', 'false', '2013-07-16 00:00:00', '', '减速箱油位正常，油颜色正常，地脚螺栓无松动', '212131', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('336', 'false', '2013-07-16 00:00:00', '', '减速箱输入、输出以及制动器轴端无漏油', '11212', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('337', 'false', '2013-07-15 00:00:00', '', '电机、风机及输入轴联轴节无异响', '112321', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('338', 'false', '2013-07-22 00:00:00', '', '输出轴联轴器无异响', '12131', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('339', 'false', '2013-07-17 00:00:00', '', '钢丝绳压板无松动，卷筒轴承支座螺栓无松动，挡块无间隙', '121212', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('340', 'false', '2013-07-16 00:00:00', '', '压绳轮位置正确，无变形', '1112', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('341', 'false', '2013-07-16 00:00:00', '', '卷筒上钢丝绳无断丝、跳槽现象', '1312312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('342', 'false', '2013-07-08 00:00:00', '', '集中润滑各绞点不漏油', '1121', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('343', 'false', '2013-07-15 00:00:00', '', '中心受电器万向节开口销无脱落', '11312', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('344', 'false', '2013-07-16 00:00:00', '', '旋转接油托盘处废油无过多', '1111', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('345', 'false', '2013-07-15 00:00:00', '', '联轴用高强度螺栓无松动', '1131', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('346', 'false', '2013-07-09 00:00:00', '', '钢丝绳出绳口螺栓无松动，转动灵活，铜块无脱落', '111', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('347', 'false', '2013-07-08 00:00:00', '', '集中润滑各连接点无滑油', '121312', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('348', 'false', '2013-07-15 00:00:00', '', '人字架与机器房顶连接螺栓无松动', '1311', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('349', 'false', '2013-07-17 00:00:00', '', '门机低速做起升动作检查钢丝绳断丝磨损情况', '112212', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('350', 'false', '2013-07-08 00:00:00', '', '房顶无油污或其他杂物', '1212312', '', '1', '2', '4');
INSERT INTO `inspect_item` VALUES ('351', 'false', '2013-07-08 00:00:00', '', '电机、风机、联轴节无异响', '131212', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('352', 'false', '2013-07-09 00:00:00', '', '集中润滑各接点无漏油，地面无油污', '1112', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('353', 'false', '2013-07-08 00:00:00', '', '齿条无缺油，压轮无松动', '113123', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('354', 'false', '2013-07-09 00:00:00', '', '地脚螺栓无松动、挡块无间隙', '112312', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('355', 'false', '2013-07-08 00:00:00', '', '低速联轴节无异响，工作正常', '1312', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('356', 'false', '2013-07-08 00:00:00', '', '减速箱输入，输出轴无漏油，油位正常', '12112', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('357', 'false', '2013-07-09 00:00:00', '', '轮式制动器动作灵活，液力推动器位置正确', '1112', '', '1', '2', '4');
INSERT INTO `inspect_item` VALUES ('358', 'false', '2013-07-10 00:00:00', '', '制动片不过薄，打开时双侧间隙均匀', '1312312', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('359', 'false', '2013-07-08 00:00:00', '', '各滑轮无异响，滑轮钢丝绳防跳防槽可靠有效', '1·21112', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('360', 'false', '2013-07-08 00:00:00', '', '滑油油污不严重，滑轮轴承盖螺栓无松动', '1121', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('361', 'false', '2013-07-18 00:00:00', '', '集中润滑分配器及润滑终点接头无漏油', '112121', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('362', 'false', '2013-07-10 00:00:00', '', '平衡量支撑架下焊缝无裂纹', '11212', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('363', 'false', '2013-07-08 00:00:00', '', '平衡梁钢结构无开裂变形', '131312', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('364', 'false', '2008-07-13 00:00:00', '', '绞点润滑良好，油污无过多', '131212', '', '1', '2', '4');
INSERT INTO `inspect_item` VALUES ('365', 'false', '2013-07-08 00:00:00', '', '栏杆无变形', '1311', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('366', 'false', '2013-07-15 00:00:00', '', '托绳轮油污无过多', '11311', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('367', 'false', '2013-07-15 00:00:00', '', '大拉杆钢结构无变形无裂纹', '131212', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('368', 'false', '2013-07-21 00:00:00', '', '钢结构无开裂变形', '11131', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('369', 'false', '2013-07-16 00:00:00', '', '顶端滑轮组罩无变形，钢丝绳防跳槽装置可靠有效', '111212', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('370', 'false', '2013-07-09 00:00:00', '', '集中润滑分配器连接头无滑油', '12313', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('371', 'false', '2013-07-09 00:00:00', '', '底部滑轮组罩无变形，钢丝绳防跳槽装置可靠有效', '1121', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('372', 'false', '2013-07-16 00:00:00', '', '底部脚踏平台及栏杆无开裂变形', '13121', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('373', 'false', '2013-07-08 00:00:00', '', '象鼻梁与大臂绞点处无裂纹', '11231', '', '0', '2', '4');
INSERT INTO `inspect_item` VALUES ('374', 'false', '2013-07-15 00:00:00', '', '栏杆无变形开焊', '11212', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('375', 'false', '2010-07-12 00:00:00', '', '油污无过多', '1121', '', '0', '2', '3');
INSERT INTO `inspect_item` VALUES ('376', 'false', '2009-07-06 00:00:00', '', '大臂与机房连接绞点无裂纹，支座底焊缝无开裂', '1212', '', '0', '2', '3');
INSERT INTO `inspect_item_record` VALUES ('1', '2010-10-02 00:00:00', '1', null, '1', '1', '53', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2', '2013-08-01 00:00:00', '1', null, '1', null, '140', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3', '2013-08-01 00:00:00', '1', null, '1', null, '140', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2680', '1879-01-02 00:00:00', '1', null, '1', '2489', '140', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2681', '1879-01-02 00:00:00', '2', null, '1', '2489', '141', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2682', '1879-01-02 00:00:00', '1', null, '1', '2489', '142', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2683', '1879-01-02 00:00:00', '3', null, '1', '2489', '143', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2684', '1879-01-02 00:00:00', '1', null, '1', '2489', '144', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2685', '1879-01-02 00:00:00', '1', null, '1', '2489', '145', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2686', '1879-01-02 00:00:00', '1', null, '1', '2489', '146', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2687', '1879-01-02 00:00:00', '3', null, '1', '2489', '147', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2688', '1879-01-02 00:00:00', '1', null, '1', '2489', '158', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2689', '1879-01-02 00:00:00', '1', null, '1', '2489', '160', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2690', '1879-01-02 00:00:00', '1', null, '1', '2489', '161', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2691', '1879-01-02 00:00:00', '1', null, '1', '2489', '172', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2692', '1879-01-02 00:00:00', '2', null, '1', '2489', '172', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2693', '1879-01-02 00:00:00', '3', null, '1', '2489', '172', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2694', '1879-01-02 00:00:00', '1', null, '1', '2489', '176', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2695', '1879-01-02 00:00:00', '2', null, '1', '2489', '176', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2696', '1879-01-02 00:00:00', '3', null, '1', '2489', '176', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2697', '1879-01-02 00:00:00', '1', null, '1', '2489', '180', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2698', '1879-01-02 00:00:00', '2', null, '1', '2489', '180', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2699', '1879-01-02 00:00:00', '3', null, '1', '2489', '180', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2700', '1879-01-02 00:00:00', '1', null, '1', '2489', '184', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2701', '1879-01-02 00:00:00', '2', null, '1', '2489', '184', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2702', '1879-01-02 00:00:00', '3', null, '1', '2489', '184', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('2703', '1879-01-02 00:00:00', '1', null, '1', '2489', '148', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2704', '1879-01-02 00:00:00', '2', null, '1', '2489', '148', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2705', '1879-01-02 00:00:00', '3', null, '1', '2489', '148', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2706', '1879-01-02 00:00:00', '1', null, '1', '2489', '150', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2707', '1879-01-02 00:00:00', '2', null, '1', '2489', '150', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2708', '1879-01-02 00:00:00', '3', null, '1', '2489', '150', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2709', '1879-01-02 00:00:00', '1', null, '1', '2489', '150', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2710', '1879-01-02 00:00:00', '2', null, '1', '2489', '150', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2711', '1879-01-02 00:00:00', '3', null, '1', '2489', '150', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2712', '1879-01-02 00:00:00', '1', null, '1', '2489', '151', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2713', '1879-01-02 00:00:00', '2', null, '1', '2489', '151', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2714', '1879-01-02 00:00:00', '3', null, '1', '2489', '151', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2715', '1879-01-02 00:00:00', '1', null, '1', '2489', '152', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2716', '1879-01-02 00:00:00', '2', null, '1', '2489', '152', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2717', '1879-01-02 00:00:00', '3', null, '1', '2489', '152', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2718', '1879-01-02 00:00:00', '1', null, '1', '2489', '173', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2719', '1879-01-02 00:00:00', '2', null, '1', '2489', '173', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2720', '1879-01-02 00:00:00', '3', null, '1', '2489', '173', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2721', '1879-01-02 00:00:00', '1', null, '1', '2489', '177', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2722', '1879-01-02 00:00:00', '2', null, '1', '2489', '177', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2723', '1879-01-02 00:00:00', '3', null, '1', '2489', '177', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2724', '1879-01-02 00:00:00', '1', null, '1', '2489', '181', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2725', '1879-01-02 00:00:00', '2', null, '1', '2489', '181', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2726', '1879-01-02 00:00:00', '3', null, '1', '2489', '181', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2727', '1879-01-02 00:00:00', '1', null, '1', '2489', '185', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2728', '1879-01-02 00:00:00', '2', null, '1', '2489', '185', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2729', '1879-01-02 00:00:00', '3', null, '1', '2489', '185', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('2730', '1879-01-02 00:00:00', '1', null, '1', '2489', '163', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2731', '1879-01-02 00:00:00', '2', null, '1', '2489', '163', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2732', '1879-01-02 00:00:00', '3', null, '1', '2489', '163', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2733', '1879-01-02 00:00:00', '1', null, '1', '2489', '154', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2734', '1879-01-02 00:00:00', '2', null, '1', '2489', '154', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2735', '1879-01-02 00:00:00', '3', null, '1', '2489', '154', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2736', '1879-01-02 00:00:00', '1', null, '1', '2489', '155', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2737', '1879-01-02 00:00:00', '2', null, '1', '2489', '155', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2738', '1879-01-02 00:00:00', '3', null, '1', '2489', '155', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2739', '1879-01-02 00:00:00', '1', null, '1', '2489', '156', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2740', '1879-01-02 00:00:00', '2', null, '1', '2489', '156', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2741', '1879-01-02 00:00:00', '3', null, '1', '2489', '156', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2742', '1879-01-02 00:00:00', '1', null, '1', '2489', '162', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2743', '1879-01-02 00:00:00', '2', null, '1', '2489', '162', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2744', '1879-01-02 00:00:00', '3', null, '1', '2489', '162', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2745', '1879-01-02 00:00:00', '1', null, '1', '2489', '163', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2746', '1879-01-02 00:00:00', '2', null, '1', '2489', '163', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2747', '1879-01-02 00:00:00', '3', null, '1', '2489', '163', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2748', '1879-01-02 00:00:00', '1', null, '1', '2489', '164', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2749', '1879-01-02 00:00:00', '2', null, '1', '2489', '164', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2750', '1879-01-02 00:00:00', '3', null, '1', '2489', '164', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2751', '1879-01-02 00:00:00', '1', null, '1', '2489', '165', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2752', '1879-01-02 00:00:00', '2', null, '1', '2489', '165', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2753', '1879-01-02 00:00:00', '3', null, '1', '2489', '165', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2754', '1879-01-02 00:00:00', '1', null, '1', '2489', '166', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2755', '1879-01-02 00:00:00', '2', null, '1', '2489', '166', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2756', '1879-01-02 00:00:00', '3', null, '1', '2489', '166', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2757', '1879-01-02 00:00:00', '1', null, '1', '2489', '174', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2758', '1879-01-02 00:00:00', '2', null, '1', '2489', '174', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2759', '1879-01-02 00:00:00', '3', null, '1', '2489', '174', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2760', '1879-01-02 00:00:00', '1', null, '1', '2489', '178', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2761', '1879-01-02 00:00:00', '2', null, '1', '2489', '178', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2762', '1879-01-02 00:00:00', '3', null, '1', '2489', '178', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2763', '1879-01-02 00:00:00', '1', null, '1', '2489', '182', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2764', '1879-01-02 00:00:00', '2', null, '1', '2489', '182', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2765', '1879-01-02 00:00:00', '3', null, '1', '2489', '182', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2766', '1879-01-02 00:00:00', '1', null, '1', '2489', '186', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2767', '1879-01-02 00:00:00', '2', null, '1', '2489', '186', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2768', '1879-01-02 00:00:00', '3', null, '1', '2489', '186', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('2769', '1879-01-02 00:00:00', '1', null, '1', '2489', '157', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2770', '1879-01-02 00:00:00', '2', null, '1', '2489', '157', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2771', '1879-01-02 00:00:00', '3', null, '1', '2489', '157', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2772', '1879-01-02 00:00:00', '1', null, '1', '2489', '159', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2773', '1879-01-02 00:00:00', '2', null, '1', '2489', '159', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2774', '1879-01-02 00:00:00', '3', null, '1', '2489', '159', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2775', '1879-01-02 00:00:00', '1', null, '1', '2489', '167', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2776', '1879-01-02 00:00:00', '2', null, '1', '2489', '167', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2777', '1879-01-02 00:00:00', '3', null, '1', '2489', '167', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2778', '1879-01-02 00:00:00', '1', null, '1', '2489', '168', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2779', '1879-01-02 00:00:00', '2', null, '1', '2489', '168', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2780', '1879-01-02 00:00:00', '3', null, '1', '2489', '168', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2781', '1879-01-02 00:00:00', '1', null, '1', '2489', '169', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2782', '1879-01-02 00:00:00', '2', null, '1', '2489', '169', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2783', '1879-01-02 00:00:00', '3', null, '1', '2489', '169', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2784', '1879-01-02 00:00:00', '1', null, '1', '2489', '170', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2785', '1879-01-02 00:00:00', '2', null, '1', '2489', '170', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2786', '1879-01-02 00:00:00', '3', null, '1', '2489', '170', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2787', '1879-01-02 00:00:00', '1', null, '1', '2489', '171', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2788', '1879-01-02 00:00:00', '2', null, '1', '2489', '171', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2789', '1879-01-02 00:00:00', '3', null, '1', '2489', '171', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2790', '1879-01-02 00:00:00', '1', null, '1', '2489', '175', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2791', '1879-01-02 00:00:00', '2', null, '1', '2489', '175', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2792', '1879-01-02 00:00:00', '3', null, '1', '2489', '175', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2793', '1879-01-02 00:00:00', '1', null, '1', '2489', '179', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2794', '1879-01-02 00:00:00', '2', null, '1', '2489', '179', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2795', '1879-01-02 00:00:00', '3', null, '1', '2489', '179', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2796', '1879-01-02 00:00:00', '1', null, '1', '2489', '183', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2797', '1879-01-02 00:00:00', '2', null, '1', '2489', '183', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2798', '1879-01-02 00:00:00', '3', null, '1', '2489', '183', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2799', '1879-01-02 00:00:00', '1', null, '1', '2489', '187', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2800', '1879-01-02 00:00:00', '2', null, '1', '2489', '187', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2801', '1879-01-02 00:00:00', '3', null, '1', '2489', '187', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('2802', '1879-01-02 00:00:00', '1', null, '2', '2489', '270', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2803', '1879-01-02 00:00:00', '1', null, '2', '2489', '271', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2804', '1879-01-02 00:00:00', '1', null, '2', '2489', '272', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2805', '1879-01-02 00:00:00', '3', null, '2', '2489', '273', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2806', '1879-01-02 00:00:00', '2', null, '2', '2489', '274', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2807', '1879-01-02 00:00:00', '1', null, '2', '2489', '275', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2808', '1879-01-02 00:00:00', '1', null, '2', '2489', '276', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2809', '1879-01-02 00:00:00', '1', null, '2', '2489', '301', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2810', '1879-01-02 00:00:00', '1', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2811', '1879-01-02 00:00:00', '1', null, '2', '2489', '303', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2812', '1879-01-02 00:00:00', '1', null, '2', '2489', '280', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2813', '1879-01-02 00:00:00', '3', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2814', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2815', '1879-01-02 00:00:00', '1', null, '2', '2489', '283', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2816', '1879-01-02 00:00:00', '2', null, '2', '2489', '299', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2817', '1879-01-02 00:00:00', '1', null, '2', '2489', '291', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2818', '1879-01-02 00:00:00', '1', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2819', '1879-01-02 00:00:00', '3', null, '2', '2489', '303', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2820', '1879-01-02 00:00:00', '1', null, '2', '2489', '304', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2821', '1879-01-02 00:00:00', '3', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2822', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2823', '1879-01-02 00:00:00', '1', null, '2', '2489', '291', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2824', '1879-01-02 00:00:00', '1', null, '2', '2489', '301', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2825', '1879-01-02 00:00:00', '3', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2826', '1879-01-02 00:00:00', '2', null, '2', '2489', '294', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2827', '1879-01-02 00:00:00', '1', null, '2', '2489', '304', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2828', '1879-01-02 00:00:00', '1', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2829', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2830', '1879-01-02 00:00:00', '1', null, '2', '2489', '298', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2831', '1879-01-02 00:00:00', '3', null, '2', '2489', '299', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2832', '1879-01-02 00:00:00', '3', null, '2', '2489', '300', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2833', '1879-01-02 00:00:00', '1', null, '2', '2489', '301', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2834', '1879-01-02 00:00:00', '1', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2835', '1879-01-02 00:00:00', '1', null, '2', '2489', '303', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2836', '1879-01-02 00:00:00', '1', null, '2', '2489', '304', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2837', '1879-01-02 00:00:00', '3', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2838', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2839', '1879-01-02 00:00:00', '3', null, '2', '2489', '307', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2840', '1879-01-02 00:00:00', '1', null, '2', '2489', '308', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2841', '1879-01-02 00:00:00', '1', null, '2', '2489', '309', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('2842', '1879-01-02 00:00:00', '1', null, '2', '2489', '310', '2', '2');
INSERT INTO `inspect_item_record` VALUES ('2843', '1879-01-02 00:00:00', '1', null, '2', '2489', '311', '2', '2');
INSERT INTO `inspect_item_record` VALUES ('2844', '1879-01-02 00:00:00', '3', null, '2', '2489', '312', '2', '2');
INSERT INTO `inspect_item_record` VALUES ('2845', '1879-01-02 00:00:00', '3', null, '2', '2489', '313', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2846', '1879-01-02 00:00:00', '3', null, '2', '2489', '314', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2847', '1879-01-02 00:00:00', '3', null, '2', '2489', '315', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2848', '1879-01-02 00:00:00', '1', null, '2', '2489', '322', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2849', '1879-01-02 00:00:00', '3', null, '2', '2489', '323', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2850', '1879-01-02 00:00:00', '1', null, '2', '2489', '324', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2851', '1879-01-02 00:00:00', '1', null, '2', '2489', '319', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2852', '1879-01-02 00:00:00', '3', null, '2', '2489', '320', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2853', '1879-01-02 00:00:00', '1', null, '2', '2489', '321', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2854', '1879-01-02 00:00:00', '1', null, '2', '2489', '322', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2855', '1879-01-02 00:00:00', '1', null, '2', '2489', '323', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2856', '1879-01-02 00:00:00', '1', null, '2', '2489', '324', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2857', '1879-01-02 00:00:00', '1', null, '2', '2489', '333', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2858', '1879-01-02 00:00:00', '1', null, '2', '2489', '334', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2859', '1879-01-02 00:00:00', '1', null, '2', '2489', '335', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2860', '1879-01-02 00:00:00', '3', null, '2', '2489', '328', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2861', '1879-01-02 00:00:00', '3', null, '2', '2489', '338', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2862', '1879-01-02 00:00:00', '1', null, '2', '2489', '330', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2863', '1879-01-02 00:00:00', '1', null, '2', '2489', '340', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2864', '1879-01-02 00:00:00', '1', null, '2', '2489', '332', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2865', '1879-01-02 00:00:00', '1', null, '2', '2489', '333', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2866', '1879-01-02 00:00:00', '2', null, '2', '2489', '334', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2867', '1879-01-02 00:00:00', '1', null, '2', '2489', '335', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2868', '1879-01-02 00:00:00', '1', null, '2', '2489', '336', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2869', '1879-01-02 00:00:00', '1', null, '2', '2489', '337', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2870', '1879-01-02 00:00:00', '1', null, '2', '2489', '338', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2871', '1879-01-02 00:00:00', '3', null, '2', '2489', '339', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2872', '1879-01-02 00:00:00', '1', null, '2', '2489', '340', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2873', '1879-01-02 00:00:00', '1', null, '2', '2489', '341', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2874', '1879-01-02 00:00:00', '2', null, '2', '2489', '341', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2875', '1879-01-02 00:00:00', '3', null, '2', '2489', '341', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2876', '1879-01-02 00:00:00', '1', null, '2', '2489', '342', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2877', '1879-01-02 00:00:00', '1', null, '2', '2489', '343', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2878', '1879-01-02 00:00:00', '1', null, '2', '2489', '344', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2879', '1879-01-02 00:00:00', '1', null, '2', '2489', '345', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2880', '1879-01-02 00:00:00', '1', null, '2', '2489', '374', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2881', '1879-01-02 00:00:00', '1', null, '2', '2489', '375', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2882', '1879-01-02 00:00:00', '1', null, '2', '2489', '376', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('2883', '1879-01-02 00:00:00', '1', null, '2', '2489', '346', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2884', '1879-01-02 00:00:00', '1', null, '2', '2489', '347', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2885', '1879-01-02 00:00:00', '1', null, '2', '2489', '348', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2886', '1879-01-02 00:00:00', '3', null, '2', '2489', '349', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2887', '1879-01-02 00:00:00', '1', null, '2', '2489', '350', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2888', '1879-01-02 00:00:00', '1', null, '2', '2489', '351', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2889', '1879-01-02 00:00:00', '1', null, '2', '2489', '352', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2890', '1879-01-02 00:00:00', '1', null, '2', '2489', '353', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2891', '1879-01-02 00:00:00', '1', null, '2', '2489', '354', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2892', '1879-01-02 00:00:00', '1', null, '2', '2489', '355', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2893', '1879-01-02 00:00:00', '1', null, '2', '2489', '356', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2894', '1879-01-02 00:00:00', '3', null, '2', '2489', '357', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2895', '1879-01-02 00:00:00', '1', null, '2', '2489', '358', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2896', '1879-01-02 00:00:00', '1', null, '2', '2489', '359', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2897', '1879-01-02 00:00:00', '1', null, '2', '2489', '360', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2898', '1879-01-02 00:00:00', '1', null, '2', '2489', '361', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2899', '1879-01-02 00:00:00', '3', null, '2', '2489', '362', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2900', '1879-01-02 00:00:00', '1', null, '2', '2489', '363', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2901', '1879-01-02 00:00:00', '1', null, '2', '2489', '364', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2902', '1879-01-02 00:00:00', '1', null, '2', '2489', '365', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2903', '1879-01-02 00:00:00', '1', null, '2', '2489', '366', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2904', '1879-01-02 00:00:00', '1', null, '2', '2489', '367', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2905', '1879-01-02 00:00:00', '1', null, '2', '2489', '368', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2906', '1879-01-02 00:00:00', '1', null, '2', '2489', '369', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2907', '1879-01-02 00:00:00', '1', null, '2', '2489', '370', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2908', '1879-01-02 00:00:00', '1', null, '2', '2489', '371', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2909', '1879-01-02 00:00:00', '3', null, '2', '2489', '372', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('2910', '1879-01-02 00:00:00', '1', null, '2', '2489', '373', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3226', '1879-01-02 00:00:00', '1', null, '2', '2489', '270', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3227', '1879-01-02 00:00:00', '1', null, '2', '2489', '271', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3228', '1879-01-02 00:00:00', '1', null, '2', '2489', '272', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3229', '1879-01-02 00:00:00', '3', null, '2', '2489', '273', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3230', '1879-01-02 00:00:00', '2', null, '2', '2489', '274', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3231', '1879-01-02 00:00:00', '1', null, '2', '2489', '275', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3232', '1879-01-02 00:00:00', '1', null, '2', '2489', '276', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3233', '1879-01-02 00:00:00', '1', null, '2', '2489', '301', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3234', '1879-01-02 00:00:00', '1', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3235', '1879-01-02 00:00:00', '1', null, '2', '2489', '303', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3236', '1879-01-02 00:00:00', '1', null, '2', '2489', '280', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3237', '1879-01-02 00:00:00', '3', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3238', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3239', '1879-01-02 00:00:00', '1', null, '2', '2489', '283', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3240', '1879-01-02 00:00:00', '2', null, '2', '2489', '299', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3241', '1879-01-02 00:00:00', '1', null, '2', '2489', '291', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3242', '1879-01-02 00:00:00', '1', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3243', '1879-01-02 00:00:00', '3', null, '2', '2489', '303', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3244', '1879-01-02 00:00:00', '1', null, '2', '2489', '304', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3245', '1879-01-02 00:00:00', '3', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3246', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3247', '1879-01-02 00:00:00', '1', null, '2', '2489', '291', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3248', '1879-01-02 00:00:00', '1', null, '2', '2489', '301', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3249', '1879-01-02 00:00:00', '3', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3250', '1879-01-02 00:00:00', '2', null, '2', '2489', '294', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3251', '1879-01-02 00:00:00', '1', null, '2', '2489', '304', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3252', '1879-01-02 00:00:00', '1', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3253', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3254', '1879-01-02 00:00:00', '1', null, '2', '2489', '298', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3255', '1879-01-02 00:00:00', '3', null, '2', '2489', '299', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3256', '1879-01-02 00:00:00', '3', null, '2', '2489', '300', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3257', '1879-01-02 00:00:00', '1', null, '2', '2489', '301', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3258', '1879-01-02 00:00:00', '1', null, '2', '2489', '302', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3259', '1879-01-02 00:00:00', '1', null, '2', '2489', '303', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3260', '1879-01-02 00:00:00', '1', null, '2', '2489', '304', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3261', '1879-01-02 00:00:00', '3', null, '2', '2489', '305', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3262', '1879-01-02 00:00:00', '1', null, '2', '2489', '306', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3263', '1879-01-02 00:00:00', '3', null, '2', '2489', '307', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3264', '1879-01-02 00:00:00', '1', null, '2', '2489', '308', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3265', '1879-01-02 00:00:00', '1', null, '2', '2489', '309', '1', '2');
INSERT INTO `inspect_item_record` VALUES ('3266', '1879-01-02 00:00:00', '1', null, '2', '2489', '310', '2', '2');
INSERT INTO `inspect_item_record` VALUES ('3267', '1879-01-02 00:00:00', '1', null, '2', '2489', '311', '2', '2');
INSERT INTO `inspect_item_record` VALUES ('3268', '1879-01-02 00:00:00', '3', null, '2', '2489', '312', '2', '2');
INSERT INTO `inspect_item_record` VALUES ('3269', '1879-01-02 00:00:00', '3', null, '2', '2489', '313', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3270', '1879-01-02 00:00:00', '3', null, '2', '2489', '314', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3271', '1879-01-02 00:00:00', '3', null, '2', '2489', '315', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3272', '1879-01-02 00:00:00', '1', null, '2', '2489', '322', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3273', '1879-01-02 00:00:00', '3', null, '2', '2489', '323', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3274', '1879-01-02 00:00:00', '1', null, '2', '2489', '324', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3275', '1879-01-02 00:00:00', '1', null, '2', '2489', '319', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3276', '1879-01-02 00:00:00', '3', null, '2', '2489', '320', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3277', '1879-01-02 00:00:00', '1', null, '2', '2489', '321', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3278', '1879-01-02 00:00:00', '1', null, '2', '2489', '322', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3279', '1879-01-02 00:00:00', '1', null, '2', '2489', '323', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3280', '1879-01-02 00:00:00', '1', null, '2', '2489', '324', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3281', '1879-01-02 00:00:00', '1', null, '2', '2489', '333', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3282', '1879-01-02 00:00:00', '1', null, '2', '2489', '334', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3283', '1879-01-02 00:00:00', '1', null, '2', '2489', '335', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3284', '1879-01-02 00:00:00', '3', null, '2', '2489', '328', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3285', '1879-01-02 00:00:00', '3', null, '2', '2489', '338', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3286', '1879-01-02 00:00:00', '1', null, '2', '2489', '330', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3287', '1879-01-02 00:00:00', '1', null, '2', '2489', '340', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3288', '1879-01-02 00:00:00', '1', null, '2', '2489', '332', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3289', '1879-01-02 00:00:00', '1', null, '2', '2489', '333', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3290', '1879-01-02 00:00:00', '2', null, '2', '2489', '334', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3291', '1879-01-02 00:00:00', '1', null, '2', '2489', '335', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3292', '1879-01-02 00:00:00', '1', null, '2', '2489', '336', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3293', '1879-01-02 00:00:00', '1', null, '2', '2489', '337', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3294', '1879-01-02 00:00:00', '1', null, '2', '2489', '338', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3295', '1879-01-02 00:00:00', '3', null, '2', '2489', '339', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3296', '1879-01-02 00:00:00', '1', null, '2', '2489', '340', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3297', '1879-01-02 00:00:00', '1', null, '2', '2489', '341', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3298', '1879-01-02 00:00:00', '2', null, '2', '2489', '341', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3299', '1879-01-02 00:00:00', '3', null, '2', '2489', '341', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3300', '1879-01-02 00:00:00', '1', null, '2', '2489', '342', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3301', '1879-01-02 00:00:00', '1', null, '2', '2489', '343', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3302', '1879-01-02 00:00:00', '1', null, '2', '2489', '344', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3303', '1879-01-02 00:00:00', '1', null, '2', '2489', '345', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3304', '1879-01-02 00:00:00', '1', null, '2', '2489', '374', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3305', '1879-01-02 00:00:00', '1', null, '2', '2489', '375', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3306', '1879-01-02 00:00:00', '1', null, '2', '2489', '376', '3', '2');
INSERT INTO `inspect_item_record` VALUES ('3307', '1879-01-02 00:00:00', '1', null, '2', '2489', '346', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3308', '1879-01-02 00:00:00', '1', null, '2', '2489', '347', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3309', '1879-01-02 00:00:00', '1', null, '2', '2489', '348', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3310', '1879-01-02 00:00:00', '3', null, '2', '2489', '349', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3311', '1879-01-02 00:00:00', '1', null, '2', '2489', '350', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3312', '1879-01-02 00:00:00', '1', null, '2', '2489', '351', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3313', '1879-01-02 00:00:00', '1', null, '2', '2489', '352', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3314', '1879-01-02 00:00:00', '1', null, '2', '2489', '353', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3315', '1879-01-02 00:00:00', '1', null, '2', '2489', '354', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3316', '1879-01-02 00:00:00', '1', null, '2', '2489', '355', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3317', '1879-01-02 00:00:00', '1', null, '2', '2489', '356', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3318', '1879-01-02 00:00:00', '3', null, '2', '2489', '357', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3319', '1879-01-02 00:00:00', '1', null, '2', '2489', '358', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3320', '1879-01-02 00:00:00', '1', null, '2', '2489', '359', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3321', '1879-01-02 00:00:00', '1', null, '2', '2489', '360', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3322', '1879-01-02 00:00:00', '1', null, '2', '2489', '361', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3323', '1879-01-02 00:00:00', '3', null, '2', '2489', '362', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3324', '1879-01-02 00:00:00', '1', null, '2', '2489', '363', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3325', '1879-01-02 00:00:00', '1', null, '2', '2489', '364', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3326', '1879-01-02 00:00:00', '1', null, '2', '2489', '365', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3327', '1879-01-02 00:00:00', '1', null, '2', '2489', '366', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3328', '1879-01-02 00:00:00', '1', null, '2', '2489', '367', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3329', '1879-01-02 00:00:00', '1', null, '2', '2489', '368', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3330', '1879-01-02 00:00:00', '1', null, '2', '2489', '369', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3331', '1879-01-02 00:00:00', '1', null, '2', '2489', '370', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3332', '1879-01-02 00:00:00', '1', null, '2', '2489', '371', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3333', '1879-01-02 00:00:00', '3', null, '2', '2489', '372', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3334', '1879-01-02 00:00:00', '1', null, '2', '2489', '373', '4', '2');
INSERT INTO `inspect_item_record` VALUES ('3335', '2013-07-31 00:00:00', '1', null, '3', '2490', '99', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3336', '2013-07-31 00:00:00', '1', null, '3', '2490', '100', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3337', '2013-07-31 00:00:00', '3', null, '3', '2490', '101', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3338', '2013-07-31 00:00:00', '1', null, '3', '2490', '102', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3339', '2013-07-31 00:00:00', '1', null, '3', '2490', '103', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3340', '2013-07-31 00:00:00', '1', null, '3', '2490', '104', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3341', '2013-07-31 00:00:00', '1', null, '3', '2490', '105', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3342', '2013-07-31 00:00:00', '1', null, '3', '2490', '106', '1', '1');
INSERT INTO `inspect_item_record` VALUES ('3343', '2013-07-31 00:00:00', '1', null, '3', '2490', '107', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('3344', '2013-07-31 00:00:00', '1', null, '3', '2490', '124', '2', '1');
INSERT INTO `inspect_item_record` VALUES ('3345', '2013-07-31 00:00:00', '1', null, '3', '2490', '108', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3346', '2013-07-31 00:00:00', '1', null, '3', '2490', '109', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3347', '2013-07-31 00:00:00', '3', null, '3', '2490', '110', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3348', '2013-07-31 00:00:00', '1', null, '3', '2490', '111', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3349', '2013-07-31 00:00:00', '1', null, '3', '2490', '112', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3350', '2013-07-31 00:00:00', '1', null, '3', '2490', '113', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3351', '2013-07-31 00:00:00', '1', null, '3', '2490', '114', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3352', '2013-07-31 00:00:00', '1', null, '3', '2490', '115', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3353', '2013-07-31 00:00:00', '1', null, '3', '2490', '116', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3354', '2013-07-31 00:00:00', '1', null, '3', '2490', '117', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3355', '2013-07-31 00:00:00', '1', null, '3', '2490', '118', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3356', '2013-07-31 00:00:00', '3', null, '3', '2490', '119', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3357', '2013-07-31 00:00:00', '1', null, '3', '2490', '125', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3358', '2013-07-31 00:00:00', '1', null, '3', '2490', '126', '3', '1');
INSERT INTO `inspect_item_record` VALUES ('3359', '2013-07-31 00:00:00', '1', null, '3', '2490', '120', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('3360', '2013-07-31 00:00:00', '1', null, '3', '2490', '121', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('3361', '2013-07-31 00:00:00', '1', null, '3', '2490', '122', '4', '1');
INSERT INTO `inspect_item_record` VALUES ('3362', '2013-07-31 00:00:00', '1', null, '3', '2490', '123', '4', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('53', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('54', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('55', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('56', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('57', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('58', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('59', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('60', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('61', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('62', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('63', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('64', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('65', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('66', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('67', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('68', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('69', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('70', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('71', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('72', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('73', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('74', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('75', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('76', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('77', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('78', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('79', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('80', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('81', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('82', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('83', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('84', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('85', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('86', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('87', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('88', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('89', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('90', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('91', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('92', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('93', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('94', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('95', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('96', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('97', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('98', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('99', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('100', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('101', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('102', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('103', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('104', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('105', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('106', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('107', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('108', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('109', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('110', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('111', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('112', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('113', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('114', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('115', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('116', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('117', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('118', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('119', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('120', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('121', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('122', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('123', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('124', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('125', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('126', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('127', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('128', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('129', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('130', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('131', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('132', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('133', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('134', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('135', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('136', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('137', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('138', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('139', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('140', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('141', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('142', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('143', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('144', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('145', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('146', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('147', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('148', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('149', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('150', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('151', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('152', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('153', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('154', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('155', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('156', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('157', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('158', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('159', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('160', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('161', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('162', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('163', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('164', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('165', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('166', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('167', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('168', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('169', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('170', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('171', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('172', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('173', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('174', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('175', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('176', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('177', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('178', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('179', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('180', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('181', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('182', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('183', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('184', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('185', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('186', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('187', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('188', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('189', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('190', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('191', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('192', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('193', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('194', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('195', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('196', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('197', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('198', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('199', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('200', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('201', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('202', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('203', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('204', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('205', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('206', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('207', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('208', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('209', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('210', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('211', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('212', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('213', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('214', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('215', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('216', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('217', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('218', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('219', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('220', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('221', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('222', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('223', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('224', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('225', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('226', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('227', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('228', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('229', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('230', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('231', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('232', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('233', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('234', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('235', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('236', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('237', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('238', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('239', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('240', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('241', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('242', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('243', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('244', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('245', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('246', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('247', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('248', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('249', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('250', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('251', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('252', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('253', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('254', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('255', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('256', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('257', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('258', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('259', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('260', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('261', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('262', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('263', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('264', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('265', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('266', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('267', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('268', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('269', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('270', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('271', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('272', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('273', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('274', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('275', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('276', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('277', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('278', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('279', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('280', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('281', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('282', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('283', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('284', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('285', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('286', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('287', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('288', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('289', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('290', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('291', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('292', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('293', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('294', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('295', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('296', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('297', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('298', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('299', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('300', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('301', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('302', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('303', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('304', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('305', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('306', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('307', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('308', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('309', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('310', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('311', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('312', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('313', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('314', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('315', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('316', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('317', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('318', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('319', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('320', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('321', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('322', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('323', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('324', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('325', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('326', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('327', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('328', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('329', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('330', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('331', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('332', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('333', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('334', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('335', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('336', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('337', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('338', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('339', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('340', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('341', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('342', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('343', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('344', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('345', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('346', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('347', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('348', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('349', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('350', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('351', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('352', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('353', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('354', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('355', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('356', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('357', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('358', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('359', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('360', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('361', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('362', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('363', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('364', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('365', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('366', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('367', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('368', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('369', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('370', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('371', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('372', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('373', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('374', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('375', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('376', '1');
INSERT INTO `inspect_item_tvalues` VALUES ('53', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('54', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('55', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('56', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('57', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('58', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('59', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('60', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('61', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('62', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('63', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('64', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('65', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('66', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('67', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('68', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('69', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('70', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('71', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('72', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('73', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('74', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('75', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('76', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('77', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('78', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('79', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('80', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('81', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('82', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('83', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('84', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('85', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('86', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('87', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('88', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('89', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('90', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('91', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('92', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('93', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('94', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('95', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('96', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('97', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('98', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('99', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('100', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('101', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('102', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('103', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('104', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('105', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('106', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('107', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('108', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('109', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('110', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('111', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('112', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('113', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('114', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('115', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('116', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('117', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('118', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('119', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('120', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('121', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('122', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('123', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('124', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('125', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('126', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('127', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('128', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('129', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('130', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('131', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('132', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('133', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('134', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('135', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('136', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('137', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('138', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('139', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('140', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('141', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('142', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('143', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('144', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('145', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('146', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('147', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('148', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('149', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('150', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('151', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('152', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('153', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('154', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('155', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('156', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('157', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('158', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('159', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('160', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('161', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('162', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('163', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('164', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('165', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('166', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('167', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('168', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('169', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('170', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('171', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('172', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('173', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('174', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('175', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('176', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('177', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('178', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('179', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('180', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('181', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('182', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('183', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('184', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('185', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('186', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('187', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('188', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('189', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('190', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('191', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('192', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('193', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('194', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('195', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('196', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('197', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('198', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('199', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('200', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('201', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('202', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('203', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('204', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('205', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('206', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('207', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('208', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('209', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('210', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('211', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('212', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('213', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('214', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('215', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('216', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('217', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('218', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('219', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('220', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('221', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('222', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('223', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('224', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('225', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('226', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('227', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('228', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('229', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('230', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('231', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('232', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('233', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('234', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('235', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('236', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('237', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('238', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('239', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('240', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('241', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('242', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('243', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('244', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('245', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('246', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('247', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('248', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('249', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('250', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('251', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('252', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('253', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('254', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('255', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('256', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('257', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('258', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('259', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('260', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('261', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('262', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('263', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('264', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('265', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('266', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('267', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('268', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('269', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('270', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('271', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('272', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('273', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('274', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('275', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('276', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('277', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('278', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('279', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('280', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('281', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('282', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('283', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('284', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('285', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('286', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('287', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('288', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('289', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('290', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('291', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('292', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('293', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('294', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('295', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('296', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('297', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('298', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('299', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('300', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('301', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('302', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('303', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('304', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('305', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('306', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('307', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('308', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('309', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('310', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('311', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('312', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('313', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('314', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('315', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('316', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('317', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('318', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('319', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('320', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('321', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('322', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('323', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('324', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('325', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('326', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('327', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('328', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('329', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('330', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('331', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('332', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('333', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('334', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('335', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('336', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('337', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('338', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('339', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('340', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('341', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('342', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('343', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('344', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('345', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('346', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('347', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('348', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('349', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('350', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('351', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('352', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('353', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('354', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('355', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('356', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('357', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('358', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('359', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('360', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('361', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('362', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('363', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('364', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('365', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('366', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('367', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('368', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('369', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('370', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('371', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('372', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('373', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('374', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('375', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('376', '2');
INSERT INTO `inspect_item_tvalues` VALUES ('53', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('54', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('55', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('56', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('57', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('58', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('59', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('60', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('61', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('62', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('63', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('64', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('65', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('66', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('67', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('68', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('69', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('70', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('71', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('72', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('73', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('74', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('75', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('76', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('77', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('78', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('79', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('80', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('81', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('82', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('83', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('84', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('85', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('86', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('87', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('88', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('89', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('90', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('91', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('92', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('93', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('94', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('95', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('96', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('97', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('98', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('99', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('100', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('101', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('102', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('103', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('104', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('105', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('106', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('107', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('108', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('109', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('110', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('111', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('112', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('113', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('114', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('115', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('116', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('117', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('118', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('119', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('120', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('121', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('122', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('123', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('124', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('125', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('126', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('127', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('128', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('129', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('130', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('131', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('132', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('133', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('134', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('135', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('136', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('137', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('138', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('139', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('140', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('141', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('142', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('143', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('144', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('145', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('146', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('147', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('148', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('149', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('150', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('151', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('152', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('153', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('154', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('155', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('156', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('157', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('158', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('159', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('160', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('161', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('162', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('163', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('164', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('165', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('166', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('167', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('168', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('169', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('170', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('171', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('172', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('173', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('174', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('175', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('176', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('177', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('178', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('179', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('180', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('181', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('182', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('183', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('184', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('185', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('186', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('187', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('188', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('189', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('190', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('191', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('192', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('193', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('194', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('195', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('196', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('197', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('198', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('199', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('200', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('201', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('202', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('203', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('204', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('205', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('206', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('207', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('208', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('209', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('210', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('211', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('212', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('213', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('214', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('215', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('216', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('217', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('218', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('219', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('220', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('221', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('222', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('223', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('224', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('225', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('226', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('227', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('228', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('229', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('230', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('231', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('232', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('233', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('234', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('235', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('236', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('237', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('238', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('239', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('240', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('241', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('242', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('243', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('244', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('245', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('246', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('247', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('248', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('249', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('250', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('251', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('252', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('253', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('254', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('255', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('256', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('257', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('258', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('259', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('260', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('261', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('262', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('263', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('264', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('265', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('266', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('267', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('268', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('269', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('270', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('271', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('272', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('273', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('274', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('275', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('276', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('277', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('278', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('279', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('280', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('281', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('282', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('283', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('284', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('286', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('287', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('288', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('289', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('290', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('291', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('292', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('293', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('294', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('295', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('296', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('297', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('298', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('299', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('300', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('301', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('302', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('303', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('304', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('305', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('306', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('307', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('308', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('309', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('310', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('311', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('312', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('313', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('314', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('315', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('316', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('317', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('318', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('319', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('320', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('321', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('322', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('323', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('324', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('325', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('326', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('327', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('328', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('329', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('330', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('331', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('332', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('333', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('334', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('335', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('336', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('337', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('338', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('339', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('340', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('341', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('342', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('343', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('344', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('345', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('346', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('347', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('348', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('349', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('350', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('351', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('352', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('353', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('354', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('355', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('356', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('357', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('358', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('359', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('360', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('361', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('362', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('363', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('364', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('365', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('366', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('367', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('368', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('369', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('370', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('371', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('372', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('373', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('374', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('375', '3');
INSERT INTO `inspect_item_tvalues` VALUES ('376', '3');
INSERT INTO `inspect_table` VALUES ('1', '2013-07-03 00:00:00', '机修人员点检表', '0', '1');
INSERT INTO `inspect_table` VALUES ('2', '2013-07-17 00:00:00', '门机队机械技术员点检表', '0', '2');
INSERT INTO `inspect_table` VALUES ('3', '2013-07-04 00:00:00', '门机技术员电气日常点检表', '0', '3');
INSERT INTO `inspect_table` VALUES ('4', '2013-07-10 00:00:00', '门机减速机专项点检卡', '0', '4');
INSERT INTO `inspect_table` VALUES ('5', '2013-07-18 00:00:00', '门机司机日常点检表', '0', '5');
INSERT INTO `inspect_table` VALUES ('6', '2013-07-08 00:00:00', '门机周一定保专项点检卡片', '0', '2');
INSERT INTO `inspect_table_record` VALUES ('1', '2013-08-14 20:18:40', '10', null, '1', '1');
INSERT INTO `inspect_table_record` VALUES ('82', '2010-10-03 00:00:00', null, null, '1', null);
INSERT INTO `inspect_table_record` VALUES ('83', '2013-08-01 00:00:00', null, null, '1', null);
INSERT INTO `inspect_table_record` VALUES ('84', '2013-08-01 00:00:00', null, null, '1', null);
INSERT INTO `inspect_table_record` VALUES ('2253', '1879-01-02 00:00:00', null, null, null, null);
INSERT INTO `inspect_table_record` VALUES ('2254', '1879-01-02 00:00:00', null, null, null, null);
INSERT INTO `inspect_table_record` VALUES ('2489', '1879-01-02 00:00:00', null, null, null, null);
INSERT INTO `inspect_table_record` VALUES ('2490', '2013-07-31 00:00:00', null, null, null, null);
INSERT INTO `inspect_tag` VALUES ('1', '2013-07-10 00:00:00', '描述1', '标签1', '112121', '0');
INSERT INTO `inspect_tag` VALUES ('2', '2013-07-18 00:00:00', '描述2', '标签2', '1124124', '0');
INSERT INTO `inspect_tag` VALUES ('3', '2013-07-11 00:00:00', '11212321', '标签3', '114124', '0');
INSERT INTO `inspect_tag` VALUES ('4', '2008-07-09 00:00:00', '描述4', '标签4', '12212', '0');
INSERT INTO `roles` VALUES ('1', '2013-07-30 00:00:00', '机修人员', '0');
INSERT INTO `roles` VALUES ('2', '2013-07-01 00:00:00', '门机队机械技术员', '0');
INSERT INTO `roles` VALUES ('3', '2010-07-04 00:00:00', '门机电气技术员', '0');
INSERT INTO `roles` VALUES ('4', '2011-07-24 00:00:00', '门机减速机技术员', '0');
INSERT INTO `roles` VALUES ('5', '2008-07-13 00:00:00', '门机司机', '0');
INSERT INTO `tvalue` VALUES ('1', '正常', '0');
INSERT INTO `tvalue` VALUES ('2', '异常', '0');
INSERT INTO `tvalue` VALUES ('3', '无', '0');
INSERT INTO `users` VALUES ('1', '2013-07-17 00:00:00', '地址1', '24', '工作人员1', '123456', '男', '0', '1', '1');
INSERT INTO `users` VALUES ('2', '2013-07-08 00:00:00', '地址2', '12', '工作人员2', '1111111', '男', '1', '1', '2');
INSERT INTO `users` VALUES ('3', '2013-07-11 00:00:00', '地址4', '24', '工作人员3', '1111111', '男', '0', '1', '3');
INSERT INTO `users` VALUES ('4', '2009-07-20 00:00:00', '地址4', '26', '工作人员4', '112211', '女', '0', '1', '4');
INSERT INTO `users` VALUES ('5', '2013-07-18 00:00:00', '地址5', '19', '工作人员5', '1242424', '男', '0', '1', '5');
