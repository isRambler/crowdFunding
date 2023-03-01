/*
SQLyog Professional v12.09 (64 bit)
MySQL - 8.0.31 : Database - crowdfunding
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crowdfunding` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `crowdfunding`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `account` varchar(255) NOT NULL,
  `admin_pwd` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `admin` */

insert  into `admin`(`id`,`account`,`admin_pwd`,`email`,`create_time`) values (1,'cxy','4297F44B13955235245B2497399D7A93','1295423769@qq.com','2023-02-21 22:32:03');

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `project_description` varchar(255) DEFAULT NULL COMMENT '项目描述',
  `money` bigint DEFAULT NULL COMMENT '筹集金额',
  `day` int DEFAULT NULL COMMENT '筹集天数',
  `status` int DEFAULT NULL COMMENT '0-即将开始，1-众筹中，2-众筹成功，3-众筹失败',
  `deploy_date` varchar(19) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '项目发起时间',
  `support_money` int DEFAULT NULL COMMENT '已筹集到的金额',
  `supporter` int DEFAULT NULL COMMENT '支持人数',
  `member_name` varchar(255) DEFAULT NULL COMMENT '发起人',
  `create_date` varchar(19) DEFAULT NULL COMMENT '项目创建时间',
  `picture_path` varchar(255) DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

/*Data for the table `project` */

insert  into `project`(`id`,`project_name`,`project_description`,`money`,`day`,`status`,`deploy_date`,`support_money`,`supporter`,`member_name`,`create_date`,`picture_path`) values (3,'面包软床','带你体验不一样的睡眠',50000,40,1,'2023-02-27 19:22:34',1500,5,'jack','2023-02-26 22:20:54','upload/31ebc05a-b267-4db7-9ce6-cea9073cecba/carousel-3.jpg'),(4,'玉米U盘','U盘也可以那么可爱',5000,60,1,'2023-02-28 16:38:31',450,2,'oll','2023-02-26 22:24:47','upload/eda2f491-6fd5-44e4-8b9b-5b5bbf10b6f6/carousel-1.jpg'),(5,'番茄汁书签','使用本书签让你的阅读生活多一份乐趣',10000,30,0,NULL,0,0,'tom','2023-02-27 20:28:50','upload/5c74567d-0a45-4c43-87a6-9d27c96559ab/carousel-2.jpg'),(7,'梵高向日葵籽袋','普通的梵高小卡片，我们替梵高动手，用剪刀咔嚓一下耳朵，就能倒出一堆向日葵籽。',10000,25,1,'2023-02-28 16:38:27',0,0,'lucy','2023-02-28 16:33:14','upload/d64c8f59-543f-4df0-b668-94aaf988c545/remote_161545104086720.jpg'),(9,'果汁的肌肤','drud为了顾客获得最本真的产品体验，包装上借鉴模拟自然物体表面纹理和组织结构，并最大限度的发挥产品的实用性。',30000,60,1,'2023-02-28 16:39:46',0,0,'drud','2023-02-28 16:35:27','upload/cdaad922-6aec-4ca5-98e3-cda07923e894/remote_161545103844605.png'),(10,'圆白菜碗','axy用可塑材料制作圆白菜叶子，再用聚酮精确复制，之后组合成一个圆白菜。将圆白菜拆开就成了一个个碗。',30000,45,0,NULL,0,0,'axy','2023-02-28 16:36:41','upload/0c5197a2-65e5-4a4b-9068-4a19a1124d7a/remote_161545103614587.png');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `account` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`account`,`user_pwd`,`email`,`create_time`) values ('008392a5-0c30-4709-9e91-b7ec1e6a11d3','luckies','4297F44B13955235245B2497399D7A93','567@qq.com','2023-02-24 16:58:37'),('0c0bf2e6-67bc-4c77-bfd2-e5840fe2e77e','food','4297F44B13955235245B2497399D7A93','13425@qq.com','2023-02-24 17:02:12'),('1','tom','4297F44B13955235245B2497399D7A93','1295423768@qq.com','2023-02-22 20:07:52'),('13dcc2e3-a9ca-440c-a8d8-6290381d6c80','milk','4297F44B13955235245B2497399D7A93','789@qq.com','2023-02-24 16:57:26'),('207c69be-7ec7-43cb-913e-8268cb00a5fb','lucy','4297F44B13955235245B2497399D7A93','333@qq.com','2023-02-24 16:59:30'),('20d8eafc-ad9d-474f-9773-26b62fd4361e','drud','4297F44B13955235245B2497399D7A93','543430@qq.com','2023-02-25 11:22:06'),('227934e1-7d04-43ca-8e60-a39079701745','pore','4297F44B13955235245B2497399D7A93','0234@qq.com','2023-02-25 11:22:30'),('2693a387-3717-4502-82bd-299dcee32ef3','axy','4297F44B13955235245B2497399D7A93','9990@qq.com','2023-02-25 11:20:44'),('2eac7a4f-c378-4ec7-a655-b138443c06d5','timi','4297F44B13955235245B2497399D7A93','123@qq.com','2023-02-24 16:56:49'),('4865e858-da67-4d78-9f46-759b0883b356','fire','4297F44B13955235245B2497399D7A93','2354923@qq.com','2023-02-25 11:21:00'),('4ddd508d-76f7-4a65-b479-84fbab748ca8','bobo','4297F44B13955235245B2497399D7A93','3563@qq.com','2023-02-25 15:59:17'),('6480d06b-d7fa-42c2-9c0a-e62bd0b01855','killy','4297F44B13955235245B2497399D7A93','999@qq.com','2023-02-24 17:00:52'),('64fcd145-d1b4-4241-a705-0e4035ed096c','spark','4297F44B13955235245B2497399D7A93','4574@qq.com','2023-02-25 11:21:13'),('897f67d8-438c-4d15-865e-6de8f4e7701d','wonder','4297F44B13955235245B2497399D7A93','00012@qq.com','2023-02-25 11:21:32'),('8afe2ae7-1606-4e42-9ee0-73ddd03cc0ee','bill','4297F44B13955235245B2497399D7A93','777@qq.com','2023-02-24 17:00:20'),('902ace9d-2f69-47d8-97ec-5a27d5a558db','tour','4297F44B13955235245B2497399D7A93','56452@qq.com','2023-02-25 11:20:01'),('a7a627d0-4f7d-4156-9f71-6e7198011125','jack','4297F44B13955235245B2497399D7A93','666@qq.com','2023-02-22 23:28:19'),('ae4ae8dc-454c-4356-9ff0-f31de512e6dd','haven','4297F44B13955235245B2497399D7A93','444@qq.com','2023-02-24 16:59:05'),('d0a665df-51a6-45eb-8220-f082865e0979','hello','4297F44B13955235245B2497399D7A93','6666@qq.com','2023-02-28 22:26:28'),('fbe2a97f-8d1e-44ce-be02-8a2d669999e6','gully','4297F44B13955235245B2497399D7A93','564563@qq.com','2023-02-24 17:01:52'),('fe80b8bd-142e-45a3-a2f4-3c1d6501f6b6','polly','4297F44B13955235245B2497399D7A93','3564575@qq.com','2023-02-25 11:19:06');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
