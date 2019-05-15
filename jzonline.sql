/*
Navicat MySQL Data Transfer

Source Server         : sz
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : jzonline

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2019-05-16 00:16:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 用户信息', '6', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 用户信息', '6', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 用户信息', '6', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('24', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('26', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('27', 'Can add 轮播图', '8', 'add_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can change 轮播图', '8', 'change_banner');
INSERT INTO `auth_permission` VALUES ('29', 'Can delete 轮播图', '8', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('30', 'Can view 轮播图', '8', 'view_banner');
INSERT INTO `auth_permission` VALUES ('31', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户信息', '6', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 课程', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 课程', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 课程', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('36', 'Can add 章节', '10', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('37', 'Can change 章节', '10', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('38', 'Can delete 章节', '10', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('39', 'Can add 视频', '11', 'add_video');
INSERT INTO `auth_permission` VALUES ('40', 'Can change 视频', '11', 'change_video');
INSERT INTO `auth_permission` VALUES ('41', 'Can delete 视频', '11', 'delete_video');
INSERT INTO `auth_permission` VALUES ('42', 'Can add 课程资源', '12', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('43', 'Can change 课程资源', '12', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('44', 'Can delete 课程资源', '12', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('45', 'Can view 课程', '9', 'view_course');
INSERT INTO `auth_permission` VALUES ('46', 'Can view 课程资源', '12', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('47', 'Can view 章节', '10', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 视频', '11', 'view_video');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 城市', '13', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 城市', '13', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 城市', '13', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 课程机构', '14', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 课程机构', '14', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 课程机构', '14', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 教师', '15', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 教师', '15', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 教师', '15', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('58', 'Can view 城市', '13', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('59', 'Can view 课程机构', '14', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 教师', '15', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('64', 'Can add 课程评论', '17', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('65', 'Can change 课程评论', '17', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete 课程评论', '17', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('67', 'Can add 用户收藏', '18', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('68', 'Can change 用户收藏', '18', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('69', 'Can delete 用户收藏', '18', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('70', 'Can add 用户消息', '19', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('71', 'Can change 用户消息', '19', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('72', 'Can delete 用户消息', '19', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 用户课程', '20', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 用户课程', '20', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 用户课程', '20', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 课程评论', '17', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 用户课程', '20', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 用户收藏', '18', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户消息', '19', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('85', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('91', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('92', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('93', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('94', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('96', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('97', 'Can add captcha store', '25', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('98', 'Can change captcha store', '25', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete captcha store', '25', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('100', 'Can view captcha store', '25', 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL auto_increment,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('100', 'ZHHR', 'zhhr', '5c027a2dae144bfacbccc226d053d697f73dd663', '2019-04-14 16:41:56');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(10) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `org_id` int(11),
  `image` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `courses_course_9cf869aa` (`org_id`),
  CONSTRAINT `courses_course_org_id_387fdc72_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'django入门', 'django入门', 'django入门全部', 'cj', '25', '1', '1', '1', '2019-04-06 11:10:00', '1', 'course/2019/05/django.jpg');
INSERT INTO `courses_course` VALUES ('2', 'mysql 入门', 'mysql 入门到精通', 'MySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，目前属于 Oracle 旗下公司。MySQL 最流行的关系型数据库管理系统，在 WEB 应用方面MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一', 'cj', '600', '40', '5', '2000', '2019-05-12 14:20:00', '1', 'course/2019/05/mysql.png');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一章 初始django', '2019-04-06 11:27:00', '1');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of courses_video
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('25', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('9', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL auto_increment,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('10', 'users', '0001_initial', '2019-04-05 18:04:06');
INSERT INTO `django_migrations` VALUES ('11', 'admin', '0001_initial', '2019-04-05 18:04:07');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0002_logentry_remove_auto_add', '2019-04-05 18:04:07');
INSERT INTO `django_migrations` VALUES ('13', 'courses', '0001_initial', '2019-04-05 18:04:07');
INSERT INTO `django_migrations` VALUES ('14', 'operation', '0001_initial', '2019-04-05 18:04:07');
INSERT INTO `django_migrations` VALUES ('15', 'operation', '0002_auto_20190405_1803', '2019-04-05 18:04:07');
INSERT INTO `django_migrations` VALUES ('16', 'organization', '0001_initial', '2019-04-05 18:04:08');
INSERT INTO `django_migrations` VALUES ('17', 'sessions', '0001_initial', '2019-04-05 18:04:08');
INSERT INTO `django_migrations` VALUES ('18', 'xadmin', '0001_initial', '2019-04-05 18:04:08');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0002_log', '2019-04-05 22:42:20');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0003_auto_20160715_0100', '2019-04-05 22:42:20');
INSERT INTO `django_migrations` VALUES ('21', 'captcha', '0001_initial', '2019-04-07 23:41:51');
INSERT INTO `django_migrations` VALUES ('22', 'users', '0002_auto_20190405_2240', '2019-04-07 23:41:51');
INSERT INTO `django_migrations` VALUES ('23', 'users', '0003_auto_20190407_2341', '2019-04-07 23:41:51');
INSERT INTO `django_migrations` VALUES ('24', 'organization', '0002_auto_20190416_2246', '2019-04-16 22:46:53');
INSERT INTO `django_migrations` VALUES ('25', 'organization', '0003_auto_20190420_1931', '2019-04-20 19:46:08');
INSERT INTO `django_migrations` VALUES ('26', 'organization', '0004_auto_20190420_2053', '2019-04-20 20:53:21');
INSERT INTO `django_migrations` VALUES ('27', 'organization', '0005_auto_20190423_2255', '2019-04-23 22:55:30');
INSERT INTO `django_migrations` VALUES ('28', 'courses', '0002_course_org', '2019-04-23 22:55:30');
INSERT INTO `django_migrations` VALUES ('29', 'courses', '0003_course_image', '2019-05-03 20:13:30');
INSERT INTO `django_migrations` VALUES ('30', 'courses', '0004_remove_course_image', '2019-05-03 20:19:30');
INSERT INTO `django_migrations` VALUES ('31', 'courses', '0005_course_image', '2019-05-03 20:35:00');
INSERT INTO `django_migrations` VALUES ('32', 'organization', '0006_auto_20190511_1307', '2019-05-11 13:07:26');
INSERT INTO `django_migrations` VALUES ('33', 'courses', '0006_auto_20190516_0016', '2019-05-16 00:16:22');
INSERT INTO `django_migrations` VALUES ('34', 'operation', '0003_remove_userfavorite_course', '2019-05-16 00:16:22');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('38b5y96gui6k1raa3yoej6vyyvtg3h6g', 'NGEwZjkzYWJlNmZkODJmMzZjNGMwMTA5YmNiZDA5ZTcxZTBkODVmNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiYjhiOTFjNGZlOWJhZWZjNzEzMWY5ODBkMmVkYjI0NWUwMjYzNDFiMSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwid2l6YXJkX3hhZG1pbnVzZXJ3aWRnZXRfYWRtaW5fd2l6YXJkX2Zvcm1fcGx1Z2luIjp7InN0ZXBfZmlsZXMiOnt9LCJzdGVwIjoiV2lkZ2V0XHU3YzdiXHU1NzhiIiwiZXh0cmFfZGF0YSI6e30sInN0ZXBfZGF0YSI6e319fQ==', '2019-04-19 22:20:49');
INSERT INTO `django_session` VALUES ('4hit3gxmlhavtht5zwu58bo18u7nhyuc', 'NDZlYzhmOWI5YTUyM2U5NGMzNDI4OWMwOWFlMjQ2Nzk0ZjJjMzRjZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4YjkxYzRmZTliYWVmYzcxMzFmOTgwZDJlZGIyNDVlMDI2MzQxYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kcyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-05-30 00:11:11');
INSERT INTO `django_session` VALUES ('65cgfjy01pnj5nwv2jevgzhli76kw4qc', 'Mjk1ZDYwOTI5OGU4NDAxZmY3YmI1Y2NmODNhZjMzNmE4ODMyMzY0Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmRzIiwiTElTVF9RVUVSWSI6W1sib3JnYW5pemF0aW9uIiwiY291cnNlb3JnIl0sIiJdLCJfYXV0aF91c2VyX2hhc2giOiJiOGI5MWM0ZmU5YmFlZmM3MTMxZjk4MGQyZWRiMjQ1ZTAyNjM0MWIxIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2019-04-30 22:36:45');
INSERT INTO `django_session` VALUES ('7q2xs13mu60xh36uh7chmb3ze85icy4o', 'NDZlYzhmOWI5YTUyM2U5NGMzNDI4OWMwOWFlMjQ2Nzk0ZjJjMzRjZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4YjkxYzRmZTliYWVmYzcxMzFmOTgwZDJlZGIyNDVlMDI2MzQxYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kcyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-04-21 16:01:22');
INSERT INTO `django_session` VALUES ('a2j71476licblj4h5mrrpfzjyi0q3zz2', 'NTgxNGU4YTU4MzM5MmRmZGM2N2FjYjIxMjNmM2YyMzM1MmM2MzM2MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiYjhiOTFjNGZlOWJhZWZjNzEzMWY5ODBkMmVkYjI0NWUwMjYzNDFiMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-04-21 13:37:17');
INSERT INTO `django_session` VALUES ('ejoyz7rsf0t3zsqdj41r06dx20h974as', 'Yzg1MTUwN2YxMDM1ZTg1OTMyMDFhNzJkMWU1NjFkZGZlMzAzM2ZhYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4YjkxYzRmZTliYWVmYzcxMzFmOTgwZDJlZGIyNDVlMDI2MzQxYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-04-21 13:38:09');
INSERT INTO `django_session` VALUES ('fzegii6gy98sbrl7vbhawovs3arja2mf', 'NDZlYzhmOWI5YTUyM2U5NGMzNDI4OWMwOWFlMjQ2Nzk0ZjJjMzRjZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4YjkxYzRmZTliYWVmYzcxMzFmOTgwZDJlZGIyNDVlMDI2MzQxYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kcyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-04-21 19:42:35');
INSERT INTO `django_session` VALUES ('kvecibg93vyzrcc2r1lctp9m8l1a17jw', 'NDZlYzhmOWI5YTUyM2U5NGMzNDI4OWMwOWFlMjQ2Nzk0ZjJjMzRjZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImI4YjkxYzRmZTliYWVmYzcxMzFmOTgwZDJlZGIyNDVlMDI2MzQxYjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kcyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-05-04 14:00:01');
INSERT INTO `django_session` VALUES ('kzcc0ewt1jvq9hbmogr470w7wqjm79zx', 'YTFiNTk4ZTJmMjQ2MDFhNDE2ZTQ5NDJlOTlmNzZjNWRhYjBjMTBhOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRkNDI0ODEzZTRiZTA1ZjU0ZmYxMWQwNzVhZGFiNTM1ZTUwNzBmZjYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kcyIsIl9hdXRoX3VzZXJfaWQiOiIxMiJ9', '2019-04-28 13:02:51');
INSERT INTO `django_session` VALUES ('lmu134bgu593x1kx3ede7h3xc1s7g1zj', 'MTljNDM5NzMyZjRjMzBkODgyNWRlOGZiMmIxMjA2YzcyZTJiYWZjYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImxlc3NvbiJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiYjhiOTFjNGZlOWJhZWZjNzEzMWY5ODBkMmVkYjI0NWUwMjYzNDFiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwid2l6YXJkX3hhZG1pbnVzZXJ3aWRnZXRfYWRtaW5fd2l6YXJkX2Zvcm1fcGx1Z2luIjp7InN0ZXBfZmlsZXMiOnt9LCJzdGVwIjpudWxsLCJleHRyYV9kYXRhIjp7fSwic3RlcF9kYXRhIjp7fX19', '2019-04-20 11:12:11');
INSERT INTO `django_session` VALUES ('xhao2fbelbootftpppho0j32liptnobl', 'OGU0OWY2NzgwNjY0OGMyNjM3NTJkN2I1OWE4NTkxOWJhNWQzNDI0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmRzIiwiTElTVF9RVUVSWSI6W1sib3JnYW5pemF0aW9uIiwidGVhY2hlciJdLCIiXSwiX2F1dGhfdXNlcl9oYXNoIjoiYjhiOTFjNGZlOWJhZWZjNzEzMWY5ODBkMmVkYjI0NWUwMjYzNDFiMSIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2019-05-29 23:23:57');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL auto_increment,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `operation_coursecomments_ea134da7` (`course_id`),
  KEY `operation_coursecomments_e8701ad4` (`user_id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL auto_increment,
  `add_time` datetime NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `operation_usercourse_ea134da7` (`course_id`),
  KEY `operation_usercourse_e8701ad4` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL auto_increment,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `operation_userfavorite_e8701ad4` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL auto_increment,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京市', '北京市', '2019-04-16 22:18:00');
INSERT INTO `organization_citydict` VALUES ('2', '上海市', '上海市', '2019-04-16 22:19:00');
INSERT INTO `organization_citydict` VALUES ('3', '武汉市', '武汉市', '2019-04-16 22:19:00');
INSERT INTO `organization_citydict` VALUES ('4', '深圳市', '深圳市', '2019-04-16 22:19:00');
INSERT INTO `organization_citydict` VALUES ('5', '成都市', '成都市', '2019-04-16 22:19:00');
INSERT INTO `organization_citydict` VALUES ('6', '杭州市', '杭州市', '2019-04-16 22:21:00');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `add_time` datetime NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '江南水师学堂', '江南水师学堂又称南洋水师学堂、江宁水师学堂。建于1890年（清光绪十六年）。江南水师学堂是清政府在洋务运动中开办的军事学校，作为培养科技人才的基地，是中国海军人才的摇篮。\r\n1925年（民国十四年）江南水师学堂停办，1928年（民国十七年）国民政府在行政院军政部之下设立海军署，于次年，将其扩充为海军部。\r\n民国海军总长林建章、海军总长与代总理杜钖圭、黄花岗起义领袖赵声、海军舰队司令陈季良、海军部部长陈绍宽等人都是江南水师学堂知名校友。', '0', 'org/2019/04/3812b31bb051f819e80aa178dcb44aed2e73e7d1.jpg', '玉渊潭路1号', '2019-04-16 22:21:00', '1', 'gx', '123', '21', '23');
INSERT INTO `organization_courseorg` VALUES ('2', '尚学堂', '北京尚学堂科技有限公司是一家从事JAVA、IOS、android、hadoop大数据云计算技术开发、培训、咨询为一体的软件公司。公司由海外留学人员和国内IT精英人士创建，主要成员均拥有硕士以上学位，毕业于国内著名大学如：清华大学，北京航空航天大学等。', '0', 'org/2019/04/sxt.jpg', '巨峰路1号', '2019-04-16 22:27:00', '2', 'pxjg', '2222', '122', '43');
INSERT INTO `organization_courseorg` VALUES ('3', '京师大学堂', '京师大学堂，是北京大学在1912年5月之前使用的旧名。作为戊戌变法的“新政”之一，学校创办于1898年7月3日，是中国近代第一所国立大学   ，其成立标志着中国近代国立高等教育的开端。', '0', 'org/2019/04/jsdxt.jpg', '北京路1号', '2019-04-16 22:29:00', '1', 'pxjg', '4324', '312', '89');
INSERT INTO `organization_courseorg` VALUES ('4', '武汉大学', '武汉大学（Wuhan University），简称“武大”，初名自强学堂，诞生于1893年，是一所中国著名的综合性研究型大学，也是近代中国建立最早的国立大学。1893年，湖广总督张之洞奏请清政府在武昌创办自强学堂，由此揭开了近代中国高等教育的序幕。历经传承演变，1913年更名国立武昌高等师范学校，1928年定名国立武汉大学，是民国四大名校之一。1949年更为现名。', '0', 'org/2019/04/whdx.jpg', '珞珈路一号', '2019-04-16 22:31:00', '3', 'gx', '23432', '223', '243');
INSERT INTO `organization_courseorg` VALUES ('5', '四川大学', '四川大学，简称“川大”，坐落于四川省会成都市，是中华人民共和国教育部直属、中央直管副部级建制的全国重点大学，位列国家“211工程”、“985工程”、“世界一流大学和一流学科”，   入选“珠峰计划、2011计划、111计划、卓越工程师教育培养计划、卓越医生教育培养计划、卓越法律人才教育培养计划、国家大学生创新性实验计划、国家建设高水平大学公派研究生项目、国家级大学生创新创业训练计划、中国政府奖学金来华留学生接收院校、全国深化创新创业教育改革示范高校”，是国家布局在中国西部重点建设的高水平研究型综合大学，拥有研究生院和研究生自主划线资格。', '0', 'org/2019/04/scdx.jpg', '榆林路1号', '2019-04-16 22:32:00', '5', 'gx', '234', '12', '12');
INSERT INTO `organization_courseorg` VALUES ('6', '深圳大学', '深圳大学（Shenzhen University），简称“深大”，位于中国经济特区广东省深圳市，是由国家教育部批准设立，广东省主管、深圳市人民政府主办的综合性大学，入选广东省高水平大学重点建设高校，为国家大学生文化素质教育基地、全国文明校园、全国首批深化创新创业教育改革示范高校、全国地方高校UOOC联盟发起单位，设有研究生院。具有推荐免试研究生资格。', '0', 'org/2019/04/szdx.jpg', '腾讯路1号', '2019-04-16 22:34:00', '4', 'gx', '112', '13', '10');
INSERT INTO `organization_courseorg` VALUES ('7', '深圳大学1', '深圳大学（Shenzhen University），简称“深大”，位于中国经济特区广东省深圳市，是由国家教育部批准设立，广东省主管、深圳市人民政府主办的综合性大学，入选广东省高水平大学重点建设高校，为国家大学生文化素质教育基地、全国文明校园、全国首批深化创新创业教育改革示范高校、全国地方高校UOOC联盟发起单位，设有研究生院。具有推荐免试研究生资格。', '0', 'org/2019/04/szdx_pg1dAmu.jpg', '腾讯路1号', '2019-04-16 22:35:00', '4', 'gx', '1112', '43', '15');
INSERT INTO `organization_courseorg` VALUES ('8', '深圳大学2', '深圳大学（Shenzhen University），简称“深大”，位于中国经济特区广东省深圳市，是由国家教育部批准设立，广东省主管、深圳市人民政府主办的综合性大学，入选广东省高水平大学重点建设高校，为国家大学生文化素质教育基地、全国文明校园、全国首批深化创新创业教育改革示范高校、全国地方高校UOOC联盟发起单位，设有研究生院。具有推荐免试研究生资格。', '0', 'org/2019/04/szdx_pg1dAmu.jpg', '腾讯路1号', '2019-04-16 22:35:00', '4', 'gx', '111', '43', '15');
INSERT INTO `organization_courseorg` VALUES ('9', '深圳大学3', '深圳大学（Shenzhen University），简称“深大”，位于中国经济特区广东省深圳市，是由国家教育部批准设立，广东省主管、深圳市人民政府主办的综合性大学，入选广东省高水平大学重点建设高校，为国家大学生文化素质教育基地、全国文明校园、全国首批深化创新创业教育改革示范高校、全国地方高校UOOC联盟发起单位，设有研究生院。具有推荐免试研究生资格。', '0', 'org/2019/04/szdx_pg1dAmu.jpg', '腾讯路1号', '2019-04-16 22:35:00', '4', 'gx', '123', '43', '15');
INSERT INTO `organization_courseorg` VALUES ('10', '深圳大学4', '深圳大学（Shenzhen University），简称“深大”，位于中国经济特区广东省深圳市，是由国家教育部批准设立，广东省主管、深圳市人民政府主办的综合性大学，入选广东省高水平大学重点建设高校，为国家大学生文化素质教育基地、全国文明校园、全国首批深化创新创业教育改革示范高校、全国地方高校UOOC联盟发起单位，设有研究生院。具有推荐免试研究生资格。', '0', 'org/2019/04/szdx_pg1dAmu.jpg', '腾讯路1号', '2019-04-16 22:35:00', '4', 'gx', '123', '43', '15');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100),
  PRIMARY KEY  (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', '江哲', '5', '阿里巴巴', '高级架构师', '无聊', '20000', '1000', '2019-04-23 22:36:00', '2', null);
INSERT INTO `organization_teacher` VALUES ('2', '李雅岚', '4', '艾益生', '市场部主管', '超级装逼', '10000', '400', '2019-04-23 22:42:00', '1', 'teacher/702A2AF89519F4192CE8900BEA2ED033.png');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', 'banner1', 'banner/2019/04/2.png', 'http://www.baidu.com', '1', '2019-04-06 10:57:00');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL auto_increment,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', 'admin', '827088212@qq.com', 'register', '2019-04-05 22:42:00');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'liyalan', '11@qq.com', 'forget', '2019-04-05 22:56:00');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'SbjzxGhxNugHRrlB', '827088212@qq.com', 'register', '2019-04-09 07:23:45');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'eMOeMIcNmoMxKKHj', '822212@qq.com', 'register', '2019-04-09 07:33:57');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'obuxqeWwuIfexGRC', '827088212@qq.com', 'register', '2019-04-09 07:43:55');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'eqAqlEGBEsmiBmtI', '827088212@qq.com', 'register', '2019-04-10 23:11:57');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'yihlteGlJWZukxWq', '82702@qq.com', 'register', '2019-04-10 23:16:24');
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'YHPfQxeFnQZIRGIe', '8270288212@qq.com', 'register', '2019-04-10 23:24:26');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'UWWesHkkXVwnXwIG', 'm13120511312@163.com', 'register', '2019-04-10 23:27:45');
INSERT INTO `users_emailverifyrecord` VALUES ('10', 'lHUThwAGOGeKlZch', '827088212@qq.com', 'register', '2019-04-14 12:40:36');
INSERT INTO `users_emailverifyrecord` VALUES ('11', 'BEjXPvJJZKKAnFRH', '13120511312@163.com', 'register', '2019-04-14 12:44:59');
INSERT INTO `users_emailverifyrecord` VALUES ('12', 'HGFzSPLlbbAqRfGp', '13120511312@163.com', 'forget', '2019-04-14 15:50:49');
INSERT INTO `users_emailverifyrecord` VALUES ('13', 'rVQZKEoYFBDFztJM', '13120511312@163.com', 'forget', '2019-04-14 16:08:57');
INSERT INTO `users_emailverifyrecord` VALUES ('14', 'uduslzMPCcypZvrC', '13120511312@163.com', 'forget', '2019-04-14 16:37:28');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(128) NOT NULL,
  `last_login` datetime default NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` date default NULL,
  `gender` varchar(8) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(11) default NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$rjBcbJltUlpB$O2qtsDYyUXJeLWlhfyvio3ac9rDy3HK0r/wCGJxC1WA=', '2019-05-16 00:11:11', '1', 'admin', '', '', '827088212@qq.com', '1', '1', '2019-04-05 18:18:15', '', null, 'female', '', null, 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('2', 'pbkdf2_sha256$24000$hNBDTvtuSAwi$4ULqd3t8CZ3uE0Zs7oE9o1i1C2s/IsLrE+wyHBz/9Ro=', null, '0', 'liyalan', '', '', '', '0', '1', '2019-04-05 18:20:00', '', null, 'female', '', null, 'image/default.png');
INSERT INTO `users_userprofile` VALUES ('12', 'pbkdf2_sha256$24000$kTJ83qCZVb08$kWKNjkybejF9kRZdaA6Hrne1e5MIFBdyJVfzhLpypwo=', '2019-04-14 16:44:37', '0', '13120511312@163.com', '', '', '13120511312@163.com', '0', '1', '2019-04-14 12:44:56', '', null, 'female', '', null, 'image/default.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL auto_increment,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `ip_addr` char(39) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) default NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2019-04-05 22:42:57', '127.0.0.1', '1', 'EmailVerifyRecord object', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2019-04-05 22:56:16', '127.0.0.1', '2', 'liyalan(11@qq.com)', 'create', '已添加', '7', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2019-04-06 10:58:23', '127.0.0.1', '1', 'Banner object', 'create', '已添加', '8', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2019-04-06 11:10:29', '127.0.0.1', '1', 'Course object', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2019-04-06 11:27:52', '127.0.0.1', '1', 'Lesson object', 'create', '已添加', '10', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2019-04-16 22:18:55', '127.0.0.1', '1', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2019-04-16 22:19:08', '127.0.0.1', '2', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2019-04-16 22:19:15', '127.0.0.1', '3', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2019-04-16 22:19:21', '127.0.0.1', '4', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2019-04-16 22:19:27', '127.0.0.1', '5', 'CityDict object', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2019-04-16 22:21:24', '127.0.0.1', '6', '杭州市', 'create', '已添加', '13', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2019-04-16 22:25:49', '127.0.0.1', '1', 'CourseOrg object', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2019-04-16 22:29:37', '127.0.0.1', '2', '尚学堂', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2019-04-16 22:31:28', '127.0.0.1', '3', '京师大学堂', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2019-04-16 22:32:53', '127.0.0.1', '4', '武汉大学', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2019-04-16 22:34:02', '127.0.0.1', '5', '四川大学', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2019-04-16 22:35:08', '127.0.0.1', '6', '深圳大学', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2019-04-16 22:35:55', '127.0.0.1', '7', '深圳大学', 'create', '已添加', '14', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2019-04-16 22:36:45', '127.0.0.1', '1', '江南水师学堂', 'change', '已修改 image 。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2019-04-23 22:37:17', '127.0.0.1', '1', 'Teacher object', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2019-04-23 22:42:51', '127.0.0.1', '2', '李雅岚', 'create', '已添加', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2019-05-04 00:55:05', '127.0.0.1', '1', 'django入门', 'change', '已修改 org 和 image 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2019-05-04 00:55:13', '127.0.0.1', '1', 'django入门', 'change', '没有字段被修改。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2019-05-04 15:13:53', '127.0.0.1', '1', 'django入门', 'change', '已修改 image 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2019-05-11 12:17:38', '127.0.0.1', '1', 'django入门', 'change', '已修改 image 。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2019-05-11 13:12:31', '127.0.0.1', '2', '李雅岚', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2019-05-11 13:34:58', '127.0.0.1', '2', '李雅岚', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2019-05-11 13:35:23', '127.0.0.1', '2', '李雅岚', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2019-05-11 13:35:37', '127.0.0.1', '2', '李雅岚', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2019-05-11 13:35:50', '127.0.0.1', '2', '李雅岚', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2019-05-11 13:36:07', '127.0.0.1', '2', '李雅岚', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2019-05-11 13:37:00', '127.0.0.1', '2', '李雅岚', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2019-05-12 14:24:01', '127.0.0.1', '2', 'mysql 入门', 'create', '已添加', '9', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2019-05-12 14:24:47', '127.0.0.1', '1', '江南水师学堂', 'change', '没有字段被修改。', '14', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL auto_increment,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '1', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL auto_increment,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
INSERT INTO `xadmin_userwidget` VALUES ('1', 'home', 'chart', '{\"model\": \"xadmin.userwidget\", \"id\": \"1\", \"title\": \"df\"}', '1');
