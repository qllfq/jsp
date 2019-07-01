/*
SQLyog v10.2 
MySQL - 5.5.49 : Database - makefriend
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`makefriend` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `makefriend`;

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `logname` char(100) NOT NULL,
  `password` char(100) DEFAULT NULL,
  `phone` char(100) DEFAULT NULL,
  `email` char(200) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `pic` char(200) DEFAULT NULL,
  PRIMARY KEY (`logname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`logname`,`password`,`phone`,`email`,`message`,`pic`) values ('1','3','3','3','3','public.jpg'),('1111','1111','11111','11111','11111111','public.jpg'),('1144114','411414','4141','4141','414141','public.jpg'),('12212121','21212121','21212121','21212121','212121212121','public.jpg'),('123','123','133','123','123','123.jpg'),('12345','12345','123','123','123','public.jpg'),('1we21','111qqq','18137733394','123123121@qq.com','1w','public.jpg'),('2','2','2','2','2','public.jpg'),('3333','323232','3','3','3','3333.jpg'),('33333','1111111','','','','public.jpg'),('4桥路了','4','1','1','1','public.jpg'),('55','5','5','5','5','public.jpg'),('55555','5555555551q','18137733394','123123121@qq.com','1','public.jpg'),('7','s','s','s','s','public.jpg'),('888','888','888','888','888','public.jpg'),('999','888','吧','cav','法尔','999.jpg'),('99999','123','123','123','esf','public.jpg'),('?','11','??','??','??','public.jpg'),('??','dd','??','??','??','public.jpg'),('a','a','a','a','a','public.jpg'),('aaa','aaa','aaa','aaa','aaa','public.jpg'),('asd','asd','sad','asd','sad','public.jpg'),('d123','d','d','d','d','public.jpg'),('fdwer','f','f','f','f','public.jpg'),('ff','ff','ff','ff','ff','dd'),('ff1','ff','ff','ff','ff','dd'),('svrdx','111','1111','111','111','public.jpg'),('xzc','zx','zxc','zxc','xcz','public.jpg'),('乔露露','123','123','123','仍无法','public.jpg'),('乔露露1','b','b','b','b','public.jpg'),('乔露露2','111qqq','18137733394','123123121@qq.com','未插入','public.jpg'),('乔露露3','19990116q','15506053026','123456789@qq.com','我是学生','public.jpg'),('乔露露4','123456789q','15506053026','123456789@qq.com','我是学生','public.jpg'),('亚瑟王saber','123456789q','15522226969','123123121@qq.com','我是大不列颠的国王，我能拔出石中剑。','public.jpg'),('出2','c','出','出','长春','public.jpg'),('副船长索隆','123456q','15506053026','123123121@qq.com','我要成为世界第一大剑豪。','public.jpg'),('发多少S','123456q','18137733394','123123121@qq.com','aD','public.jpg'),('吉尔伽美什','123456789q','15522226969','123123121@qq.com','我是比巴比伦的英雄王。','public.jpg'),('后方可拉好看','123456789q','11526262621','1261234@qq.com','712','public.jpg'),('多的3是','zz','组长','组长','组长','public.jpg'),('天天','bb','看看','哈哈','露露','public.jpg'),('宫本武藏','123456q','15522226969','123456789@qq.com','我是最厉害的武士。','宫本武藏.jpg'),('我就发发','123456q','18137733394','123123121@qq.com','是个第三方','public.jpg'),('方琦','www','覆盖广泛','呜呜呜','充电方式','public.jpg'),('方琦其气球','111qqq','18137733394','123123121@qq.com','行为而特别','public.jpg'),('施瓦辛格','123456q','15506053026','123456789@qq.com','我有肌肉。','施瓦辛格.jpg'),('死亡笔记','123456q','15522226969','123123121@qq.com','我是一部漫画。','public.jpg'),('海尔兄弟','123456789q','18137733394','123123121@qq.com','我们是两个人哦。','public.jpg'),('海贼王路飞','123456q','15506053026','123123121@qq.com','我是要成为海贼王的男人！','public.jpg'),('爱因斯坦','111qqq','18137733394','123123121@qq.com','安抚','public.jpg'),('美国队长','123456789q','15522226969','123123121@qq.com','我是人民的英雄。','public.jpg'),('莎士比亚','123456q','18137733394','123@qq.com','防守打法','莎士比亚.jpg'),('诸葛孔明','123456q','18137733394','123456789@qq.com','鞠躬尽瘁死而后已。','public.jpg'),('谢谢1','信息','学校','师生','等等','方法'),('迈克尔杰克逊','123456q','18137733394','123456789@qq.com','我是歌王。','public.jpg'),('铁人王进喜','123456q','18137733394','123123121@qq.com','我为石油做贡献','public.jpg'),('铁臂阿童木','111qqq','15506053026','123123121@qq.com','眼睛大得像铜铃。','public.jpg'),('阿凡达2','123456789q','15506053026','123123121@qq.com','我是外星人。','public.jpg'),('黑旋风李逵','123456q','18137733394','123123121@qq.com','我黑我自豪。','public.jpg');

/*Table structure for table `msg` */

DROP TABLE IF EXISTS `msg`;

CREATE TABLE `msg` (
  `logname` char(100) NOT NULL,
  `leavemsg` char(100) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `nowTime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `msg` */

insert  into `msg`(`logname`,`leavemsg`,`type`,`nowTime`) values ('3333','gse',1,'2018-06-23 00:00:00'),('3333','hte6u',1,'2018-06-23 00:00:00'),('3333','ndyt',1,'2018-06-23 00:00:00'),('3333','截的图',1,'2018-06-23 00:00:00'),('3333','保险费图给你',1,'2018-06-23 15:15:25'),('3333','test',1,'2018-06-23 15:26:34'),('3333','gsrth',1,'2018-06-24 18:58:34'),('3333','nfyu',1,'2018-06-24 19:00:14'),('3333','jbljkgb',1,'2018-06-25 13:35:39'),('3333','城市人防',1,'2018-06-25 16:37:59'),('3333','vera',1,'2018-06-25 17:05:29'),('3333','FQ53',1,'2018-06-25 18:01:36'),('3333','ge6rh',1,'2018-06-25 19:15:01'),('3333','hft7j',1,'2018-06-25 20:17:38'),('3333','vaer;boa',1,'2018-06-25 20:33:32'),('3333','fr5hgwgdyth',1,'2018-06-25 20:42:41'),('3333','充不上电看见了',2,'2018-06-25 21:26:30'),('3333','cwrtg3bv',1,'2018-06-26 11:13:00'),('3333','cwrtg3bv',1,'2018-06-26 11:20:00'),('3333','sbrtn',1,'2018-06-26 20:04:07'),('3333','暗室逢灯',1,'2018-06-27 09:36:34'),('施瓦辛格','恭喜施瓦辛格夺冠',1,'2018-06-28 09:23:26'),('施瓦辛格','今天我一直在家。',2,'2018-06-28 09:31:24'),('施瓦辛格','我的电影终结者上映了。',1,'2018-06-28 09:40:27'),('施瓦辛格','我的电影希望大家支持',2,'2018-06-28 10:39:38');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
