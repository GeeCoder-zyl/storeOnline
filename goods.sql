/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : goods

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-08-05 16:10:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods_admin
-- ----------------------------
DROP TABLE IF EXISTS `goods_admin`;
CREATE TABLE `goods_admin` (
  `ga_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员标识',
  `ga_name` varchar(20) NOT NULL COMMENT '管理员姓名',
  `ga_password` varchar(20) NOT NULL COMMENT '管理员密码',
  `ga_rank` int(1) NOT NULL COMMENT '管理员等级 1超级管理员 2普通管理员',
  `ga_status` int(1) NOT NULL COMMENT '管理员状态 0未启用 1启用 2删除',
  PRIMARY KEY (`ga_id`,`ga_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_admin
-- ----------------------------

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `gc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品类型标识',
  `gc_name` varchar(20) NOT NULL COMMENT '商品类型名称',
  `gc_status` int(1) NOT NULL COMMENT '商品类型状态 0未启用 1启用 2删除',
  PRIMARY KEY (`gc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_category
-- ----------------------------

-- ----------------------------
-- Table structure for goods_order
-- ----------------------------
DROP TABLE IF EXISTS `goods_order`;
CREATE TABLE `goods_order` (
  `go_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单标识',
  `go_orderCode` varchar(50) NOT NULL COMMENT '订单号',
  `go_address` varchar(255) NOT NULL COMMENT '收货地址',
  `go_post` varchar(20) NOT NULL COMMENT '发件人',
  `go_receiver` varchar(20) NOT NULL COMMENT '收货人',
  `go_phone` int(11) NOT NULL COMMENT '收货人电话',
  `go_useMessage` varchar(255) DEFAULT NULL COMMENT '备注',
  `go_createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建订单时间',
  `go_payDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '付款日期',
  `go_deliveryDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '收货时间',
  `go_confirmDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '确认收货时间',
  `go_uid` int(11) NOT NULL COMMENT '用户id',
  `go_status` int(1) NOT NULL COMMENT '订单状态 0取消 1待付款 2发货 3待收货 4待确认收货 5待评论 6已完成 7删除',
  PRIMARY KEY (`go_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_order
-- ----------------------------

-- ----------------------------
-- Table structure for goods_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `goods_orderitem`;
CREATE TABLE `goods_orderitem` (
  `goi_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单标识',
  `goi_pid` int(11) DEFAULT NULL COMMENT '商品id',
  `goi_oid` int(11) DEFAULT NULL COMMENT '订单id',
  `goi_uid` int(11) DEFAULT NULL COMMENT '用户id',
  `goi_number` int(11) DEFAULT NULL COMMENT '商品数量',
  `goi_status` int(1) DEFAULT NULL COMMENT '订单状态 0下架 1上架 2删除',
  PRIMARY KEY (`goi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for goods_product
-- ----------------------------
DROP TABLE IF EXISTS `goods_product`;
CREATE TABLE `goods_product` (
  `gp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品标识',
  `gp_name` varchar(20) NOT NULL COMMENT '商品名称',
  `gp_introduce` varchar(255) NOT NULL COMMENT '商品介绍',
  `gp_originalPrice` decimal(10,2) NOT NULL COMMENT '商品原价',
  `gp_promotePrice` decimal(10,2) DEFAULT NULL COMMENT '商品促销价',
  `gp_stock` int(11) NOT NULL COMMENT '商品库存',
  `gp_cid` int(11) NOT NULL COMMENT '商品类型id',
  `gp_uid` int(11) NOT NULL COMMENT '上传商品的用户id',
  `gp_createDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '商品创建时间',
  `gp_status` int(1) NOT NULL COMMENT '商品状态 0下架 1上架 2删除',
  PRIMARY KEY (`gp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_product
-- ----------------------------

-- ----------------------------
-- Table structure for goods_productimage
-- ----------------------------
DROP TABLE IF EXISTS `goods_productimage`;
CREATE TABLE `goods_productimage` (
  `gpi_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品图片标识',
  `gpi_pid` int(11) NOT NULL COMMENT '商品id',
  `gpi_type` varchar(20) NOT NULL COMMENT '商品图片类型（哪个部分的展示图片）',
  `gpi_status` int(1) NOT NULL COMMENT '图片状态 0下架 1上架 2删除',
  PRIMARY KEY (`gpi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_productimage
-- ----------------------------

-- ----------------------------
-- Table structure for goods_review
-- ----------------------------
DROP TABLE IF EXISTS `goods_review`;
CREATE TABLE `goods_review` (
  `gr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论标识',
  `gr_content` varchar(255) NOT NULL COMMENT '评论内容',
  `gr_uname` varchar(20) NOT NULL COMMENT '用户名称',
  `gr_pid` int(11) NOT NULL COMMENT '商品id',
  `gr_creatTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '评论创建时间',
  `gr_star` double(2,1) NOT NULL COMMENT '评论星级',
  `gr_status` int(1) NOT NULL COMMENT '评论状态 0下架 1发布 2删除',
  PRIMARY KEY (`gr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_review
-- ----------------------------

-- ----------------------------
-- Table structure for goods_user
-- ----------------------------
DROP TABLE IF EXISTS `goods_user`;
CREATE TABLE `goods_user` (
  `gu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `gu_name` varchar(20) NOT NULL COMMENT '用户名称',
  `gu_password` varchar(20) NOT NULL COMMENT '用户密码',
  `gu_status` int(1) NOT NULL COMMENT '用户状态',
  `gu_sex` varchar(1) DEFAULT NULL COMMENT '用户性别',
  `gu_age` int(4) DEFAULT NULL COMMENT '用户年龄',
  `gu_phone` int(11) DEFAULT NULL COMMENT '用户电话',
  `gu_address` varchar(255) DEFAULT NULL COMMENT '用户地址',
  `gu_payPassword` varchar(20) NOT NULL COMMENT '支付密码',
  PRIMARY KEY (`gu_id`,`gu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_user
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
