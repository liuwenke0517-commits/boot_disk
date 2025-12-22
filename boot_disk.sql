/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36)
 Source Host           : localhost:3306
 Source Schema         : boot_disk

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36)
 File Encoding         : 65001

 Date: 08/09/2025 18:49:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
CREATE TABLE `admin`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '管理员', 'http://localhost:9090/files/1743060533972-1.jpg', 'ADMIN', '13677889922', 'admin@xm.com');

-- ----------------------------
-- Table structure for disk_files
-- ----------------------------
CREATE TABLE `disk_files`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否文件夹',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件路径',
  `user_id` int NULL DEFAULT NULL COMMENT '创建人ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` double(10, 3) NULL DEFAULT NULL COMMENT '文件大小',
  `crate_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '修改时间',
  `folder_id` int NULL DEFAULT NULL COMMENT '所属文件夹ID',
  `root_folder_id` int NULL DEFAULT NULL COMMENT '最外层文件夹ID',
  `delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '网盘文件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of disk_files
-- ----------------------------
INSERT INTO `disk_files` VALUES (84, 'uploadsystemintro_picture2.jpg', '否', 'http://localhost:9090/diskFiles/download/1735052218413-uploadsystemintro_picture2.jpg', 2, 'jpg', 100.751, '2025-03-24 22:56:58', '2025-03-24 22:56:58', NULL, NULL, 0);
INSERT INTO `disk_files` VALUES (85, '111', '是', NULL, 2, 'folder', NULL, '2025-03-27 22:56:58', '2025-03-24 22:56:58', NULL, 85, 0);
INSERT INTO `disk_files` VALUES (86, 'uploadsystemintro_picture2-1拷贝.jpg', '否', 'http://localhost:9090/diskFiles/download/1735052218413-uploadsystemintro_picture2.jpg', 2, 'jpg', 100.751, '2025-03-24 22:56:58', '2025-03-24 22:56:58', NULL, NULL, 1);
INSERT INTO `disk_files` VALUES (87, 'uploadsystemintro_picture2.jpg', '否', 'http://localhost:9090/diskFiles/download/1735052875505-uploadsystemintro_picture2.jpg', 2, 'jpg', 100.751, '2025-03-20 22:56:58', '2025-03-24 22:56:58', NULL, NULL, 0);
INSERT INTO `disk_files` VALUES (88, '333', '是', NULL, 2, 'folder', NULL, '2025-03-21 22:56:58', '2025-03-24 22:56:58', NULL, 88, 1);
INSERT INTO `disk_files` VALUES (89, '23.jpg', '否', 'http://localhost:9090/diskFiles/download/1743061403646-2.jpg', 2, 'jpg', 2.349, '2025-03-27 15:43:23', '2025-03-27 15:43:23', NULL, NULL, 0);
INSERT INTO `disk_files` VALUES (90, '我的资源', '是', NULL, 2, 'folder', NULL, '2025-03-27 15:43:47', '2025-03-27 15:43:47', NULL, 90, 0);
INSERT INTO `disk_files` VALUES (91, '23-拷贝.jpg', '否', 'http://localhost:9090/diskFiles/download/1743061403646-2.jpg', 2, 'jpg', 2.349, '2025-03-27 15:44:19', '2025-03-27 15:44:19', NULL, NULL, 0);
INSERT INTO `disk_files` VALUES (92, '23-拷贝.jpg', '否', 'http://localhost:9090/diskFiles/download/1743061403646-2.jpg', 2, 'jpg', 2.349, '2025-09-08 18:46:33', '2025-09-08 18:46:33', NULL, NULL, 0);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
CREATE TABLE `notice`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '公告信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '新年快乐！！', '新年快乐！！', '2024-12-05', 'admin');
INSERT INTO `notice` VALUES (2, '维护公告，1月12日将关闭服务器一天。', '维护公告，1月12日将关闭服务器一天。', '2025-03-15', 'admin');
INSERT INTO `notice` VALUES (3, '请在规则内使用网盘，违者封禁！', '请在规则内使用，违者封禁！', '2024-03-25', 'admin');

-- ----------------------------
-- Table structure for share
-- ----------------------------
CREATE TABLE `share`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `file_id` int NULL DEFAULT NULL COMMENT '文件ID',
  `share_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分享时间',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '到期时间',
  `count` int NULL DEFAULT 0 COMMENT '访问次数',
  `user_id` int NULL DEFAULT NULL COMMENT '分享人ID',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '验证码',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分享' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of share
-- ----------------------------
INSERT INTO `share` VALUES (21, 'uploadsystemintro_picture2-1拷贝.jpg', 86, '2024-12-24 22:57:28', '2025-04-27 22:57:28', 1, 2, '1871570896591273984', 'jpg');
INSERT INTO `share` VALUES (22, '2.jpg', 89, '2025-03-27 15:43:28', '2025-03-30 15:43:28', 1, 2, '1905163748680257536', 'jpg');

-- ----------------------------
-- Table structure for trash
-- ----------------------------
CREATE TABLE `trash`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_id` int NULL DEFAULT NULL COMMENT '文件ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `size` double NULL DEFAULT NULL COMMENT '文件大小',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '删除时间',
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '回收站' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of trash
-- ----------------------------
INSERT INTO `trash` VALUES (62, 88, '333', NULL, '2024-12-24 23:08:21', 2);
INSERT INTO `trash` VALUES (63, 86, 'uploadsystemintro_picture2-1拷贝.jpg', 100.751, '2025-03-27 15:44:09', 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色标识',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '普通用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (2, '1', '1', '张三', 'http://localhost:9090/files/1743060575596-2.jpg', 'USER', '13055557777', 'moon@xm.com');
INSERT INTO `user` VALUES (6, '3', '3', '王五', NULL, 'USER', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
