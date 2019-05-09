
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT 'product id',
  `name` varchar(50) NOT NULL COMMENT 'category name',
  `description` varchar(1000) DEFAULT NULL COMMENT 'description',
  `imgURLs` varchar(200) DEFAULT NULL COMMENT 'store with string[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Surveillance', 'device', '');


-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `model` varchar(100) NOT NULL COMMENT 'model',
  `name` varchar(100) NOT NULL COMMENT 'name',
  `category_id` tinyint(4) NOT NULL COMMENT 'category id',
  `description` varchar(1000) DEFAULT NULL COMMENT 'descr',
  `price` double NOT NULL COMMENT 'price',
  `number` bigint(20) NOT NULL COMMENT 'num',
  `imgURLs` varchar(1000) DEFAULT NULL ,
  `brand` varchar(50) NOT NULL ,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'sdfwer23', 'sdf', '3', 'fadsf', '44545', '53545', null, 'gfd');


-- ----------------------------
-- Table structure for `statistics_category`
-- ----------------------------
DROP TABLE IF EXISTS `statistics_category`;
CREATE TABLE `statistics_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `num` int(11) unsigned DEFAULT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ;

-- ----------------------------
-- Records of statistics_category
-- ----------------------------
INSERT INTO `statistics_category` VALUES ('1', '1', '2');
INSERT INTO `statistics_category` VALUES ('2', '2', '3');
INSERT INTO `statistics_category` VALUES ('3', '3', '4');
INSERT INTO `statistics_category` VALUES ('4', '4', '5');
INSERT INTO `statistics_category` VALUES ('5', '5', '7');

-- ----------------------------
-- Table structure for `tb_car_product`
-- ----------------------------
DROP TABLE IF EXISTS `tb_car_product`;
CREATE TABLE `tb_car_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL ,
  `product_id` bigint(20) NOT NULL ,
  `product_count` int(4) NOT NULL ,
  `add_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_car_product
-- ----------------------------

-- ----------------------------
-- Table structure for `tb_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '-1' ,
  `product_id` bigint(20) NOT NULL DEFAULT '-1',
  `number` bigint(20) NOT NULL DEFAULT '-1',
  `state` tinyint(5) NOT NULL DEFAULT '-1',
  `time` date NOT NULL ,
  `memo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('18', '38', '10', '1', '2', '2016-02-23', '');
INSERT INTO `tb_order` VALUES ('22', '38', '3', '6', '2', '2016-02-23', 'å¾å¥½');
INSERT INTO `tb_order` VALUES ('23', '38', '4', '6', '0', '2016-02-23', null);

-- ----------------------------
-- Table structure for `tb_product_order`
-- ----------------------------
DROP TABLE IF EXISTS `tb_product_order`;
CREATE TABLE `tb_product_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL ,
  `order_id` bigint(20) DEFAULT NULL ,
  `number` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_product_order
-- ----------------------------
INSERT INTO `tb_product_order` VALUES ('1', '-1', '2', '-1', '35');
INSERT INTO `tb_product_order` VALUES ('2', '-1', '4', '-1', '38');
INSERT INTO `tb_product_order` VALUES ('3', '-1', '5', '-1', '38');
INSERT INTO `tb_product_order` VALUES ('4', '-1', '6', '-1', '38');
INSERT INTO `tb_product_order` VALUES ('5', '3', '7', '-1', '38');
INSERT INTO `tb_product_order` VALUES ('6', '2', '8', '-1', '38');
INSERT INTO `tb_product_order` VALUES ('7', '2', '9', '-1', '38');
INSERT INTO `tb_product_order` VALUES ('8', '2', '10', '2', '38');
INSERT INTO `tb_product_order` VALUES ('9', '4', '11', '6', '38');
INSERT INTO `tb_product_order` VALUES ('10', '10', '12', '1', '38');
INSERT INTO `tb_product_order` VALUES ('11', '3', '13', '6', '38');
INSERT INTO `tb_product_order` VALUES ('12', '4', '14', '6', '38');


-- ----------------------------
-- Table structure for `tb_shop_car`
-- ----------------------------
DROP TABLE IF EXISTS `tb_shop_car`;
CREATE TABLE `tb_shop_car` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_shop_car
-- ----------------------------
INSERT INTO `tb_shop_car` VALUES ('1', '2');
INSERT INTO `tb_shop_car` VALUES ('2', '3');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `loginName` varchar(100) NOT NULL,
  `loginPass` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `type` tinyint(4) NOT NULL ,
  `sex` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `companyType` varchar(50) DEFAULT NULL ,
  `companySize` tinyint(4) DEFAULT NULL ,
  `companyOwner` varchar(100) DEFAULT NULL ,
  `companyNumber` varchar(100) DEFAULT NULL ,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('39', 'df', 'eee', '111111', 'dsf', '111', '1', 'male', '1980-01-01', null, '0', null, null);
INSERT INTO `user` VALUES ('41', 'sdf', 'vvv', '111111', 'df', '34', '1', 'female', '1980-01-01', null, '0', null, null);
INSERT INTO `user` VALUES ('46', 'dsf', 'hhh', '111111', 'df', '234', '1', 'male', '1980-01-01', null, '0', null, null);

