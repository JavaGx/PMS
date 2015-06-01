/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : pms

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2015-05-27 17:29:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recipient_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `state` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_column2` (`recipient_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('2', '3', '44', '1');
INSERT INTO `comment` VALUES ('3', '1', '45', '1');
INSERT INTO `comment` VALUES ('4', '2', '46', '1');
INSERT INTO `comment` VALUES ('5', '3', '47', '1');
INSERT INTO `comment` VALUES ('6', '3', '48', '1');
INSERT INTO `comment` VALUES ('7', '2', '49', '1');
INSERT INTO `comment` VALUES ('8', '1', '50', '1');
INSERT INTO `comment` VALUES ('9', '9', '51', '1');
INSERT INTO `comment` VALUES ('10', '9', '52', '1');
INSERT INTO `comment` VALUES ('11', '3', '53', '1');
INSERT INTO `comment` VALUES ('12', '1', '54', '1');
INSERT INTO `comment` VALUES ('13', '1', '55', '1');
INSERT INTO `comment` VALUES ('14', '1', '56', '1');
INSERT INTO `comment` VALUES ('15', '1', '57', '1');
INSERT INTO `comment` VALUES ('16', '3', '58', '1');
INSERT INTO `comment` VALUES ('17', '3', '59', '1');
INSERT INTO `comment` VALUES ('18', '10', '60', '1');
INSERT INTO `comment` VALUES ('19', '3', '61', '1');
INSERT INTO `comment` VALUES ('20', '1', '62', '1');
INSERT INTO `comment` VALUES ('21', '1', '63', '1');
INSERT INTO `comment` VALUES ('22', '9', '64', '1');
INSERT INTO `comment` VALUES ('23', '3', '65', '1');

-- ----------------------------
-- Table structure for demand
-- ----------------------------
DROP TABLE IF EXISTS `demand`;
CREATE TABLE `demand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(400) DEFAULT NULL,
  `applicant` int(11) DEFAULT NULL,
  `starttime` varchar(20) DEFAULT NULL,
  `updatetime` varchar(20) DEFAULT NULL,
  `content` varchar(4000) DEFAULT NULL,
  `appointperson` int(11) DEFAULT NULL,
  `project` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_column_id2` (`appointperson`),
  KEY `fk_column_id3` (`applicant`),
  KEY `fk_id2` (`project`),
  CONSTRAINT `fk_column_id2` FOREIGN KEY (`appointperson`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_column_id3` FOREIGN KEY (`applicant`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_id2` FOREIGN KEY (`project`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of demand
-- ----------------------------
INSERT INTO `demand` VALUES ('1', '用户管理', '1', '2015-05-06 19:58:35', '2015-05-06 20:06:47', '功能：查询用户、添加用户、删除用户、更改用户。', '1', '1');
INSERT INTO `demand` VALUES ('2', '权限控制', '1', '2015-05-06 20:10:25', '2015-05-06 20:10:25', '对不同的用户角色进行不同的权限控制。', '1', '1');
INSERT INTO `demand` VALUES ('3', '商城平台', '2', '2015-06-19 12:55:13', '', '构建一个轻量级的平台', '10', '3');
INSERT INTO `demand` VALUES ('4', '数据图表', '1', '2015-04-19 13:03:46', '', '根据每月数据生成相应月的图表数据变化情况', '10', '2');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_column6` (`pid`),
  CONSTRAINT `fk_column6` FOREIGN KEY (`pid`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '项目组1', '项目开发组1', '3');
INSERT INTO `department` VALUES ('2', '项目组2', '项目开发组2', '3');
INSERT INTO `department` VALUES ('3', '开发部', '负责项目开发', '5');
INSERT INTO `department` VALUES ('4', '项目组3', '开发项目组3', '3');
INSERT INTO `department` VALUES ('5', '总经办', '公司行政部门', null);
INSERT INTO `department` VALUES ('6', '测试组', '软件测试', '3');
INSERT INTO `department` VALUES ('7', '设计组', '页面设计', '3');

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `pid` int(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK196D169157908E75` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('11', '系统管理', null, null, null);
INSERT INTO `privilege` VALUES ('12', '部门管理', '', '11', '');
INSERT INTO `privilege` VALUES ('13', '部门列表', '/department/departmentList', '12', '查看部门信息');
INSERT INTO `privilege` VALUES ('14', '部门添加', '/department/addDepartment', '12', '添加部门信息');
INSERT INTO `privilege` VALUES ('15', '部门删除', '/department/deleteDepartment', '12', '删除部门信息');
INSERT INTO `privilege` VALUES ('16', '部门修改', '/department/updateDepartment', '12', '修改部门信息');
INSERT INTO `privilege` VALUES ('17', '岗位管理', '', '11', '');
INSERT INTO `privilege` VALUES ('18', '岗位列表', '/role/roleList', '17', '角色列表');
INSERT INTO `privilege` VALUES ('19', '岗位添加', '/role/addRole', '17', '添加岗位');
INSERT INTO `privilege` VALUES ('20', '岗位删除', '/role/deleteRole', '17', '删除角色');
INSERT INTO `privilege` VALUES ('21', '岗位修改', '/role/updateRole', '17', '修改角色信息');
INSERT INTO `privilege` VALUES ('22', '岗位设置权限', '/role/setPrivilege', '17', '给岗位分配权限');
INSERT INTO `privilege` VALUES ('23', '用户管理', '', '11', '');
INSERT INTO `privilege` VALUES ('24', '用户列表', '/user/userList', '23', '查看用户信息');
INSERT INTO `privilege` VALUES ('25', '用户添加', '/user/addUser', '23', '添加用户信息');
INSERT INTO `privilege` VALUES ('26', '用户删除', '/user/deleteUser', '23', '删除用户信息');
INSERT INTO `privilege` VALUES ('27', '用户修改', '/user/updateUser', '23', '修改用户信息');
INSERT INTO `privilege` VALUES ('28', '项目管理', '', null, '项目信息管理');
INSERT INTO `privilege` VALUES ('29', '添加项目页面', '/project/addProjectUI', '28', '进行添加项目');
INSERT INTO `privilege` VALUES ('30', '添加需求', '/demand/addDemand', '28', '为项目添加需求');
INSERT INTO `privilege` VALUES ('31', '修改需求', '/demand/updateDemand', '28', '修改需求');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(20) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `versionno` varchar(10) DEFAULT NULL,
  `startdate` varchar(20) DEFAULT NULL,
  `plandate` varchar(20) DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `file` varchar(100) DEFAULT NULL,
  `applicant` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id1` (`department`),
  KEY `fk_id5` (`applicant`),
  CONSTRAINT `fk_id1` FOREIGN KEY (`department`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_id5` FOREIGN KEY (`applicant`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('1', '项目管理系统', '开发使用范围广的项目管理系统', '我们的宗旨是开发出在一般的项目管理系统所具有的功能的前提下，进行创新、整合，为广大的开发企业用户群提供方便、清晰、便于管理的项目管理系统。', '1.0', '2015-05-02', '2015-05-13', '1', null, '1');
INSERT INTO `project` VALUES ('2', '项目1', '测试项目', '测试中文文件上传下载', '1.0', '2015-04-11', '2015-04-18', '4', 'file/2015051101_我的简历.wps', '1');
INSERT INTO `project` VALUES ('3', '商城项目', '网上商城', '大众网上商城', '1.0', '2015-06-19', '2015-07-26', '4', 'file/2015051912_新建 Microsoft Word 文档.doc', '2');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `replytime` varchar(30) DEFAULT NULL,
  `handle` varchar(4000) DEFAULT NULL,
  `myfile` varchar(100) DEFAULT NULL,
  `warn_id` int(11) DEFAULT NULL,
  `replyperson` int(11) DEFAULT NULL,
  `pid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_column_id5` (`replyperson`),
  KEY `fk_column_id6` (`warn_id`),
  KEY `fk_id6` (`pid`),
  CONSTRAINT `fk_column_id5` FOREIGN KEY (`replyperson`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_column_id6` FOREIGN KEY (`warn_id`) REFERENCES `warning` (`id`),
  CONSTRAINT `fk_id6` FOREIGN KEY (`pid`) REFERENCES `reply` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------
INSERT INTO `reply` VALUES ('1', '2015-05-04 13:03:02', '<p>浏览器兼容问题</p>', null, '1', '1', null);
INSERT INTO `reply` VALUES ('2', '2015-05-04 13:05:51', '<p>目前技术稳定性不高</p>', null, '1', '1', null);
INSERT INTO `reply` VALUES ('3', '2015-05-04 13:18:58', '<p>结贴吧</p>', null, '1', '1', null);
INSERT INTO `reply` VALUES ('4', '2015-05-06 22:57:37', '', null, '2', '1', null);
INSERT INTO `reply` VALUES ('5', '2015-05-07 18:16:30', '页面静态化是个方法', null, null, '2', '4');
INSERT INTO `reply` VALUES ('6', '2015-05-07 18:53:42', '试试', null, null, '1', '4');
INSERT INTO `reply` VALUES ('7', '2015-05-07 19:07:24', '<p>楼上为啥没内容？</p>', null, '2', '2', null);
INSERT INTO `reply` VALUES ('8', '2015-05-07 19:38:47', '失误', null, null, '1', '7');
INSERT INTO `reply` VALUES ('9', '2015-05-07 20:21:46', '111111', null, null, '1', '4');
INSERT INTO `reply` VALUES ('10', '2015-05-07 20:37:15', 'undefined', null, null, '1', '5');
INSERT INTO `reply` VALUES ('11', '2015-05-07 20:46:48', 'è¿é½è½è¡', null, null, '1', '10');
INSERT INTO `reply` VALUES ('12', '2015-05-07 20:53:14', '123', null, null, '1', '6');
INSERT INTO `reply` VALUES ('13', '2015-05-07 20:58:22', 'ä¸­æ', null, null, '1', '8');
INSERT INTO `reply` VALUES ('14', '2015-05-07 21:26:45', '中文', null, null, '1', '13');
INSERT INTO `reply` VALUES ('15', '2015-05-07 21:37:39', '这是什么鬼', null, null, '2', '13');
INSERT INTO `reply` VALUES ('16', '2015-05-07 21:38:42', ',,,,当前用户是谁', null, null, '2', '7');
INSERT INTO `reply` VALUES ('17', '2015-05-08 03:21:04', '<p>还不结贴，更待何时。</p>', null, '2', '1', null);
INSERT INTO `reply` VALUES ('18', '2015-05-08 03:22:14', '急啥，还不是你决定', null, null, '2', '17');
INSERT INTO `reply` VALUES ('19', '2015-05-08 03:23:01', '逗逗你', null, null, '1', '18');
INSERT INTO `reply` VALUES ('20', '2015-05-08 03:24:12', '这评论有三层了吧?', null, null, '2', '19');
INSERT INTO `reply` VALUES ('21', '2015-05-08 03:25:01', '嗯，弄一天了，终于弄好了', null, null, '1', '20');
INSERT INTO `reply` VALUES ('22', '2015-05-08 03:25:31', '现在几点了？', null, null, '2', '21');
INSERT INTO `reply` VALUES ('23', '2015-05-08 03:26:15', '凌晨三点半，洗洗睡吧', null, null, '2', '22');
INSERT INTO `reply` VALUES ('24', '2015-05-08 03:27:07', '我是不是有病，一个人在说', null, null, '2', '23');
INSERT INTO `reply` VALUES ('25', '2015-05-08 12:15:23', '这都可以', null, null, '1', '1');
INSERT INTO `reply` VALUES ('26', '2015-05-08 12:15:50', '咋啦', null, null, '2', '25');
INSERT INTO `reply` VALUES ('27', '2015-05-08 12:16:21', '试试格式', null, null, '1', '26');
INSERT INTO `reply` VALUES ('28', '2015-05-08 14:41:27', '<p>新人报道</p>', null, '2', '3', null);
INSERT INTO `reply` VALUES ('29', '2015-05-08 14:42:01', '欢迎欢迎！', null, null, '2', '28');
INSERT INTO `reply` VALUES ('30', '2015-05-08 14:46:43', '我来也', null, null, '1', '29');
INSERT INTO `reply` VALUES ('31', '2015-05-08 17:36:22', ',,,,,1111', null, null, '1', '7');
INSERT INTO `reply` VALUES ('32', '2015-05-08 23:16:41', ',,,,,,为啥采纳不了', null, null, '1', '4');
INSERT INTO `reply` VALUES ('33', '2015-05-10 01:53:31', '<p>大半夜的瞎弄什么</p>', null, '3', '1', null);
INSERT INTO `reply` VALUES ('34', '2015-05-10 01:58:38', '谁叫我命苦', null, null, '2', '33');
INSERT INTO `reply` VALUES ('35', '2015-05-11 11:21:38', ',,,,,,,什么情况,', null, null, '2', '17');
INSERT INTO `reply` VALUES ('36', '2015-05-12 02:00:35', '<p>试试消息</p>', null, '3', '1', null);
INSERT INTO `reply` VALUES ('37', '2015-05-12 02:02:25', '<p>再试一次</p>', null, '3', '1', null);
INSERT INTO `reply` VALUES ('38', '2015-05-12 02:04:26', '<p>再试一次，就不信还有问题</p>', null, '3', '1', null);
INSERT INTO `reply` VALUES ('39', '2015-05-12 02:06:34', '<p>我笑了</p>', null, '3', '3', null);
INSERT INTO `reply` VALUES ('40', '2015-05-12 02:12:55', '<p>啥</p>', null, '3', '3', null);
INSERT INTO `reply` VALUES ('41', '2015-05-12 02:16:10', '<p>无语了都</p>', null, '3', '3', null);
INSERT INTO `reply` VALUES ('42', '2015-05-12 02:19:33', '<p>一点东西调试半天，半天！！！</p>', null, '3', '3', null);
INSERT INTO `reply` VALUES ('43', '2015-05-12 02:22:58', '<p>一个问题接着一个问题</p>', null, '11', '3', null);
INSERT INTO `reply` VALUES ('44', '2015-05-12 13:16:33', '是啊', null, null, '2', '43');
INSERT INTO `reply` VALUES ('45', '2015-05-12 13:51:09', '<p>测试评论</p>', null, '11', '3', null);
INSERT INTO `reply` VALUES ('46', '2015-05-12 15:10:28', '<p>试啥？</p>', null, '14', '9', null);
INSERT INTO `reply` VALUES ('47', '2015-05-12 15:17:48', '<p>成功没？</p>', null, '13', '9', null);
INSERT INTO `reply` VALUES ('48', '2015-05-12 15:19:17', '<p>现在就剩下测试了</p>', null, '13', '2', null);
INSERT INTO `reply` VALUES ('49', '2015-05-14 14:27:01', '<p>11111</p>', null, '3', '1', null);
INSERT INTO `reply` VALUES ('50', '2015-05-14 21:33:47', '<p>是不是并发的时候，主键不一样了？</p><p>ProjFcdImpl的scope不是配的singleton吗？试试配成 prototype</p><p>@Transactional(isolation = Isolation.SERIALIZABLE)指定事务隔离级别可以解决你的问题。</p>', null, '15', '3', null);
INSERT INTO `reply` VALUES ('51', '2015-05-14 21:52:40', '样式还不好', null, null, '1', '47');
INSERT INTO `reply` VALUES ('52', '2015-05-14 21:53:52', ',嗯，要调式', null, null, '2', '47');
INSERT INTO `reply` VALUES ('53', '2015-05-14 23:41:15', '<p>为图片测试</p>', null, '13', '1', null);
INSERT INTO `reply` VALUES ('54', '2015-05-16 17:27:44', '<p>消息㴰即时收到么</p>', null, '12', '2', null);
INSERT INTO `reply` VALUES ('55', '2015-05-16 17:28:28', '<p>再来一个</p>', null, '12', '2', null);
INSERT INTO `reply` VALUES ('56', '2015-05-16 21:27:33', '<p>测试消息提醒</p>', null, '12', '10', null);
INSERT INTO `reply` VALUES ('57', '2015-05-16 21:28:49', '<p>第二次消息提醒</p>', null, '12', '10', null);
INSERT INTO `reply` VALUES ('58', '2015-05-17 00:21:23', '<p>最后nginx上测试</p>', null, '13', '10', null);
INSERT INTO `reply` VALUES ('59', '2015-05-17 00:22:18', '<p>两次消息试一下</p>', null, '13', '10', null);
INSERT INTO `reply` VALUES ('60', '2015-05-17 00:33:39', '可以了', null, null, '3', '59');
INSERT INTO `reply` VALUES ('61', '2015-05-17 00:34:28', '嗯', null, null, '10', '60');
INSERT INTO `reply` VALUES ('62', '2015-05-17 15:56:54', '<p>为截图测试</p>', null, '11', '9', null);
INSERT INTO `reply` VALUES ('63', '2015-05-18 15:04:19', '<p>再一次测试</p>', null, '1', '9', null);
INSERT INTO `reply` VALUES ('64', '2015-05-20 22:15:10', '<p>通过maven来管理你们的所有项目代码。</p><p>可以分为如下的maven库。</p><p><strong>底层数据模块</strong></p><p>com.xxx.core</p><p>com.xxx.dao</p><p>com.xxx.service</p><p><strong>公共类模块</strong></p><p>com.xxx.common</p><p><strong>应用层模块</strong></p><p>com.xxx.www</p><p>com.xxx.cms</p><p>应用层模块依赖于公共类模块和底层数据模块，这样就能最大程度的去复用你们的代码了。</p><p>如果不用maven，可以依赖于jar包也可以，把底层数据模块和公共类模块导出为jar，如果涉及到多个部门交互，安全方面可以考虑加密jar包。</p>', null, '17', '3', null);
INSERT INTO `reply` VALUES ('65', '2015-05-20 22:20:17', '<p>synchronized关键字主要解决多线程共享数据同步问题。<br />ThreadLocal使用场合主要解决多线程中数据因并发产生不一致问题。</p><p>ThreadLocal和Synchonized都用于解决多线程并发访问。但是ThreadLocal与synchronized有本质的区别:<br />&nbsp;&nbsp; &nbsp;synchronized是利用锁的机制，使变量或代码块在某一时该只能被一个线程访问。而ThreadLocal为每一个线程都提供了变量的副本，使 得每个线程在某一时间访问到的并不是同一个对象，这样就隔离了多个线程对数据的数据共享。而Synchronized却正好相反，它用于在多个线程间通信 时能够获得数据共享。</p><p>Synchronized用于线程间的数据共享，而ThreadLocal则用于线程间的数据隔离。当然ThreadLocal并不能替代synchronized,它们处理不同的问题域。Synchronized用于实现同步机制，比ThreadLocal更加复杂。</p><p>1、java中synchronized用法<br />&nbsp;&nbsp; &nbsp;使用了synchronized关键字可以轻松地解决多线程共享数据同步问题。<br />&nbsp;&nbsp; &nbsp;synchronized关键字可以作为函数的修饰符，也可作为函数内的语句，也就是平时说的同步方法和同步语句块。如果再细的分 类，synchronized可作用于instance变量、object reference（对象引用）、static函数和class literals(类名称字面常量)身上。 &nbsp;<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; synchronized取得的锁都是对象；每个对象只有一个锁（lock）与之相关联；实现同步是要很大的系统开销作为代价的，甚至可能造成死锁，所以尽量避免无谓的同步控制。</p><p>synchronized的4种用法 ：<br />&nbsp;&nbsp; &nbsp;1.方法声明时使用,线程获得的是成员锁.<br />&nbsp;&nbsp; &nbsp;2.对某一代码块使用,synchronized后跟括号,括号里是变量,线程获得的是成员锁.<br />&nbsp;&nbsp; &nbsp;3.synchronized后面括号里是一对象,此时,线程获得的是对象锁.<br />&nbsp;&nbsp; &nbsp;4.synchronized后面括号里是类,此时,线程获得的是对象锁.</p><p>2、java.lang.ThreadLocal()的用法 &nbsp;<br />一、概述<br />ThreadLocal 是什么呢?其实ThreadLocal并非是一个线程的本地实现版本，它并不是一个Thread，而是 threadlocalvariable(线程局部变量)。也许把它命名为ThreadLocalVar更加合适。线程局部变量 (ThreadLocal)其实的功用非常简单，就是为每一个使用该变量的线程都提供一个变量值的副本，是Java中一种较为特殊的线程绑定机制，是每一 个线程都可以独立地改变自己的副本，而不会和其它线程的副本冲突。</p><p>ThreadLocal是如何做到为每一个线程维护变量的副本的呢?其实实现的思路很简单，在ThreadLocal类中有一个Map，用于存储每一个线程的变量的副本。</p><p>概括起来说，对于多线程资源共享的问题，同步机制采用了&ldquo;以时间换空间&rdquo;的方式，而ThreadLocal采用了&ldquo;以空间换时间&rdquo;的方式。前者仅提供一份变量，让不同的线程排队访问，而后者为每一个线程都提供了一份变量，因此可以同时访问而互不影响。</p><p>二、API说明</p><p>ThreadLocal()<br />&nbsp;&nbsp; &nbsp;创建一个线程本地变量。</p><p>T get()<br />&nbsp;&nbsp; &nbsp;返回此线程局部变量的当前线程副本中的值，如果这是线程第一次调用该方法，则创建并初始化此副本。</p><p>protected T initialValue()<br />&nbsp;&nbsp; &nbsp;返回此线程局部变量的当前线程的初始值。最多在每次访问线程来获得每个线程局部变量时调用此方法一次，即线程第一次使用 get() 方法访问变量的时候。如果线程先于 get 方法调用 set(T) 方法，则不会在线程中再调用 initialValue 方法。<br />&nbsp;&nbsp; &nbsp;若该实现只返回 null;如果程序员希望将线程局部变量初始化为 null 以外的某个值，则必须为 ThreadLocal 创建子类，并重写此方法。通常，将使用匿名内部类。initialValue 的典型实现将调用一个适当的构造方法，并返回新构造的对象。</p><p>void remove()<br />&nbsp;&nbsp; &nbsp;移除此线程局部变量的值。这可能有助于减少线程局部变量的存储需求。如果再次访问此线程局部变量，那么在默认情况下它将拥有其 initialValue。</p><p>void set(T value)<br />&nbsp;&nbsp; &nbsp;将此线程局部变量的当前线程副本中的值设置为指定值。许多应用程序不需要这项功能，它们只依赖于 initialValue() 方法来设置线程局部变量的值。<br />&nbsp;&nbsp; &nbsp;在程序中一般都重写initialValue方法，以给定一个特定的初始值。</p><p>三、典型实例</p><p>四、总结<br />&nbsp;&nbsp; &nbsp;ThreadLocal使用场合主要解决多线程中数据因并发产生不一致问题。<br />&nbsp;&nbsp; &nbsp;<br />&nbsp;&nbsp; &nbsp;ThreadLocal为每个线程的中并发访问的数据提供一个副本，通过访问副本来运行业务，这样的结果是耗费了内存，单大大减少了线程同步所带来性能消耗，也减少了线程并发控制的复杂度。</p><p>&nbsp;&nbsp; &nbsp;ThreadLocal不能使用原子类型，只能使用Object类型。ThreadLocal的使用比synchronized要简单得多。</p><p>五、ThreadLocal使用的一般步骤<br />&nbsp;&nbsp; &nbsp;1、在多线程的类(如ThreadDemo类)中，创建一个ThreadLocal对象threadXxx，用来保存线程间需要隔离处理的对象xxx。<br />&nbsp;&nbsp; &nbsp;2、在ThreadDemo类中，创建一个获取要隔离访问的数据的方法getXxx()，在方法中判断，若ThreadLocal对象为null时候，应该new()一个隔离访问类型的对象，并强制转换为要应用的类型。<br />&nbsp;&nbsp; &nbsp;3、在ThreadDemo类的run()方法中，通过getXxx()方法获取要操作的数据，这样可以保证每个线程对应一个数据对象，在任何时刻都操作的是这个对象。</p>', null, '18', '3', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_column4` (`departmentId`),
  CONSTRAINT `fk_column4` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('15', '项目经理', '管理项目', '3');
INSERT INTO `role` VALUES ('16', '程序员', '编码', '1');
INSERT INTO `role` VALUES ('17', '架构师', '设计项目架构', '3');
INSERT INTO `role` VALUES ('18', '总经理', '管理', '5');
INSERT INTO `role` VALUES ('19', '程序员', '编程开发，实现具体功能。', '1');
INSERT INTO `role` VALUES ('20', '游客', 'guest', null);
INSERT INTO `role` VALUES ('21', '项目组长', '组长', '1');

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `roleId` int(20) NOT NULL,
  `privilegeId` int(20) NOT NULL,
  PRIMARY KEY (`privilegeId`,`roleId`),
  KEY `FK45FBD62857908E75` (`privilegeId`),
  KEY `FK45FBD6281830894F` (`roleId`),
  CONSTRAINT `fk_column2` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_column3` FOREIGN KEY (`privilegeId`) REFERENCES `privilege` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('18', '11');
INSERT INTO `role_privilege` VALUES ('18', '12');
INSERT INTO `role_privilege` VALUES ('18', '13');
INSERT INTO `role_privilege` VALUES ('18', '14');
INSERT INTO `role_privilege` VALUES ('18', '15');
INSERT INTO `role_privilege` VALUES ('18', '16');
INSERT INTO `role_privilege` VALUES ('18', '17');
INSERT INTO `role_privilege` VALUES ('18', '18');
INSERT INTO `role_privilege` VALUES ('18', '19');
INSERT INTO `role_privilege` VALUES ('18', '20');
INSERT INTO `role_privilege` VALUES ('18', '21');
INSERT INTO `role_privilege` VALUES ('18', '22');
INSERT INTO `role_privilege` VALUES ('18', '23');
INSERT INTO `role_privilege` VALUES ('18', '24');
INSERT INTO `role_privilege` VALUES ('18', '25');
INSERT INTO `role_privilege` VALUES ('18', '26');
INSERT INTO `role_privilege` VALUES ('18', '27');
INSERT INTO `role_privilege` VALUES ('15', '28');
INSERT INTO `role_privilege` VALUES ('18', '28');
INSERT INTO `role_privilege` VALUES ('21', '28');
INSERT INTO `role_privilege` VALUES ('15', '29');
INSERT INTO `role_privilege` VALUES ('18', '29');
INSERT INTO `role_privilege` VALUES ('21', '29');
INSERT INTO `role_privilege` VALUES ('15', '30');
INSERT INTO `role_privilege` VALUES ('18', '30');
INSERT INTO `role_privilege` VALUES ('21', '30');
INSERT INTO `role_privilege` VALUES ('15', '31');
INSERT INTO `role_privilege` VALUES ('18', '31');
INSERT INTO `role_privilege` VALUES ('21', '31');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `sex` varchar(2) DEFAULT '男',
  `image` varchar(100) DEFAULT NULL,
  `depart_id` int(11) DEFAULT NULL,
  `roleId` int(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_column_id` (`depart_id`),
  KEY `fk_column1` (`roleId`),
  CONSTRAINT `fk_column1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`),
  CONSTRAINT `fk_column_id` FOREIGN KEY (`depart_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '110', '121@136.com', '男', 'userImages/2015051101_51.jpg', '5', '18', '生命不息，奋斗不止！');
INSERT INTO `user` VALUES ('2', 'aa', '11', '110', '123@136.com', '男', 'userImages/2015051022_50.png', '1', '21', '生命不息，奋斗不止。');
INSERT INTO `user` VALUES ('3', '做一个安静的码农', '123', '110', '111@136.com', '男', 'userImages/1.jpg', '3', '15', '生命不息，奋斗不止。');
INSERT INTO `user` VALUES ('9', '苍寂', '11', null, '123@163.com', '男', 'userImages/2015051601_54.jpg', '3', '17', null);
INSERT INTO `user` VALUES ('10', '行者', '123', null, '1@sina.com', '男', 'userImages/1.jpg', '4', '19', null);

-- ----------------------------
-- Table structure for warning
-- ----------------------------
DROP TABLE IF EXISTS `warning`;
CREATE TABLE `warning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `starttime` varchar(30) DEFAULT NULL,
  `urgent` varchar(10) DEFAULT NULL,
  `state` varchar(6) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `applicant` int(11) DEFAULT NULL,
  `bestreply` int(11) DEFAULT NULL,
  `browsenumber` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_column_id4` (`applicant`),
  KEY `fk_column_id7` (`bestreply`),
  CONSTRAINT `fk_column_id4` FOREIGN KEY (`applicant`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_column_id7` FOREIGN KEY (`bestreply`) REFERENCES `reply` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of warning
-- ----------------------------
INSERT INTO `warning` VALUES ('1', '页面加载有问题', '2015-05-03 01:10:30', '一般', '已关闭', '页面加载不稳定', '', '1', '1', '28');
INSERT INTO `warning` VALUES ('2', '页面响应慢', '2015-05-06 18:06:15', '紧急', '已关闭', '前台页面响应速度还有待加快。', '', '1', '4', '30');
INSERT INTO `warning` VALUES ('3', '页面结构不稳定', '2015-05-10 01:48:31', '一般', '已解决', '页面结构时不时有点错乱', '', '2', '33', '37');
INSERT INTO `warning` VALUES ('10', '测试', '2015-05-10 17:56:59', '一般', '未处理', '测试上传文件，有bug么，应该没吧', '', '1', null, '21');
INSERT INTO `warning` VALUES ('11', '分页测试', '2015-05-11 17:24:06', '一般', '已解决', 'jqPaginator插件应用测试', 'userImages/2015051612_54.jpg', '1', '43', '43');
INSERT INTO `warning` VALUES ('12', '页面响应', '2015-05-11 17:24:59', '一般', '已回复', '数据查询需要优化，没时间了吗', '', '1', null, '26');
INSERT INTO `warning` VALUES ('13', '逻辑处理', '2015-05-11 19:37:32', '一般', '已回复', '不上传图片', '', '3', null, '27');
INSERT INTO `warning` VALUES ('14', '再试一次', '2015-05-11 20:17:38', '一般', '已回复', '希望没问题', '', '2', null, '13');
INSERT INTO `warning` VALUES ('15', 'spring同步关键词synchronized和事务锁@Transactional为什么还有并发？', '2015-05-14 21:30:42', '一般', '已回复', '@Transactional\r\n@Service(\"projFcd\")\r\npublic class ProjFcdImpl implements ProjFcd {\r\n....\r\n       @Override\r\n	public synchronized Result investProject(InvestProjBO tp) throws ProjException {\r\n              ......\r\n        }\r\n}\r\n一个service类上加了@Transaction注解，在方法上加了synchronized关键字，可是最后还是发生了并发问题，是事务没配好，还是怎么回事？再问一句这里的事务锁和同步锁的进入出来顺序是怎么样的？', 'userImages/2015051616_783720604.png', '1', null, '37');
INSERT INTO `warning` VALUES ('16', '一个10G文件内容存的都是整型数据，如何更高效的去重？', '2015-05-20 22:11:24', '一般', '未处理', '在项目中遇到这样的问题。文件下有很多的日志文件，我扫描后存入数据库，这些日志文件过段时间就会新增内容，当日志文件新增后。我只把新增的内容存入数据库。\r\n\r\n例如，一个日志文件的内容为ab，我第一次扫描存入数据库，这个日志文件过了一会新增内容了内容，此时为abcd，我这次扫描后只把新增的内容cd存入数据库。求大神指点。', '', '9', null, '3');
INSERT INTO `warning` VALUES ('17', '如何在不同产品的java项目中最大程度复用java代码？', '2015-05-20 22:14:23', '一般', '已回复', '如题，在Java开发中如何最大化重用java代码？比如：项目中可以会涉及多个产品，这多个产品的功能会有重复，但又不是完全重复，为了能快速接入相同产品，而不需要做大量的开发（只是不同的业务进行重新定制开发）。请问这样的项目应该如何设计，要用到哪些设计模式。希望大家给个学习的方向！！！！！！！！！', '', '9', null, '7');
INSERT INTO `warning` VALUES ('18', '面试常问问题：银行网上支付项目中怎么控制多线程高并发访问？', '2015-05-20 22:19:02', '一般', '已回复', '最近两家面试，都问到了这个问题，因为我是做银行网上支付的，问到了这问题倒也不奇怪。虽然开发快两年了，但我实在不知道这块是怎么去控制的，框架是公司内部的，这些多线程的东西早就封装好了，没接触过这块。就想问下各位大神，你们的项目中是怎么控制的这个高并发访问的？', '', '3', null, '8');

-- ----------------------------
-- Table structure for work_log
-- ----------------------------
DROP TABLE IF EXISTS `work_log`;
CREATE TABLE `work_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startdate` varchar(255) DEFAULT NULL,
  `eventdate` varchar(255) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `applicant` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk1` (`applicant`),
  CONSTRAINT `fk1` FOREIGN KEY (`applicant`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work_log
-- ----------------------------
INSERT INTO `work_log` VALUES ('1', '2015-05-17 02:24:46', '2015-05-17', '第一次记事', '9');
INSERT INTO `work_log` VALUES ('2', '2015-05-17 02:26:53', '2015-05-17', '今天记事', '9');
INSERT INTO `work_log` VALUES ('3', '2015-05-17 04:20:27', '2015-05-18', '已经是第二天了么，时间流逝的可怕。', '9');
INSERT INTO `work_log` VALUES ('4', '2015-05-17 04:24:17', '2015-05-17', '应该是最后一次测试了吧', '9');
INSERT INTO `work_log` VALUES ('5', '2015-05-19 03:08:47', '2015-05-19', '又小小的完善了一下', '9');
INSERT INTO `work_log` VALUES ('6', '2015-05-22 17:28:38', '2015-05-22', '明天会发生什么', '9');
INSERT INTO `work_log` VALUES ('7', '2015-05-23 00:43:37', '2015-05-23', '明天是个迷', '9');
