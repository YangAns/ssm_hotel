/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : hotel

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 09/09/2021 16:30:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门编号',
  `deptname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '部门名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `createDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '1', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (2, '2', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (3, '3', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (4, '4', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (5, '运营部', '2305', NULL, NULL);
INSERT INTO `sys_dept` VALUES (6, '事业部', '2031', '2021-09-08 11:16:40', '');

-- ----------------------------
-- Table structure for sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee`;
CREATE TABLE `sys_employee`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `loginname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录账号',
  `loginpwd` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '登录密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '真实姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1-男 2-女）',
  `deptId` int(11) DEFAULT NULL COMMENT '部门编号',
  `hiredate` datetime(0) DEFAULT NULL COMMENT '入职日期',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加密盐值',
  `createdBy` int(11) DEFAULT NULL COMMENT '创建人',
  `createDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改人',
  `modifyDate` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO `sys_employee` VALUES (1, 'admin', '70761d94ca5ce6a3d1d6f34b42401a5f', '超级管理员', 1, 1, '2021-09-01 08:47:48', '2073b6a5eb3b4a7192691000b5476dd2', 1, '2021-09-08 08:48:08', NULL, NULL, NULL);
INSERT INTO `sys_employee` VALUES (3, 'shopmanager', '89ce27cb45640281b3c69e60dce9be61', '王宇', 1, 5, '2021-09-08 00:00:00', 'a39c461513b1430286f7661133f52a3a', 1, '2021-09-08 13:54:58', 1, '2021-09-08 14:15:43', '');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `pid` int(11) DEFAULT NULL COMMENT '所属父级菜单编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单名称',
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '打开链接地址',
  `spread` int(11) DEFAULT NULL COMMENT '是否展开(0-否，1-是)',
  `target` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '打开方式',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '菜单图标样式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', NULL, 1, '_self', 'fa fa-users');
INSERT INTO `sys_menu` VALUES (2, 0, '客房管理', NULL, 1, '_self', 'fa fa-users');
INSERT INTO `sys_menu` VALUES (3, 1, '员工管理', '/admin/toEmployeeManager', 0, NULL, 'fa fa-users');
INSERT INTO `sys_menu` VALUES (4, 1, '部门管理', '/admin/toDeptManager', 0, '', 'fa fa-users');
INSERT INTO `sys_menu` VALUES (5, 2, '房型管理', '/admin/toRoomTypeManager', 0, NULL, 'fa fa-university');
INSERT INTO `sys_menu` VALUES (6, 2, '房间管理', '/admin/toRoomManager', 0, NULL, 'fa fa-users');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', '/admin/toRoleManager', NULL, NULL, 'fa fa-users');
INSERT INTO `sys_menu` VALUES (8, 1, '菜单管理', '/admin/toMenuManager', NULL, NULL, 'fa fa-users');
INSERT INTO `sys_menu` VALUES (10, 2, '楼层管理', '/admin/toFloorManager', 0, '_self', 'fa fa-stack-overflow');
INSERT INTO `sys_menu` VALUES (11, 0, '订单管理', NULL, 1, '_self', 'fa fa-users');
INSERT INTO `sys_menu` VALUES (12, 0, '报表管理', NULL, 1, '_self', 'fa fa-users');
INSERT INTO `sys_menu` VALUES (13, 11, '预订管理', '/admin/toOrdersManager', 0, '_self', 'fa fa-address-card');
INSERT INTO `sys_menu` VALUES (14, 11, '入住管理', '/admin/toCheckinManager', 0, '_self', '');
INSERT INTO `sys_menu` VALUES (15, 12, '年度营业额报表统计', '/admin/toYearTotalPriceManager', 0, '_self', '');
INSERT INTO `sys_menu` VALUES (16, 12, '月营业额报表统计', '/admin/toYearOfMonthCharts', 0, '_self', '');
INSERT INTO `sys_menu` VALUES (17, 12, '季度营业额报表统计', '/admin/toQuarterTotalPriceCharts', 0, '_self', '');
INSERT INTO `sys_menu` VALUES (18, 12, '房型预订报表统计', '/admin/toRoomTypePieCharts', 0, '_self', '');
INSERT INTO `sys_menu` VALUES (19, 12, '当日开房报表', '/admin/toCurrentDateCheckinCharts', 0, '_self', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `roledesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有操作权限');
INSERT INTO `sys_role` VALUES (2, '系统管理员', '拥有系统管理操作权限');
INSERT INTO `sys_role` VALUES (4, '资料管理员', '管理资料');
INSERT INTO `sys_role` VALUES (6, '店员', '');

-- ----------------------------
-- Table structure for sys_role_employee
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_employee`;
CREATE TABLE `sys_role_employee`  (
  `eid` int(11) NOT NULL COMMENT '员工编号',
  `rid` int(11) NOT NULL COMMENT '角色编号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_employee
-- ----------------------------
INSERT INTO `sys_role_employee` VALUES (1, 1);
INSERT INTO `sys_role_employee` VALUES (1, 1);
INSERT INTO `sys_role_employee` VALUES (3, 2);
INSERT INTO `sys_role_employee` VALUES (3, 4);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `mid` int(11) NOT NULL COMMENT '菜单编号',
  `rid` int(11) NOT NULL COMMENT '角色编号'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (4, 2);
INSERT INTO `sys_role_menu` VALUES (7, 2);
INSERT INTO `sys_role_menu` VALUES (8, 2);
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (7, 1);
INSERT INTO `sys_role_menu` VALUES (8, 1);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (5, 1);
INSERT INTO `sys_role_menu` VALUES (6, 1);
INSERT INTO `sys_role_menu` VALUES (10, 1);
INSERT INTO `sys_role_menu` VALUES (11, 1);
INSERT INTO `sys_role_menu` VALUES (13, 1);
INSERT INTO `sys_role_menu` VALUES (14, 1);
INSERT INTO `sys_role_menu` VALUES (12, 1);
INSERT INTO `sys_role_menu` VALUES (15, 1);
INSERT INTO `sys_role_menu` VALUES (16, 1);
INSERT INTO `sys_role_menu` VALUES (17, 1);
INSERT INTO `sys_role_menu` VALUES (18, 1);
INSERT INTO `sys_role_menu` VALUES (19, 1);

-- ----------------------------
-- Table structure for t_checkin
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `roomTypeId` int(11) DEFAULT NULL COMMENT '所属房型',
  `roomId` bigint(20) DEFAULT NULL COMMENT '所属房间',
  `customerName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入住人姓名',
  `idCard` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '入住人身份证号',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '手机号',
  `arriveDate` date DEFAULT NULL COMMENT '入住日期',
  `leaveDate` date DEFAULT NULL COMMENT '离店日期',
  `payPrice` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `ordersId` bigint(20) DEFAULT NULL COMMENT '关联预订订单ID',
  `status` int(11) UNSIGNED DEFAULT NULL COMMENT '状态',
  `createDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `createdBy` int(11) DEFAULT NULL COMMENT '创建人',
  `modifyDate` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `payPrice`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkin
-- ----------------------------
INSERT INTO `t_checkin` VALUES (1, 5, 3, 'we', '12244', '13679642629', '2021-09-09', '2021-09-11', 800.00, 2, 2, '2021-09-09 14:00:32', 1, NULL, NULL, '33');

-- ----------------------------
-- Table structure for t_checkout
-- ----------------------------
DROP TABLE IF EXISTS `t_checkout`;
CREATE TABLE `t_checkout`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `checkOutNumber` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '退房记录编号',
  `checkInId` bigint(20) DEFAULT NULL COMMENT '关联入住ID',
  `consumePrice` decimal(10, 2) DEFAULT NULL COMMENT '消费金额',
  `createDate` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `createdBy` int(11) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkout
-- ----------------------------
INSERT INTO `t_checkout` VALUES (1, '47bc6dbc68904a17be067ea86d88a045', 1, NULL, '2021-09-09 14:00:41', 1, NULL);

-- ----------------------------
-- Table structure for t_floor
-- ----------------------------
DROP TABLE IF EXISTS `t_floor`;
CREATE TABLE `t_floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '楼层名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_floor
-- ----------------------------
INSERT INTO `t_floor` VALUES (1, '1楼', '酒店1楼');
INSERT INTO `t_floor` VALUES (3, '2楼', '酒店二楼');
INSERT INTO `t_floor` VALUES (4, '3楼', '酒店三楼');

-- ----------------------------
-- Table structure for t_orders
-- ----------------------------
DROP TABLE IF EXISTS `t_orders`;
CREATE TABLE `t_orders`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '预订编号',
  `ordersNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预订单号',
  `accountId` bigint(20) DEFAULT NULL COMMENT '预订人账号ID',
  `roomTypeId` int(11) DEFAULT NULL COMMENT '房型编号',
  `roomId` bigint(20) DEFAULT NULL COMMENT '房间ID',
  `reservationName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '预订人姓名',
  `idCard` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `status` int(11) DEFAULT NULL COMMENT '状态1-待确认  2-已确认',
  `reserveDate` datetime(0) DEFAULT NULL COMMENT '预定时间',
  `arriveDate` date DEFAULT NULL COMMENT '到店时间',
  `leaveDate` date DEFAULT NULL COMMENT '离店时间',
  `reservePrice` decimal(10, 2) DEFAULT NULL COMMENT '预订价格',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_orders
-- ----------------------------
INSERT INTO `t_orders` VALUES (1, 'c3b5c54daf244749ad0e6eea8470a4ca', 1, 2, 4, '谢小', '513826199906022713', '13679642629', 1, '2021-09-09 09:43:01', '2021-09-09', '2021-09-11', 400.00, '');
INSERT INTO `t_orders` VALUES (2, '5b9a8b4efcfa42838a285852dd642939', 2, 5, 3, 'we', '12244', '13679642629', 4, '2021-09-09 09:55:42', '2021-09-09', '2021-09-11', 800.00, '33');

-- ----------------------------
-- Table structure for t_room
-- ----------------------------
DROP TABLE IF EXISTS `t_room`;
CREATE TABLE `t_room`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房间图片',
  `roomNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房间编号',
  `roomTypeId` int(11) DEFAULT NULL COMMENT '房型',
  `floorId` int(11) DEFAULT NULL COMMENT '所属楼层',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `roomDesc` text CHARACTER SET utf8 COLLATE utf8_bin COMMENT '房间描述',
  `roomRequirement` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '要求',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_room
-- ----------------------------
INSERT INTO `t_room` VALUES (1, '20210908/737dada33fca40609ad63cd1429edc46.jpg', '101', 2, 1, 3, '<p><img src=\"/hotel/show/20210909/48cd9d30f8174480b3becded3cc69659.jpg\" alt=\"undefined\"><br></p>', '每天14:00后入住，12:00之前退房。', NULL);
INSERT INTO `t_room` VALUES (2, '20210908/71dbd6dfa64c4656bdaa748e0ebc643b.jpg', '201', 3, 3, 3, '<p><img src=\"/hotel/show/20210909/da63c7618c564453ab1edbcbc219a863.jpg\" alt=\"undefined\"><br></p>', '每天14:00后入住，12:00之前退房。', '1');
INSERT INTO `t_room` VALUES (3, '20210908/d778fbdb50904809beaaf0b7adc525d7.jpg', '301', 5, 4, 3, '<p><img src=\"/hotel/show/20210909/b9ad24c9fd5f4f8b931b19a5d8858692.jpg\" alt=\"undefined\"><br></p>', '每天14:00后入住，12:00之前退房。', '1');
INSERT INTO `t_room` VALUES (4, '20210908/b7a03e42ce354c6089d0cafae6ee924a.jpg', '102', 2, 1, 1, '<p><img src=\"/hotel/show/20210909/186ed93fc1594477bbec34ea0eb3b33e.jpg\" alt=\"undefined\"><br></p>', '每天14:00后入住，12:00之前退房。', '');

-- ----------------------------
-- Table structure for t_room_type
-- ----------------------------
DROP TABLE IF EXISTS `t_room_type`;
CREATE TABLE `t_room_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '房型编号',
  `typeName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房型名称',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '房型图片',
  `price` decimal(8, 2) DEFAULT NULL COMMENT '参考价格',
  `liveNum` int(11) DEFAULT NULL COMMENT '可入住人数',
  `bedNum` int(11) DEFAULT NULL COMMENT '床位数',
  `roomNum` int(11) DEFAULT NULL COMMENT '房间数量',
  `reservedNum` int(11) DEFAULT NULL COMMENT '已预定数量',
  `avilableNum` int(11) DEFAULT NULL COMMENT '可住房间数',
  `livedNum` int(11) DEFAULT NULL COMMENT '已入住数量',
  `status` int(11) DEFAULT NULL COMMENT '房型状态',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_room_type
-- ----------------------------
INSERT INTO `t_room_type` VALUES (2, '单人间', '20210908/dc601bad14504c16b2accb449d8f7778.jpg', 200.00, 2, 1, 20, 1, 19, 0, 1, '无');
INSERT INTO `t_room_type` VALUES (3, '双人间', '20210908/686e860df876478f965ccd0ee1c80a34.jpg', 300.00, 2, 2, 20, 0, 20, 0, 1, 'x');
INSERT INTO `t_room_type` VALUES (4, '标准间', '20210908/a4e36ceba167404c9a4a882b848d1357.jpg', 300.00, 2, 1, 20, 0, 20, 0, 1, '2');
INSERT INTO `t_room_type` VALUES (5, '商务间', '20210908/636724dc7e8e405daf053ce3de133bd5.jpg', 400.00, 1, 1, 20, 1, 20, 0, 1, '');
INSERT INTO `t_room_type` VALUES (6, '标准双人间', '20210908/27338636d7f64ca682109f05238787b5.jpg', 360.00, 40, 2, 20, NULL, 20, 0, 1, '');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `loginName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '登录账号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '登录密码',
  `realName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '真实姓名',
  `idCard` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '身份证号码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `status` int(11) DEFAULT NULL COMMENT '状态1-可用 0-异常',
  `createDate` datetime(0) DEFAULT NULL COMMENT '注册时间',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '盐值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'zj-s', '9e650a13a5c5d93a21e6d15b5d4aa0f3', '王五', NULL, '13679642326', NULL, NULL, NULL, 'e2c6603aa9154c649ab4b68faec64aa4');
INSERT INTO `t_user` VALUES (2, 'yw', 'cdfe8ff55f54d67d2347ad724348de28', NULL, NULL, '15283349626', NULL, NULL, NULL, '2b894a64f0fd473d90691c7f6ab90dd0');
INSERT INTO `t_user` VALUES (3, 'tj', 'bdd7375156d97d8ee99ff37ed126fbd2', NULL, NULL, '15234678964', NULL, NULL, NULL, 'c562e80d010a415ca9a0b627db2e4b19');

SET FOREIGN_KEY_CHECKS = 1;
