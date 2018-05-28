/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : bangbangyz

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-28 17:50:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bangbang_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_admin_menu`;
CREATE TABLE `bangbang_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parent_id` (`parent_id`),
  KEY `controller` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of bangbang_admin_menu
-- ----------------------------
INSERT INTO `bangbang_admin_menu` VALUES ('1', '0', '0', '1', '20', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `bangbang_admin_menu` VALUES ('2', '1', '1', '1', '10000', 'admin', 'Hook', 'index', '', '钩子管理', '', '钩子管理');
INSERT INTO `bangbang_admin_menu` VALUES ('3', '2', '1', '0', '10000', 'admin', 'Hook', 'plugins', '', '钩子插件管理', '', '钩子插件管理');
INSERT INTO `bangbang_admin_menu` VALUES ('4', '2', '2', '0', '10000', 'admin', 'Hook', 'pluginListOrder', '', '钩子插件排序', '', '钩子插件排序');
INSERT INTO `bangbang_admin_menu` VALUES ('5', '2', '1', '0', '10000', 'admin', 'Hook', 'sync', '', '同步钩子', '', '同步钩子');
INSERT INTO `bangbang_admin_menu` VALUES ('6', '0', '0', '1', '0', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `bangbang_admin_menu` VALUES ('7', '6', '1', '1', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `bangbang_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `bangbang_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `bangbang_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `bangbang_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `bangbang_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `bangbang_admin_menu` VALUES ('15', '6', '1', '1', '10', 'admin', 'Mailer', 'index', '', '邮箱配置', '', '邮箱配置');
INSERT INTO `bangbang_admin_menu` VALUES ('16', '15', '2', '0', '10000', 'admin', 'Mailer', 'indexPost', '', '邮箱配置提交保存', '', '邮箱配置提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('17', '15', '1', '0', '10000', 'admin', 'Mailer', 'template', '', '邮件模板', '', '邮件模板');
INSERT INTO `bangbang_admin_menu` VALUES ('18', '15', '2', '0', '10000', 'admin', 'Mailer', 'templatePost', '', '邮件模板提交', '', '邮件模板提交');
INSERT INTO `bangbang_admin_menu` VALUES ('19', '15', '1', '0', '10000', 'admin', 'Mailer', 'test', '', '邮件发送测试', '', '邮件发送测试');
INSERT INTO `bangbang_admin_menu` VALUES ('20', '6', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `bangbang_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `bangbang_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `bangbang_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `bangbang_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `bangbang_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `bangbang_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `bangbang_admin_menu` VALUES ('29', '6', '1', '1', '30', 'admin', 'Nav', 'index', '', '导航管理', '', '导航管理');
INSERT INTO `bangbang_admin_menu` VALUES ('30', '29', '1', '0', '10000', 'admin', 'Nav', 'add', '', '添加导航', '', '添加导航');
INSERT INTO `bangbang_admin_menu` VALUES ('31', '29', '2', '0', '10000', 'admin', 'Nav', 'addPost', '', '添加导航提交保存', '', '添加导航提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('32', '29', '1', '0', '10000', 'admin', 'Nav', 'edit', '', '编辑导航', '', '编辑导航');
INSERT INTO `bangbang_admin_menu` VALUES ('33', '29', '2', '0', '10000', 'admin', 'Nav', 'editPost', '', '编辑导航提交保存', '', '编辑导航提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('34', '29', '2', '0', '10000', 'admin', 'Nav', 'delete', '', '删除导航', '', '删除导航');
INSERT INTO `bangbang_admin_menu` VALUES ('35', '29', '1', '0', '10000', 'admin', 'NavMenu', 'index', '', '导航菜单', '', '导航菜单');
INSERT INTO `bangbang_admin_menu` VALUES ('36', '35', '1', '0', '10000', 'admin', 'NavMenu', 'add', '', '添加导航菜单', '', '添加导航菜单');
INSERT INTO `bangbang_admin_menu` VALUES ('37', '35', '2', '0', '10000', 'admin', 'NavMenu', 'addPost', '', '添加导航菜单提交保存', '', '添加导航菜单提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('38', '35', '1', '0', '10000', 'admin', 'NavMenu', 'edit', '', '编辑导航菜单', '', '编辑导航菜单');
INSERT INTO `bangbang_admin_menu` VALUES ('39', '35', '2', '0', '10000', 'admin', 'NavMenu', 'editPost', '', '编辑导航菜单提交保存', '', '编辑导航菜单提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('40', '35', '2', '0', '10000', 'admin', 'NavMenu', 'delete', '', '删除导航菜单', '', '删除导航菜单');
INSERT INTO `bangbang_admin_menu` VALUES ('41', '35', '2', '0', '10000', 'admin', 'NavMenu', 'listOrder', '', '导航菜单排序', '', '导航菜单排序');
INSERT INTO `bangbang_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `bangbang_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `bangbang_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `bangbang_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `bangbang_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `bangbang_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `bangbang_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `bangbang_admin_menu` VALUES ('49', '109', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `bangbang_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `bangbang_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `bangbang_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `bangbang_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `bangbang_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `bangbang_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `bangbang_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `bangbang_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `bangbang_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `bangbang_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `bangbang_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `bangbang_admin_menu` VALUES ('61', '6', '1', '1', '10000', 'admin', 'Route', 'index', '', 'URL美化', '', 'URL规则管理');
INSERT INTO `bangbang_admin_menu` VALUES ('62', '61', '1', '0', '10000', 'admin', 'Route', 'add', '', '添加路由规则', '', '添加路由规则');
INSERT INTO `bangbang_admin_menu` VALUES ('63', '61', '2', '0', '10000', 'admin', 'Route', 'addPost', '', '添加路由规则提交', '', '添加路由规则提交');
INSERT INTO `bangbang_admin_menu` VALUES ('64', '61', '1', '0', '10000', 'admin', 'Route', 'edit', '', '路由规则编辑', '', '路由规则编辑');
INSERT INTO `bangbang_admin_menu` VALUES ('65', '61', '2', '0', '10000', 'admin', 'Route', 'editPost', '', '路由规则编辑提交', '', '路由规则编辑提交');
INSERT INTO `bangbang_admin_menu` VALUES ('66', '61', '2', '0', '10000', 'admin', 'Route', 'delete', '', '路由规则删除', '', '路由规则删除');
INSERT INTO `bangbang_admin_menu` VALUES ('67', '61', '2', '0', '10000', 'admin', 'Route', 'ban', '', '路由规则禁用', '', '路由规则禁用');
INSERT INTO `bangbang_admin_menu` VALUES ('68', '61', '2', '0', '10000', 'admin', 'Route', 'open', '', '路由规则启用', '', '路由规则启用');
INSERT INTO `bangbang_admin_menu` VALUES ('69', '61', '2', '0', '10000', 'admin', 'Route', 'listOrder', '', '路由规则排序', '', '路由规则排序');
INSERT INTO `bangbang_admin_menu` VALUES ('70', '61', '1', '0', '10000', 'admin', 'Route', 'select', '', '选择URL', '', '选择URL');
INSERT INTO `bangbang_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `bangbang_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `bangbang_admin_menu` VALUES ('73', '6', '1', '0', '10000', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `bangbang_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `bangbang_admin_menu` VALUES ('75', '6', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `bangbang_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `bangbang_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `bangbang_admin_menu` VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `bangbang_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `bangbang_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `bangbang_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `bangbang_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `bangbang_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `bangbang_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `bangbang_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `bangbang_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `bangbang_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `bangbang_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `bangbang_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `bangbang_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `bangbang_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `bangbang_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `bangbang_admin_menu` VALUES ('93', '6', '1', '1', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `bangbang_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `bangbang_admin_menu` VALUES ('95', '6', '1', '1', '20', 'admin', 'Theme', 'index', '', '模板管理', '', '模板管理');
INSERT INTO `bangbang_admin_menu` VALUES ('96', '95', '1', '0', '10000', 'admin', 'Theme', 'install', '', '安装模板', '', '安装模板');
INSERT INTO `bangbang_admin_menu` VALUES ('97', '95', '2', '0', '10000', 'admin', 'Theme', 'uninstall', '', '卸载模板', '', '卸载模板');
INSERT INTO `bangbang_admin_menu` VALUES ('98', '95', '2', '0', '10000', 'admin', 'Theme', 'installTheme', '', '模板安装', '', '模板安装');
INSERT INTO `bangbang_admin_menu` VALUES ('99', '95', '2', '0', '10000', 'admin', 'Theme', 'update', '', '模板更新', '', '模板更新');
INSERT INTO `bangbang_admin_menu` VALUES ('100', '95', '2', '0', '10000', 'admin', 'Theme', 'active', '', '启用模板', '', '启用模板');
INSERT INTO `bangbang_admin_menu` VALUES ('101', '95', '1', '0', '10000', 'admin', 'Theme', 'files', '', '模板文件列表', '', '启用模板');
INSERT INTO `bangbang_admin_menu` VALUES ('102', '95', '1', '0', '10000', 'admin', 'Theme', 'fileSetting', '', '模板文件设置', '', '模板文件设置');
INSERT INTO `bangbang_admin_menu` VALUES ('103', '95', '1', '0', '10000', 'admin', 'Theme', 'fileArrayData', '', '模板文件数组数据列表', '', '模板文件数组数据列表');
INSERT INTO `bangbang_admin_menu` VALUES ('104', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEdit', '', '模板文件数组数据添加编辑', '', '模板文件数组数据添加编辑');
INSERT INTO `bangbang_admin_menu` VALUES ('105', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '', '模板文件数组数据添加编辑提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('106', '95', '2', '0', '10000', 'admin', 'Theme', 'fileArrayDataDelete', '', '模板文件数组数据删除', '', '模板文件数组数据删除');
INSERT INTO `bangbang_admin_menu` VALUES ('107', '95', '2', '0', '10000', 'admin', 'Theme', 'settingPost', '', '模板文件编辑提交保存', '', '模板文件编辑提交保存');
INSERT INTO `bangbang_admin_menu` VALUES ('108', '95', '1', '0', '10000', 'admin', 'Theme', 'dataSource', '', '模板文件设置数据源', '', '模板文件设置数据源');
INSERT INTO `bangbang_admin_menu` VALUES ('109', '0', '0', '1', '10', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `bangbang_admin_menu` VALUES ('110', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `bangbang_admin_menu` VALUES ('111', '110', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `bangbang_admin_menu` VALUES ('112', '110', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `bangbang_admin_menu` VALUES ('113', '110', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `bangbang_admin_menu` VALUES ('114', '110', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `bangbang_admin_menu` VALUES ('115', '110', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `bangbang_admin_menu` VALUES ('116', '110', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `bangbang_admin_menu` VALUES ('117', '110', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `bangbang_admin_menu` VALUES ('118', '110', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `bangbang_admin_menu` VALUES ('119', '110', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `bangbang_admin_menu` VALUES ('120', '0', '0', '1', '30', 'portal', 'AdminIndex', 'default', '', '门户管理', 'th', '门户管理');
INSERT INTO `bangbang_admin_menu` VALUES ('121', '120', '1', '1', '10000', 'portal', 'AdminArticle', 'index', '', '文章管理', '', '文章列表');
INSERT INTO `bangbang_admin_menu` VALUES ('122', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'add', '', '添加文章', '', '添加文章');
INSERT INTO `bangbang_admin_menu` VALUES ('123', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'addPost', '', '添加文章提交', '', '添加文章提交');
INSERT INTO `bangbang_admin_menu` VALUES ('124', '121', '1', '0', '10000', 'portal', 'AdminArticle', 'edit', '', '编辑文章', '', '编辑文章');
INSERT INTO `bangbang_admin_menu` VALUES ('125', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'editPost', '', '编辑文章提交', '', '编辑文章提交');
INSERT INTO `bangbang_admin_menu` VALUES ('126', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'delete', '', '文章删除', '', '文章删除');
INSERT INTO `bangbang_admin_menu` VALUES ('127', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'publish', '', '文章发布', '', '文章发布');
INSERT INTO `bangbang_admin_menu` VALUES ('128', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'top', '', '文章置顶', '', '文章置顶');
INSERT INTO `bangbang_admin_menu` VALUES ('129', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'recommend', '', '文章推荐', '', '文章推荐');
INSERT INTO `bangbang_admin_menu` VALUES ('130', '121', '2', '0', '10000', 'portal', 'AdminArticle', 'listOrder', '', '文章排序', '', '文章排序');
INSERT INTO `bangbang_admin_menu` VALUES ('131', '120', '1', '1', '10000', 'portal', 'AdminCategory', 'index', '', '分类管理', '', '文章分类列表');
INSERT INTO `bangbang_admin_menu` VALUES ('132', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'add', '', '添加文章分类', '', '添加文章分类');
INSERT INTO `bangbang_admin_menu` VALUES ('133', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'addPost', '', '添加文章分类提交', '', '添加文章分类提交');
INSERT INTO `bangbang_admin_menu` VALUES ('134', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'edit', '', '编辑文章分类', '', '编辑文章分类');
INSERT INTO `bangbang_admin_menu` VALUES ('135', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'editPost', '', '编辑文章分类提交', '', '编辑文章分类提交');
INSERT INTO `bangbang_admin_menu` VALUES ('136', '131', '1', '0', '10000', 'portal', 'AdminCategory', 'select', '', '文章分类选择对话框', '', '文章分类选择对话框');
INSERT INTO `bangbang_admin_menu` VALUES ('137', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'listOrder', '', '文章分类排序', '', '文章分类排序');
INSERT INTO `bangbang_admin_menu` VALUES ('138', '131', '2', '0', '10000', 'portal', 'AdminCategory', 'delete', '', '删除文章分类', '', '删除文章分类');
INSERT INTO `bangbang_admin_menu` VALUES ('139', '120', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '页面管理');
INSERT INTO `bangbang_admin_menu` VALUES ('140', '139', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加页面', '', '添加页面');
INSERT INTO `bangbang_admin_menu` VALUES ('141', '139', '2', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加页面提交', '', '添加页面提交');
INSERT INTO `bangbang_admin_menu` VALUES ('142', '139', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑页面', '', '编辑页面');
INSERT INTO `bangbang_admin_menu` VALUES ('143', '139', '2', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑页面提交', '', '编辑页面提交');
INSERT INTO `bangbang_admin_menu` VALUES ('144', '139', '2', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除页面', '', '删除页面');
INSERT INTO `bangbang_admin_menu` VALUES ('145', '120', '1', '1', '10000', 'portal', 'AdminTag', 'index', '', '文章标签', '', '文章标签');
INSERT INTO `bangbang_admin_menu` VALUES ('146', '145', '1', '0', '10000', 'portal', 'AdminTag', 'add', '', '添加文章标签', '', '添加文章标签');
INSERT INTO `bangbang_admin_menu` VALUES ('147', '145', '2', '0', '10000', 'portal', 'AdminTag', 'addPost', '', '添加文章标签提交', '', '添加文章标签提交');
INSERT INTO `bangbang_admin_menu` VALUES ('148', '145', '2', '0', '10000', 'portal', 'AdminTag', 'upStatus', '', '更新标签状态', '', '更新标签状态');
INSERT INTO `bangbang_admin_menu` VALUES ('149', '145', '2', '0', '10000', 'portal', 'AdminTag', 'delete', '', '删除文章标签', '', '删除文章标签');
INSERT INTO `bangbang_admin_menu` VALUES ('150', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `bangbang_admin_menu` VALUES ('151', '150', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `bangbang_admin_menu` VALUES ('152', '109', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `bangbang_admin_menu` VALUES ('153', '152', '1', '1', '10000', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `bangbang_admin_menu` VALUES ('154', '153', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `bangbang_admin_menu` VALUES ('155', '153', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `bangbang_admin_menu` VALUES ('156', '152', '1', '1', '10000', 'user', 'AdminOauth', 'index', '', '第三方用户', '', '第三方用户');
INSERT INTO `bangbang_admin_menu` VALUES ('157', '156', '2', '0', '10000', 'user', 'AdminOauth', 'delete', '', '删除第三方用户绑定', '', '删除第三方用户绑定');
INSERT INTO `bangbang_admin_menu` VALUES ('158', '6', '1', '1', '10000', 'user', 'AdminUserAction', 'index', '', '用户操作管理', '', '用户操作管理');
INSERT INTO `bangbang_admin_menu` VALUES ('159', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'edit', '', '编辑用户操作', '', '编辑用户操作');
INSERT INTO `bangbang_admin_menu` VALUES ('160', '158', '2', '0', '10000', 'user', 'AdminUserAction', 'editPost', '', '编辑用户操作提交', '', '编辑用户操作提交');
INSERT INTO `bangbang_admin_menu` VALUES ('161', '158', '1', '0', '10000', 'user', 'AdminUserAction', 'sync', '', '同步用户操作', '', '同步用户操作');
INSERT INTO `bangbang_admin_menu` VALUES ('162', '0', '0', '1', '10000', 'admin', 'Order', 'default', '', '工单管理', 'reorder', '');
INSERT INTO `bangbang_admin_menu` VALUES ('163', '162', '1', '1', '10000', 'admin', 'Order', 'index', '', '工单列表', '', '');
INSERT INTO `bangbang_admin_menu` VALUES ('164', '6', '1', '1', '10000', 'admin', 'handle_log', 'index', '', '用户操作日志配置', '', '');
INSERT INTO `bangbang_admin_menu` VALUES ('165', '6', '1', '1', '10000', 'admin', 'mysql_handle', 'index', '', '数据库操作', '', '');
INSERT INTO `bangbang_admin_menu` VALUES ('166', '6', '1', '1', '10000', 'admin', 'HandleLog', 'handleLogList', '', '用户操作日志列表', '', '');

-- ----------------------------
-- Table structure for bangbang_asset
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_asset`;
CREATE TABLE `bangbang_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of bangbang_asset
-- ----------------------------
INSERT INTO `bangbang_asset` VALUES ('1', '1', '24567', '1519558126', '1', '0', '34f98fc75e7e847febc40d0dc8c451dce9e2a8eecf7f984037a9bddcfd192bda', 'huoying.jpg', 'admin/20180225/09cd31a4c6077c97c1ad3e57693b2a56.jpg', '34f98fc75e7e847febc40d0dc8c451dc', '03899490a4f9037e2d4e621596e6c81a5bf66a55', 'jpg', '');
INSERT INTO `bangbang_asset` VALUES ('2', '1', '19055', '1519558131', '1', '0', '4fe7a41f874f02027a4efbee7391a61cefba066b8990766b93d920dafff39da1', 'e2.jpg', 'admin/20180225/f79072603ed2ca1cbe7ac7e8b39e621b.jpg', '4fe7a41f874f02027a4efbee7391a61c', '4b8e21c80957aa9597e97020ea16312c2755549d', 'jpg', '');
INSERT INTO `bangbang_asset` VALUES ('3', '1', '25057', '1519558658', '1', '0', '34da34924e8ce2cf273afd7087abdd777b873d35f86d9077fdc9e8e24e70d672', 'u=3315553323,1499582357&fm=27&gp=0.jpg', 'admin/20180225/499b0541eb59b25b647c077e003510a0.jpg', '34da34924e8ce2cf273afd7087abdd77', '1226f347f1750b637306d6b6b5486885bfed98cd', 'jpg', '');
INSERT INTO `bangbang_asset` VALUES ('4', '1', '67382', '1525689178', '1', '0', '2b5b4a5425a0252baeb183c6f4c06422a4fe532268bc2234dccb145adbd4c4f2', '微信图片_20180503164715.png', 'admin/20180507/93d137750bf117af5afae20aedcd04bd.png', '2b5b4a5425a0252baeb183c6f4c06422', '60ac48941eef06dbdf7c19cd782204fccb021db0', 'png', null);
INSERT INTO `bangbang_asset` VALUES ('5', '1', '75289', '1525689265', '1', '0', 'af85280ca23006da206b4b58bca43c26e2d61c727d88c2deb6734e80102e92e0', '1524635891(1).jpg', 'admin/20180507/94dd146b7101aa301694b5bb3d36fb67.jpg', 'af85280ca23006da206b4b58bca43c26', '227e17702e1e9fa05a62cdb4ffeedbfdaf8d2344', 'jpg', null);
INSERT INTO `bangbang_asset` VALUES ('6', '1', '14208', '1525689293', '1', '0', 'b6c43271bea0b0e48136c5449f1a1f41870b04338c4f82e5b2f21a8b142e5578', '1524203440(1).png', 'admin/20180507/1fc260f2665abc9adea83f50ab6ef8f0.png', 'b6c43271bea0b0e48136c5449f1a1f41', 'a9c4f2f1cd4474b94aacb8a4a6aed3dffdcef4e8', 'png', null);
INSERT INTO `bangbang_asset` VALUES ('7', '1', '23170', '1525691093', '1', '0', 'ba39c05572585b40e9b896c59cec9bf65884de2363d08af7b7b6ce169b434143', 'image.png', 'admin/20180507/9541ff853b289b2dec9e00b61786f39f.png', 'ba39c05572585b40e9b896c59cec9bf6', 'a51b622f489217a28f6b8b4d25fe5347e58fbaf7', 'png', null);

-- ----------------------------
-- Table structure for bangbang_auth_access
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_auth_access`;
CREATE TABLE `bangbang_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of bangbang_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_auth_rule`;
CREATE TABLE `bangbang_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(15) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of bangbang_auth_rule
-- ----------------------------
INSERT INTO `bangbang_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `bangbang_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `bangbang_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `bangbang_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `bangbang_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `bangbang_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `bangbang_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `bangbang_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `bangbang_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `bangbang_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `bangbang_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `bangbang_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `bangbang_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `bangbang_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `bangbang_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `bangbang_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `bangbang_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `bangbang_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `bangbang_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `bangbang_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `bangbang_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `bangbang_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `bangbang_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `bangbang_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `bangbang_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `bangbang_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `bangbang_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `bangbang_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `bangbang_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `bangbang_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `bangbang_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `bangbang_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `bangbang_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `bangbang_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `bangbang_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `bangbang_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `bangbang_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `bangbang_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `bangbang_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `bangbang_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `bangbang_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `bangbang_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `bangbang_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `bangbang_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `bangbang_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `bangbang_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `bangbang_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `bangbang_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `bangbang_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `bangbang_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `bangbang_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `bangbang_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `bangbang_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `bangbang_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `bangbang_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `bangbang_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `bangbang_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `bangbang_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `bangbang_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `bangbang_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `bangbang_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `bangbang_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `bangbang_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `bangbang_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `bangbang_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `bangbang_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `bangbang_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `bangbang_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `bangbang_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `bangbang_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `bangbang_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `bangbang_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `bangbang_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `bangbang_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `bangbang_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `bangbang_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `bangbang_auth_rule` VALUES ('119', '1', 'portal', 'admin_url', 'portal/AdminArticle/index', '', '文章管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('120', '1', 'portal', 'admin_url', 'portal/AdminArticle/add', '', '添加文章', '');
INSERT INTO `bangbang_auth_rule` VALUES ('121', '1', 'portal', 'admin_url', 'portal/AdminArticle/addPost', '', '添加文章提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('122', '1', 'portal', 'admin_url', 'portal/AdminArticle/edit', '', '编辑文章', '');
INSERT INTO `bangbang_auth_rule` VALUES ('123', '1', 'portal', 'admin_url', 'portal/AdminArticle/editPost', '', '编辑文章提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('124', '1', 'portal', 'admin_url', 'portal/AdminArticle/delete', '', '文章删除', '');
INSERT INTO `bangbang_auth_rule` VALUES ('125', '1', 'portal', 'admin_url', 'portal/AdminArticle/publish', '', '文章发布', '');
INSERT INTO `bangbang_auth_rule` VALUES ('126', '1', 'portal', 'admin_url', 'portal/AdminArticle/top', '', '文章置顶', '');
INSERT INTO `bangbang_auth_rule` VALUES ('127', '1', 'portal', 'admin_url', 'portal/AdminArticle/recommend', '', '文章推荐', '');
INSERT INTO `bangbang_auth_rule` VALUES ('128', '1', 'portal', 'admin_url', 'portal/AdminArticle/listOrder', '', '文章排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('129', '1', 'portal', 'admin_url', 'portal/AdminCategory/index', '', '分类管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('130', '1', 'portal', 'admin_url', 'portal/AdminCategory/add', '', '添加文章分类', '');
INSERT INTO `bangbang_auth_rule` VALUES ('131', '1', 'portal', 'admin_url', 'portal/AdminCategory/addPost', '', '添加文章分类提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('132', '1', 'portal', 'admin_url', 'portal/AdminCategory/edit', '', '编辑文章分类', '');
INSERT INTO `bangbang_auth_rule` VALUES ('133', '1', 'portal', 'admin_url', 'portal/AdminCategory/editPost', '', '编辑文章分类提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('134', '1', 'portal', 'admin_url', 'portal/AdminCategory/select', '', '文章分类选择对话框', '');
INSERT INTO `bangbang_auth_rule` VALUES ('135', '1', 'portal', 'admin_url', 'portal/AdminCategory/listOrder', '', '文章分类排序', '');
INSERT INTO `bangbang_auth_rule` VALUES ('136', '1', 'portal', 'admin_url', 'portal/AdminCategory/delete', '', '删除文章分类', '');
INSERT INTO `bangbang_auth_rule` VALUES ('137', '1', 'portal', 'admin_url', 'portal/AdminIndex/default', '', '门户管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('138', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('139', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加页面', '');
INSERT INTO `bangbang_auth_rule` VALUES ('140', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加页面提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('141', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑页面', '');
INSERT INTO `bangbang_auth_rule` VALUES ('142', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑页面提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('143', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除页面', '');
INSERT INTO `bangbang_auth_rule` VALUES ('144', '1', 'portal', 'admin_url', 'portal/AdminTag/index', '', '文章标签', '');
INSERT INTO `bangbang_auth_rule` VALUES ('145', '1', 'portal', 'admin_url', 'portal/AdminTag/add', '', '添加文章标签', '');
INSERT INTO `bangbang_auth_rule` VALUES ('146', '1', 'portal', 'admin_url', 'portal/AdminTag/addPost', '', '添加文章标签提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('147', '1', 'portal', 'admin_url', 'portal/AdminTag/upStatus', '', '更新标签状态', '');
INSERT INTO `bangbang_auth_rule` VALUES ('148', '1', 'portal', 'admin_url', 'portal/AdminTag/delete', '', '删除文章标签', '');
INSERT INTO `bangbang_auth_rule` VALUES ('149', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('150', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `bangbang_auth_rule` VALUES ('151', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('152', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `bangbang_auth_rule` VALUES ('153', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `bangbang_auth_rule` VALUES ('154', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `bangbang_auth_rule` VALUES ('155', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `bangbang_auth_rule` VALUES ('156', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `bangbang_auth_rule` VALUES ('157', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `bangbang_auth_rule` VALUES ('158', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('159', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `bangbang_auth_rule` VALUES ('160', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `bangbang_auth_rule` VALUES ('161', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `bangbang_auth_rule` VALUES ('162', '1', 'admin', 'admin_url', 'admin/Order/default', '', '工单管理', '');
INSERT INTO `bangbang_auth_rule` VALUES ('163', '1', 'admin', 'admin_url', 'admin/Order/index', '', '工单列表', '');
INSERT INTO `bangbang_auth_rule` VALUES ('164', '1', 'admin', 'admin_url', 'admin/handle_log/index', '', '用户操作日志配置', '');
INSERT INTO `bangbang_auth_rule` VALUES ('165', '1', 'admin', 'admin_url', 'admin/mysql_handle/index', '', '数据库操作', '');
INSERT INTO `bangbang_auth_rule` VALUES ('166', '1', 'admin', 'admin_url', 'admin/HandleLog/handleLogList', '', '用户操作日志列表', '');

-- ----------------------------
-- Table structure for bangbang_comment
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_comment`;
CREATE TABLE `bangbang_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `like_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislike_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '不喜欢数',
  `floor` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '楼层数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:已审核,0:未审核',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `table_name` varchar(64) NOT NULL DEFAULT '' COMMENT '评论内容所在表，不带表前缀',
  `full_name` varchar(50) NOT NULL DEFAULT '' COMMENT '评论者昵称',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '评论者邮箱',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  `url` text COMMENT '原文地址',
  `content` text CHARACTER SET utf8mb4 COMMENT '评论内容',
  `more` text CHARACTER SET utf8mb4 COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `table_id_status` (`table_name`,`object_id`,`status`),
  KEY `object_id` (`object_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of bangbang_comment
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_customer_assign_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_customer_assign_log`;
CREATE TABLE `bangbang_customer_assign_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL COMMENT '客户id',
  `operatingId` int(11) NOT NULL COMMENT '操作人',
  `operatingTime` int(11) NOT NULL COMMENT '操作时间',
  `beOperatingId` int(11) NOT NULL COMMENT '被操作人（把用户分配给谁，或者是把谁的用户回收）',
  `operatingType` tinyint(1) NOT NULL COMMENT '操作类型1=>''分配用户给某人'',2=>''把某人的用户回收''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顾客资源分配回收记录';

-- ----------------------------
-- Records of bangbang_customer_assign_log
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_customer_info
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_customer_info`;
CREATE TABLE `bangbang_customer_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customerName` varchar(50) NOT NULL COMMENT '顾客名字',
  `customerPhone` varchar(20) NOT NULL COMMENT '顾客电话',
  `customerAddress` text NOT NULL COMMENT '顾客地址',
  `createId` int(11) NOT NULL COMMENT '创建人',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `updateId` int(11) DEFAULT NULL COMMENT '最后修改人',
  `updateTime` int(11) DEFAULT NULL COMMENT '最后修改时间',
  `provideId` int(11) NOT NULL COMMENT '顾客信息提供方（推荐人）',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=>''弃用'',1=>''未分配'',2=>''已分配业务员'',3=>''转交设计师审核'',4=>''转交设计师成功'',''5''=>''成交客户''',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顾客基本信息录入';

-- ----------------------------
-- Records of bangbang_customer_info
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_customer_track_info
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_customer_track_info`;
CREATE TABLE `bangbang_customer_track_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL COMMENT '客户id对应客户详情表里id',
  `customerRemark` text NOT NULL COMMENT '客户最近追踪记录',
  `customerIntent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '客户意向,0=>''意向不明确'',1=>''有下单欲望'',-1=>''无下单欲望'',2=>‘强烈下单欲望’',
  `createId` int(11) NOT NULL COMMENT '提交人',
  `createTime` int(11) NOT NULL COMMENT '提交时间',
  `version` varchar(20) NOT NULL COMMENT '提交生成的版本号以年月日+00的形式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户意向追踪表';

-- ----------------------------
-- Records of bangbang_customer_track_info
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_customer_transfer_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_customer_transfer_log`;
CREATE TABLE `bangbang_customer_transfer_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL COMMENT '客户id',
  `operatingId` int(11) NOT NULL COMMENT '操作人',
  `operatingTime` int(11) NOT NULL COMMENT '操作时间',
  `receiverId` int(11) NOT NULL COMMENT '接手人id',
  `operatingType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>''转交申请'',2=>''接受转交'',-1=>''拒绝转交''',
  `receiverTime` int(11) NOT NULL COMMENT '接手人操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bangbang_customer_transfer_log
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_flow
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_flow`;
CREATE TABLE `bangbang_flow` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `money` decimal(2,0) NOT NULL COMMENT '流水金额',
  `createId` int(11) NOT NULL COMMENT '流水添加时间',
  `createTime` int(11) NOT NULL COMMENT '流水添加时间',
  `orderId` int(11) NOT NULL COMMENT '对应工单id',
  `flowSn` varchar(50) NOT NULL COMMENT '流水编号',
  `flowContent` varchar(255) NOT NULL COMMENT '流水简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bangbang_flow
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_flow_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_flow_log`;
CREATE TABLE `bangbang_flow_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` int(11) DEFAULT NULL COMMENT '对应工单id',
  `flowOn` varchar(50) NOT NULL COMMENT '生成的流水号',
  `createTime` int(11) NOT NULL COMMENT '生成时间',
  `createId` int(11) NOT NULL COMMENT '生成的操作人',
  `orderMoneyId` int(11) DEFAULT NULL COMMENT '对应的工单交款期数',
  `Money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '缴纳的钱数',
  `payType` varchar(25) NOT NULL DEFAULT '' COMMENT '支付的类型alipay(支付宝),weixin(微信),other(其他)',
  `flowContent` varchar(255) NOT NULL COMMENT '流水内容',
  `flowType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>工单流水,2=>监控扣款流水,3=>日常工资流水',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是后台操作 0=>''不是''，1=》''是''',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flowSn` (`flowOn`) USING BTREE,
  KEY `time` (`createTime`) USING BTREE,
  KEY `order` (`orderId`,`orderMoneyId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='流水日志表';

-- ----------------------------
-- Records of bangbang_flow_log
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_hook
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_hook`;
CREATE TABLE `bangbang_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of bangbang_hook
-- ----------------------------
INSERT INTO `bangbang_hook` VALUES ('1', '1', '0', '应用初始化', 'app_init', 'cmf', '应用初始化');
INSERT INTO `bangbang_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `bangbang_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `bangbang_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `bangbang_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `bangbang_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `bangbang_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `bangbang_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `bangbang_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `bangbang_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `bangbang_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `bangbang_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `bangbang_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `bangbang_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `bangbang_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `bangbang_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `bangbang_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `bangbang_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `bangbang_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `bangbang_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `bangbang_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `bangbang_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `bangbang_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `bangbang_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `bangbang_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `bangbang_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `bangbang_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `bangbang_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `bangbang_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `bangbang_hook` VALUES ('30', '2', '0', '文章显示之前', 'portal_before_assign_article', 'portal', '文章显示之前');
INSERT INTO `bangbang_hook` VALUES ('31', '2', '0', '后台文章保存之后', 'portal_admin_after_save_article', 'portal', '后台文章保存之后');
INSERT INTO `bangbang_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `bangbang_hook` VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `bangbang_hook` VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `bangbang_hook` VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');

-- ----------------------------
-- Table structure for bangbang_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_hook_plugin`;
CREATE TABLE `bangbang_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of bangbang_hook_plugin
-- ----------------------------
INSERT INTO `bangbang_hook_plugin` VALUES ('1', '10000', '1', 'admin_dashboard', 'SystemInfo');

-- ----------------------------
-- Table structure for bangbang_link
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_link`;
CREATE TABLE `bangbang_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of bangbang_link
-- ----------------------------
INSERT INTO `bangbang_link` VALUES ('1', '1', '1', '8', 'thinkcmf官网', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '');

-- ----------------------------
-- Table structure for bangbang_nav
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_nav`;
CREATE TABLE `bangbang_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_main` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否为主导航;1:是;0:不是',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '导航位置名称',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航位置表';

-- ----------------------------
-- Records of bangbang_nav
-- ----------------------------
INSERT INTO `bangbang_nav` VALUES ('1', '1', '主导航', '主导航');
INSERT INTO `bangbang_nav` VALUES ('2', '0', '底部导航', '');

-- ----------------------------
-- Table structure for bangbang_nav_menu
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_nav_menu`;
CREATE TABLE `bangbang_nav_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nav_id` int(11) NOT NULL COMMENT '导航 id',
  `parent_id` int(11) NOT NULL COMMENT '父 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '打开方式',
  `href` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `icon` varchar(20) NOT NULL DEFAULT '' COMMENT '图标',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='前台导航菜单表';

-- ----------------------------
-- Records of bangbang_nav_menu
-- ----------------------------
INSERT INTO `bangbang_nav_menu` VALUES ('1', '1', '0', '1', '0', '首页', '', 'home', '', '0-1');

-- ----------------------------
-- Table structure for bangbang_option
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_option`;
CREATE TABLE `bangbang_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';

-- ----------------------------
-- Records of bangbang_option
-- ----------------------------
INSERT INTO `bangbang_option` VALUES ('1', '1', 'site_info', '{\"site_name\":\"ThinkCMFu5185u5bb9u7ba1u7406u6846u67b6\",\"site_seo_title\":\"ThinkCMFu5185u5bb9u7ba1u7406u6846u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,u5185u5bb9u7ba1u7406u6846u67b6,cmf,cms,u7b80u7ea6u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMFu662fu7b80u7ea6u98ceu7f51u7edcu79d1u6280u53d1u5e03u7684u4e00u6b3eu7528u4e8eu5febu901fu5f00u53d1u7684u5185u5bb9u7ba1u7406u6846u67b6\"}');
INSERT INTO `bangbang_option` VALUES ('2', '1', 'admin_dashboard_widgets', '[{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1},{\"name\":\"SystemInfo\",\"is_system\":0}]');

-- ----------------------------
-- Table structure for bangbang_order_info
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_order_info`;
CREATE TABLE `bangbang_order_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createId` int(11) NOT NULL COMMENT '下单人',
  `createTime` int(11) NOT NULL COMMENT '下单时间',
  `updateTime` int(11) DEFAULT NULL COMMENT '修改时间',
  `updateId` int(11) DEFAULT NULL COMMENT '修改人',
  `orderNum` varchar(50) CHARACTER SET utf8mb4 NOT NULL COMMENT '工单编号',
  `orderName` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '订单所属人姓名',
  `orderUid` int(11) NOT NULL COMMENT '订单所属人id',
  `userTel` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT '订单所属人电话',
  `userAddress` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户装修地址',
  `userAddressNum` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '用户工单地址转换为经纬度',
  `orderTotal` decimal(11,2) NOT NULL COMMENT '订单总金额',
  `orderType` tinyint(2) NOT NULL COMMENT '工单装修类型',
  `orderCycle` int(6) NOT NULL COMMENT '装修总周期',
  `orderImage` text CHARACTER SET utf8mb4 COMMENT '效果图集合',
  `orderContent` text CHARACTER SET utf8mb4 COMMENT '工单装修风格简介',
  `orderStatus` tinyint(2) NOT NULL DEFAULT '0' COMMENT '-1=>无效,0=>任务待分解,1=>''任务待发布'',2=>任务进行中,3=>任务完成',
  `orderDesigner` int(11) NOT NULL COMMENT '工单设计师',
  `orderSupervisor` int(11) NOT NULL COMMENT '工单监理',
  `orderRecommend` int(11) NOT NULL DEFAULT '0' COMMENT '工单推荐人',
  `orderStartTime` int(11) NOT NULL COMMENT '工程开始时间',
  `orderEndTime` int(11) DEFAULT NULL COMMENT '工单交付时间',
  `coverImage` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '工单封面图',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`) USING BTREE,
  KEY `time` (`createTime`,`updateTime`,`orderStartTime`,`orderEndTime`) USING BTREE,
  KEY `tel` (`userTel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='装修工单详情表';

-- ----------------------------
-- Records of bangbang_order_info
-- ----------------------------
INSERT INTO `bangbang_order_info` VALUES ('17', '1', '1522484970', '0', '0', '201803833863', '王生', '2', '15826962999', '湖北黄石', '', '10000.00', '1', '90', 's:4:\"test\";', '<p>test</p>', '1', '1', '1', '1', '1522857600', '0', '');
INSERT INTO `bangbang_order_info` VALUES ('20', '1', '1522507936', '0', '0', '201803720982', '王生', '2', '15826962999', '湖北黄石', '', '10000.00', '1', '90', 's:4:\"test\";', '<p>test</p>', '1', '1', '1', '1', '1522857600', '0', '');
INSERT INTO `bangbang_order_info` VALUES ('21', '1', '1522508091', '0', '0', '201803296984', '王生', '2', '15826962999', '湖北黄石', '', '10000.00', '1', '90', 's:4:\"test\";', '<p>test</p>', '1', '1', '1', '1', '1522425600', '0', '');
INSERT INTO `bangbang_order_info` VALUES ('22', '1', '1522588994', '0', '0', '20180488229', '王生', '2', '15826962999', '湖北黄石', '', '10000.00', '1', '90', 's:4:\"test\";', '<p>test</p>', '1', '1', '1', '1', '1522425600', '0', '');

-- ----------------------------
-- Table structure for bangbang_order_money
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_order_money`;
CREATE TABLE `bangbang_order_money` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL COMMENT '对应的工单id',
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '简要说明',
  `money` decimal(11,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>未交付,1=>已交付',
  `createId` int(11) NOT NULL COMMENT '添加人',
  `createTime` int(11) NOT NULL COMMENT '添加时间',
  `updateId` int(11) DEFAULT NULL COMMENT '修改人',
  `updateTime` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='工单分期交款表';

-- ----------------------------
-- Records of bangbang_order_money
-- ----------------------------
INSERT INTO `bangbang_order_money` VALUES ('25', '17', '第1期交款', '3000.00', '0', '1', '1522484970', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('26', '17', '第2期交款', '3000.00', '0', '1', '1522484970', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('27', '17', '第3期交款', '4000.00', '0', '1', '1522484970', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('34', '20', '第1期交款', '3000.00', '0', '1', '1522507936', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('35', '20', '第2期交款', '3000.00', '0', '1', '1522507936', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('36', '20', '第3期交款', '4000.00', '0', '1', '1522507936', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('37', '21', '第1期交款', '3000.00', '0', '1', '1522508091', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('38', '21', '第2期交款', '3000.00', '0', '1', '1522508091', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('39', '21', '第3期交款', '4000.00', '0', '1', '1522508091', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('40', '22', '第1期交款', '3000.00', '0', '1', '1522588994', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('41', '22', '第2期交款', '3000.00', '0', '1', '1522588994', '0', '0');
INSERT INTO `bangbang_order_money` VALUES ('42', '22', '第3期交款', '4000.00', '0', '1', '1522588994', '0', '0');

-- ----------------------------
-- Table structure for bangbang_order_option_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_order_option_log`;
CREATE TABLE `bangbang_order_option_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `optionUserId` int(11) NOT NULL COMMENT '日志操作人',
  `optionType` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'ADDORDER(下单),\r\nRESOLVE(分解任务),\r\nRELEASE(发布任务),\r\nSTARTTACK(开始任务),\r\nENDTASK(完成任务),\r\nPAYMONEY(缴纳工单款),\r\nDUNNING(催交款工单款),\r\nSIGNTASK(签收任务),\r\nREMINDERSIG(催签任务),\r\nENDORDER(完结工单),',
  `optionTime` int(11) NOT NULL COMMENT '操作时间',
  `orderId` int(11) NOT NULL COMMENT '操作对应的工单id',
  `submitParameter` text CHARACTER SET utf8mb4 NOT NULL COMMENT '请求参数',
  `resultBefore` text CHARACTER SET utf8mb4 COMMENT '请求前结果',
  `resultRear` text CHARACTER SET utf8mb4 COMMENT '请求后结果',
  `optionContent` text CHARACTER SET utf8mb4 NOT NULL COMMENT '日志说明',
  `taskId` int(11) DEFAULT NULL COMMENT '对应的工单任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='工单操作日志';

-- ----------------------------
-- Records of bangbang_order_option_log
-- ----------------------------
INSERT INTO `bangbang_order_option_log` VALUES ('12', '1', 'ADDORDER', '1522484970', '17', '{\"orderNum\":\"201803833863\",\"orderRecommend\":1,\"orderUid\":2,\"createId\":1,\"createTime\":1522484970,\"orderName\":\"u738bu751f\",\"userTel\":\"15826962999\",\"userAddress\":\"u6e56u5317u9ec4u77f3\",\"orderTotal\":\"10000\",\"orderType\":\"1\",\"orderCycle\":\"90\",\"orderImage\":\"s:4:\"test\";\",\"orderContent\":\"<p>test</p>\",\"orderStatus\":0,\"orderDesigner\":\"1\",\"orderSupervisor\":\"1\"}', '', '', '下单成功', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('20', '1', 'RESOLVE', '1522507604', '17', '{\"orderId\":17,\"endTime\":1530633600,\"task\":{\"25\":{\"1\":{\"taskName\":\"25test\",\"taskCycle\":5,\"taskStartTime\":1522857600,\"taskEndTime\":1523289600,\"isVerify\":0},\"2\":{\"taskName\":\"25test\",\"taskCycle\":5,\"taskStartTime\":1523289600,\"taskEndTime\":1523721600,\"isVerify\":0},\"3\":{\"taskName\":\"25test\",\"taskCycle\":5,\"taskStartTime\":1523721600,\"taskEndTime\":1524153600,\"isVerify\":0},\"4\":{\"taskName\":\"25test\",\"taskCycle\":5,\"taskStartTime\":1524153600,\"taskEndTime\":1524585600,\"isVerify\":0},\"5\":{\"taskName\":\"25test\",\"taskCycle\":5,\"taskStartTime\":1524585600,\"taskEndTime\":1525017600,\"isVerify\":0},\"6\":{\"taskName\":\"25test\",\"taskCycle\":5,\"taskStartTime\":1525017600,\"taskEndTime\":1525449600,\"isVerify\":0}},\"26\":{\"1\":{\"taskName\":\"26test\",\"taskCycle\":5,\"taskStartTime\":1525449600,\"taskEndTime\":1525881600,\"isVerify\":0},\"2\":{\"taskName\":\"26test\",\"taskCycle\":5,\"taskStartTime\":1525881600,\"taskEndTime\":1526313600,\"isVerify\":0},\"3\":{\"taskName\":\"26test\",\"taskCycle\":5,\"taskStartTime\":1526313600,\"taskEndTime\":1526745600,\"isVerify\":0},\"4\":{\"taskName\":\"26test\",\"taskCycle\":5,\"taskStartTime\":1526745600,\"taskEndTime\":1527177600,\"isVerify\":0},\"5\":{\"taskName\":\"26test\",\"taskCycle\":5,\"taskStartTime\":1527177600,\"taskEndTime\":1527609600,\"isVerify\":0},\"6\":{\"taskName\":\"26test\",\"taskCycle\":5,\"taskStartTime\":1527609600,\"taskEndTime\":1528041600,\"isVerify\":0}},\"27\":{\"1\":{\"taskName\":\"27test\",\"taskCycle\":5,\"taskStartTime\":1528041600,\"taskEndTime\":1528473600,\"isVerify\":0},\"2\":{\"taskName\":\"27test\",\"taskCycle\":5,\"taskStartTime\":1528473600,\"taskEndTime\":1528905600,\"isVerify\":0},\"3\":{\"taskName\":\"27test\",\"taskCycle\":5,\"taskStartTime\":1528905600,\"taskEndTime\":1529337600,\"isVerify\":0},\"4\":{\"taskName\":\"27test\",\"taskCycle\":5,\"taskStartTime\":1529337600,\"taskEndTime\":1529769600,\"isVerify\":0},\"5\":{\"taskName\":\"27test\",\"taskCycle\":5,\"taskStartTime\":1529769600,\"taskEndTime\":1530201600,\"isVerify\":0},\"6\":{\"taskName\":\"27test\",\"taskCycle\":5,\"taskStartTime\":1530201600,\"taskEndTime\":1530633600,\"isVerify\":0}}}}', '', '', '任务分解', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('21', '1', 'ADDORDER', '1522507936', '20', '{\"orderNum\":\"201803720982\",\"orderRecommend\":1,\"orderUid\":2,\"createId\":1,\"createTime\":1522507936,\"orderName\":\"u738bu751f\",\"userTel\":\"15826962999\",\"userAddress\":\"u6e56u5317u9ec4u77f3\",\"orderTotal\":\"10000\",\"orderType\":\"1\",\"orderCycle\":\"90\",\"orderImage\":\"s:4:\"test\";\",\"orderContent\":\"<p>test</p>\",\"orderStatus\":0,\"orderDesigner\":\"1\",\"orderSupervisor\":\"1\"}', '', '', '下单成功', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('22', '1', 'RESOLVE', '1522508086', '20', '{\"orderId\":20,\"endTime\":1530633600,\"task\":{\"34\":{\"1\":{\"taskName\":\"34test\",\"taskCycle\":5,\"taskStartTime\":1522857600,\"taskEndTime\":1523289600,\"isVerify\":0},\"2\":{\"taskName\":\"34test\",\"taskCycle\":5,\"taskStartTime\":1523289600,\"taskEndTime\":1523721600,\"isVerify\":0},\"3\":{\"taskName\":\"34test\",\"taskCycle\":5,\"taskStartTime\":1523721600,\"taskEndTime\":1524153600,\"isVerify\":0},\"4\":{\"taskName\":\"34test\",\"taskCycle\":5,\"taskStartTime\":1524153600,\"taskEndTime\":1524585600,\"isVerify\":0},\"5\":{\"taskName\":\"34test\",\"taskCycle\":5,\"taskStartTime\":1524585600,\"taskEndTime\":1525017600,\"isVerify\":0},\"6\":{\"taskName\":\"34test\",\"taskCycle\":5,\"taskStartTime\":1525017600,\"taskEndTime\":1525449600,\"isVerify\":0}},\"35\":{\"1\":{\"taskName\":\"35test\",\"taskCycle\":5,\"taskStartTime\":1525449600,\"taskEndTime\":1525881600,\"isVerify\":0},\"2\":{\"taskName\":\"35test\",\"taskCycle\":5,\"taskStartTime\":1525881600,\"taskEndTime\":1526313600,\"isVerify\":0},\"3\":{\"taskName\":\"35test\",\"taskCycle\":5,\"taskStartTime\":1526313600,\"taskEndTime\":1526745600,\"isVerify\":0},\"4\":{\"taskName\":\"35test\",\"taskCycle\":5,\"taskStartTime\":1526745600,\"taskEndTime\":1527177600,\"isVerify\":0},\"5\":{\"taskName\":\"35test\",\"taskCycle\":5,\"taskStartTime\":1527177600,\"taskEndTime\":1527609600,\"isVerify\":0},\"6\":{\"taskName\":\"35test\",\"taskCycle\":5,\"taskStartTime\":1527609600,\"taskEndTime\":1528041600,\"isVerify\":0}},\"36\":{\"1\":{\"taskName\":\"36test\",\"taskCycle\":5,\"taskStartTime\":1528041600,\"taskEndTime\":1528473600,\"isVerify\":0},\"2\":{\"taskName\":\"36test\",\"taskCycle\":5,\"taskStartTime\":1528473600,\"taskEndTime\":1528905600,\"isVerify\":0},\"3\":{\"taskName\":\"36test\",\"taskCycle\":5,\"taskStartTime\":1528905600,\"taskEndTime\":1529337600,\"isVerify\":0},\"4\":{\"taskName\":\"36test\",\"taskCycle\":5,\"taskStartTime\":1529337600,\"taskEndTime\":1529769600,\"isVerify\":0},\"5\":{\"taskName\":\"36test\",\"taskCycle\":5,\"taskStartTime\":1529769600,\"taskEndTime\":1530201600,\"isVerify\":0},\"6\":{\"taskName\":\"36test\",\"taskCycle\":5,\"taskStartTime\":1530201600,\"taskEndTime\":1530633600,\"isVerify\":0}}}}', '', '', '任务分解', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('23', '1', 'ADDORDER', '1522508091', '21', '{\"orderNum\":\"201803296984\",\"orderRecommend\":1,\"orderUid\":2,\"createId\":1,\"createTime\":1522508091,\"orderName\":\"u738bu751f\",\"userTel\":\"15826962999\",\"userAddress\":\"u6e56u5317u9ec4u77f3\",\"orderTotal\":\"10000\",\"orderType\":\"1\",\"orderCycle\":\"90\",\"orderImage\":\"s:4:\"test\";\",\"orderContent\":\"<p>test</p>\",\"orderStatus\":0,\"orderDesigner\":\"1\",\"orderSupervisor\":\"1\",\"orderStartTime\":1522425600}', '', '', '下单成功', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('24', '1', 'RESOLVE', '1522508096', '21', '{\"orderId\":21,\"endTime\":1530201600,\"task\":{\"37\":{\"1\":{\"taskName\":\"37test\",\"taskCycle\":5,\"taskStartTime\":1522425600,\"taskEndTime\":1522857600,\"isVerify\":0},\"2\":{\"taskName\":\"37test\",\"taskCycle\":5,\"taskStartTime\":1522857600,\"taskEndTime\":1523289600,\"isVerify\":0},\"3\":{\"taskName\":\"37test\",\"taskCycle\":5,\"taskStartTime\":1523289600,\"taskEndTime\":1523721600,\"isVerify\":0},\"4\":{\"taskName\":\"37test\",\"taskCycle\":5,\"taskStartTime\":1523721600,\"taskEndTime\":1524153600,\"isVerify\":0},\"5\":{\"taskName\":\"37test\",\"taskCycle\":5,\"taskStartTime\":1524153600,\"taskEndTime\":1524585600,\"isVerify\":0},\"6\":{\"taskName\":\"37test\",\"taskCycle\":5,\"taskStartTime\":1524585600,\"taskEndTime\":1525017600,\"isVerify\":0}},\"38\":{\"1\":{\"taskName\":\"38test\",\"taskCycle\":5,\"taskStartTime\":1525017600,\"taskEndTime\":1525449600,\"isVerify\":0},\"2\":{\"taskName\":\"38test\",\"taskCycle\":5,\"taskStartTime\":1525449600,\"taskEndTime\":1525881600,\"isVerify\":0},\"3\":{\"taskName\":\"38test\",\"taskCycle\":5,\"taskStartTime\":1525881600,\"taskEndTime\":1526313600,\"isVerify\":0},\"4\":{\"taskName\":\"38test\",\"taskCycle\":5,\"taskStartTime\":1526313600,\"taskEndTime\":1526745600,\"isVerify\":0},\"5\":{\"taskName\":\"38test\",\"taskCycle\":5,\"taskStartTime\":1526745600,\"taskEndTime\":1527177600,\"isVerify\":0},\"6\":{\"taskName\":\"38test\",\"taskCycle\":5,\"taskStartTime\":1527177600,\"taskEndTime\":1527609600,\"isVerify\":0}},\"39\":{\"1\":{\"taskName\":\"39test\",\"taskCycle\":5,\"taskStartTime\":1527609600,\"taskEndTime\":1528041600,\"isVerify\":0},\"2\":{\"taskName\":\"39test\",\"taskCycle\":5,\"taskStartTime\":1528041600,\"taskEndTime\":1528473600,\"isVerify\":0},\"3\":{\"taskName\":\"39test\",\"taskCycle\":5,\"taskStartTime\":1528473600,\"taskEndTime\":1528905600,\"isVerify\":0},\"4\":{\"taskName\":\"39test\",\"taskCycle\":5,\"taskStartTime\":1528905600,\"taskEndTime\":1529337600,\"isVerify\":0},\"5\":{\"taskName\":\"39test\",\"taskCycle\":5,\"taskStartTime\":1529337600,\"taskEndTime\":1529769600,\"isVerify\":0},\"6\":{\"taskName\":\"39test\",\"taskCycle\":5,\"taskStartTime\":1529769600,\"taskEndTime\":1530201600,\"isVerify\":0}}}}', '', '', '任务分解', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('25', '1', 'ADDORDER', '1522588994', '22', '{\"orderNum\":\"20180488229\",\"orderRecommend\":1,\"orderUid\":2,\"createId\":1,\"createTime\":1522588994,\"orderName\":\"u738bu751f\",\"userTel\":\"15826962999\",\"userAddress\":\"u6e56u5317u9ec4u77f3\",\"orderTotal\":\"10000\",\"orderType\":\"1\",\"orderCycle\":\"90\",\"orderImage\":\"s:4:\"test\";\",\"orderContent\":\"<p>test</p>\",\"orderStatus\":0,\"orderDesigner\":\"1\",\"orderSupervisor\":\"1\",\"orderStartTime\":1522425600}', '', '', '下单成功', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('28', '1', 'RESOLVE', '1522589548', '22', '{\"orderId\":22,\"endTime\":1530201600,\"task\":{\"40\":{\"1\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1522425600,\"taskEndTime\":1522857600,\"isVerify\":0},\"2\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1522857600,\"taskEndTime\":1523289600,\"isVerify\":0},\"3\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1523289600,\"taskEndTime\":1523721600,\"isVerify\":0},\"4\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1523721600,\"taskEndTime\":1524153600,\"isVerify\":0},\"5\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1524153600,\"taskEndTime\":1524585600,\"isVerify\":0},\"6\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1524585600,\"taskEndTime\":1525017600,\"isVerify\":0}},\"41\":{\"1\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1525017600,\"taskEndTime\":1525449600,\"isVerify\":0},\"2\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1525449600,\"taskEndTime\":1525881600,\"isVerify\":0},\"3\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1525881600,\"taskEndTime\":1526313600,\"isVerify\":0},\"4\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1526313600,\"taskEndTime\":1526745600,\"isVerify\":0},\"5\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1526745600,\"taskEndTime\":1527177600,\"isVerify\":0},\"6\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1527177600,\"taskEndTime\":1527609600,\"isVerify\":0}},\"42\":{\"1\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1527609600,\"taskEndTime\":1528041600,\"isVerify\":0},\"2\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1528041600,\"taskEndTime\":1528473600,\"isVerify\":0},\"3\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1528473600,\"taskEndTime\":1528905600,\"isVerify\":0},\"4\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1528905600,\"taskEndTime\":1529337600,\"isVerify\":0},\"5\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1529337600,\"taskEndTime\":1529769600,\"isVerify\":0},\"6\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1529769600,\"taskEndTime\":1530201600,\"isVerify\":0}}}}', '', '', '任务分解', '0');
INSERT INTO `bangbang_order_option_log` VALUES ('29', '1', 'RESOLVE', '1522589548', '22', '{\"orderId\":22,\"endTime\":1530201600,\"task\":{\"40\":{\"1\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1522425600,\"taskEndTime\":1522857600,\"isVerify\":0},\"2\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1522857600,\"taskEndTime\":1523289600,\"isVerify\":0},\"3\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1523289600,\"taskEndTime\":1523721600,\"isVerify\":0},\"4\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1523721600,\"taskEndTime\":1524153600,\"isVerify\":0},\"5\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1524153600,\"taskEndTime\":1524585600,\"isVerify\":0},\"6\":{\"taskName\":\"40test\",\"taskCycle\":5,\"taskStartTime\":1524585600,\"taskEndTime\":1525017600,\"isVerify\":0}},\"41\":{\"1\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1525017600,\"taskEndTime\":1525449600,\"isVerify\":0},\"2\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1525449600,\"taskEndTime\":1525881600,\"isVerify\":0},\"3\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1525881600,\"taskEndTime\":1526313600,\"isVerify\":0},\"4\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1526313600,\"taskEndTime\":1526745600,\"isVerify\":0},\"5\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1526745600,\"taskEndTime\":1527177600,\"isVerify\":0},\"6\":{\"taskName\":\"41test\",\"taskCycle\":5,\"taskStartTime\":1527177600,\"taskEndTime\":1527609600,\"isVerify\":0}},\"42\":{\"1\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1527609600,\"taskEndTime\":1528041600,\"isVerify\":0},\"2\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1528041600,\"taskEndTime\":1528473600,\"isVerify\":0},\"3\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1528473600,\"taskEndTime\":1528905600,\"isVerify\":0},\"4\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1528905600,\"taskEndTime\":1529337600,\"isVerify\":0},\"5\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1529337600,\"taskEndTime\":1529769600,\"isVerify\":0},\"6\":{\"taskName\":\"42test\",\"taskCycle\":5,\"taskStartTime\":1529769600,\"taskEndTime\":1530201600,\"isVerify\":0}}}}', '', '', '任务分解', '0');

-- ----------------------------
-- Table structure for bangbang_order_task
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_order_task`;
CREATE TABLE `bangbang_order_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `taskName` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '任务名称',
  `taskCycle` int(10) NOT NULL COMMENT '任务周期',
  `taskStartTime` int(11) NOT NULL COMMENT '任务开始时间',
  `taskEndTime` int(11) NOT NULL COMMENT '任务结束时间',
  `taskCompleteTime` int(11) DEFAULT NULL COMMENT '任务完成时间',
  `taskStatus` tinyint(2) NOT NULL DEFAULT '-2' COMMENT '-2,=>未发布,-1=>待开始,0=>进行中,1=>已完成',
  `orderMoneyId` int(11) NOT NULL COMMENT '对应order_money表',
  `orderId` int(11) NOT NULL COMMENT '对应order_info表',
  `isConfirm` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>''未确认'',1=>''已确认''',
  `isVerify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>''用户不需确认'',1=>''用户确认才可以开始下一任务''',
  `ActualStartTime` int(11) DEFAULT NULL COMMENT '任务时间开始时间',
  `ActualEndTime` int(11) DEFAULT NULL COMMENT '任务时间结束时间',
  `ActualDay` int(11) DEFAULT NULL COMMENT '任务时间周期',
  `createId` int(11) NOT NULL COMMENT '分解人',
  `createTime` int(11) NOT NULL COMMENT '分解时间',
  `updateId` int(11) DEFAULT NULL COMMENT '修改人',
  `updateTime` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COMMENT='工单每期任务分解';

-- ----------------------------
-- Records of bangbang_order_task
-- ----------------------------
INSERT INTO `bangbang_order_task` VALUES ('145', '25test', '5', '1522857600', '1523289600', '0', '-2', '25', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('146', '25test', '5', '1523289600', '1523721600', '0', '-2', '25', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('147', '25test', '5', '1523721600', '1524153600', '0', '-2', '25', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('148', '25test', '5', '1524153600', '1524585600', '0', '-2', '25', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('149', '25test', '5', '1524585600', '1525017600', '0', '-2', '25', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('150', '25test', '5', '1525017600', '1525449600', '0', '-2', '25', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('151', '26test', '5', '1525449600', '1525881600', '0', '-2', '26', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('152', '26test', '5', '1525881600', '1526313600', '0', '-2', '26', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('153', '26test', '5', '1526313600', '1526745600', '0', '-2', '26', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('154', '26test', '5', '1526745600', '1527177600', '0', '-2', '26', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('155', '26test', '5', '1527177600', '1527609600', '0', '-2', '26', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('156', '26test', '5', '1527609600', '1528041600', '0', '-2', '26', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('157', '27test', '5', '1528041600', '1528473600', '0', '-2', '27', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('158', '27test', '5', '1528473600', '1528905600', '0', '-2', '27', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('159', '27test', '5', '1528905600', '1529337600', '0', '-2', '27', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('160', '27test', '5', '1529337600', '1529769600', '0', '-2', '27', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('161', '27test', '5', '1529769600', '1530201600', '0', '-2', '27', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('162', '27test', '5', '1530201600', '1530633600', '0', '-2', '27', '17', '0', '0', '0', '0', '0', '1', '1522507604', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('163', '34test', '5', '1522857600', '1523289600', '0', '-2', '34', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('164', '34test', '5', '1523289600', '1523721600', '0', '-2', '34', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('165', '34test', '5', '1523721600', '1524153600', '0', '-2', '34', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('166', '34test', '5', '1524153600', '1524585600', '0', '-2', '34', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('167', '34test', '5', '1524585600', '1525017600', '0', '-2', '34', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('168', '34test', '5', '1525017600', '1525449600', '0', '-2', '34', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('169', '35test', '5', '1525449600', '1525881600', '0', '-2', '35', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('170', '35test', '5', '1525881600', '1526313600', '0', '-2', '35', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('171', '35test', '5', '1526313600', '1526745600', '0', '-2', '35', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('172', '35test', '5', '1526745600', '1527177600', '0', '-2', '35', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('173', '35test', '5', '1527177600', '1527609600', '0', '-2', '35', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('174', '35test', '5', '1527609600', '1528041600', '0', '-2', '35', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('175', '36test', '5', '1528041600', '1528473600', '0', '-2', '36', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('176', '36test', '5', '1528473600', '1528905600', '0', '-2', '36', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('177', '36test', '5', '1528905600', '1529337600', '0', '-2', '36', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('178', '36test', '5', '1529337600', '1529769600', '0', '-2', '36', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('179', '36test', '5', '1529769600', '1530201600', '0', '-2', '36', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('180', '36test', '5', '1530201600', '1530633600', '0', '-2', '36', '20', '0', '0', '0', '0', '0', '1', '1522508086', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('181', '37test', '5', '1522425600', '1522857600', '0', '-2', '37', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('182', '37test', '5', '1522857600', '1523289600', '0', '-2', '37', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('183', '37test', '5', '1523289600', '1523721600', '0', '-2', '37', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('184', '37test', '5', '1523721600', '1524153600', '0', '-2', '37', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('185', '37test', '5', '1524153600', '1524585600', '0', '-2', '37', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('186', '37test', '5', '1524585600', '1525017600', '0', '-2', '37', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('187', '38test', '5', '1525017600', '1525449600', '0', '-2', '38', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('188', '38test', '5', '1525449600', '1525881600', '0', '-2', '38', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('189', '38test', '5', '1525881600', '1526313600', '0', '-2', '38', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('190', '38test', '5', '1526313600', '1526745600', '0', '-2', '38', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('191', '38test', '5', '1526745600', '1527177600', '0', '-2', '38', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('192', '38test', '5', '1527177600', '1527609600', '0', '-2', '38', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('193', '39test', '5', '1527609600', '1528041600', '0', '-2', '39', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('194', '39test', '5', '1528041600', '1528473600', '0', '-2', '39', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('195', '39test', '5', '1528473600', '1528905600', '0', '-2', '39', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('196', '39test', '5', '1528905600', '1529337600', '0', '-2', '39', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('197', '39test', '5', '1529337600', '1529769600', '0', '-2', '39', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('198', '39test', '5', '1529769600', '1530201600', '0', '-2', '39', '21', '0', '0', '0', '0', '0', '1', '1522508096', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('235', '40test', '5', '1522425600', '1522857600', '0', '-2', '40', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('236', '40test', '5', '1522857600', '1523289600', '0', '-2', '40', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('237', '40test', '5', '1523289600', '1523721600', '0', '-2', '40', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('238', '40test', '5', '1523721600', '1524153600', '0', '-2', '40', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('239', '40test', '5', '1524153600', '1524585600', '0', '-2', '40', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('240', '40test', '5', '1524585600', '1525017600', '0', '-2', '40', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('241', '41test', '5', '1525017600', '1525449600', '0', '-2', '41', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('242', '41test', '5', '1525449600', '1525881600', '0', '-2', '41', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('243', '41test', '5', '1525881600', '1526313600', '0', '-2', '41', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('244', '41test', '5', '1526313600', '1526745600', '0', '-2', '41', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('245', '41test', '5', '1526745600', '1527177600', '0', '-2', '41', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('246', '41test', '5', '1527177600', '1527609600', '0', '-2', '41', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('247', '42test', '5', '1527609600', '1528041600', '0', '-2', '42', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('248', '42test', '5', '1528041600', '1528473600', '0', '-2', '42', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('249', '42test', '5', '1528473600', '1528905600', '0', '-2', '42', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('250', '42test', '5', '1528905600', '1529337600', '0', '-2', '42', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('251', '42test', '5', '1529337600', '1529769600', '0', '-2', '42', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');
INSERT INTO `bangbang_order_task` VALUES ('252', '42test', '5', '1529769600', '1530201600', '0', '-2', '42', '22', '0', '0', '0', '0', '0', '1', '1522589548', '0', '0');

-- ----------------------------
-- Table structure for bangbang_plugin
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_plugin`;
CREATE TABLE `bangbang_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of bangbang_plugin
-- ----------------------------
INSERT INTO `bangbang_plugin` VALUES ('1', '1', '0', '1', '0', 'SystemInfo', '系统信息', '', '', 'ThinkCMF', '', '1.0', '系统信息', '[]');

-- ----------------------------
-- Table structure for bangbang_portal_category
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_portal_category`;
CREATE TABLE `bangbang_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of bangbang_portal_category
-- ----------------------------
INSERT INTO `bangbang_portal_category` VALUES ('1', '0', '0', '1', '0', '10000', 'test', '', '0-1', '', '', '', 'list', 'article', '{\"thumbnail\":\"\"}');

-- ----------------------------
-- Table structure for bangbang_portal_category_post
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_portal_category_post`;
CREATE TABLE `bangbang_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of bangbang_portal_category_post
-- ----------------------------
INSERT INTO `bangbang_portal_category_post` VALUES ('1', '1', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('2', '2', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('3', '3', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('4', '4', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('5', '5', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('6', '6', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('7', '7', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('8', '8', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('9', '9', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('10', '10', '1', '10000', '1');
INSERT INTO `bangbang_portal_category_post` VALUES ('11', '11', '1', '10000', '1');

-- ----------------------------
-- Table structure for bangbang_portal_post
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_portal_post`;
CREATE TABLE `bangbang_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `post_content` text COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`),
  KEY `parent_id` (`parent_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of bangbang_portal_post
-- ----------------------------
INSERT INTO `bangbang_portal_post` VALUES ('1', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520509843', '1520509843', '1520509835', '0', '1q', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('2', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520509863', '1520509863', '1520509853', '0', '2', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('3', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520509954', '1520509954', '1520509946', '0', '3', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('4', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520509973', '1520509973', '1520509965', '0', '4', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('5', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520509983', '1520509983', '1520509977', '0', '5', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('6', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520509993', '1520509993', '1520509987', '0', '6', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('7', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520510003', '1520510003', '1520509997', '0', '7', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('8', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520510015', '1520510015', '1520510008', '0', '8', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('9', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520510026', '1520510026', '1520510019', '0', '9', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('10', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520510037', '1520510037', '1520510030', '0', '10', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');
INSERT INTO `bangbang_portal_post` VALUES ('11', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '1520510046', '1520510046', '1520510041', '0', '11', '', '', '', '', '', '{\"thumbnail\":\"\",\"template\":\"\"}');

-- ----------------------------
-- Table structure for bangbang_portal_tag
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_portal_tag`;
CREATE TABLE `bangbang_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of bangbang_portal_tag
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_portal_tag_post
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_portal_tag_post`;
CREATE TABLE `bangbang_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of bangbang_portal_tag_post
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_recycle_bin
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_recycle_bin`;
CREATE TABLE `bangbang_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- ----------------------------
-- Records of bangbang_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_role
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_role`;
CREATE TABLE `bangbang_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of bangbang_role
-- ----------------------------
INSERT INTO `bangbang_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');
INSERT INTO `bangbang_role` VALUES ('2', '0', '1', '1329633709', '1329633709', '0', '普通管理员', '权限由最高管理员分配！');
INSERT INTO `bangbang_role` VALUES ('3', '0', '1', '0', '0', '0', '设计师', '设计师');

-- ----------------------------
-- Table structure for bangbang_role_user
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_role_user`;
CREATE TABLE `bangbang_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of bangbang_role_user
-- ----------------------------
INSERT INTO `bangbang_role_user` VALUES ('1', '2', '2');

-- ----------------------------
-- Table structure for bangbang_route
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_route`;
CREATE TABLE `bangbang_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of bangbang_route
-- ----------------------------
INSERT INTO `bangbang_route` VALUES ('1', '5000', '1', '2', 'portal/List/index?id=1', '测试');
INSERT INTO `bangbang_route` VALUES ('2', '4999', '1', '2', 'portal/Article/index?cid=1', '测试/:id');

-- ----------------------------
-- Table structure for bangbang_send_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_send_sms_log`;
CREATE TABLE `bangbang_send_sms_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `smsContent` text NOT NULL COMMENT '推送消息',
  `AcceptUid` int(11) NOT NULL COMMENT '接受人id',
  `createTime` int(11) NOT NULL COMMENT '推送时间',
  `sendType` varchar(50) NOT NULL DEFAULT '' COMMENT '推送工具DingDing(钉钉机器人),sms(短信推送)',
  `isSuccess` tinyint(1) NOT NULL COMMENT '是否成功',
  `smsId` int(11) NOT NULL DEFAULT '1' COMMENT '对应的推送模板id',
  `orderId` int(11) DEFAULT NULL COMMENT '工单id',
  `orderMoneyId` int(11) DEFAULT NULL COMMENT '工单交款期数id',
  `orderTaskId` int(11) DEFAULT NULL COMMENT '工单任务id',
  PRIMARY KEY (`id`),
  KEY `smsId` (`smsId`,`AcceptUid`) USING BTREE,
  KEY `time` (`createTime`) USING BTREE,
  KEY `other` (`sendType`,`isSuccess`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bangbang_send_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_slide
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_slide`;
CREATE TABLE `bangbang_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- ----------------------------
-- Records of bangbang_slide
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_slide_item
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_slide_item`;
CREATE TABLE `bangbang_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '链接打开方式',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of bangbang_slide_item
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_sms_tel
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_sms_tel`;
CREATE TABLE `bangbang_sms_tel` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `pushTitle` varchar(255) NOT NULL COMMENT '推送标题',
  `pushContent` text NOT NULL COMMENT '推送模板',
  `smsType` varchar(255) NOT NULL COMMENT 'Email,Dingding,Sms短信模板类型',
  `discernCode` varchar(50) NOT NULL COMMENT '推送模板识别码',
  `createId` int(11) NOT NULL COMMENT '创建人',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `updateId` int(11) DEFAULT NULL COMMENT '修改人id',
  `updateTime` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bangbang_sms_tel
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_tag
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_tag`;
CREATE TABLE `bangbang_tag` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tagName` varchar(50) NOT NULL COMMENT '标签名称',
  `createId` int(11) NOT NULL COMMENT '创建人id',
  `createTime` int(11) NOT NULL COMMENT '创建时间',
  `updateId` int(11) DEFAULT NULL COMMENT '修改人id',
  `updateTime` int(11) DEFAULT NULL COMMENT '修改时间',
  `tagId` int(11) DEFAULT NULL COMMENT '标签图片',
  `tagType` varchar(50) DEFAULT NULL COMMENT '标签类型，style=>''装修风格'',''decorationType''=>''装修价位'',''pattern''=>''户型''',
  `tagStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=>''正常'',0=>''禁用''',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bangbang_tag
-- ----------------------------
INSERT INTO `bangbang_tag` VALUES ('1', '一室一厅', '1', '1526035051', null, null, '0', 'style', '1');
INSERT INTO `bangbang_tag` VALUES ('2', '二室一厅', '1', '1526035110', null, null, '0', 'style', '1');
INSERT INTO `bangbang_tag` VALUES ('3', '三室一厅', '1', '1526035281', null, null, '0', 'style', '1');
INSERT INTO `bangbang_tag` VALUES ('4', '三室两厅', '1', '1526035319', null, null, '0', 'style', '1');
INSERT INTO `bangbang_tag` VALUES ('5', '四室两厅', '1', '1526035367', null, null, '0', 'style', '1');

-- ----------------------------
-- Table structure for bangbang_theme
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_theme`;
CREATE TABLE `bangbang_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bangbang_theme
-- ----------------------------
INSERT INTO `bangbang_theme` VALUES ('1', '0', '0', '0', '0', 'simpleboot3', 'simpleboot3', '1.0.2', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for bangbang_theme_file
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_theme_file`;
CREATE TABLE `bangbang_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bangbang_theme_file
-- ----------------------------
INSERT INTO `bangbang_theme_file` VALUES ('1', '0', '10', 'simpleboot3', '文章页', 'portal/Article/index', 'portal/article', '文章页模板文件', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '');
INSERT INTO `bangbang_theme_file` VALUES ('2', '0', '10', 'simpleboot3', '联系我们页', 'portal/Page/index', 'portal/contact', '联系我们页模板文件', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'>u5730u5740uff1au4e0au6d77u5e02u5f90u6c47u533au659cu571fu8def2601u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"u4e0au6d77u5e02u5f90u6c47u533au659cu571fu8def0001u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}', '');
INSERT INTO `bangbang_theme_file` VALUES ('3', '0', '5', 'simpleboot3', '首页', 'portal/Index/index', 'portal/index', '首页模板文件', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"u5febu901fu4e86u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVCu5206u5c42u6a21u5f0f\",\"icon\":\"bars\",\"content\":\"u4f7fu7528MVCu5e94u7528u7a0bu5e8fu88abu5206u6210u4e09u4e2au6838u5fc3u90e8u4ef6uff1au6a21u578buff08Muff09u3001u89c6u56feuff08Vuff09u3001u63a7u5236u5668uff08Cuff09uff0cu4ed6u4e0du662fu4e00u4e2au65b0u7684u6982u5ff5uff0cu53eau662fThinkCMFu5c06u5176u53d1u6325u5230u4e86u6781u81f4u3002\"},{\"title\":\"u7528u6237u7ba1u7406\",\"icon\":\"group\",\"content\":\"ThinkCMFu5185u7f6eu4e86u7075u6d3bu7684u7528u6237u7ba1u7406u65b9u5f0fuff0cu5e76u53efu76f4u63a5u4e0eu7b2cu4e09u65b9u7ad9u70b9u8fdbu884cu4e92u8054u4e92u901auff0cu5982u679cu4f60u613fu610fu751au81f3u53efu4ee5u5bf9u5355u4e2au7528u6237u6216u7fa4u4f53u7528u6237u7684u884cu4e3au8fdbu884cu8bb0u5f55u53cau5206u4eabuff0cu4e3au60a8u7684u8fd0u8425u51b3u7b56u63d0u4f9bu6709u6548u53c2u8003u6570u636eu3002\"},{\"title\":\"u4e91u7aefu90e8u7f72\",\"icon\":\"cloud\",\"content\":\"u901au8fc7u9a71u52a8u7684u65b9u5f0fu53efu4ee5u8f7bu677eu652fu6301u4e91u5e73u53f0u7684u90e8u7f72uff0cu8ba9u4f60u7684u7f51u7ad9u65e0u7f1du8fc1u79fbuff0cu5185u7f6eu5df2u7ecfu652fu6301SAEu3001BAEuff0cu6b63u5f0fu7248u5c06u5bf9u4e91u7aefu90e8u7f72u8fdbu884cu8fdbu4e00u6b65u4f18u5316u3002\"},{\"title\":\"u5b89u5168u7b56u7565\",\"icon\":\"heart\",\"content\":\"u63d0u4f9bu7684u7a33u5065u7684u5b89u5168u7b56u7565uff0cu5305u62ecu5907u4efdu6062u590duff0cu5bb9u9519uff0cu9632u6cbbu6076u610fu653bu51fbu767bu9646uff0cu7f51u9875u9632u7be1u6539u7b49u591au9879u5b89u5168u7ba1u7406u529fu80fduff0cu4fddu8bc1u7cfbu7edfu5b89u5168uff0cu53efu9760uff0cu7a33u5b9au7684u8fd0u884cu3002\"},{\"title\":\"u5e94u7528u6a21u5757u5316\",\"icon\":\"cubes\",\"content\":\"u63d0u51fau5168u65b0u7684u5e94u7528u6a21u5f0fu8fdbu884cu6269u5c55uff0cu4e0du7ba1u662fu4f60u5f00u53d1u4e00u4e2au5c0fu529fu80fdu8fd8u662fu4e00u4e2au5168u65b0u7684u7ad9u70b9uff0cu5728ThinkCMFu4e2du4f60u53eau662fu589eu52a0u4e86u4e00u4e2aAPPuff0cu6bcfu4e2au72ecu7acbu8fd0u884cu4e92u4e0du5f71u54cduff0cu4fbfu4e8eu7075u6d3bu6269u5c55u548cu4e8cu6b21u5f00u53d1u3002\"},{\"title\":\"u514du8d39u5f00u6e90\",\"icon\":\"certificate\",\"content\":\"u4ee3u7801u9075u5faaApache2u5f00u6e90u534fu8baeuff0cu514du8d39u4f7fu7528uff0cu5bf9u5546u4e1au7528u6237u4e5fu65e0u4efbu4f55u9650u5236u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"u6700u65b0u8d44u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '');
INSERT INTO `bangbang_theme_file` VALUES ('4', '0', '10', 'simpleboot3', '文章列表页', 'portal/List/index', 'portal/list', '文章列表模板文件', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"u70edu95e8u6587u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"u6700u65b0u53d1u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '');
INSERT INTO `bangbang_theme_file` VALUES ('5', '0', '10', 'simpleboot3', '单页面', 'portal/Page/index', 'portal/page', '单页面模板文件', '{\"widgets\":{\"hottest_articles\":{\"title\":\"u70edu95e8u6587u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"u6700u65b0u53d1u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}', '');
INSERT INTO `bangbang_theme_file` VALUES ('6', '0', '10', 'simpleboot3', '搜索页面', 'portal/search/index', 'portal/search', '搜索模板文件', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}', '');
INSERT INTO `bangbang_theme_file` VALUES ('7', '1', '0', 'simpleboot3', '模板全局配置', 'public/Config', 'public/config', '模板全局配置文件', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}', '');
INSERT INTO `bangbang_theme_file` VALUES ('8', '1', '1', 'simpleboot3', '导航条', 'public/Nav', 'public/nav', '导航条模板文件', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}', '');

-- ----------------------------
-- Table structure for bangbang_third_party_user
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_third_party_user`;
CREATE TABLE `bangbang_third_party_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '本站用户id',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'access_token过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `login_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:正常;0:禁用',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `third_party` varchar(20) NOT NULL DEFAULT '' COMMENT '第三方惟一码',
  `app_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方应用 id',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `access_token` varchar(512) NOT NULL DEFAULT '' COMMENT '第三方授权码',
  `openid` varchar(40) NOT NULL DEFAULT '' COMMENT '第三方用户id',
  `union_id` varchar(64) NOT NULL DEFAULT '' COMMENT '第三方用户多个产品中的惟一 id,(如:微信平台)',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='第三方用户表';

-- ----------------------------
-- Records of bangbang_third_party_user
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_user
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user`;
CREATE TABLE `bangbang_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of bangbang_user
-- ----------------------------
INSERT INTO `bangbang_user` VALUES ('1', '1', '0', '0', '1527475954', '0', '0', '0.00', '1519299231', '1', 'admin', '###41db486ab474d7329263420baaf164e8', 'admin', '591554596@qq.com', '', '', '', '127.0.0.1', '', '', '');
INSERT INTO `bangbang_user` VALUES ('2', '1', '0', '0', '1522812169', '0', '0', '0.00', '0', '1', 'admin01', '###41db486ab474d7329263420baaf164e8', '', '591554595@qq.com', '', '', '', '127.0.0.1', '', '15826962999', '');

-- ----------------------------
-- Table structure for bangbang_user_action
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_action`;
CREATE TABLE `bangbang_user_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  `reward_number` int(11) NOT NULL DEFAULT '0' COMMENT '奖励次数',
  `cycle_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '周期类型;0:不限;1:按天;2:按小时;3:永久',
  `cycle_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '周期时间值',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `app` varchar(50) NOT NULL DEFAULT '' COMMENT '操作所在应用名或插件名等',
  `url` text COMMENT '执行操作的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作表';

-- ----------------------------
-- Records of bangbang_user_action
-- ----------------------------
INSERT INTO `bangbang_user_action` VALUES ('1', '1', '1', '1', '2', '1', '用户登录', 'login', 'user', '');

-- ----------------------------
-- Table structure for bangbang_user_action_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_action_log`;
CREATE TABLE `bangbang_user_action_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `last_visit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `object` varchar(100) NOT NULL DEFAULT '' COMMENT '访问对象的id,格式:不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user_id`,`object`,`action`),
  KEY `user_object_action_ip` (`user_id`,`object`,`action`,`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问记录表';

-- ----------------------------
-- Records of bangbang_user_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_user_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_balance_log`;
CREATE TABLE `bangbang_user_balance_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `change` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改余额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '更改后余额',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户余额变更日志表';

-- ----------------------------
-- Records of bangbang_user_balance_log
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_favorite`;
CREATE TABLE `bangbang_user_favorite` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户 id',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '收藏内容的标题',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) CHARACTER SET utf8 DEFAULT '' COMMENT '收藏内容的描述',
  `table_name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收藏实体以前所在表,不带前缀',
  `object_id` int(10) unsigned DEFAULT '0' COMMENT '收藏内容原来的主键id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- ----------------------------
-- Records of bangbang_user_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_user_handle_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_handle_log`;
CREATE TABLE `bangbang_user_handle_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `opUid` int(11) NOT NULL COMMENT '操作人',
  `opController` varchar(255) NOT NULL COMMENT '访问的控制器',
  `opAction` varchar(255) NOT NULL COMMENT '访问的方法',
  `opContent` varchar(255) NOT NULL COMMENT '操作的中文内容',
  `opTime` int(11) NOT NULL COMMENT '访问时间',
  `opIp` varchar(255) NOT NULL COMMENT 'ip',
  `requestData` text COMMENT '请求数据',
  `dataResult` text COMMENT '数据结果',
  `resultId` int(11) NOT NULL DEFAULT '0' COMMENT '操作的结果id',
  `type` varchar(255) NOT NULL COMMENT '操作类型:访问=>access，上下架=>changeStatus 添加=>add 删除=>del 修改=>edit',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=utf8 COMMENT='后台操作日志';

-- ----------------------------
-- Records of bangbang_user_handle_log
-- ----------------------------
INSERT INTO `bangbang_user_handle_log` VALUES ('4', '1', 'HandleLog', 'index', '用户日志配置列表', '1525506570', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('5', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525506596', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('6', '1', 'Order', 'index', '访问工单主页面', '1525506621', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('7', '1', 'Order', 'index', '访问工单主页面', '1525506666', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('8', '1', 'Order', 'index', '访问工单主页面', '1525506667', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('9', '1', 'Order', 'index', '访问工单主页面', '1525506669', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('10', '1', 'Order', 'index', '访问工单主页面', '1525506670', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('11', '1', 'Order', 'index', '访问工单主页面', '1525506672', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('12', '1', 'Order', 'index', '访问工单主页面', '1525506674', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('13', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525506717', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('14', '1', 'HandleLog', 'index', '用户日志配置列表', '1525506719', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('15', '1', 'HandleLog', 'index', '用户日志配置列表', '1525506726', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('16', '1', 'Storage', 'index', '未设置日志配置', '1525506739', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('17', '1', 'Setting', 'upload', '未设置日志配置', '1525506741', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('18', '1', 'Index', 'index', '未设置日志配置', '1525506746', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('19', '1', 'Main', 'index', '未设置日志配置', '1525506747', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('20', '1', 'Order', 'index', '访问工单主页面', '1525506782', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('21', '1', 'Order', 'index', '访问工单主页面', '1525506784', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('22', '1', 'Plugin', 'index', '未设置日志配置', '1525506799', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('23', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525506890', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('24', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1525506895', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('25', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525506900', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('26', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1525506908', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('27', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525506912', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('28', '1', 'HandleLog', 'index', '用户日志配置列表', '1525507142', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('29', '1', 'HandleLog', 'index', '用户日志配置列表', '1525507152', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('30', '1', 'HandleLog', 'index', '用户日志配置列表', '1525507165', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('31', '1', 'Setting', 'clearcache', '未设置日志配置', '1525508419', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('32', '1', 'Setting', 'site', '未设置日志配置', '1525508674', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('33', '1', 'HandleLog', 'index', '用户日志配置列表', '1525512467', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('34', '1', 'AdminAsset', 'index', '未设置日志配置', '1525512792', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('35', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525512795', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('36', '1', 'Order', 'index', '访问工单主页面', '1525513608', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('37', '1', 'Order', 'index', '访问工单主页面', '1525513618', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('38', '1', 'AdminArticle', 'index', '未设置日志配置', '1525513626', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('39', '1', 'AdminArticle', 'index', '未设置日志配置', '1525513632', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('40', '1', 'AdminArticle', 'index', '未设置日志配置', '1525513635', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('41', '1', 'AdminArticle', 'index', '未设置日志配置', '1525513638', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('42', '1', 'Order', 'index', '访问工单主页面', '1525513644', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('43', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525515174', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('44', '1', 'HandleLog', 'index', '用户日志配置列表', '1525515176', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('45', '1', 'Menu', 'index', '未设置日志配置', '1525515228', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('46', '1', 'Menu', 'add', '未设置日志配置', '1525515259', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('47', '1', 'Menu', 'addpost', '未设置日志配置', '1525515293', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('48', '1', 'Menu', 'index', '未设置日志配置', '1525515295', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('49', '1', 'Menu', 'edit', '未设置日志配置', '1525515308', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('50', '1', 'Menu', 'editpost', '未设置日志配置', '1525515324', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('51', '1', 'Menu', 'edit', '未设置日志配置', '1525515327', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('52', '1', 'Menu', 'editpost', '未设置日志配置', '1525515333', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('53', '1', 'Menu', 'edit', '未设置日志配置', '1525515335', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('54', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525515339', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('55', '1', 'Setting', 'clearcache', '未设置日志配置', '1525515342', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('56', '1', 'Index', 'index', '未设置日志配置', '1525515346', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('57', '1', 'Main', 'index', '未设置日志配置', '1525515347', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('58', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525515354', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('59', '1', 'Menu', 'index', '未设置日志配置', '1525515359', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('60', '1', 'Menu', 'edit', '未设置日志配置', '1525515365', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('61', '1', 'Menu', 'editpost', '未设置日志配置', '1525515371', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('62', '1', 'Menu', 'edit', '未设置日志配置', '1525515374', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('63', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525515376', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('64', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525515402', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('65', '1', 'Index', 'index', '未设置日志配置', '1525515404', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('66', '1', 'Main', 'index', '未设置日志配置', '1525515405', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('67', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525515407', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('68', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525516111', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('69', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525516233', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('70', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525516853', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('71', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525516922', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('72', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517062', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('73', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517066', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('74', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517069', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('75', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517071', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('76', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517073', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('77', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517074', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('78', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517076', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('79', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517078', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('80', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517080', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('81', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517105', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('82', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517108', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('83', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517116', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('84', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517511', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('85', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525517571', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('86', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517574', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('87', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517649', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('88', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517739', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('89', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517765', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('90', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517827', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('91', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517831', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('92', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517848', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('93', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517861', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('94', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517976', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('95', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525517979', '127.0.0.1', '{\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('96', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525518017', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('97', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525518104', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('98', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525518117', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('99', '1', 'HandleLog', 'index', '用户日志配置列表', '1525518119', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('100', '1', 'HandleLog', 'save', '未设置日志配置', '1525518288', '127.0.0.1', '{\"data\":{\"DecorationTypeController\":{\"index\":\"test\",\"addDecorationType\":\"\",\"editDecorationType\":\"\",\"delDecorationType\":\"\",\"changeDecorationType\":\"\"},\"DialogController\":{\"map\":\"\"},\"HandleLogController\":{\"index\":\"u7528u6237u65e5u5fd7u914du7f6eu5217u8868\",\"save\":\"u4feeu6539u7528u6237u65e5u5fd7u914du7f6e\",\"handleLogList\":\"u7528u6237u64cdu4f5cu65e5u5fd7u5217u8868\"},\"HookController\":{\"index\":\"\",\"plugins\":\"\",\"pluginListOrder\":\"\",\"sync\":\"\"},\"IndexController\":{\"index\":\"\"},\"LinkController\":{\"index\":\"\",\"add\":\"\",\"addPost\":\"\",\"edit\":\"\",\"editPost\":\"\",\"delete\":\"\",\"listOrder\":\"\",\"toggle\":\"\"},\"MailerController\":{\"index\":\"\",\"indexPost\":\"\",\"template\":\"\",\"templatePost\":\"\",\"test\":\"\"},\"MainController\":{\"index\":\"\",\"dashboardWidget\":\"\"},\"MenuController\":{\"index\":\"\",\"lists\":\"\",\"add\":\"\",\"addPost\":\"\",\"edit\":\"\",\"editPost\":\"\",\"delete\":\"\",\"listOrder\":\"\",\"getActions\":\"\"},\"MysqlHandleController\":{\"index\":\"\",\"operating\":\"\"},\"NavController\":{\"index\":\"\",\"add\":\"\",\"addPost\":\"\",\"edit\":\"\",\"editPost\":\"\",\"delete\":\"\"},\"NavMenuController\":{\"index\":\"\",\"add\":\"\",\"addPost\":\"\",\"edit\":\"\",\"editPost\":\"\",\"delete\":\"\",\"listOrder\":\"\"},\"OrderController\":{\"index\":\"u8bbfu95eeu5de5u5355u4e3bu9875u9762\",\"addOrder\":\"\",\"addPost\":\"\",\"addTask\":\"\",\"publishingTasks\":\"\"},\"OrderTestController\":{\"index\":\"\",\"addOrder\":\"\",\"taskDecomposition\":\"\",\"releaseTask\":\"\",\"test\":\"\"},\"PatternController\":{\"index\":\"\",\"addPattern\":\"\",\"editPattern\":\"\",\"delPattern\":\"\",\"changePattern\":\"\"},\"PluginController\":{\"index\":\"\",\"toggle\":\"\",\"setting\":\"\",\"settingPost\":\"\",\"install\":\"\",\"update\":\"\",\"uninstall\":\"\"},\"PublicController\":{\"login\":\"\",\"doLogin\":\"\",\"logout\":\"\"},\"RbacController\":{\"index\":\"\",\"roleAdd\":\"\",\"roleAddPost\":\"\",\"roleEdit\":\"\",\"roleEditPost\":\"\",\"roleDelete\":\"\",\"authorize\":\"\",\"authorizePost\":\"\",\"member\":\"\"},\"RecycleBinController\":{\"index\":\"\",\"restore\":\"\",\"delete\":\"\"},\"RouteController\":{\"index\":\"\",\"add\":\"\",\"addPost\":\"\",\"edit\":\"\",\"editPost\":\"\",\"delete\":\"\",\"ban\":\"\",\"open\":\"\",\"listOrder\":\"\",\"select\":\"\",\"_suggest_url\":\"\",\"_url_vars\":\"\"},\"SettingController\":{\"site\":\"\",\"sitePost\":\"\",\"password\":\"\",\"passwordPost\":\"\",\"upload\":\"\",\"uploadPost\":\"\",\"clearCache\":\"\"},\"SlideController\":{\"index\":\"\",\"add\":\"\",\"addPost\":\"\",\"edit\":\"\",\"editPost\":\"\",\"delete\":\"\"},\"SlideItemController\":{\"index\":\"\",\"add\":\"\",\"addPost\":\"\",\"edit\":\"\",\"editPost\":\"\",\"delete\":\"\",\"ban\":\"\",\"cancelBan\":\"\",\"listOrder\":\"\"},\"SmsController\":{\"getSmsTelList\":\"\",\"getSendSmsLogList\":\"\",\"addSmsTel\":\"\"},\"StorageController\":{\"index\":\"\",\"settingPost\":\"\"},\"StyleController\":{\"index\":\"\",\"addStyle\":\"\",\"editStyle\":\"\",\"delStyle\":\"\",\"changeStyle\":\"\"},\"TestController\":{\"test\":\"\",\"test1\":\"\",\"test2\":\"\"},\"ThemeController\":{\"index\":\"\",\"install\":\"\",\"uninstall\":\"\",\"installTheme\":\"\",\"update\":\"\",\"active\":\"\",\"files\":\"\",\"fileSetting\":\"\",\"fileArrayData\":\"\",\"fileArrayDataEdit\":\"\",\"fileArrayDataEditPost\":\"\",\"fileArrayDataDelete\":\"\",\"settingPost\":\"\",\"dataSource\":\"\"},\"UserController\":{\"index\":\"u7528u6237u4e3bu9875u9762\",\"add\":\"u7528u6237u6dfbu52a0u9875u9762\",\"addPost\":\"\",\"edit\":\"u7528u6237u4feeu6539u9875u9762\",\"editPost\":\"\",\"userInfo\":\"\",\"userInfoPost\":\"\",\"delete\":\"\",\"ban\":\"\",\"cancelBan\":\"\"}}}', '', '0', 'edit');
INSERT INTO `bangbang_user_handle_log` VALUES ('101', '1', 'HandleLog', 'index', '用户日志配置列表', '1525518292', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('102', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525518294', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('103', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525518306', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('104', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525518315', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('105', '1', 'HandleLog', 'index', '用户日志配置列表', '1525518317', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('106', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525518345', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('107', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525518595', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('108', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525518607', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('109', '1', 'HandleLog', 'index', '用户日志配置列表', '1525518609', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('110', '1', 'Menu', 'index', '未设置日志配置', '1525518830', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('111', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525518974', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('112', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525518975', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('113', '1', 'HandleLog', 'index', '用户日志配置列表', '1525518976', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('114', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525519091', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('115', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525519092', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('116', '1', 'HandleLog', 'index', '用户日志配置列表', '1525519094', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('117', '1', 'HandleLog', 'save', '修改用户日志配置', '1525519113', '127.0.0.1', '{\"data\":{\"DecorationTypeController\":{\"index\":\"test1\",\"adddecorationtype\":\"\",\"editdecorationtype\":\"\",\"deldecorationtype\":\"\",\"changedecorationtype\":\"\"},\"DialogController\":{\"map\":\"\"},\"HandleLogController\":{\"index\":\"u7528u6237u65e5u5fd7u914du7f6eu5217u8868\",\"save\":\"u4feeu6539u7528u6237u65e5u5fd7u914du7f6e\",\"handleloglist\":\"\"},\"HookController\":{\"index\":\"\",\"plugins\":\"\",\"pluginlistorder\":\"\",\"sync\":\"\"},\"IndexController\":{\"index\":\"\"},\"LinkController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"listorder\":\"\",\"toggle\":\"\"},\"MailerController\":{\"index\":\"\",\"indexpost\":\"\",\"template\":\"\",\"templatepost\":\"\",\"test\":\"\"},\"MainController\":{\"index\":\"\",\"dashboardwidget\":\"\"},\"MenuController\":{\"index\":\"\",\"lists\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"listorder\":\"\",\"getactions\":\"\"},\"MysqlHandleController\":{\"index\":\"\",\"operating\":\"\"},\"NavController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\"},\"NavMenuController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"listorder\":\"\"},\"OrderController\":{\"index\":\"u8bbfu95eeu5de5u5355u4e3bu9875u9762\",\"addorder\":\"\",\"addpost\":\"\",\"addtask\":\"\",\"publishingtasks\":\"\"},\"OrderTestController\":{\"index\":\"\",\"addorder\":\"\",\"taskdecomposition\":\"\",\"releasetask\":\"\",\"test\":\"\"},\"PatternController\":{\"index\":\"\",\"addpattern\":\"\",\"editpattern\":\"\",\"delpattern\":\"\",\"changepattern\":\"\"},\"PluginController\":{\"index\":\"\",\"toggle\":\"\",\"setting\":\"\",\"settingpost\":\"\",\"install\":\"\",\"update\":\"\",\"uninstall\":\"\"},\"PublicController\":{\"login\":\"\",\"dologin\":\"\",\"logout\":\"\"},\"RbacController\":{\"index\":\"\",\"roleadd\":\"\",\"roleaddpost\":\"\",\"roleedit\":\"\",\"roleeditpost\":\"\",\"roledelete\":\"\",\"authorize\":\"\",\"authorizepost\":\"\",\"member\":\"\"},\"RecycleBinController\":{\"index\":\"\",\"restore\":\"\",\"delete\":\"\"},\"RouteController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"ban\":\"\",\"open\":\"\",\"listorder\":\"\",\"select\":\"\",\"_suggest_url\":\"\",\"_url_vars\":\"\"},\"SettingController\":{\"site\":\"\",\"sitepost\":\"\",\"password\":\"\",\"passwordpost\":\"\",\"upload\":\"\",\"uploadpost\":\"\",\"clearcache\":\"\"},\"SlideController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\"},\"SlideItemController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"ban\":\"\",\"cancelban\":\"\",\"listorder\":\"\"},\"SmsController\":{\"getsmstellist\":\"\",\"getsendsmsloglist\":\"\",\"addsmstel\":\"\"},\"StorageController\":{\"index\":\"\",\"settingpost\":\"\"},\"StyleController\":{\"index\":\"\",\"addstyle\":\"\",\"editstyle\":\"\",\"delstyle\":\"\",\"changestyle\":\"\"},\"TestController\":{\"test\":\"\",\"test1\":\"\",\"test2\":\"\"},\"ThemeController\":{\"index\":\"\",\"install\":\"\",\"uninstall\":\"\",\"installtheme\":\"\",\"update\":\"\",\"active\":\"\",\"files\":\"\",\"filesetting\":\"\",\"filearraydata\":\"\",\"filearraydataedit\":\"\",\"filearraydataeditpost\":\"\",\"filearraydatadelete\":\"\",\"settingpost\":\"\",\"datasource\":\"\"},\"UserController\":{\"index\":\"u7528u6237u4e3bu9875u9762\",\"add\":\"u7528u6237u6dfbu52a0u9875u9762\",\"addpost\":\"\",\"edit\":\"u7528u6237u4feeu6539u9875u9762\",\"editpost\":\"\",\"userinfo\":\"\",\"userinfopost\":\"\",\"delete\":\"\",\"ban\":\"\",\"cancelban\":\"\"}}}', '', '0', 'edit');
INSERT INTO `bangbang_user_handle_log` VALUES ('118', '1', 'HandleLog', 'index', '用户日志配置列表', '1525519117', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('119', '1', 'HandleLog', 'index', '用户日志配置列表', '1525519119', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('120', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1525519122', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('121', '1', 'HandleLog', 'index', '用户日志配置列表', '1525519131', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('122', '1', 'HandleLog', 'save', '修改用户日志配置', '1525519205', '127.0.0.1', '{\"data\":{\"DecorationTypeController\":{\"index\":\"test1\",\"adddecorationtype\":\"\",\"editdecorationtype\":\"\",\"deldecorationtype\":\"\",\"changedecorationtype\":\"\"},\"DialogController\":{\"map\":\"\"},\"HandleLogController\":{\"index\":\"u7528u6237u65e5u5fd7u914du7f6eu5217u8868\",\"save\":\"u4feeu6539u7528u6237u65e5u5fd7u914du7f6e\",\"handleloglist\":\"u7528u6237u64cdu4f5cu65e5u5fd7u5217u8868\"},\"HookController\":{\"index\":\"\",\"plugins\":\"\",\"pluginlistorder\":\"\",\"sync\":\"\"},\"IndexController\":{\"index\":\"\"},\"LinkController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"listorder\":\"\",\"toggle\":\"\"},\"MailerController\":{\"index\":\"\",\"indexpost\":\"\",\"template\":\"\",\"templatepost\":\"\",\"test\":\"\"},\"MainController\":{\"index\":\"\",\"dashboardwidget\":\"\"},\"MenuController\":{\"index\":\"\",\"lists\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"listorder\":\"\",\"getactions\":\"\"},\"MysqlHandleController\":{\"index\":\"\",\"operating\":\"\"},\"NavController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\"},\"NavMenuController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"listorder\":\"\"},\"OrderController\":{\"index\":\"u8bbfu95eeu5de5u5355u4e3bu9875u9762\",\"addorder\":\"\",\"addpost\":\"\",\"addtask\":\"\",\"publishingtasks\":\"\"},\"OrderTestController\":{\"index\":\"\",\"addorder\":\"\",\"taskdecomposition\":\"\",\"releasetask\":\"\",\"test\":\"\"},\"PatternController\":{\"index\":\"\",\"addpattern\":\"\",\"editpattern\":\"\",\"delpattern\":\"\",\"changepattern\":\"\"},\"PluginController\":{\"index\":\"\",\"toggle\":\"\",\"setting\":\"\",\"settingpost\":\"\",\"install\":\"\",\"update\":\"\",\"uninstall\":\"\"},\"PublicController\":{\"login\":\"\",\"dologin\":\"\",\"logout\":\"\"},\"RbacController\":{\"index\":\"\",\"roleadd\":\"\",\"roleaddpost\":\"\",\"roleedit\":\"\",\"roleeditpost\":\"\",\"roledelete\":\"\",\"authorize\":\"\",\"authorizepost\":\"\",\"member\":\"\"},\"RecycleBinController\":{\"index\":\"\",\"restore\":\"\",\"delete\":\"\"},\"RouteController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"ban\":\"\",\"open\":\"\",\"listorder\":\"\",\"select\":\"\",\"_suggest_url\":\"\",\"_url_vars\":\"\"},\"SettingController\":{\"site\":\"\",\"sitepost\":\"\",\"password\":\"\",\"passwordpost\":\"\",\"upload\":\"\",\"uploadpost\":\"\",\"clearcache\":\"\"},\"SlideController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\"},\"SlideItemController\":{\"index\":\"\",\"add\":\"\",\"addpost\":\"\",\"edit\":\"\",\"editpost\":\"\",\"delete\":\"\",\"ban\":\"\",\"cancelban\":\"\",\"listorder\":\"\"},\"SmsController\":{\"getsmstellist\":\"\",\"getsendsmsloglist\":\"\",\"addsmstel\":\"\"},\"StorageController\":{\"index\":\"\",\"settingpost\":\"\"},\"StyleController\":{\"index\":\"\",\"addstyle\":\"\",\"editstyle\":\"\",\"delstyle\":\"\",\"changestyle\":\"\"},\"TestController\":{\"test\":\"\",\"test1\":\"\",\"test2\":\"\"},\"ThemeController\":{\"index\":\"\",\"install\":\"\",\"uninstall\":\"\",\"installtheme\":\"\",\"update\":\"\",\"active\":\"\",\"files\":\"\",\"filesetting\":\"\",\"filearraydata\":\"\",\"filearraydataedit\":\"\",\"filearraydataeditpost\":\"\",\"filearraydatadelete\":\"\",\"settingpost\":\"\",\"datasource\":\"\"},\"UserController\":{\"index\":\"u7528u6237u4e3bu9875u9762\",\"add\":\"u7528u6237u6dfbu52a0u9875u9762\",\"addpost\":\"\",\"edit\":\"u7528u6237u4feeu6539u9875u9762\",\"editpost\":\"\",\"userinfo\":\"\",\"userinfopost\":\"\",\"delete\":\"\",\"ban\":\"\",\"cancelban\":\"\"}}}', '', '0', 'edit');
INSERT INTO `bangbang_user_handle_log` VALUES ('123', '1', 'HandleLog', 'index', '用户日志配置列表', '1525519209', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('124', '1', 'Index', 'index', '未设置日志配置', '1525519211', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('125', '1', 'Main', 'index', '未设置日志配置', '1525519213', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('126', '1', 'Index', 'index', '未设置日志配置', '1525519225', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('127', '1', 'Main', 'index', '未设置日志配置', '1525519226', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('128', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519230', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('129', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519236', '127.0.0.1', '{\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('130', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519238', '127.0.0.1', '{\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('131', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519481', '127.0.0.1', '{\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('132', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519508', '127.0.0.1', '{\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('133', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519511', '127.0.0.1', '{\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('134', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519547', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('135', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519599', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('136', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519646', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('137', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519753', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('138', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519862', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('139', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519955', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('140', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525519995', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('141', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525520010', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('142', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521018', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('143', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521045', '127.0.0.1', '{\"keywordType\":\"orderNum\",\"keyword\":\"admin\",\"start_time\":\"\",\"end_time\":\"\",\"type\":\"userTel\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('144', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521152', '127.0.0.1', '{\"keywordType\":\"orderNum\",\"keyword\":\"admin\",\"start_time\":\"\",\"end_time\":\"\",\"type\":\"userTel\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('145', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521191', '127.0.0.1', '{\"keywordType\":\"orderNum\",\"keyword\":\"admin\",\"start_time\":\"\",\"end_time\":\"\",\"type\":\"userTel\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('146', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521198', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('147', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521224', '127.0.0.1', '{\"keywordType\":\"userLogin\",\"keyword\":\"admin\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"edit\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('148', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521230', '127.0.0.1', '{\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('149', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521235', '127.0.0.1', '{\"type\":\"access\",\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('150', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521241', '127.0.0.1', '{\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('151', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521244', '127.0.0.1', '{\"page\":\"3\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('152', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521260', '127.0.0.1', '{\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\",\"page\":\"3\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('153', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521279', '127.0.0.1', '{\"type\":\"access\",\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('154', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525521839', '127.0.0.1', '{\"type\":\"access\",\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('155', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522493', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\",\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('156', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522500', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('157', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522519', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('158', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522572', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('159', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522578', '127.0.0.1', '{\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('160', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522581', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\",\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('161', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522600', '127.0.0.1', '{\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\",\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('162', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522618', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\",\"page\":\"3\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('163', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522695', '127.0.0.1', '{\"keywordType\":\"userLogin\",\"keyword\":\"admin\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"access\",\"page\":\"3\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('164', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522880', '127.0.0.1', '{\"type\":\"access\",\"page\":\"3\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('165', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522905', '127.0.0.1', '{\"type\":\"access\",\"page\":\"3\",\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('166', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522916', '127.0.0.1', '{\"type\":\"access\",\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"page\":\"2\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('167', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522919', '127.0.0.1', '{\"type\":\"access\",\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('168', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522923', '127.0.0.1', '{\"type\":\"access\",\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"page\":\"3\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('169', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522927', '127.0.0.1', '{\"type\":\"access\",\"keywordType\":\"u8bf7u9009u62e9\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('170', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522942', '127.0.0.1', '{\"type\":\"access\",\"keywordType\":\"userLogin\",\"keyword\":\"admin\",\"startTime\":\"\",\"endTime\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('171', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525522996', '127.0.0.1', '{\"type\":\"access\",\"keywordType\":\"userLogin\",\"keyword\":\"admin\",\"startTime\":\"\",\"endTime\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('172', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525523422', '127.0.0.1', '{\"type\":\"access\",\"keywordType\":\"userLogin\",\"keyword\":\"admin\",\"startTime\":\"\",\"endTime\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('173', '1', 'Order', 'index', '访问工单主页面', '1525525307', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('174', '1', 'Order', 'addorder', '未设置日志配置', '1525525312', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('175', '1', 'AdminArticle', 'index', '未设置日志配置', '1525525362', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('176', '1', 'AdminCategory', 'index', '未设置日志配置', '1525525363', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('177', '1', 'AdminCategory', 'add', '未设置日志配置', '1525525368', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('178', '1', 'AdminCategory', 'addpost', '未设置日志配置', '1525525392', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('179', '1', 'AdminCategory', 'add', '未设置日志配置', '1525525410', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('180', '1', 'AdminCategory', 'add', '未设置日志配置', '1525525410', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('181', '1', 'AdminCategory', 'index', '未设置日志配置', '1525525411', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('182', '1', 'AdminCategory', 'add', '未设置日志配置', '1525525412', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('183', '1', 'AdminCategory', 'add', '未设置日志配置', '1525525451', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('184', '1', 'AdminCategory', 'index', '未设置日志配置', '1525525452', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('185', '1', 'AdminCategory', 'add', '未设置日志配置', '1525525455', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('186', '1', 'Index', 'index', '未设置日志配置', '1525584720', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('187', '1', 'Main', 'index', '未设置日志配置', '1525584722', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('188', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525584728', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('189', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525584746', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\",\"page\":\"3\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('190', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525584748', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('191', '1', 'Index', 'index', '未设置日志配置', '1525585015', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('192', '1', 'Main', 'index', '未设置日志配置', '1525585016', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('193', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525585068', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('194', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525585120', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('195', '1', 'Style', 'addstyle', '未设置日志配置', '1525585155', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('196', '1', 'Style', 'addstyle', '未设置日志配置', '1525585162', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('197', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525585165', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('198', '1', 'Style', 'addstyle', '未设置日志配置', '1525585205', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('199', '1', 'Style', 'addstyle', '未设置日志配置', '1525585247', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('200', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525585261', '127.0.0.1', '{\"keywordType\":\"\",\"keyword\":\"\",\"startTime\":\"\",\"endTime\":\"\",\"type\":\"\",\"page\":\"1\"}', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('201', '1', 'Style', 'addstyle', '未设置日志配置', '1525585286', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('202', '1', 'Style', 'addstyle', '未设置日志配置', '1525585338', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('203', '1', 'Style', 'addstyle', '未设置日志配置', '1525585359', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('204', '1', 'Style', 'addstyle', '未设置日志配置', '1525585410', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('205', '1', 'Style', 'addstyle', '未设置日志配置', '1525585635', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('206', '1', 'Style', 'addstyle', '未设置日志配置', '1525585646', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('207', '1', 'Style', 'addstyle', '未设置日志配置', '1525585678', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('208', '1', 'Style', 'addstyle', '未设置日志配置', '1525585679', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('209', '1', 'Index', 'index', '未设置日志配置', '1525619915', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('210', '1', 'Main', 'index', '未设置日志配置', '1525619916', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('211', '1', 'HandleLog', 'handleloglist', '用户操作日志列表', '1525619922', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('212', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525619924', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('213', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1525619927', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('214', '1', 'MysqlHandle', 'index', '未设置日志配置', '1525619928', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('215', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1525619930', '127.0.0.1', '', '', '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('216', '1', 'Index', 'index', '未设置日志配置', '1525688625', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('217', '1', 'Main', 'index', '未设置日志配置', '1525688627', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('218', '1', 'Style', 'addstyle', '未设置日志配置', '1525689117', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('219', '1', 'Style', 'addstyle', '未设置日志配置', '1525689198', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('220', '1', 'Style', 'addstyle', '未设置日志配置', '1525689284', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('221', '1', 'Style', 'addstyle', '未设置日志配置', '1525689303', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('222', '1', 'Style', 'addstyle', '未设置日志配置', '1525689632', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('223', '1', 'Style', 'addstyle', '未设置日志配置', '1525690320', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('224', '1', 'Style', 'addstyle', '未设置日志配置', '1525690366', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('225', '1', 'Index', 'index', '未设置日志配置', '1525918498', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('226', '1', 'Main', 'index', '未设置日志配置', '1525918498', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('227', '1', 'Style', 'addstyle', '未设置日志配置', '1525918523', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('228', '1', 'Style', 'addstyle', '未设置日志配置', '1525918933', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('229', '1', 'Rbac', 'index', '未设置日志配置', '1525920450', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('230', '1', 'User', 'index', '未设置日志配置', '1525920452', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('231', '1', 'Slide', 'index', '未设置日志配置', '1525920516', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('232', '1', 'Rbac', 'index', '未设置日志配置', '1525920532', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('233', '1', 'Index', 'index', '未设置日志配置', '1526021132', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('234', '1', 'Main', 'index', '未设置日志配置', '1526021132', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('235', '1', 'Setting', 'clearcache', '未设置日志配置', '1526025608', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('236', '1', 'RecycleBin', 'index', '未设置日志配置', '1526025611', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('237', '1', 'Index', 'index', '未设置日志配置', '1526025616', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('238', '1', 'Main', 'index', '未设置日志配置', '1526025617', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('239', '1', 'RecycleBin', 'index', '未设置日志配置', '1526025618', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('240', '1', 'Style', 'addstyle', '未设置日志配置', '1526034824', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('241', '1', 'Style', 'addstyle', '未设置日志配置', '1526034835', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('242', '1', 'Style', 'addstyle', '未设置日志配置', '1526034906', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('243', '1', 'Style', 'addstyle', '未设置日志配置', '1526034911', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('244', '1', 'Style', 'addstyle', '未设置日志配置', '1526034919', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('245', '1', 'Style', 'addstyle', '未设置日志配置', '1526034927', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('246', '1', 'Style', 'addstyle', '未设置日志配置', '1526034987', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('247', '1', 'Style', 'addstyle', '未设置日志配置', '1526035051', '127.0.0.1', '{\"tagName\":\"\\u4e00\\u5ba4\\u4e00\\u5385\",\"more\":{\"thumbnail\":\"\"},\"status\":1,\"type\":\"style\"}', '', '0', 'add');
INSERT INTO `bangbang_user_handle_log` VALUES ('248', '1', 'Style', 'addstyle', '未设置日志配置', '1526035109', '127.0.0.1', '{\"tagName\":\"\\u4e8c\\u5ba4\\u4e00\\u5385\",\"more\":{\"thumbnail\":\"\"},\"status\":1,\"type\":\"style\"}', '', '2', 'add');
INSERT INTO `bangbang_user_handle_log` VALUES ('249', '1', 'Style', 'addstyle', '未设置日志配置', '1526035281', '127.0.0.1', '{\"tagName\":\"\\u4e09\\u5ba4\\u4e00\\u5385\",\"more\":{\"thumbnail\":\"\"},\"status\":1,\"type\":\"style\"}', '', '3', 'add');
INSERT INTO `bangbang_user_handle_log` VALUES ('250', '1', 'Style', 'addstyle', '未设置日志配置', '1526035288', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('251', '1', 'Style', 'addstyle', '未设置日志配置', '1526035319', '127.0.0.1', '{\"tagName\":\"\\u4e09\\u5ba4\\u4e24\\u5385\",\"more\":{\"thumbnail\":\"\"},\"status\":1,\"type\":\"style\"}', '', '4', 'add');
INSERT INTO `bangbang_user_handle_log` VALUES ('252', '1', 'Style', 'addstyle', '未设置日志配置', '1526035367', '127.0.0.1', '{\"tagName\":\"\\u56db\\u5ba4\\u4e24\\u5385\",\"more\":{\"thumbnail\":\"\"},\"status\":1,\"type\":\"style\"}', '', '5', 'add');
INSERT INTO `bangbang_user_handle_log` VALUES ('253', '1', 'Style', 'addstyle', '未设置日志配置', '1526035369', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('254', '1', 'Style', 'addstyle', '未设置日志配置', '1526035423', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('255', '1', 'Style', 'addstyle', '未设置日志配置', '1526035891', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('256', '1', 'Index', 'index', '未设置日志配置', '1526035970', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('257', '1', 'Main', 'index', '未设置日志配置', '1526035971', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('258', '1', 'MysqlHandle', 'index', '未设置日志配置', '1526035979', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('259', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1526035981', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('260', '1', 'MysqlHandle', 'index', '未设置日志配置', '1526035985', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('261', '1', 'Index', 'index', '未设置日志配置', '1526463714', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('262', '1', 'Main', 'index', '未设置日志配置', '1526463715', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('263', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1526463722', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('264', '1', 'Index', 'index', '未设置日志配置', '1527391281', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('265', '1', 'Main', 'index', '未设置日志配置', '1527391281', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('266', '1', 'Style', 'addstyle', '未设置日志配置', '1527391314', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('267', '1', 'Style', 'index', '未设置日志配置', '1527391326', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('268', '1', 'Style', 'styleindex', '未设置日志配置', '1527391338', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('269', '1', 'Style', 'styleindex', '未设置日志配置', '1527391381', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('270', '1', 'Style', 'styleindex', '未设置日志配置', '1527391879', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('271', '1', 'Style', 'styleindex', '未设置日志配置', '1527391969', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('272', '1', 'Style', 'styleindex', '未设置日志配置', '1527391981', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('273', '1', 'Style', 'styleindex', '未设置日志配置', '1527392000', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('274', '1', 'Style', 'styleindex', '未设置日志配置', '1527392012', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('275', '1', 'Index', 'index', '未设置日志配置', '1527392047', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('276', '1', 'Main', 'index', '未设置日志配置', '1527392048', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('277', '1', 'HandleLog', 'index', '未设置日志配置', '1527392073', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('278', '1', 'AdminUserAction', 'index', '未设置日志配置', '1527392079', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('279', '1', 'HandleLog', 'index', '未设置日志配置', '1527392080', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('280', '1', 'HandleLog', 'index', '未设置日志配置', '1527392085', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('281', '1', 'Setting', 'site', '未设置日志配置', '1527392119', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('282', '1', 'Setting', 'clearcache', '未设置日志配置', '1527392128', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('283', '1', 'Menu', 'index', '未设置日志配置', '1527392133', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('284', '1', 'Menu', 'add', '未设置日志配置', '1527392135', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('285', '1', 'Menu', 'index', '未设置日志配置', '1527392137', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('286', '1', 'Menu', 'add', '未设置日志配置', '1527392139', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('287', '1', 'Menu', 'lists', '未设置日志配置', '1527392140', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('288', '1', 'Menu', 'index', '未设置日志配置', '1527392181', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('289', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1527392204', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('290', '1', 'HandleLog', 'index', '未设置日志配置', '1527392239', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('291', '1', 'HandleLog', 'index', '未设置日志配置', '1527392309', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('292', '1', 'HandleLog', 'index', '未设置日志配置', '1527392310', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('293', '1', 'HandleLog', 'index', '未设置日志配置', '1527392376', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('294', '1', 'HandleLog', 'index', '未设置日志配置', '1527392520', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('295', '1', 'HandleLog', 'index', '未设置日志配置', '1527392629', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('296', '1', 'AdminUserAction', 'index', '未设置日志配置', '1527392632', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('297', '1', 'HandleLog', 'handleloglist', '未设置日志配置', '1527392637', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('298', '1', 'AdminUserAction', 'index', '未设置日志配置', '1527392644', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('299', '1', 'AdminUserAction', 'index', '未设置日志配置', '1527392661', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('300', '1', 'Style', 'styleindex', '未设置日志配置', '1527392805', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('301', '1', 'Style', 'styleindex', '未设置日志配置', '1527392807', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('302', '1', 'Style', 'styleindex', '未设置日志配置', '1527392829', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('303', '1', 'Style', 'styleindex', '未设置日志配置', '1527392996', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('304', '1', 'Style', 'styleindex', '未设置日志配置', '1527393030', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('305', '1', 'Style', 'styleindex', '未设置日志配置', '1527393050', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('306', '1', 'Style', 'styleindex', '未设置日志配置', '1527393052', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('307', '1', 'Style', 'styleindex', '未设置日志配置', '1527393054', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('308', '1', 'Style', 'styleindex', '未设置日志配置', '1527393085', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('309', '1', 'Style', 'styleindex', '未设置日志配置', '1527393151', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('310', '1', 'Style', 'styleindex', '未设置日志配置', '1527393624', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('311', '1', 'Style', 'styleindex', '未设置日志配置', '1527396520', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('312', '1', 'Style', 'styleindex', '未设置日志配置', '1527396548', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('313', '1', 'Style', 'styleindex', '未设置日志配置', '1527396550', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('314', '1', 'Style', 'styleindex', '未设置日志配置', '1527396572', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('315', '1', 'Style', 'styleindex', '未设置日志配置', '1527397620', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('316', '1', 'Style', 'styleindex', '未设置日志配置', '1527397822', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('317', '1', 'Style', 'styleindex', '未设置日志配置', '1527397824', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('318', '1', 'Style', 'styleindex', '未设置日志配置', '1527397896', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('319', '1', 'AdminUserAction', 'index', '未设置日志配置', '1527397922', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('320', '1', 'AdminUserAction', 'index', '未设置日志配置', '1527397998', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('321', '1', 'Style', 'styleindex', '未设置日志配置', '1527398147', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('322', '1', 'Style', 'styleindex', '未设置日志配置', '1527398148', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('323', '1', 'Style', 'styleindex', '未设置日志配置', '1527398149', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('324', '1', 'Style', 'styleindex', '未设置日志配置', '1527398150', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('325', '1', 'Style', 'styleindex', '未设置日志配置', '1527398151', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('326', '1', 'Style', 'styleindex', '未设置日志配置', '1527398151', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('327', '1', 'Style', 'styleindex', '未设置日志配置', '1527398152', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('328', '1', 'Demo', 'listdemo', '未设置日志配置', '1527398211', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('329', '1', 'Demo', 'listdemo', '未设置日志配置', '1527398938', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('330', '1', 'Demo', 'listdemo', '未设置日志配置', '1527399462', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('331', '1', 'Demo', 'listdemo', '未设置日志配置', '1527399503', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('332', '1', 'Demo', 'listdemo', '未设置日志配置', '1527399700', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('333', '1', 'Demo', 'listdemo', '未设置日志配置', '1527399724', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('334', '1', 'Demo', 'listdemo', '未设置日志配置', '1527399879', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('335', '1', 'Demo', 'listdemo', '未设置日志配置', '1527399899', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('336', '1', 'Demo', 'listdemo', '未设置日志配置', '1527399901', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('337', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400262', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('338', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400274', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('339', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400456', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('340', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400461', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('341', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400472', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('342', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400489', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('343', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400783', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('344', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400801', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('345', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400847', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('346', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400849', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('347', '1', 'Demo', 'listdemo', '未设置日志配置', '1527400851', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('348', '1', 'Demo', 'listdemo', '未设置日志配置', '1527401054', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('349', '1', 'AdminIndex', 'index', '未设置日志配置', '1527401077', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('350', '1', 'Demo', 'listdemos', '未设置日志配置', '1527401893', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('351', '1', 'Demo', 'listdemos', '未设置日志配置', '1527401909', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('352', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402107', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('353', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402156', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('354', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402160', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('355', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402188', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('356', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402207', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('357', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402209', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('358', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402552', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('359', '1', 'Demo', 'listdemos', '未设置日志配置', '1527402731', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('360', '1', 'Demo', 'listdemo', '未设置日志配置', '1527402735', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('361', '1', 'Demo', 'listdemos', '未设置日志配置', '1527403551', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('362', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404044', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('363', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404095', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('364', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404097', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('365', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404098', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('366', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404139', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('367', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404148', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('368', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404257', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('369', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404261', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('370', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404271', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('371', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404406', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('372', '1', 'Menu', 'index', '未设置日志配置', '1527404467', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('373', '1', 'Index', 'index', '未设置日志配置', '1527404469', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('374', '1', 'Main', 'index', '未设置日志配置', '1527404470', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('375', '1', 'Demo', 'listdemo', '未设置日志配置', '1527404843', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('376', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405089', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('377', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405322', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('378', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405584', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('379', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405651', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('380', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405685', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('381', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405695', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('382', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405779', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('383', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405784', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('384', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405807', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('385', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405809', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('386', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405832', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('387', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405856', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('388', '1', 'Demo', 'listdemo', '未设置日志配置', '1527405860', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('389', '1', 'HandleLog', 'index', '未设置日志配置', '1527406023', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('390', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406068', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('391', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406073', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('392', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406075', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('393', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406077', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('394', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406198', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('395', '1', 'Demo', 'plugins', '未设置日志配置', '1527406199', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('396', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406220', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('397', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406237', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('398', '1', 'Demo', 'listdemo', '未设置日志配置', '1527406491', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('399', '1', 'Rbac', 'index', '未设置日志配置', '1527408880', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('400', '1', 'User', 'index', '未设置日志配置', '1527408881', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('401', '1', 'Rbac', 'index', '未设置日志配置', '1527408891', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('402', '1', 'User', 'index', '未设置日志配置', '1527408892', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('403', '1', 'Demo', 'listdemo', '未设置日志配置', '1527409013', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('404', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411232', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('405', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411305', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('406', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411356', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('407', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411387', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('408', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411391', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('409', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411549', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('410', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411553', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('411', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411555', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('412', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411561', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('413', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411564', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('414', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411615', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('415', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411658', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('416', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411705', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('417', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411743', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('418', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411785', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('419', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411787', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('420', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411811', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('421', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411830', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('422', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411842', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('423', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411864', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('424', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411867', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('425', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411883', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('426', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411911', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('427', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411988', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('428', '1', 'Demo', 'listdemo', '未设置日志配置', '1527411990', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('429', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412027', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('430', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412056', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('431', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412082', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('432', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412084', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('433', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412187', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('434', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412200', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('435', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412228', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('436', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412244', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('437', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412372', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('438', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412394', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('439', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412430', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('440', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412433', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('441', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412467', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('442', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412476', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('443', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412569', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('444', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412578', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('445', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412603', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('446', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412682', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('447', '1', 'Demo', 'listdemo', '未设置日志配置', '1527412793', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('448', '1', 'Demo', 'listdemos', '未设置日志配置', '1527413141', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('449', '1', 'Demo', 'listdemo', '未设置日志配置', '1527413144', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('450', '1', 'Demo', 'listdemo', '未设置日志配置', '1527413556', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('451', '1', 'MysqlHandle', 'index', '未设置日志配置', '1527414593', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('452', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1527414597', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('453', '1', 'MysqlHandle', 'index', '未设置日志配置', '1527414599', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('454', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1527414603', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('455', '1', 'MysqlHandle', 'index', '未设置日志配置', '1527414605', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('456', '1', 'MysqlHandle', 'operating', '未设置日志配置', '1527414606', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('457', '1', 'MysqlHandle', 'index', '未设置日志配置', '1527414610', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('458', '1', 'Index', 'index', '未设置日志配置', '1527475956', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('459', '1', 'Main', 'index', '未设置日志配置', '1527475956', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('460', '1', 'Plugin', 'index', '未设置日志配置', '1527475964', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('461', '1', 'Plugin', 'install', '未设置日志配置', '1527475986', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('462', '1', 'Plugin', 'index', '未设置日志配置', '1527475988', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('463', '1', 'Plugin', 'index', '未设置日志配置', '1527475989', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('464', '1', 'Plugin', 'toggle', '未设置日志配置', '1527475996', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('465', '1', 'Plugin', 'index', '未设置日志配置', '1527475998', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('466', '1', 'Index', 'index', '未设置日志配置', '1527476681', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('467', '1', 'Main', 'index', '未设置日志配置', '1527476682', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('468', '1', 'Theme', 'index', '未设置日志配置', '1527476692', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('469', '1', 'Theme', 'install', '未设置日志配置', '1527476699', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('470', '1', 'Index', 'index', '未设置日志配置', '1527476925', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('471', '1', 'Main', 'index', '未设置日志配置', '1527476926', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('472', '1', 'Index', 'index', '未设置日志配置', '1527476929', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('473', '1', 'Main', 'index', '未设置日志配置', '1527476930', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('474', '1', 'Index', 'index', '未设置日志配置', '1527484574', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('475', '1', 'Main', 'index', '未设置日志配置', '1527484575', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('476', '1', 'Setting', 'clearcache', '未设置日志配置', '1527484630', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('477', '1', 'Plugin', 'index', '未设置日志配置', '1527484651', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('478', '1', 'Plugin', 'toggle', '未设置日志配置', '1527484660', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('479', '1', 'Plugin', 'index', '未设置日志配置', '1527484662', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('480', '1', 'Index', 'index', '未设置日志配置', '1527484666', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('481', '1', 'Main', 'index', '未设置日志配置', '1527484667', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('482', '1', 'Index', 'index', '未设置日志配置', '1527485454', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('483', '1', 'Main', 'index', '未设置日志配置', '1527485455', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('484', '1', 'Demo', 'listdemo', '未设置日志配置', '1527488127', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('485', '1', 'Demo', 'listdemo', '未设置日志配置', '1527489580', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('486', '1', 'Demo', 'listdemo', '未设置日志配置', '1527489582', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('487', '1', 'Demo', 'listdemo', '未设置日志配置', '1527489865', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('488', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490042', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('489', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490044', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('490', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490215', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('491', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490216', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('492', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490225', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('493', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490301', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('494', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490307', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('495', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490309', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('496', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490312', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('497', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490313', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('498', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490332', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('499', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490334', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('500', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490350', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('501', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490352', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('502', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490405', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('503', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490407', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('504', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490408', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('505', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490409', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('506', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490409', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('507', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490410', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('508', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490411', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('509', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490411', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('510', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490412', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('511', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490412', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('512', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490412', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('513', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490476', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('514', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490479', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('515', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490568', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('516', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490569', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('517', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490571', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('518', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490605', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('519', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490606', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('520', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490615', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('521', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490618', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('522', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490669', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('523', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490670', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('524', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490671', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('525', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490672', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('526', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490673', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('527', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490698', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('528', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490699', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('529', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490700', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('530', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490700', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('531', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490700', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('532', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490700', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('533', '1', 'Demo', 'listdemo', '未设置日志配置', '1527490957', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('534', '1', 'Demo', 'listdemo', '未设置日志配置', '1527491103', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('535', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492429', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('536', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492432', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('537', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492433', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('538', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492433', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('539', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492437', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('540', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492438', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('541', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492438', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('542', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492438', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('543', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492456', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('544', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492471', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('545', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492472', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('546', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492473', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('547', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492473', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('548', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492473', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('549', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492473', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('550', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492479', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('551', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492505', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('552', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492588', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('553', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492610', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('554', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492612', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('555', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492613', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('556', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492614', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('557', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492614', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('558', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492625', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('559', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492627', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('560', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492629', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('561', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492631', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('562', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492632', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('563', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492666', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('564', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492667', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('565', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492668', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('566', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492668', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('567', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492668', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('568', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492690', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('569', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492727', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('570', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492730', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('571', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492770', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('572', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492791', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('573', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492842', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('574', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492855', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('575', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492881', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('576', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492883', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('577', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492898', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('578', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492920', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('579', '1', 'Demo', 'listdemo', '未设置日志配置', '1527492959', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('580', '1', 'Demo', 'listdemo', '未设置日志配置', '1527493064', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('581', '1', 'Demo', 'listdemo', '未设置日志配置', '1527493107', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('582', '1', 'Demo', 'listdemo', '未设置日志配置', '1527493297', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('583', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494315', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('584', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494317', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('585', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494365', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('586', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494375', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('587', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494377', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('588', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494379', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('589', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494406', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('590', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494408', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('591', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494408', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('592', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494409', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('593', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494410', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('594', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494413', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('595', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494413', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('596', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494414', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('597', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494414', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('598', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494435', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('599', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494449', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('600', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494459', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('601', '1', 'Demo', 'listdemo', '未设置日志配置', '1527494461', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('602', '1', 'Main', 'dashboardwidget', '未设置日志配置', '1527496427', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('603', '1', 'Main', 'dashboardwidget', '未设置日志配置', '1527496431', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('604', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497158', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('605', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497192', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('606', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497197', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('607', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497356', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('608', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497358', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('609', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497420', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('610', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497563', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('611', '1', 'Demo', 'listdemo', '未设置日志配置', '1527497602', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('612', '1', 'Demo', 'listdemo', '未设置日志配置', '1527498179', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('613', '1', 'Demo', 'listdemo', '未设置日志配置', '1527498433', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('614', '1', 'Demo', 'listdemo', '未设置日志配置', '1527498438', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('615', '1', 'Demo', 'listdemo', '未设置日志配置', '1527498510', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('616', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499042', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('617', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499046', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('618', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499095', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('619', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499106', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('620', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499199', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('621', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499221', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('622', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499436', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('623', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499438', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('624', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499502', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('625', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499504', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('626', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499506', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('627', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499507', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('628', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499507', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('629', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499508', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('630', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499659', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('631', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499669', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('632', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499702', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('633', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499910', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('634', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499930', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('635', '1', 'Demo', 'listdemo', '未设置日志配置', '1527499933', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('636', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500059', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('637', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500063', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('638', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500068', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('639', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500089', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('640', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500214', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('641', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500226', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('642', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500228', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('643', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500292', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('644', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500352', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('645', '1', 'Demo', 'listdemo', '未设置日志配置', '1527500474', '127.0.0.1', null, null, '0', 'access');
INSERT INTO `bangbang_user_handle_log` VALUES ('646', '1', 'Demo', 'index', '未设置日志配置', '1527500478', '127.0.0.1', null, null, '0', 'access');

-- ----------------------------
-- Table structure for bangbang_user_login_attempt
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_login_attempt`;
CREATE TABLE `bangbang_user_login_attempt` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login_attempts` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试次数',
  `attempt_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '尝试登录时间',
  `locked_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户 ip',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '用户账号,手机号,邮箱或用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户登录尝试表';

-- ----------------------------
-- Records of bangbang_user_login_attempt
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_score_log`;
CREATE TABLE `bangbang_user_score_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '用户操作名称',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '更改积分，可以为负',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '更改金币，可以为负',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户操作积分等奖励日志表';

-- ----------------------------
-- Records of bangbang_user_score_log
-- ----------------------------

-- ----------------------------
-- Table structure for bangbang_user_token
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_user_token`;
CREATE TABLE `bangbang_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of bangbang_user_token
-- ----------------------------
INSERT INTO `bangbang_user_token` VALUES ('1', '1', '1534851311', '1519299311', '75d1f1fbe77aa5e81c3edb5f8b757653ef4c03be0d050be6826d2839798d5f9e', 'web');
INSERT INTO `bangbang_user_token` VALUES ('2', '2', '1538364169', '1522812169', 'e0cd8a5228586b9510616f834eebe714108f908948c5c3517be1000dfff16a52', 'web');

-- ----------------------------
-- Table structure for bangbang_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `bangbang_verification_code`;
CREATE TABLE `bangbang_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of bangbang_verification_code
-- ----------------------------
