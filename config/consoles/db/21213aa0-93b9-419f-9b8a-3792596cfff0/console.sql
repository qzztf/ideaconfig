/*

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bpm_form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `DEF_ID` varchar(50) DEFAULT NULL COMMENT '表单元数据定义ID',
  `NAME` varchar(200) DEFAULT NULL COMMENT '表单名称',
  `FORM_KEY` varchar(50) DEFAULT NULL COMMENT '表单key',
  `DESC` varchar(200) DEFAULT NULL COMMENT '描述',
  `FORM_HTML` longtext COMMENT '表单定义HTML',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '状态 draft=草稿；deploy=发布',
  `FORM_TYPE` varchar(20) DEFAULT NULL COMMENT '表单类型 分为 pc,mobile',
  `TYPE_ID` varchar(50) DEFAULT NULL COMMENT '所属分类ID',
  `TYPENAME` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `IS_MAIN` char(1) DEFAULT NULL COMMENT '是否主版本',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本号',
  `CREATE_BY` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(50) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `FORM_TAB_TITLE` varchar(200) DEFAULT NULL COMMENT '表单tab标题',
  `rev` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idx_form_key` (`FORM_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单定义';

-- ----------------------------
-- Table structure for bpm_form_bo
-- ----------------------------
DROP TABLE IF EXISTS `form_bo`;
CREATE TABLE `form_bo` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `FORM_ID` varchar(50) DEFAULT NULL COMMENT '表单ID',
  `BO_DEF_ID` varchar(50) DEFAULT NULL COMMENT 'BO定义ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单和BO的关联';

-- ----------------------------
-- Table structure for bpm_form_def
-- ----------------------------
DROP TABLE IF EXISTS `form_def`;
CREATE TABLE `form_def` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `KEY_` varchar(50) DEFAULT NULL COMMENT '表单key值',
  `NAME` varchar(50) DEFAULT NULL COMMENT '定义名称',
  `TYPE` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `TYPE_ID` varchar(50) DEFAULT NULL COMMENT '分类',
  `EXPAND` longtext COMMENT '扩展字段',
  `OPINION_CONF_` varchar(1000) DEFAULT NULL COMMENT '意见配置',
  `CREATE_BY` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(50) DEFAULT NULL COMMENT '最后更新人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `CREATE_ORG_ID` varchar(255) DEFAULT NULL COMMENT '创建组织',
  `DESC` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单元数据定义';

-- ----------------------------
-- Table structure for bpm_form_field
-- ----------------------------
DROP TABLE IF EXISTS `form_field`;
CREATE TABLE `form_field` (
  `ID` varchar(20) NOT NULL COMMENT '主键',
  `NAME` varchar(50) DEFAULT NULL COMMENT '字段名',
  `DESC` varchar(100) DEFAULT NULL COMMENT '描述',
  `FORM_ID` varchar(50) DEFAULT NULL COMMENT '表单元数据ID',
  `BO_DEF_ID` varchar(50) DEFAULT NULL COMMENT 'BO定义ID',
  `ENT_ID` varchar(255) DEFAULT NULL COMMENT '实体ID',
  `GROUP_ID` varchar(50) DEFAULT NULL COMMENT '分组ID',
  `CALCULATION` text COMMENT '计算表达式',
  `TYPE` varchar(50) DEFAULT NULL COMMENT '数据类型',
  `BO_ATTR_ID` varchar(50) DEFAULT NULL COMMENT 'BO属性定义',
  `CTRL_TYPE` varchar(50) DEFAULT NULL COMMENT '控件类型',
  `VALID_RULE` text COMMENT '验证规则',
  `OPTION` text COMMENT '表单配置选项',
  `SN` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`ID`),
  KEY `idx_formfield_formid` (`FORM_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单字段定义';

-- ----------------------------
-- Table structure for bpm_form_hi
-- ----------------------------
DROP TABLE IF EXISTS `form_hi`;
CREATE TABLE `form_hi` (
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `FORM_ID` varchar(64) NOT NULL COMMENT '对应表单ID',
  `NAME` varchar(64) NOT NULL COMMENT '表单名称',
  `DESC` varchar(255) DEFAULT NULL COMMENT '表单描述',
  `FORM_HTML` text COMMENT '表单设计（HTML代码）',
  `CREATE_USER_ID` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_USER_NAME` varchar(64) DEFAULT NULL COMMENT '创建人Name',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `FORM_KEY` varchar(64) DEFAULT NULL,
  `VERSION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程表单HTML设计历史记录';

-- ----------------------------
-- Table structure for bpm_form_inst
-- ----------------------------
DROP TABLE IF EXISTS `form_inst`;
CREATE TABLE `form_inst` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `DEF_ID` varchar(64) DEFAULT NULL COMMENT '流程定义ID',
  `NODE_ID` varchar(64) DEFAULT NULL COMMENT '节点ID',
  `INST_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `FORM_TYPE` varchar(64) DEFAULT NULL COMMENT '表单类型',
  `FORM_ID` varchar(64) DEFAULT NULL COMMENT '表单定义ID',
  PRIMARY KEY (`ID`),
  KEY `idx_forminst_instid` (`INST_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单实例数据，表单定义与流程实例的关系';

-- ----------------------------
-- Table structure for bpm_form_right
-- ----------------------------
DROP TABLE IF EXISTS `form_right`;
CREATE TABLE `form_right` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `FORM_KEY` varchar(64) DEFAULT NULL COMMENT '表单KEY',
  `FLOW_KEY` varchar(64) DEFAULT NULL COMMENT '流程定义KEY',
  `NODE_ID` varchar(60) DEFAULT NULL COMMENT '节点ID',
  `PARENT_FLOW_KEY` varchar(64) DEFAULT NULL COMMENT '父流程key',
  `PERMISSION` longtext COMMENT '权限',
  `PERMISSION_TYPE` int(11) DEFAULT NULL COMMENT '权限类型 1 流程权限，2 实例权限',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单权限';

-- ----------------------------
-- Table structure for bpm_form_template
-- ----------------------------
DROP TABLE IF EXISTS `form_template`;
CREATE TABLE `form_template` (
  `TEMPLATE_ID` varchar(64) NOT NULL COMMENT '模板id',
  `TEMPLATE_NAME` varchar(200) DEFAULT NULL COMMENT '模板名称',
  `TEMPLATE_TYPE` varchar(20) DEFAULT NULL COMMENT '模板类型',
  `MACRO_TEMPLATE_ALIAS` varchar(50) DEFAULT NULL COMMENT '模板所向',
  `HTML` text COMMENT '模板内容',
  `TEMPLATE_DESC` varchar(400) DEFAULT NULL COMMENT '模板描述',
  `CAN_EDIT` int(11) DEFAULT NULL COMMENT '是否可以编辑',
  `ALIAS` varchar(50) DEFAULT NULL COMMENT '别名',
  PRIMARY KEY (`TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单模版';
SET FOREIGN_KEY_CHECKS=1;
