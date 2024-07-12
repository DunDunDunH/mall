DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` VARCHAR(50) NOT NULL COMMENT 'ID',
  `username` VARCHAR(50) NOT NULL COMMENT '用户名',
  `password` VARCHAR(30) NOT NULL COMMENT '密码',
  `phone` VARCHAR(50) DEFAULT NULL COMMENT '手机号',
  `is_deleted` INTEGER DEFAULT 0 COMMENT '是否删除。0：否；1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户';
INSERT INTO user(id, username, password, phone, is_deleted) VALUES
('1', 'admin', '123456', NULL, 0),
('2', '1', '1', NULL, 0);

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` VARCHAR(50) NOT NULL COMMENT 'ID',
  `name` VARCHAR(50) NOT NULL COMMENT '名称',
  `price` DOUBLE NOT NULL COMMENT '价格',
  `is_deleted` INTEGER DEFAULT 0 COMMENT '是否删除。0：否；1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品';
INSERT INTO product(id, name, price, is_deleted) VALUES
('1', '六月雪', 10, 0),
('2', '向日葵', 11, 0),
('3', '山茶花', 31, 0),
('4', '水仙', 19.5, 0),
('5', '玫瑰', 51, 0),
('6', '芍药', 25, 0),
('7', '茉莉', 74, 0),
('8', '迎春花', 25, 0),
('9', '郁金香', 14, 0),
('10', '风信子', 71, 0);

DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` VARCHAR(50) NOT NULL COMMENT 'ID',
  `user_id` VARCHAR(50) NOT NULL COMMENT '用户ID',
  `product_id` VARCHAR(50) NOT NULL COMMENT '商品ID',
  `create_time` VARCHAR(50) DEFAULT NULL COMMENT '创建时间',
  `is_deleted` INTEGER DEFAULT 0 COMMENT '是否删除。0：否；1：是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='订单';

