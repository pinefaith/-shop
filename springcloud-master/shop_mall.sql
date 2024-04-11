/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : shop_mall

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 20/09/2023 01:01:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人姓名',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人固定电话号码',
  `addr` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, 1, '杨青山', '19140008057', '山东省烟台市莱山区清泉路30号');
INSERT INTO `address` VALUES (2, 2, '蒋冠沼', '12345566789', '山东省烟台市莱山区清泉路30号');
INSERT INTO `address` VALUES (5, 5, '胡海阔', '123456789', '山东省烟台市莱山区清泉路30号');
INSERT INTO `address` VALUES (11, 3, '陈延傅', '123456789', '山东省济宁市嘉祥县文化路30号');
INSERT INTO `address` VALUES (15, 3, '陈延傅', '17878767875', '山东省烟台市莱山区烟台大学北校区');
INSERT INTO `address` VALUES (22, 4, '陈延续', '123456789', '山东省烟台市芝罘区凤凰路30号');
INSERT INTO `address` VALUES (23, 4, '陈延续', '123456789', '山东省烟台市芝罘区凤凰路30号');
INSERT INTO `address` VALUES (24, 1, '张博', '188816354632', '清泉路30号');
INSERT INTO `address` VALUES (26, 1, '', '', '');
INSERT INTO `address` VALUES (27, 11, '1', '1', '1');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(0) NOT NULL COMMENT '用户Id',
  `product_id` int(0) NOT NULL COMMENT '商品Id',
  `quantity` int(0) NOT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (1, 1, 1, 9);
INSERT INTO `cart` VALUES (9, 5, 56, 3);
INSERT INTO `cart` VALUES (115, 5, 58, 1);
INSERT INTO `cart` VALUES (118, 3, 115, 1);
INSERT INTO `cart` VALUES (119, 3, 146, 2);
INSERT INTO `cart` VALUES (120, 4, 1, 1);
INSERT INTO `cart` VALUES (121, 4, 3, 1);
INSERT INTO `cart` VALUES (122, 3, 63, 1);
INSERT INTO `cart` VALUES (123, 3, 117, 1);
INSERT INTO `cart` VALUES (124, 3, 61, 1);
INSERT INTO `cart` VALUES (125, 3, 7, 2);
INSERT INTO `cart` VALUES (126, 3, 1, 4);
INSERT INTO `cart` VALUES (127, 3, 68, 1);
INSERT INTO `cart` VALUES (128, 3, 100, 1);
INSERT INTO `cart` VALUES (129, 3, 120, 1);
INSERT INTO `cart` VALUES (130, 3, 3, 1);
INSERT INTO `cart` VALUES (131, 3, 2, 5);
INSERT INTO `cart` VALUES (132, 4, 7, 1);
INSERT INTO `cart` VALUES (133, 4, 64, 1);
INSERT INTO `cart` VALUES (134, 5, 1, 1);
INSERT INTO `cart` VALUES (135, 5, 2, 1);
INSERT INTO `cart` VALUES (136, 2, 7, 4);
INSERT INTO `cart` VALUES (137, 3, 56, 1);
INSERT INTO `cart` VALUES (139, 11, 1, 1);
INSERT INTO `cart` VALUES (140, 11, 6, 1);
INSERT INTO `cart` VALUES (141, 11, 12, 1);
INSERT INTO `cart` VALUES (142, 11, 8, 1);
INSERT INTO `cart` VALUES (143, 3, 23, 1);
INSERT INTO `cart` VALUES (144, 3, 20, 1);
INSERT INTO `cart` VALUES (145, 3, 59, 1);
INSERT INTO `cart` VALUES (146, 14, 20, 1);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_no` bigint(0) NOT NULL COMMENT '订单编号',
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `address_id` int(0) NOT NULL COMMENT '收货地址编号',
  `amount` decimal(20, 2) NOT NULL COMMENT '订单付款金额',
  `created_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `comments` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单评价',
  `status` int(0) NULL DEFAULT NULL COMMENT '订单状态，1-未付款，2-已付款，3-已发货，4-交易成功',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE,
  INDEX `addr_id`(`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 252 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 188469141, 1, 1, 2491.90, '2023-06-11 10:54:50', '2023-06-11 10:54:52', '商品质量很好，在该商城买东西很放心！', 2);
INSERT INTO `order` VALUES (2, 20230622180743, 3, 11, 2499.00, '2023-06-22 18:07:44', '2023-06-22 18:08:10', '世达组合工具很好用，但是手套价格偏高，这次物流很慢！差评', 2);
INSERT INTO `order` VALUES (3, 20230622195336, 3, 11, 998.00, '2023-06-22 19:53:36', '2023-06-22 19:54:56', '诺冠喷雾器用起来很方便，大品牌值得推荐！', 2);
INSERT INTO `order` VALUES (4, 20230622223145, 5, 5, 1240.90, '2023-06-22 22:31:46', '2023-06-22 22:32:01', '冲压油价格很实惠，医用口罩规格也很大，就是这次物流慢一些。', 2);
INSERT INTO `order` VALUES (252, 20230920002458, 1, 1, 2099.00, '2023-09-20 00:24:59', NULL, NULL, 1);
INSERT INTO `order` VALUES (253, 20230920002611, 1, 1, 2099.00, '2023-09-20 00:26:12', NULL, NULL, 1);
INSERT INTO `order` VALUES (254, 20230920004844, 1, 1, 2099.00, '2023-09-20 00:48:44', NULL, NULL, 1);
INSERT INTO `order` VALUES (255, 20230920005714, 1, 1, 1662.90, '2023-09-20 00:57:14', NULL, NULL, 1);
INSERT INTO `order` VALUES (256, 20230920005821, 1, 1, 25.00, '2023-09-20 00:58:22', NULL, NULL, 1);
INSERT INTO `order` VALUES (257, 20230920005911, 1, 1, 73.90, '2023-09-20 00:59:12', NULL, NULL, 1);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单项id',
  `user_id` int(0) NOT NULL COMMENT '用户编号',
  `order_no` bigint(0) NOT NULL COMMENT '所属订单编号',
  `product_id` int(0) NOT NULL COMMENT '商品编号',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(20, 2) NOT NULL COMMENT '商品单价',
  `quantity` int(0) NOT NULL COMMENT '购买的商品数量',
  `total_price` decimal(20, 2) NOT NULL COMMENT '订单项总价格',
  `created` datetime(0) NULL DEFAULT NULL,
  `updated` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`user_id`) USING BTREE,
  INDEX `goods_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 300 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (300, 1, 20230920002458, 2, '钢盾 工具套装，150件套综合性组套工具，S010002', 2099.00, 1, 2099.00, '2023-09-20 00:24:59', '2023-09-20 00:24:59');
INSERT INTO `order_items` VALUES (301, 1, 20230920002611, 2, '钢盾 工具套装，150件套综合性组套工具，S010002', 2099.00, 1, 2099.00, '2023-09-20 00:26:12', '2023-09-20 00:26:12');
INSERT INTO `order_items` VALUES (302, 1, 20230920004844, 2, '钢盾 工具套装，150件套综合性组套工具，S010002', 2099.00, 1, 2099.00, '2023-09-20 00:48:44', '2023-09-20 00:48:44');
INSERT INTO `order_items` VALUES (303, 1, 20230920005714, 6, '捷科JETECH 新款5抽工具车，带锁，060802，RC-5C', 1662.90, 1, 1662.90, '2023-09-20 00:57:14', '2023-09-20 00:57:14');
INSERT INTO `order_items` VALUES (304, 1, 20230920005821, 16, '世达美工刀', 25.00, 1, 25.00, '2023-09-20 00:58:22', '2023-09-20 00:58:22');
INSERT INTO `order_items` VALUES (305, 1, 20230920005911, 23, '易尔拓YATO 绝缘斜嘴钳', 73.90, 1, 73.90, '2023-09-20 00:59:12', '2023-09-20 00:59:12');

-- ----------------------------
-- Table structure for prefer
-- ----------------------------
DROP TABLE IF EXISTS `prefer`;
CREATE TABLE `prefer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `product_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  INDEX `action_like_ibfk_1_idx`(`user_id`) USING BTREE,
  INDEX `action_like_ibfk_2_idx`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of prefer
-- ----------------------------
INSERT INTO `prefer` VALUES (2, 1, 14);
INSERT INTO `prefer` VALUES (3, 2, 35);
INSERT INTO `prefer` VALUES (4, 2, 44);
INSERT INTO `prefer` VALUES (7, 4, 45);
INSERT INTO `prefer` VALUES (8, 4, 48);
INSERT INTO `prefer` VALUES (9, 5, 55);
INSERT INTO `prefer` VALUES (10, 5, 46);
INSERT INTO `prefer` VALUES (11, 1, 1);
INSERT INTO `prefer` VALUES (12, 1, 5);
INSERT INTO `prefer` VALUES (15, 3, 7);
INSERT INTO `prefer` VALUES (16, 3, 65);
INSERT INTO `prefer` VALUES (17, 3, 5);
INSERT INTO `prefer` VALUES (18, 3, 16);
INSERT INTO `prefer` VALUES (19, 3, 20);
INSERT INTO `prefer` VALUES (20, 3, 1);
INSERT INTO `prefer` VALUES (21, 3, 63);
INSERT INTO `prefer` VALUES (22, 3, 59);
INSERT INTO `prefer` VALUES (23, 11, 16);

-- ----------------------------
-- Table structure for products_copy
-- ----------------------------
DROP TABLE IF EXISTS `products_copy`;
CREATE TABLE `products_copy`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称(配件)',
  `image_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图片',
  `sort_id` int(0) NULL DEFAULT NULL COMMENT '产品类型编号，对应action_params表中parent_id为0的分类',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品详情',
  `price` decimal(20, 2) NULL DEFAULT NULL COMMENT '价格：单位元，保留两位小数',
  `stock` int(0) NULL DEFAULT NULL COMMENT '库存',
  `popularity` int(0) NULL DEFAULT 2 COMMENT '是否热销，1-是，2-否',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`sort_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products_copy
-- ----------------------------
INSERT INTO `products_copy` VALUES (1, '钢盾 通用工具套装，25件套，S022003', '1-1-1-1.jpg', 10166, '钢盾 通用工具套装，25件套，S022003', 392.80, 26, 3);
INSERT INTO `products_copy` VALUES (2, '钢盾 工具套装，150件套综合性组套工具，S010002', '1-1-1-2.jpg', 10166, '钢盾 工具套装，150件套综合性组套工具，S010002', 2099.00, 86, 1);
INSERT INTO `products_copy` VALUES (3, '电讯工具套装，史丹利 53件套，89-883-23', '1-1-2-1.jpg', 10167, '专业人士必备套装，适用于日常维护维修和故障\r\n\r\n解决工具配备齐全，使用得心应手;\r\n\r\n通用性好，广泛用于各个行业;\r\n\r\n吹塑工具盒坚固耐用;\r\n\r\n品质优秀，值得信赖', 1089.00, 96, 0);
INSERT INTO `products_copy` VALUES (4, '世达组合工具，世达6.3 X 10 X 12.5mm系列120件套 09014，升级后为124件套', '1-1-3-1.jpg', 10168, '吹塑盒包装方便取放和收纳\r\n\r\n规格全，满足多种操作需求\r\n\r\n制作精良，耐磨耐用', 1499.00, 1, 0);
INSERT INTO `products_copy` VALUES (5, '史丹利EVA工具托组套-30件1/2\"系列套筒 ,90-031-23', '1-1-4-1.jpg', 10169, '产品适合各种场景，汽车、摩托车、各种机器的维修...', 493.90, 0, 0);
INSERT INTO `products_copy` VALUES (6, '捷科JETECH 新款5抽工具车，带锁，060802，RC-5C', '1-2-1-1.jpg', 10170, '三层工具车RC-C，专业好品质缔造结实耐用好产品', 1662.90, 0, 3);
INSERT INTO `products_copy` VALUES (7, '世达塑料工具箱', '1-2-2-1.jpg', 10171, '箱体选用增强型PP材料，含纤维树脂，高强度耐冲击\r\n\r\n锁扣，提手采用ABS工程塑料，牢固耐用；\r\n\r\n内含层板，方便自由分割储物区域', 205.00, 95, 1);
INSERT INTO `products_copy` VALUES (8, 'Raxwell 工业级活动扳手套装', '1-3-1-1.jpg', 10172, '工业级活动扳手套装，6件套，6-18\" 光柄，RTWA0002-7，活络扳手 活口扳手 活扳手 万用扳手', 659.00, 7, 1);
INSERT INTO `products_copy` VALUES (9, '得力DeLi 棘轮两用扳手', '1-3-2-1.jpg', 10173, '棘轮开口两用扳手;Cr-V铬钒钢;24mm', 47.89, 10, 0);
INSERT INTO `products_copy` VALUES (10, '得力DeLi 开口扳手', '1-3-3-1.jpg', 10174, '双头开口扳手;8×10mm;碳钢', 7.19, 10, 0);
INSERT INTO `products_copy` VALUES (11, '得力DeLi 梅花扳手', '1-3-4-1.jpg', 10175, '双头梅花扳手;24×27mm;碳钢', 33.90, 10, 0);
INSERT INTO `products_copy` VALUES (12, '迷你断线钳', '1-4-1-1.jpg', 10176, '钳体采用CR-V钢锻造;钳头热处理，硬度高', 23.69, 7, 10);
INSERT INTO `products_copy` VALUES (13, '马牌孔用卡簧钳', '1-4-2-1.jpg', 10177, '孔用卡簧钳;卡簧范围20-60mm;长度175', 172.90, 10, 0);
INSERT INTO `products_copy` VALUES (14, '凯尼派克 Knipex 卡簧钳组套', '1-4-3-1.jpg', 10178, '内含工具:MAG087：直嘴孔用卡簧钳，MAG091：弯嘴孔用卡簧钳，MAG097：直嘴轴用卡簧钳，MAG101：弯嘴轴用卡簧钳', 951.90, 10, 0);
INSERT INTO `products_copy` VALUES (15, 'martor 安全刀具，带金属性塑料COMBI安全刀', '1-5-1-1.jpg', 10179, '可检测金属的塑料;完美的人体工程学;优化了刀片区', 153.90, 10, 0);
INSERT INTO `products_copy` VALUES (16, '世达美工刀', '1-5-2-1.jpg', 10180, '世达美工刀，橡塑柄推钮 8节18x100mm, 93428', 25.00, 9, 20);
INSERT INTO `products_copy` VALUES (17, '螺丝刀Raxwell 双色柄一字螺丝刀', '1-6-1-1.jpg', 10181, '橡塑复合柄;披头材质为合金钢', 19.90, 10, 0);
INSERT INTO `products_copy` VALUES (18, '宝工BITS组100PCS起子组套装', '1-6-2-1.jpg', 10182, '宝工BITS组100PCS起子组套装，SD-2310，（不含手柄）', 164.90, 10, 0);
INSERT INTO `products_copy` VALUES (19, '世达球形微型六角螺丝刀', '1-6-3-1.jpg', 10183, '进口SVCM+ 刀杆，整体热处理；\r\n\r\n刀杆表面亚光电镀，头部磷化发黑处理，提供精准功能端尺寸；\r\n\r\n特有旋转式旋帽设计；', 20.00, 10, 0);
INSERT INTO `products_copy` VALUES (20, 'Raxwell 工业级可调式扭力扳手套装', '1-7-1-1.jpg', 10184, '3件套，5-400N.m,可换头精度±3，RTWT0021/23/26，扭矩 力矩', 7069.00, 10, 30);
INSERT INTO `products_copy` VALUES (21, 'CREATIONSPACE 3.7V充电式精密扭矩螺丝刀套装', '1-7-2-1.jpg', 10185, '0.35N.m，CS03B，ZPJ1802A，手机电脑螺丝拆装工具', 199.00, 10, 0);
INSERT INTO `products_copy` VALUES (22, 'Raxwell 14x18mm系列方头梅开型扭力扳手头', '1-7-3-1.jpg', 10186, '梅花36mm，开口27mm，RTWH0253', 499.00, 10, 0);
INSERT INTO `products_copy` VALUES (23, '易尔拓YATO 绝缘斜嘴钳', '1-8-1-1.jpg', 10187, '产品名称：绝缘斜嘴钳,6\"（160mm）\r\n\r\n品牌：易尔拓YATO \r\n\r\n制造商型号：YT-21158', 73.90, 8, 41);
INSERT INTO `products_copy` VALUES (24, '宝工Pro\'sKit 光纤熔接机(简体中文版)', '1-8-2-1.jpg', 10188, '宝工Pro\'sKit 光纤熔接机(简体中文版)，TE-6201G-W', 12099.00, 10, 0);
INSERT INTO `products_copy` VALUES (25, '上工 不锈钢用直柄麻花钻', '2-1-1-1.jpg', 10189, '可运用于钻床、车床、铣床,手电钻等工具机上使用。\r\n\r\n直柄麻花钻有双后角，减少钻孔阻力，降低热量，钻头更耐用。', 771.90, 10, 0);
INSERT INTO `products_copy` VALUES (26, '上工 锥柄机用铰刀', '2-1-2-1.jpg', 10190, '在机床上铰削一定精度的配合孔，对孔进行半精加工及精加工，也可以拥有磨孔前和研孔前的预加工。', 45.89, 10, 0);
INSERT INTO `products_copy` VALUES (27, '诗经 三牙轮钻头', '2-1-3-1.jpg', 10191, '修型中使用最多最广的工具，有平头、尖头和圆头等几种，主要用来修理型砂(芯)的较大平面，开挖浇冒口，切割沟槽和铸肋，修整砂坯及软硬砂床，把砂型表面的加强钉掀入砂型等', 6959.00, 10, 0);
INSERT INTO `products_copy` VALUES (28, '富士 手用丝锥', '2-2-1-1.jpg', 10192, '富士 手用丝锥，公制 M6（M6*1），套装(3支)', 65.79, 10, 0);
INSERT INTO `products_copy` VALUES (29, '上工 机用丝锥', '2-2-2-1.jpg', 10193, '优质高速钢、磨牙工艺制造。\r\n\r\n攻丝精度高、溶屑能力强、工作寿命长。\r\n\r\n供加工螺母或其他机件上的普通螺纹内螺纹、硬度较低的钢板。', 21.59, 10, 0);
INSERT INTO `products_copy` VALUES (30, 'YAMAWA 螺尖丝锥', '2-2-3-1.jpg', 10194, '丝攻精度等级：YAMAWA P 级 表面处理：氧化处理 丝攻材质：HSS 切刃吃入部牙数：5牙\r\n\r\nSU系列先端丝攻是为不锈钢、铬钼合金钢等设计的专用先端丝锥，对具粘性之材料具有优良之切削性能。\r\n\r\n丝攻表面也施以氧化处理，可降低溶着问题的产生。', 74.90, 111, 0);
INSERT INTO `products_copy` VALUES (31, '成量 立铣刀', '2-3-1-1.jpg', 10195, '直柄立铣刀的主切削刃是圆拄面上,端面上的的切削刃是副刀刃。\r\n\r\n工作时不能沿着铣刀的轴向作进给运动。按照国家标准规定：立铣刀直径为2-50毫米，可分为粗齿与细齿两种。直径2-20为直柄范围，直径14-50为锥柄范围。', 9.79, 1, 0);
INSERT INTO `products_copy` VALUES (32, '西南工具 直键槽（二刃）铣刀', '2-3-2-1.jpg', 10196, '直径(mm)：φ13\r\n\r\n材质：高速钢\r\n\r\n刃数：2\r\n\r\n表面涂层材料：无\r\n\r\n柄部类型：直柄', 22.89, 1, 0);
INSERT INTO `products_copy` VALUES (33, '迪美 硬质合金内螺纹铣刀', '2-3-3-1.jpg', 10197, '迪美 内螺纹铣刀，M6*1.0(I) D3.9*12*D4*50*3F', 657.90, 1, 0);
INSERT INTO `products_copy` VALUES (34, '成量 三面刃铣刀，直齿型', '2-3-4-1.jpg', 10198, '直齿三面刃铣刀与普通铣刀不同，三个刃口均有后角、刃口锋利、切削轻快。\r\n\r\n主要用于铣削定值尺寸的凹槽，也可铣削一般凹槽、台阶面、侧面。', 400.90, 1, 0);
INSERT INTO `products_copy` VALUES (35, '上工 高钴钢长方形车刀', '2-4-1-1.jpg', 10199, '适用于一般车床，半自动及自动车床，刨床的外圆，端面，内孔，螺纹，平面，台阶，凹槽及切断等工序的加工。 \r\n\r\n主要用于非调制金属材料及非金属材料的车削加工。', 102.90, 1, 0);
INSERT INTO `products_copy` VALUES (36, '焊接车刀', '1-1-1-1.jpg', 10200, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (37, '成量 直纹滚花刀', '2-4-3-1.jpg', 10201, '采用优质9SiCr材料加工，全数控加工，产品一致性好，质量稳定', 42.39, 1, 0);
INSERT INTO `products_copy` VALUES (38, '株洲钻石 车刀片，CNMG120404-EM YBG205，适合碳钢、不锈钢半精加工', '2-5-1-1.jpg', 10202, '适宜于工件相对较小，加工表面光洁度要求较高的加工领域。\r\n\r\n添加耐磨和耐高温元素的超细TiAlN基纳米涂层，高的涂层硬度和优良的耐高温性能为切削刃提供有效的保护', 172.90, 1, 0);
INSERT INTO `products_copy` VALUES (39, 'ZOTO 切刀粒，MGMN300-M(ZX15)，10片/盒', '2-5-2-1.jpg', 10203, '刀口锋利，耐磨耐用，满足不同需求', 190.39, 1, 0);
INSERT INTO `products_copy` VALUES (40, '普拉米特PRAMET U钻刀片，S-WCMX080412E-48 D8330，10片/盒', '2-5-3-1.jpg', 10204, '排屑流畅刀片前面上无障碍，保证切屑排出流畅，并容易观察。\r\n\r\n使用方便转换刀刃和更换新刀片方便、迅速。对小尺寸刀具结构要紧凑。', 329.90, 1, 0);
INSERT INTO `products_copy` VALUES (41, 'MOTOREX 液压油，COREX HLP-D32，25L/桶', '3-1-1-1.jpg', 10205, 'MOTOREX　COREX　HLP-D由精选石蜡、溶剂油、高品质的矿物油和独创的高品质化学添加剂等构成，该系列产品具有独特的品质，不同的粘度可以满足用户不同的需要，所有产品符合国际标准。', 3590.00, 1, 0);
INSERT INTO `products_copy` VALUES (42, 'E风 齿轮油，重负荷L-CKD220#，170kg/桶', '3-1-2-1.jpg', 10206, '优秀的抗氧化安定性，减少有害物质的产生，使用周期长。\r\n\r\n优良的油水分离性及抗泡性，减少水分和泡沫的危害。\r\n\r\n优秀的抗腐蚀性能，有效抑制部件的腐蚀磨损发生。', 3850.00, 1, 0);
INSERT INTO `products_copy` VALUES (43, '阿特斯 清洗油，ATS EV 清洗油 68，208L/桶', '3-1-3-1.jpg', 10207, 'ATS EV 系列清洗油是由精制基础油、防锈防腐及、抗泡剂等添加剂调配而成，产品拥有优秀的抗泡、分水及冲洗性能', 4999.00, 1, 0);
INSERT INTO `products_copy` VALUES (44, '昆仑 白色特种润滑脂，3号 800G*12/箱', '3-1-4-1.jpg', 10208, '吸附能力：对金属具有很强的吸附能力，当受到水污染或当轴承空转时，能保护轴承不发生腐蚀及破坏性点蚀。\r\n\r\n润滑性：具有很好的润滑性，在相同的运转条件下，所形成的润滑油膜厚度大，可降低相对运动元件的疲劳磨损。', 605.90, 1, 0);
INSERT INTO `products_copy` VALUES (45, '通用设备润滑油', '1-1-1-1.jpg', 10209, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (46, '山工机械 抗磨液压油，L-HM 46 (高压)，18L/桶', '3-3-1-1.jpg', 10210, '山工机械 抗磨液压油，L-HM 46 (高压)，18L/桶', 659.00, 1, 0);
INSERT INTO `products_copy` VALUES (47, '农业机械润滑油（没有）', '1-1-1-1.jpg', 10211, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (48, '爱发科/ULVAC 真空泵油，R-72，每桶20L', '3-4-1-1.jpg', 10212, '爱发科/ULVAC 真空泵油，R-72，每桶20L', 2102.50, 1, 0);
INSERT INTO `products_copy` VALUES (49, '特种润滑脂', '1-1-1-1.jpg', 10213, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (50, '抗胶合剂', '1-1-1-1.jpg', 10214, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (51, '雪佛龙 金富力方程式机油，SAE 10W-40，4L/瓶', '3-5-1-1.jpg', 10215, '采用独特的油泥防御盾技术配方而成，为发动机提供出色的保护，使发动机更清洁，运转更顺畅。\r\n\r\n适用于各种操作条件下要求 API SN 性能机油润滑的各种轿车和轻型卡车发动机。', 149.00, 1, 0);
INSERT INTO `products_copy` VALUES (52, '柴油机油', '1-1-1-1.jpg', 10216, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (53, '防冻液', '1-1-1-1.jpg', 10217, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (54, '变速箱油', '1-1-1-1.jpg', 10218, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (55, '罗森 切削液，36AL，20L/桶', '3-6-1-1.jpg', 10219, '长的使用寿命， 减少废液产生；\r\n\r\n不腐蚀水泵及阀门， 与各类密封材料适应性好， 设备使用安全；\r\n\r\n适于加工铸铝、航空铝、轮毂铝等汽车用铝， 不会导致铝件腐蚀；', 609.00, 89, 0);
INSERT INTO `products_copy` VALUES (56, '冲压油', '1-1-1-1.jpg', 10220, '', 1.00, 80, 0);
INSERT INTO `products_copy` VALUES (57, '防锈油', '1-1-1-1.jpg', 10221, '', 1.00, 111, 0);
INSERT INTO `products_copy` VALUES (58, 'Raxwell 一次性医用口罩RX1920，白色，非灭菌， 独立包装，50片/盒', '4-1-1-1.jpg', 10222, ' \r\nRaxwell 一次性医用口罩RX1920，白色，非灭菌， 独立包装，50片/盒', 19.90, 106, 2);
INSERT INTO `products_copy` VALUES (59, 'Raxwell KN95防颗粒物口罩，折叠型耳带式内置鼻夹， RX9511，独立包装，25个/盒', '4-1-2-1.jpg', 10223, 'Raxwell KN95防颗粒物口罩，折叠型耳带式内置鼻夹， RX9511，独立包装，25个/盒', 36.90, 83, 2);
INSERT INTO `products_copy` VALUES (60, 'Raxwell 滤棉，RX3708B，符合GB2626-2019 KN95，5片/包', '4-1-3-1.jpg', 10224, 'Raxwell 滤棉，RX3708B，符合GB2626-2019 KN95，5片/包', 11.90, 0, 0);
INSERT INTO `products_copy` VALUES (61, 'Raxwell 750g棉纱手套，本白，7针，12副/袋，RW2101', '4-2-1-1.jpg', 10225, 'Raxwell 750g棉纱手套，本白，7针，12副/袋，RW2101', 22.90, 0, 0);
INSERT INTO `products_copy` VALUES (62, 'Raxwell 丁腈涂层手套，13针白涤纶蓝丁腈手套，掌浸，均码，12副/袋，RW2464', '4-2-2-1.jpg', 10226, 'Raxwell 丁腈涂层手套，13针白涤纶蓝丁腈手套，掌浸，均码，12副/袋，RW2464', 35.90, 1106, 0);
INSERT INTO `products_copy` VALUES (63, '安思尔Ansell 5级防割手套，11-735-8，HyFlex防割手套', '4-2-3-1.jpg', 10227, '品牌	Ansell/安思尔\r\n防割等级	4级\r\n材质	Intercept\r\n尺码	8\r\n认证标准	EN388,ANSI\r\n长度(cm)	21.5-26.7\r\n包装数量	12副/打\r\n风险类别	Ⅱ类', 36.90, 0, 0);
INSERT INTO `products_copy` VALUES (64, 'TOWA 丁腈防化手套，565-L，丁腈橡胶耐油 26cm', '4-2-4-1.jpg', 10228, '丁腈橡胶具有优良的耐油，耐磨，防刺穿，防划伤等功能，长时间使用后没有疲劳感', 1.00, 93, 1);
INSERT INTO `products_copy` VALUES (65, 'Raxwell Tiger 多功能安全鞋', '4-3-1-1.jpg', 10229, 'Raxwell Tiger 多功能安全鞋，防砸防刺穿防静电，TI-46，RW3111', 132.90, 0, 1);
INSERT INTO `products_copy` VALUES (66, '运动安全鞋', '1-1-1-1.jpg', 10230, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (67, '绝缘鞋', '1-1-1-1.jpg', 10231, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (68, '安赛瑞 春夏短袖劳保工作服套装，夏季透气涤棉劳保服 加厚半袖劳保服夏装 灰色 XL，11301', '4-4-1-1.jpg', 10232, '产品名称：安赛瑞 春夏短袖劳保工作服套装，夏季透气涤棉劳保服 加厚半袖劳保服夏装 灰色 XL，11301\r\n\r\n制造商型号：11301\r\n\r\n品牌：安赛瑞/SAFEWARE\r\n\r\n包装单位：套', 146.90, 106, 0);
INSERT INTO `products_copy` VALUES (69, '防护服', '1-1-1-1.jpg', 10233, '', 1.00, 8, 0);
INSERT INTO `products_copy` VALUES (70, '喷砂服', '1-1-1-1.jpg', 10234, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (71, '围裙', '1-1-1-1.jpg', 10235, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (72, '3M 可重复使用耳塞，340-8002，Ultrafit 27 圣诞树型硅胶材质 带线 带把手', '4-5-1-1.jpg', 10236, '3M 可重复使用耳塞，340-8002，Ultrafit 27 圣诞树型硅胶材质 带线 带把手，100副/盒', 1509.00, 1, 0);
INSERT INTO `products_copy` VALUES (73, '耳罩', '1-1-1-1.jpg', 10237, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (74, '听力防护配件', '1-1-1-1.jpg', 10238, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (75, '霍尼韦尔Honeywell 防护眼镜，YQZG100020，防雾眼镜VL1-A', '4-6-1-1.jpg', 10239, '专为亚洲人脸型设计，提供舒适贴合性；\r\n\r\n弧形时尚无框设计，轻质全视野；\r\n\r\n柔软镜腿，提供全天候舒适保护；', 22.90, 1, 0);
INSERT INTO `products_copy` VALUES (76, '护目镜', '1-1-1-1.jpg', 10240, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (77, '防护面屏', '1-1-1-1.jpg', 10241, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (78, '华泰 玻璃钢绝缘二层凳，额定载重(kg):150 耐压220KV 踏板尺寸(cm):30*50 梯高(cm)', '5-1-1-1.jpg', 10242, '四周采用了合金进行包边牢牢将凳面与凳身固定在一起，耐腐蚀。\r\n\r\n采用了合金铆钉，最大优点在于不生锈、不腐烂、折不断等特点。', 919.00, 1, 0);
INSERT INTO `products_copy` VALUES (79, '直梯/伸缩梯', '1-1-1-1.jpg', 10243, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (80, '工作梯', '1-1-1-1.jpg', 10244, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (81, '稳耐 便携式脚手架，额定载荷（KG）：455 长*宽*高（米）', '5-2-1-1.jpg', 10245, '指施工现场为工人操作并解决垂直和水平运输而搭设的各种支架。建筑界的通用术语，指建筑工地上用在外墙、内部装修或层高较高无法直接施工的地方。', 1889.00, 1, 0);
INSERT INTO `products_copy` VALUES (82, '电工取货车', '1-1-1-1.jpg', 10246, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (83, '直臂式高空作业平台', '1-1-1-1.jpg', 10247, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (84, '智能搬运车（没找到）', '暂无图片.jpg', 10248, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (85, '快仓 鸿鹄标准版夹抱式单料箱机器人', '5-3-2-1.jpg', 10249, '额定负载40kg，标准版，二维码导航，双轮差速，快仓橙，夹抱式，最高取货高度3750mm，无选配', 171999.00, 1, 0);
INSERT INTO `products_copy` VALUES (86, '智能叉车', '暂无图片.jpg', 10250, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (87, '哈德威 斗车配件，350深推车轮', '5-4-1-1.jpg', 10251, '产品名称：西域推荐 斗车配件，350深推车轮（橡胶实心胎+轮毂）*2+配套轴承*4\r\n\r\n制造商型号：（橡胶实心胎*2+轮毂*2+配套轴承*4）/套', 296.05, 1, 0);
INSERT INTO `products_copy` VALUES (88, '观光车', '暂无图片.jpg', 10252, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (89, '电动三轮车', '暂无图片.jpg', 10253, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (90, 'Raxwell 重型塑料平板推车,最大载重550kg,静音橡胶轮,1100mm*650mm', '5-5-1-1.jpg', 10254, 'Raxwell 重型塑料平板推车,最大载重550kg,静音橡胶轮,1100mm*650mm,蓝色,RHMC0214', 899.00, 1, 0);
INSERT INTO `products_copy` VALUES (91, '静音推车', '暂无图片.jpg', 10255, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (92, '防静电推车', '暂无图片.jpg', 10256, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (93, '百雀羚三生花护手霜套装，40g*3', '6-1-1-1.jpg', 10257, '品牌	百雀羚\r\n类别	手部/身体护理\r\n容量	40gx3\r\n保质期(月)	36', 113.90, 0, 0);
INSERT INTO `products_copy` VALUES (94, ' \r\n蓝月亮 洗手液套装（500g芦荟+500g野菊花）', '6-1-2-1.jpg', 10258, '品牌	蓝月亮/BLUEMOON\r\n类别	水洗（液体）\r\n系列	健康抑菌\r\n容量	500g×2\r\n保质期(月)	24\r\n产品产地	国产\r\n香型	芦荟野菊花香\r\n包装方式	组合装', 23.60, 0, 0);
INSERT INTO `products_copy` VALUES (95, '舒适达 多效护理牙膏', '6-1-3-1.jpg', 10259, '品牌	舒适达/SENSODYNE\r\n分类	牙膏\r\n重量(g)	100\r\n保质期(月)	36\r\n香型	无香型\r\n产品产地	国产', 26.90, 0, 0);
INSERT INTO `products_copy` VALUES (96, 'KCS洗护包B，爱敬洗护沐皂+内野方巾+牙具 含洗护包', '6-1-4-1.jpg', 10260, '品牌	西域推荐/westingarea\r\n分类	洗护套装', 259.00, 0, 0);
INSERT INTO `products_copy` VALUES (97, '信达自动皂液器，ZYQ-80', '6-2-1-1.jpg', 10261, '品牌	信达\r\n类别	皂液器\r\n系列	滴液型\r\n容量(ml)	800\r\n材质	ABS\r\n控制方式	自动感应', 218.90, 0, 0);
INSERT INTO `products_copy` VALUES (98, ' \r\n艾克白色双面喷气式干手器，自动加热 AK2006H', '6-2-2-1.jpg', 10262, '品牌	Aike/艾克\r\n类别	喷射式烘手器\r\n额定功率(W)	1850\r\n风速(m/s)	90\r\n出风类型	冷热风\r\n尺寸(mm)	685×300×220\r\n重量(kg)	10.5', 2090.00, 0, 0);
INSERT INTO `products_copy` VALUES (99, '威猛先生 强效洁厕液，双包装 500gx2 洁厕灵', '6-2-3-1.jpg', 10263, '品牌	威猛先生\r\n分类	洁厕液\r\n系列	洗手间用品\r\n容量	500g×2\r\n保质期(月)	24\r\n产品产地	国产\r\n气味	清香型\r\n成分	无机酸等\r\n包装方式	组合装', 35.09, 0, 0);
INSERT INTO `products_copy` VALUES (100, '功成狮 花色抹布', '6-3-1-1.jpg', 10264, '品牌	西域推荐/westingarea\r\n类别	棉质擦机布\r\n包装方式	捆式\r\n颜色	花色\r\n尺寸(mm)	单张700×400左右\r\n包装数量	10kg/捆', 92.29, 0, 0);
INSERT INTO `products_copy` VALUES (101, '擦拭纸', '暂无图片.jpg', 10265, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (102, '纸品湿巾', '暂无图片.jpg', 10266, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (103, '儿童餐椅', '暂无图片.jpg', 10267, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (104, '家纺用品', '暂无图片.jpg', 10268, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (105, '地面清洁工具', '暂无图片.jpg', 10269, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (106, '玻璃清洁工具', '暂无图片.jpg', 10270, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (107, '工具存储架', '暂无图片.jpg', 10271, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (108, '吸尘器', '暂无图片.jpg', 10272, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (109, '扫地机', '暂无图片.jpg', 10273, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (110, '扫雪机', '暂无图片.jpg', 10274, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (111, '洗衣机', '暂无图片.jpg', 10275, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (112, '洗地机', '暂无图片.jpg', 10276, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (113, '西门子SIEMENS 中央处理器CPU,6ES7288-1ST20-0AA1（6ES7288-1ST20-0AA0升级替代）', '7-1-1-1.jpg', 10277, '品牌	西门子/SIEMENS\r\n系列	S7-200 SMART\r\n内置存储器	20KB\r\n型号	CPU ST20\r\n数字量输入集成通道（DI）	12\r\n数字量输出集成通道（DO）	8\r\n输入电压(V)	DC20.4 - 28.8', 869.00, 1, 0);
INSERT INTO `products_copy` VALUES (114, '西门子 数字量输入输出模块，6ES7223-1BL32-0XB0', '7-1-2-1.jpg', 10278, 'SIMATIC S7-1200，数字量 I/O SM 1223，16DI/16DO， 16DI 24V DC，灌电流/拉电流， 16DO，晶体管 0.5A', 1799.00, 0, 0);
INSERT INTO `products_copy` VALUES (115, '三菱M70系统FCU7-DX711/HN351键盘操作面板键盘按键IO板', '7-1-3-1.jpg', 10279, '公益宝贝\r\n每笔成交将为 乡村儿童性安全教育项目 捐赠 0.1元 。', 1000.00, 198, 0);
INSERT INTO `products_copy` VALUES (116, '利达驱动板128E/E(Q)驱动板利达LD128EII回路板LD128E(Q)I回路板', '7-1-4-1.jpg', 10280, '品牌: 利达讯型号: LD128E(Q)I产地: 中国大陆', 499.00, 0, 0);
INSERT INTO `products_copy` VALUES (117, ' \r\n丹佛斯 Danfoss FC-051系列', '7-2-1-1.jpg', 10281, '产品名称：丹佛斯，变频器，FC-051PK75S2E20H3XXCXXXSXXX\r\n\r\n制造商型号：FC-051PK75S2E20H3XXCXXXSXXX\r\n\r\n品牌：丹佛斯/Danfoss\r\n\r\n包装单位：个', 1214.62, 0, 0);
INSERT INTO `products_copy` VALUES (118, '三菱电机MITSUBISHI ELECTRIC 变频器，FR-F840-00380-2-60', '7-2-2-1.jpg', 10282, '系列	FR-F840\r\n相数	三相\r\n额定功率(kW)	18.5\r\n操作面板	内含', 7748.57, 1, 0);
INSERT INTO `products_copy` VALUES (119, '西门子/SIEMENS G120系列变频器控制单元 6SL3244-0BB12-1FA0', '7-2-3-1.jpg', 10283, 'IP防护等级	IP20\r\n外形尺寸(mm)长×宽×高	73*46*199\r\n重量(kg)	0.49', 1799.00, 0, 0);
INSERT INTO `products_copy` VALUES (120, '欧姆龙 光电传感器', '7-3-1-1.jpg', 10284, '品牌	欧姆龙\r\n类别	对射式\r\n连接方式	2m成型电缆\r\n检测距离	15m\r\n输出状态	PNP\r\n检测方式	对射式\r\n工作电压(V)	DC12-24\r\n动作模式	NO\r\n电气连接	2m成型电缆', 299.00, 0, 0);
INSERT INTO `products_copy` VALUES (121, '接近开关', '暂无图片.jpg', 10285, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (122, '温度传感器', '暂无图片.jpg', 10286, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (123, '液位传感器', '暂无图片.jpg', 10287, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (124, '人机界面/HMI', '暂无图片.jpg', 10288, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (125, '伺服电机', '暂无图片.jpg', 10289, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (126, '伺服驱动', '暂无图片.jpg', 10290, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (127, '深沟球轴承', '暂无图片.jpg', 10291, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (128, '角接触球轴承', '暂无图片.jpg', 10292, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (129, '调心球轴承', '暂无图片.jpg', 10293, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (130, '圆柱滚子轴承', '暂无图片.jpg', 10294, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (131, '圆锥滚子轴承', '暂无图片.jpg', 10295, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (132, '调心滚子轴承', '暂无图片.jpg', 10296, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (133, '带座轴承', '暂无图片.jpg', 10297, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (134, '带座轴承芯', '暂无图片.jpg', 10298, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (135, '轴承安装工具套装', '暂无图片.jpg', 10299, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (136, '轴向锁紧螺母套筒扳手', '暂无图片.jpg', 10300, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (137, '润滑系统及配件', '暂无图片.jpg', 10301, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (138, '传动配件', '暂无图片.jpg', 10302, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (139, '杆端关节轴承', '暂无图片.jpg', 10303, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (140, '球面滑动轴承', '暂无图片.jpg', 10304, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (141, '盛源 无油空压机，290L/min，7bar，100L气罐，型号：2*1500-100L', '9-1-1-1.jpg', 10305, '品牌	源盛\r\n类别	无油高效空压机\r\n气桶容量(L)	100', 3939.00, 1, 0);
INSERT INTO `products_copy` VALUES (142, '东成 双管进气无油空压机，Q1E-FF-1000/24', '9-1-2-1.jpg', 10306, '品牌	Dongcheng/东成\r\n类别	双管进气无油空压机\r\n排气量(m³/min)	0.067\r\n气桶容量(L)	24\r\n净重(kg)	22.5\r\n工作压力(Mpa)	0.7', 829.00, 1, 0);
INSERT INTO `products_copy` VALUES (143, '谦华智科 气动调压减压阀气压调节气源处理器AR,接管口径G1/4,AR2000-02', '9-2-1-1.jpg', 10307, '品牌	谦华智科/CHAHIGER TECHNOLOGY\r\n系列	AR\r\n螺纹规格(inch)	G1/4', 52.00, 0, 0);
INSERT INTO `products_copy` VALUES (144, '诺冠Norgren 通用型空气过滤器，F68G-NNN-AR3', '9-2-2-1.jpg', 10308, '品牌	Norgren/诺冠\r\n类别	通用型空气过滤器\r\n系列	F68G\r\n过滤精度(μm)	40\r\n排水方式	自动\r\n最大使用压力(MPa)	1.7\r\n滤杯材质	铝\r\n滤芯材质	烧结青铜/塑料', 1849.00, 1, 0);
INSERT INTO `products_copy` VALUES (145, 'SMC 滤芯，油压过滤器用，EP020-020N', '9-2-3-1.jpg', 10309, '折叠式滤筒，过滤面积大，滤芯寿命长，经济性好。                 \r\n\r\n微网滤芯 \r\n\r\n不锈钢网，过滤精度高。 \r\n\r\n耐热·耐化学品性优良，适合广泛的用途。 \r\n\r\n折叠式滤筒，具有圆筒3倍的过滤面积。 \r\n\r\n洗净后能反复使用，经济性好。', 112.90, 0, 0);
INSERT INTO `products_copy` VALUES (146, '诺冠Norgren 微雾油雾器，L07-200-MPAG', '9-2-4-1.jpg', 10310, '品牌	Norgren/诺冠\r\n类别	微雾油雾器\r\n系列	L07\r\n螺纹规格(inch)	G1/4\r\n最大使用压力(MPa)	1.0\r\n油杯材质	PC（聚碳酸酯）', 499.00, 84, 2);
INSERT INTO `products_copy` VALUES (147, 'SMC 3通电磁阀，直动式，直接出线式（300mm），DC24，Rc1/8\"，VT307-5G1-01', '9-3-1-1.jpg', 10311, '品牌	SMC\r\n类别	3通电磁阀\r\n系列	VT307\r\n接管口径(inch)	Rc1/8\r\n额定电压	DC24\r\n接电方式	出线式（300mm）\r\n动作方式	直动式\r\n初始状态	通用\r\n有效截面积(mm²)	3\r\n流量(CV)	0.17\r\n使用压力(Mpa)	0-0.7\r\n电磁线圈	单线圈', 309.90, 0, 0);
INSERT INTO `products_copy` VALUES (148, 'ASCO 电磁阀', '9-3-2-1.jpg', 10312, '品牌	ASCO\r\n类别	5通单电控\r\n系列	531\r\n接管口径(inch)	G1/4\r\n额定电压	AC230\r\n接电方式	DIN型插座式\r\n工作压力(Mpa)	0.2-1\r\n工作温度(℃)	-10-60', 517.90, 1, 0);
INSERT INTO `products_copy` VALUES (149, '流体控制阀', '暂无图片.jpg', 10313, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (150, '脉冲电磁阀', '暂无图片.jpg', 10314, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (151, '标准型气缸', '暂无图片.jpg', 10315, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (152, '紧凑型气缸', '暂无图片.jpg', 10316, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (153, '带导杆气缸', '暂无图片.jpg', 10317, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (154, '滑台气缸', '暂无图片.jpg', 10318, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (155, '气动接头', '暂无图片.jpg', 10319, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (156, '快速接头', '暂无图片.jpg', 10320, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (157, 'PU气管', '暂无图片.jpg', 10321, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (158, '螺旋气管', '暂无图片.jpg', 10322, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (159, 'PVC气管', '暂无图片.jpg', 10323, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (160, '内六角圆柱头螺钉', '暂无图片.jpg', 10324, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (161, '内六角塞打螺钉', '暂无图片.jpg', 10325, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (162, '内六角薄圆柱头螺钉', '暂无图片.jpg', 10326, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (163, '内六角沉头螺钉', '暂无图片.jpg', 10327, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (164, '外六角螺栓', '暂无图片.jpg', 10328, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (165, '外六角法兰面螺栓', '暂无图片.jpg', 10329, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (166, '外六角喉塞', '暂无图片.jpg', 10330, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (167, '外六角组合螺丝', '暂无图片.jpg', 10331, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (168, '双头螺栓组合螺丝', '暂无图片.jpg', 10332, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (169, '全螺纹螺柱组合螺丝', '暂无图片.jpg', 10333, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (170, '六角螺母', '暂无图片.jpg', 10334, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (171, '六角加厚螺母', '暂无图片.jpg', 10335, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (172, '精密锁紧螺母', '暂无图片.jpg', 10336, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (173, '六角锁紧螺母', '暂无图片.jpg', 10337, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (174, '十字槽沉头自攻钉', '暂无图片.jpg', 10338, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (175, '十字槽盘头自攻钉', '暂无图片.jpg', 10339, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (176, '十字槽扁头自攻钉', '暂无图片.jpg', 10340, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (177, '万用表', '暂无图片.jpg', 10341, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (178, '钳形表', '暂无图片.jpg', 10342, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (179, '电流钳', '暂无图片.jpg', 10343, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (180, '相序/电机转向', '暂无图片.jpg', 10344, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (181, '绝缘电阻测量仪', '暂无图片.jpg', 10345, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (182, '接地电阻测试仪', '暂无图片.jpg', 10346, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (183, '绝缘摇表', '暂无图片.jpg', 10347, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (184, '接地摇表', '暂无图片.jpg', 10348, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (185, '静电监控仪器', '暂无图片.jpg', 10349, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (186, '静电测试仪', '暂无图片.jpg', 10350, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (187, '炉温测试仪', '暂无图片.jpg', 10351, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (188, '变压器测试仪', '暂无图片.jpg', 10352, '', 1.00, 1, 0);
INSERT INTO `products_copy` VALUES (189, '测量测绘附件', '暂无图片.jpg', 10353, '', 1.00, 1, 0);

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `parent_id` int(0) NOT NULL DEFAULT 0 COMMENT '父类ID，id为0时为根结点，为一类节点',
  `sort_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类别名称',
  `level` int(0) NULL DEFAULT NULL COMMENT '节点级别,顶层节点为0，依次类推',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10354 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES (10094, 0, '工具', 0);
INSERT INTO `sort` VALUES (10095, 0, '刀具', 0);
INSERT INTO `sort` VALUES (10096, 0, '润滑', 0);
INSERT INTO `sort` VALUES (10097, 0, '劳保', 0);
INSERT INTO `sort` VALUES (10098, 0, '搬运', 0);
INSERT INTO `sort` VALUES (10099, 0, '清洁', 0);
INSERT INTO `sort` VALUES (10100, 0, '工控', 0);
INSERT INTO `sort` VALUES (10101, 0, '轴承', 0);
INSERT INTO `sort` VALUES (10102, 0, '气动', 0);
INSERT INTO `sort` VALUES (10103, 0, '紧固', 0);
INSERT INTO `sort` VALUES (10104, 0, '工业检测', 0);
INSERT INTO `sort` VALUES (10105, 10094, '工具套装', 1);
INSERT INTO `sort` VALUES (10106, 10094, '工具车及箱包', 1);
INSERT INTO `sort` VALUES (10107, 10094, '扳手/手动套筒', 1);
INSERT INTO `sort` VALUES (10108, 10094, '钳/夹', 1);
INSERT INTO `sort` VALUES (10109, 10094, '锤/挫/锯/刀/尺', 1);
INSERT INTO `sort` VALUES (10110, 10094, '螺丝刀', 1);
INSERT INTO `sort` VALUES (10111, 10094, '扭力工具', 1);
INSERT INTO `sort` VALUES (10112, 10094, '电工工具', 1);
INSERT INTO `sort` VALUES (10113, 10095, '孔加工工具', 1);
INSERT INTO `sort` VALUES (10114, 10095, '螺纹加工工具', 1);
INSERT INTO `sort` VALUES (10115, 10095, '铣削刀具', 1);
INSERT INTO `sort` VALUES (10116, 10095, '车削刀具', 1);
INSERT INTO `sort` VALUES (10117, 10095, '可转位刀具', 1);
INSERT INTO `sort` VALUES (10118, 10096, '工业润滑', 1);
INSERT INTO `sort` VALUES (10119, 10096, '通用设备润滑油', 1);
INSERT INTO `sort` VALUES (10120, 10096, '专用设备润滑油', 1);
INSERT INTO `sort` VALUES (10121, 10096, '特种润滑油', 1);
INSERT INTO `sort` VALUES (10122, 10096, '车船用润滑油', 1);
INSERT INTO `sort` VALUES (10123, 10096, '金属加工液', 1);
INSERT INTO `sort` VALUES (10124, 10097, '呼吸防护', 1);
INSERT INTO `sort` VALUES (10125, 10097, '手部防护', 1);
INSERT INTO `sort` VALUES (10126, 10097, '足部防护', 1);
INSERT INTO `sort` VALUES (10127, 10097, '身体防护', 1);
INSERT INTO `sort` VALUES (10128, 10097, '听力防护', 1);
INSERT INTO `sort` VALUES (10129, 10097, '眼面部防护', 1);
INSERT INTO `sort` VALUES (10130, 10098, '梯子', 1);
INSERT INTO `sort` VALUES (10131, 10098, '高空作业', 1);
INSERT INTO `sort` VALUES (10132, 10098, '搬运机器人', 1);
INSERT INTO `sort` VALUES (10133, 10098, '牵引车', 1);
INSERT INTO `sort` VALUES (10134, 10098, '手推车', 1);
INSERT INTO `sort` VALUES (10135, 10099, '个人卫生', 1);
INSERT INTO `sort` VALUES (10136, 10099, '洗手间用品', 1);
INSERT INTO `sort` VALUES (10137, 10099, '工业擦拭', 1);
INSERT INTO `sort` VALUES (10138, 10099, '清洁用品', 1);
INSERT INTO `sort` VALUES (10139, 10099, '清洁工具', 1);
INSERT INTO `sort` VALUES (10140, 10099, '清洁设备', 1);
INSERT INTO `sort` VALUES (10141, 10100, '可编程控制器', 1);
INSERT INTO `sort` VALUES (10142, 10100, '变频器', 1);
INSERT INTO `sort` VALUES (10143, 10100, '传感器', 1);
INSERT INTO `sort` VALUES (10144, 10100, '人机界面', 1);
INSERT INTO `sort` VALUES (10145, 10100, '伺服控制', 1);
INSERT INTO `sort` VALUES (10146, 10101, '球轴承', 1);
INSERT INTO `sort` VALUES (10147, 10101, '滚子轴承', 1);
INSERT INTO `sort` VALUES (10148, 10101, '带座轴承', 1);
INSERT INTO `sort` VALUES (10149, 10101, '轴承维护', 1);
INSERT INTO `sort` VALUES (10150, 10101, '滑动轴承', 1);
INSERT INTO `sort` VALUES (10151, 10102, '空压机', 1);
INSERT INTO `sort` VALUES (10152, 10102, '空气处理件', 1);
INSERT INTO `sort` VALUES (10153, 10102, '气阀类', 1);
INSERT INTO `sort` VALUES (10154, 10102, '气缸类', 1);
INSERT INTO `sort` VALUES (10155, 10102, '气动辅助件', 1);
INSERT INTO `sort` VALUES (10156, 10103, '内六角螺栓', 1);
INSERT INTO `sort` VALUES (10157, 10103, '外六角螺栓', 1);
INSERT INTO `sort` VALUES (10158, 10103, '组合螺丝', 1);
INSERT INTO `sort` VALUES (10159, 10103, '螺母', 1);
INSERT INTO `sort` VALUES (10160, 10103, '自攻螺钉', 1);
INSERT INTO `sort` VALUES (10161, 10104, '通用电气测量仪表', 1);
INSERT INTO `sort` VALUES (10162, 10104, '安规测试', 1);
INSERT INTO `sort` VALUES (10163, 10104, '电子测量仪器', 1);
INSERT INTO `sort` VALUES (10164, 10104, '电力测量仪器', 1);
INSERT INTO `sort` VALUES (10165, 10104, '测量测绘仪器', 1);
INSERT INTO `sort` VALUES (10166, 10105, '综合套装', 2);
INSERT INTO `sort` VALUES (10167, 10105, '电讯工具套装', 2);
INSERT INTO `sort` VALUES (10168, 10105, '基本维修工具套装', 2);
INSERT INTO `sort` VALUES (10169, 10105, '套筒旋具头综合套装', 2);
INSERT INTO `sort` VALUES (10170, 10106, '工具车', 2);
INSERT INTO `sort` VALUES (10171, 10106, '工具箱', 2);
INSERT INTO `sort` VALUES (10172, 10107, '活动扳手', 2);
INSERT INTO `sort` VALUES (10173, 10107, '两用扳手', 2);
INSERT INTO `sort` VALUES (10174, 10107, '开口扳手', 2);
INSERT INTO `sort` VALUES (10175, 10107, '梅花扳手', 2);
INSERT INTO `sort` VALUES (10176, 10108, '钳子', 2);
INSERT INTO `sort` VALUES (10177, 10108, '卡簧钳', 2);
INSERT INTO `sort` VALUES (10178, 10108, '卡簧钳套装', 2);
INSERT INTO `sort` VALUES (10179, 10109, '安全刀具', 2);
INSERT INTO `sort` VALUES (10180, 10109, '美工刀/切割刀/雕刻刀', 2);
INSERT INTO `sort` VALUES (10181, 10110, '螺丝刀', 2);
INSERT INTO `sort` VALUES (10182, 10110, '螺丝刀套装', 2);
INSERT INTO `sort` VALUES (10183, 10110, '微型螺丝刀', 2);
INSERT INTO `sort` VALUES (10184, 10111, '扭力扳手', 2);
INSERT INTO `sort` VALUES (10185, 10111, '扭力螺丝刀', 2);
INSERT INTO `sort` VALUES (10186, 10111, '扭力扳手头', 2);
INSERT INTO `sort` VALUES (10187, 10112, '绝缘钳', 2);
INSERT INTO `sort` VALUES (10188, 10112, '网络工具', 2);
INSERT INTO `sort` VALUES (10189, 10113, '麻花钻', 2);
INSERT INTO `sort` VALUES (10190, 10113, '铰刀', 2);
INSERT INTO `sort` VALUES (10191, 10113, '牙轮钻头', 2);
INSERT INTO `sort` VALUES (10192, 10114, '手用丝锥', 2);
INSERT INTO `sort` VALUES (10193, 10114, '机用直槽丝锥', 2);
INSERT INTO `sort` VALUES (10194, 10114, '机用罗尖丝锥', 2);
INSERT INTO `sort` VALUES (10195, 10115, '立铣刀', 2);
INSERT INTO `sort` VALUES (10196, 10115, '键槽铣刀', 2);
INSERT INTO `sort` VALUES (10197, 10115, '螺纹铣刀', 2);
INSERT INTO `sort` VALUES (10198, 10115, '三面刃铣刀', 2);
INSERT INTO `sort` VALUES (10199, 10116, '白钢车刀', 2);
INSERT INTO `sort` VALUES (10200, 10116, '焊接车刀', 2);
INSERT INTO `sort` VALUES (10201, 10116, '滚花刀', 2);
INSERT INTO `sort` VALUES (10202, 10117, '车削刀片', 2);
INSERT INTO `sort` VALUES (10203, 10117, '槽刀片', 2);
INSERT INTO `sort` VALUES (10204, 10117, 'U钻刀片', 2);
INSERT INTO `sort` VALUES (10205, 10118, '液压油', 2);
INSERT INTO `sort` VALUES (10206, 10118, '齿轮油', 2);
INSERT INTO `sort` VALUES (10207, 10118, '冲洗油', 2);
INSERT INTO `sort` VALUES (10208, 10118, '润滑油', 2);
INSERT INTO `sort` VALUES (10209, 10119, '通用设备润滑油', 2);
INSERT INTO `sort` VALUES (10210, 10120, '工程机械润滑油', 2);
INSERT INTO `sort` VALUES (10211, 10120, '农业机械润滑油', 2);
INSERT INTO `sort` VALUES (10212, 10121, '特种润滑油', 2);
INSERT INTO `sort` VALUES (10213, 10121, '特种润滑脂', 2);
INSERT INTO `sort` VALUES (10214, 10121, '抗胶合剂', 2);
INSERT INTO `sort` VALUES (10215, 10122, '汽油机油', 2);
INSERT INTO `sort` VALUES (10216, 10122, '柴油机油', 2);
INSERT INTO `sort` VALUES (10217, 10122, '防冻液', 2);
INSERT INTO `sort` VALUES (10218, 10122, '变速箱油', 2);
INSERT INTO `sort` VALUES (10219, 10123, '切削液', 2);
INSERT INTO `sort` VALUES (10220, 10123, '冲压油', 2);
INSERT INTO `sort` VALUES (10221, 10123, '防锈油', 2);
INSERT INTO `sort` VALUES (10222, 10124, '一次性口罩', 2);
INSERT INTO `sort` VALUES (10223, 10124, '防护口罩', 2);
INSERT INTO `sort` VALUES (10224, 10124, '防护面具及配件', 2);
INSERT INTO `sort` VALUES (10225, 10125, '劳保手套', 2);
INSERT INTO `sort` VALUES (10226, 10125, '涂层手套', 2);
INSERT INTO `sort` VALUES (10227, 10125, '防割手套', 2);
INSERT INTO `sort` VALUES (10228, 10125, '防化手套', 2);
INSERT INTO `sort` VALUES (10229, 10126, '安全鞋', 2);
INSERT INTO `sort` VALUES (10230, 10126, '运动安全鞋', 2);
INSERT INTO `sort` VALUES (10231, 10126, '绝缘鞋', 2);
INSERT INTO `sort` VALUES (10232, 10127, '工作服', 2);
INSERT INTO `sort` VALUES (10233, 10127, '防护服', 2);
INSERT INTO `sort` VALUES (10234, 10127, '喷砂服', 2);
INSERT INTO `sort` VALUES (10235, 10127, '围裙', 2);
INSERT INTO `sort` VALUES (10236, 10128, '耳塞', 2);
INSERT INTO `sort` VALUES (10237, 10128, '耳罩', 2);
INSERT INTO `sort` VALUES (10238, 10128, '听力防护配件', 2);
INSERT INTO `sort` VALUES (10239, 10129, '防护眼镜', 2);
INSERT INTO `sort` VALUES (10240, 10129, '护目镜', 2);
INSERT INTO `sort` VALUES (10241, 10129, '防护面屏', 2);
INSERT INTO `sort` VALUES (10242, 10130, '梯凳', 2);
INSERT INTO `sort` VALUES (10243, 10130, '直梯/伸缩梯', 2);
INSERT INTO `sort` VALUES (10244, 10130, '工作梯', 2);
INSERT INTO `sort` VALUES (10245, 10131, '脚手架', 2);
INSERT INTO `sort` VALUES (10246, 10131, '电工取货车', 2);
INSERT INTO `sort` VALUES (10247, 10131, '直臂式高空作业平台', 2);
INSERT INTO `sort` VALUES (10248, 10132, '智能搬运车', 2);
INSERT INTO `sort` VALUES (10249, 10132, '智能推高车', 2);
INSERT INTO `sort` VALUES (10250, 10132, '智能叉车', 2);
INSERT INTO `sort` VALUES (10251, 10133, '牵引车', 2);
INSERT INTO `sort` VALUES (10252, 10133, '观光车', 2);
INSERT INTO `sort` VALUES (10253, 10133, '电动三轮车', 2);
INSERT INTO `sort` VALUES (10254, 10134, '平板推车', 2);
INSERT INTO `sort` VALUES (10255, 10134, '静音推车', 2);
INSERT INTO `sort` VALUES (10256, 10134, '防静电推车', 2);
INSERT INTO `sort` VALUES (10257, 10135, '美妆护肤', 2);
INSERT INTO `sort` VALUES (10258, 10135, '洗手液', 2);
INSERT INTO `sort` VALUES (10259, 10135, '牙刷/牙膏', 2);
INSERT INTO `sort` VALUES (10260, 10135, '洗漱套装', 2);
INSERT INTO `sort` VALUES (10261, 10136, '皂液器', 2);
INSERT INTO `sort` VALUES (10262, 10136, '烘手机', 2);
INSERT INTO `sort` VALUES (10263, 10136, '洁厕剂', 2);
INSERT INTO `sort` VALUES (10264, 10137, '擦拭布', 2);
INSERT INTO `sort` VALUES (10265, 10137, '擦拭纸', 2);
INSERT INTO `sort` VALUES (10266, 10138, '纸品湿巾', 2);
INSERT INTO `sort` VALUES (10267, 10138, '儿童餐椅', 2);
INSERT INTO `sort` VALUES (10268, 10138, '家纺用品', 2);
INSERT INTO `sort` VALUES (10269, 10139, '地面清洁工具', 2);
INSERT INTO `sort` VALUES (10270, 10139, '玻璃清洁工具', 2);
INSERT INTO `sort` VALUES (10271, 10139, '工具存储架', 2);
INSERT INTO `sort` VALUES (10272, 10140, '吸尘器', 2);
INSERT INTO `sort` VALUES (10273, 10140, '扫地机', 2);
INSERT INTO `sort` VALUES (10274, 10140, '扫雪机', 2);
INSERT INTO `sort` VALUES (10275, 10140, '洗衣机', 2);
INSERT INTO `sort` VALUES (10276, 10140, '洗地机', 2);
INSERT INTO `sort` VALUES (10277, 10141, '中央处理器', 2);
INSERT INTO `sort` VALUES (10278, 10141, '数字量输入输出模块', 2);
INSERT INTO `sort` VALUES (10279, 10141, '集成电路', 2);
INSERT INTO `sort` VALUES (10280, 10141, '电子插件板', 2);
INSERT INTO `sort` VALUES (10281, 10142, '低压通用型变频器', 2);
INSERT INTO `sort` VALUES (10282, 10142, '风机水冷变频器', 2);
INSERT INTO `sort` VALUES (10283, 10142, '其中行业专用变频器', 2);
INSERT INTO `sort` VALUES (10284, 10143, '光感传感器', 2);
INSERT INTO `sort` VALUES (10285, 10143, '接近开关', 2);
INSERT INTO `sort` VALUES (10286, 10143, '温度传感器', 2);
INSERT INTO `sort` VALUES (10287, 10143, '液位传感器', 2);
INSERT INTO `sort` VALUES (10288, 10144, '人机界面/HMI', 2);
INSERT INTO `sort` VALUES (10289, 10145, '伺服电机', 2);
INSERT INTO `sort` VALUES (10290, 10145, '伺服驱动', 2);
INSERT INTO `sort` VALUES (10291, 10146, '深沟球轴承', 2);
INSERT INTO `sort` VALUES (10292, 10146, '角接触球轴承', 2);
INSERT INTO `sort` VALUES (10293, 10146, '调心球轴承', 2);
INSERT INTO `sort` VALUES (10294, 10147, '圆柱滚子轴承', 2);
INSERT INTO `sort` VALUES (10295, 10147, '圆锥滚子轴承', 2);
INSERT INTO `sort` VALUES (10296, 10147, '调心滚子轴承', 2);
INSERT INTO `sort` VALUES (10297, 10148, '带座轴承', 2);
INSERT INTO `sort` VALUES (10298, 10148, '带座轴承芯', 2);
INSERT INTO `sort` VALUES (10299, 10149, '轴承安装工具套装', 2);
INSERT INTO `sort` VALUES (10300, 10149, '轴向锁紧螺母套筒扳手', 2);
INSERT INTO `sort` VALUES (10301, 10149, '润滑系统及配件', 2);
INSERT INTO `sort` VALUES (10302, 10149, '传动配件', 2);
INSERT INTO `sort` VALUES (10303, 10150, '杆端关节轴承', 2);
INSERT INTO `sort` VALUES (10304, 10150, '球面滑动轴承', 2);
INSERT INTO `sort` VALUES (10305, 10151, '无油空压机', 2);
INSERT INTO `sort` VALUES (10306, 10151, '活塞空压机及配件', 2);
INSERT INTO `sort` VALUES (10307, 10152, '气源处理组合', 2);
INSERT INTO `sort` VALUES (10308, 10152, '空气过滤器', 2);
INSERT INTO `sort` VALUES (10309, 10152, '空气滤芯', 2);
INSERT INTO `sort` VALUES (10310, 10152, '油雾器', 2);
INSERT INTO `sort` VALUES (10311, 10153, '3通电磁阀', 2);
INSERT INTO `sort` VALUES (10312, 10153, '5通电磁阀', 2);
INSERT INTO `sort` VALUES (10313, 10153, '流体控制阀', 2);
INSERT INTO `sort` VALUES (10314, 10153, '脉冲电磁阀', 2);
INSERT INTO `sort` VALUES (10315, 10154, '标准型气缸', 2);
INSERT INTO `sort` VALUES (10316, 10154, '紧凑型气缸', 2);
INSERT INTO `sort` VALUES (10317, 10154, '带导杆气缸', 2);
INSERT INTO `sort` VALUES (10318, 10154, '滑台气缸', 2);
INSERT INTO `sort` VALUES (10319, 10155, '气动接头', 2);
INSERT INTO `sort` VALUES (10320, 10155, '快速接头', 2);
INSERT INTO `sort` VALUES (10321, 10155, 'PU气管', 2);
INSERT INTO `sort` VALUES (10322, 10155, '螺旋气管', 2);
INSERT INTO `sort` VALUES (10323, 10155, 'PVC气管', 2);
INSERT INTO `sort` VALUES (10324, 10156, '内六角圆柱头螺钉', 2);
INSERT INTO `sort` VALUES (10325, 10156, '内六角塞打螺钉', 2);
INSERT INTO `sort` VALUES (10326, 10156, '内六角薄圆柱头螺钉', 2);
INSERT INTO `sort` VALUES (10327, 10156, '内六角沉头螺钉', 2);
INSERT INTO `sort` VALUES (10328, 10157, '外六角螺栓', 2);
INSERT INTO `sort` VALUES (10329, 10157, '外六角法兰面螺栓', 2);
INSERT INTO `sort` VALUES (10330, 10157, '外六角喉塞', 2);
INSERT INTO `sort` VALUES (10331, 10158, '外六角组合螺丝', 2);
INSERT INTO `sort` VALUES (10332, 10158, '双头螺栓组合螺丝', 2);
INSERT INTO `sort` VALUES (10333, 10158, '全螺纹螺柱组合螺丝', 2);
INSERT INTO `sort` VALUES (10334, 10159, '六角螺母', 2);
INSERT INTO `sort` VALUES (10335, 10159, '六角加厚螺母', 2);
INSERT INTO `sort` VALUES (10336, 10159, '精密锁紧螺母', 2);
INSERT INTO `sort` VALUES (10337, 10159, '六角锁紧螺母', 2);
INSERT INTO `sort` VALUES (10338, 10160, '十字槽沉头自攻钉', 2);
INSERT INTO `sort` VALUES (10339, 10160, '十字槽盘头自攻钉', 2);
INSERT INTO `sort` VALUES (10340, 10160, '十字槽扁头自攻钉', 2);
INSERT INTO `sort` VALUES (10341, 10161, '万用表', 2);
INSERT INTO `sort` VALUES (10342, 10161, '钳形表', 2);
INSERT INTO `sort` VALUES (10343, 10161, '电流钳', 2);
INSERT INTO `sort` VALUES (10344, 10161, '相序/电机转向', 2);
INSERT INTO `sort` VALUES (10345, 10162, '绝缘电阻测量仪', 2);
INSERT INTO `sort` VALUES (10346, 10162, '接地电阻测试仪', 2);
INSERT INTO `sort` VALUES (10347, 10162, '绝缘摇表', 2);
INSERT INTO `sort` VALUES (10348, 10162, '接地摇表', 2);
INSERT INTO `sort` VALUES (10349, 10163, '静电监控仪器', 2);
INSERT INTO `sort` VALUES (10350, 10163, '静电测试仪', 2);
INSERT INTO `sort` VALUES (10351, 10163, '炉温测试仪', 2);
INSERT INTO `sort` VALUES (10352, 10164, '变压器测试仪', 2);
INSERT INTO `sort` VALUES (10353, 10165, '测量测绘附件', 2);

-- ----------------------------
-- Table structure for system_admin
-- ----------------------------
DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES (1, 'admin1', '123123', '管理员1', '88132001');
INSERT INTO `system_admin` VALUES (2, 'admin2', '123123', '管理员2', '88132002');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码，MD5加密',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '性别，1：男、0：女',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'yqs', '杨青山', '123123', '19140008057', '男');
INSERT INTO `user` VALUES (2, 'jgz', '蒋冠沼', '123123', '12345566789', '男');
INSERT INTO `user` VALUES (3, 'cyf', '陈延傅', '123456', '17676556789', '男');
INSERT INTO `user` VALUES (4, 'wzy', '王子甲', '123456', '13371002261', '男');
INSERT INTO `user` VALUES (5, 'hhk', '胡海阔', '123456', '123456789', '男');
INSERT INTO `user` VALUES (6, 'lfs', '罗抚松', '123123', '12312311212', '男');
INSERT INTO `user` VALUES (7, 'zkp', '张鲲鹏', '123123', '3213123123', '男');
INSERT INTO `user` VALUES (11, 'sx', '申鑫', '123456', '15654323678', '男');
INSERT INTO `user` VALUES (12, '1', '1', '12', '123', '男');
INSERT INTO `user` VALUES (13, '11', '11', '11', '123', '男');
INSERT INTO `user` VALUES (14, '123', '123', '123', '123', '男');

SET FOREIGN_KEY_CHECKS = 1;
