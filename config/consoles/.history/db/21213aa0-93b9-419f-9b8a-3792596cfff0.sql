/*
Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2018-09-08 15:27:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bpm_pro_bo
-- ----------------------------
DROP TABLE IF EXISTS `bpm_pro_bo`;
CREATE TABLE `bpm_pro_bo` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `PROCESS_ID` varchar(64) DEFAULT NULL COMMENT '流程ID',
  `PROCESS_KEY` varchar(128) DEFAULT NULL COMMENT '流程KEY',
  `BO_CODE` varchar(128) DEFAULT NULL COMMENT '业务对象CODE',
  `BO_NAME` varchar(128) DEFAULT NULL COMMENT '业务对象名称',
  `CREATOR_ID` varchar(64) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程业务对象设置表';

-- ----------------------------
-- Table structure for bo_attr
-- ----------------------------
DROP TABLE IF EXISTS `bo_attr`;
CREATE TABLE `bo_attr` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `NAME` varchar(64) NOT NULL COMMENT '属性名称',
  `DESC` varchar(255) DEFAULT NULL COMMENT '属性描述',
  `ENT_ID` varchar(64) DEFAULT NULL COMMENT '实体ID',
  `DATA_TYPE` varchar(40) DEFAULT NULL COMMENT '数据类型。string=字符串；number=数值；datetime=日期（长日期，通过显示格式来限制）；',
  `DEFAULT_VALUE` varchar(1024) DEFAULT NULL COMMENT '基本默认值',
  `FORMAT` varchar(255) DEFAULT NULL COMMENT '基本类型显示格式',
  `IS_REQUIRED` char(1) NOT NULL DEFAULT 'N' COMMENT '是否必填',
  `ATTR_LENGTH` int(11) DEFAULT NULL COMMENT '属性长度',
  `DECIMAL_LEN` int(11) DEFAULT NULL COMMENT '浮点长度',
  `FIELD_NAME` varchar(50) DEFAULT NULL COMMENT '字段名',
  PRIMARY KEY (`ID`),
  KEY `idx_ent_ID` (`ENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务实体定义属性';

-- ----------------------------
-- Table structure for bo_data_rel
-- ----------------------------
DROP TABLE IF EXISTS `bo_data_rel`;
CREATE TABLE `bo_data_rel` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `PK` varchar(50) DEFAULT NULL COMMENT '主表PK数据',
  `FK` varchar(50) DEFAULT NULL COMMENT '外键ID数据',
  `PK_NUM` decimal(20,0) DEFAULT NULL COMMENT '主键值',
  `FK_NUM` decimal(20,0) DEFAULT NULL COMMENT '外键数字',
  `SUB_BO_NAME` varchar(50) DEFAULT NULL COMMENT '子实体名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多对多业务数据关联表';

-- ----------------------------
-- Table structure for bo_def
-- ----------------------------
DROP TABLE IF EXISTS `bo_def`;
CREATE TABLE `bo_def` (
  `ID` varchar(50) NOT NULL COMMENT '主键ID',
  `CATEGORY_ID` varchar(50) DEFAULT NULL COMMENT '分类ID',
  `ALIAS` varchar(50) DEFAULT NULL COMMENT '别名',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '表单定义描述',
  `SUPPORT_DB` smallint(6) DEFAULT NULL COMMENT 'BO支持数据库，相关的BO实体生成物理表',
  `DEPLOYED` smallint(6) DEFAULT NULL COMMENT '是否发布',
  `STATUS` varchar(20) DEFAULT NULL COMMENT 'BO状态(normal,正常,forbidden 禁用)',
  `CREATOR` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_BY` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BO定义';

-- ----------------------------
-- Table structure for bo_ent
-- ----------------------------
DROP TABLE IF EXISTS `bo_ent`;
CREATE TABLE `bo_ent` (
  `ID` varchar(64) NOT NULL COMMENT '对象定义ID',
  `PACKAGE_ID` varchar(50) DEFAULT NULL COMMENT '分类ID',
  `NAME` varchar(64) NOT NULL COMMENT '对象名称(需要唯一约束)',
  `DESC` varchar(255) DEFAULT NULL COMMENT '对象描述',
  `STATUS` varchar(40) NOT NULL COMMENT '状态。inactive=未激活；actived=激活；forbidden=禁用',
  `IS_CREATE_TABLE` smallint(6) NOT NULL COMMENT '是否生成表',
  `TABLE_NAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `DS_NAME` varchar(50) DEFAULT NULL COMMENT '数据源名称',
  `PK_TYPE` varchar(20) DEFAULT NULL COMMENT '主键类型',
  `IS_EXTERNAL` smallint(6) DEFAULT NULL COMMENT '是否外部表',
  `PK` varchar(50) DEFAULT NULL COMMENT '主键字段名称',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务实体定义';

-- ----------------------------
-- Table structure for bo_ent_rel
-- ----------------------------
DROP TABLE IF EXISTS `bo_ent_rel`;
CREATE TABLE `bo_ent_rel` (
  `ID` varchar(50) NOT NULL COMMENT '主键ID',
  `BO_DEF_ID` varchar(50) DEFAULT NULL COMMENT 'BO定义ID',
  `PARENT_ID` varchar(50) DEFAULT NULL COMMENT '上级ID',
  `REF_ENT_ID` varchar(64) DEFAULT NULL COMMENT '关联实体ID',
  `TYPE` varchar(50) DEFAULT NULL COMMENT '类型 (主表,main, onetoone,onetomany,manytomany)',
  `filter` varchar(500) DEFAULT NULL,
  `fk_to_pf` varchar(50) DEFAULT NULL,
  `fk` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BO定义实体关系';

-- ----------------------------
-- Table structure for bo_inst
-- ----------------------------
DROP TABLE IF EXISTS `bo_inst`;
CREATE TABLE `bo_inst` (
  `ID` varchar(64) NOT NULL COMMENT '业务实例ID',
  `DEF_ID` varchar(64) NOT NULL COMMENT '对象定义ID',
  `INST_DATA` text COMMENT '实例数据',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象实例';

-- ----------------------------
-- Table structure for bo_service
-- ----------------------------
DROP TABLE IF EXISTS `bo_service`;
CREATE TABLE `bo_service` (
  `ID` varchar(64) NOT NULL COMMENT '服务配置ID',
  `DEF_ID` varchar(64) NOT NULL COMMENT '对象定义ID',
  `SERVICE_NAME` varchar(128) NOT NULL COMMENT '服务名称',
  `GROUP` varchar(128) DEFAULT NULL COMMENT '所属分组',
  `SERVICE_TYPE` varchar(40) DEFAULT NULL COMMENT '服务类型',
  `DEFAULT` char(1) NOT NULL COMMENT '是否默认配置',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '服务说明',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象服务调用配置';
SET FOREIGN_KEY_CHECKS=1;
;
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bpm_pro_bo`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bpm_pro_bo` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `PROCESS_ID` varchar(64) DEFAULT NULL COMMENT '流程ID',
  `PROCESS_KEY` varchar(128) DEFAULT NULL COMMENT '流程KEY',
  `BO_CODE` varchar(128) DEFAULT NULL COMMENT '业务对象CODE',
  `BO_NAME` varchar(128) DEFAULT NULL COMMENT '业务对象名称',
  `CREATOR_ID` varchar(64) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程业务对象设置表';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bo_attr`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bo_attr` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `NAME` varchar(64) NOT NULL COMMENT '属性名称',
  `DESC` varchar(255) DEFAULT NULL COMMENT '属性描述',
  `ENT_ID` varchar(64) DEFAULT NULL COMMENT '实体ID',
  `DATA_TYPE` varchar(40) DEFAULT NULL COMMENT '数据类型。string=字符串；number=数值；datetime=日期（长日期，通过显示格式来限制）；',
  `DEFAULT_VALUE` varchar(1024) DEFAULT NULL COMMENT '基本默认值',
  `FORMAT` varchar(255) DEFAULT NULL COMMENT '基本类型显示格式',
  `IS_REQUIRED` char(1) NOT NULL DEFAULT 'N' COMMENT '是否必填',
  `ATTR_LENGTH` int(11) DEFAULT NULL COMMENT '属性长度',
  `DECIMAL_LEN` int(11) DEFAULT NULL COMMENT '浮点长度',
  `FIELD_NAME` varchar(50) DEFAULT NULL COMMENT '字段名',
  PRIMARY KEY (`ID`),
  KEY `idx_ent_ID` (`ENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务实体定义属性';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bo_data_rel`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bo_data_rel` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `PK` varchar(50) DEFAULT NULL COMMENT '主表PK数据',
  `FK` varchar(50) DEFAULT NULL COMMENT '外键ID数据',
  `PK_NUM` decimal(20,0) DEFAULT NULL COMMENT '主键值',
  `FK_NUM` decimal(20,0) DEFAULT NULL COMMENT '外键数字',
  `SUB_BO_NAME` varchar(50) DEFAULT NULL COMMENT '子实体名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多对多业务数据关联表';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bo_def`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bo_def` (
  `ID` varchar(50) NOT NULL COMMENT '主键ID',
  `CATEGORY_ID` varchar(50) DEFAULT NULL COMMENT '分类ID',
  `ALIAS` varchar(50) DEFAULT NULL COMMENT '别名',
  `DESCRIPTION` varchar(100) DEFAULT NULL COMMENT '表单定义描述',
  `SUPPORT_DB` smallint(6) DEFAULT NULL COMMENT 'BO支持数据库，相关的BO实体生成物理表',
  `DEPLOYED` smallint(6) DEFAULT NULL COMMENT '是否发布',
  `STATUS` varchar(20) DEFAULT NULL COMMENT 'BO状态(normal,正常,forbidden 禁用)',
  `CREATOR` varchar(50) DEFAULT NULL COMMENT '创建人',
  `CREATE_BY` varchar(50) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BO定义';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bo_ent`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bo_ent` (
  `ID` varchar(64) NOT NULL COMMENT '对象定义ID',
  `PACKAGE_ID` varchar(50) DEFAULT NULL COMMENT '分类ID',
  `NAME` varchar(64) NOT NULL COMMENT '对象名称(需要唯一约束)',
  `DESC` varchar(255) DEFAULT NULL COMMENT '对象描述',
  `STATUS` varchar(40) NOT NULL COMMENT '状态。inactive=未激活；actived=激活；forbidden=禁用',
  `IS_CREATE_TABLE` smallint(6) NOT NULL COMMENT '是否生成表',
  `TABLE_NAME` varchar(50) DEFAULT NULL COMMENT '表名',
  `DS_NAME` varchar(50) DEFAULT NULL COMMENT '数据源名称',
  `PK_TYPE` varchar(20) DEFAULT NULL COMMENT '主键类型',
  `IS_EXTERNAL` smallint(6) DEFAULT NULL COMMENT '是否外部表',
  `PK` varchar(50) DEFAULT NULL COMMENT '主键字段名称',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务实体定义';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bo_ent_rel`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bo_ent_rel` (
  `ID` varchar(50) NOT NULL COMMENT '主键ID',
  `BO_DEF_ID` varchar(50) DEFAULT NULL COMMENT 'BO定义ID',
  `PARENT_ID` varchar(50) DEFAULT NULL COMMENT '上级ID',
  `REF_ENT_ID` varchar(64) DEFAULT NULL COMMENT '关联实体ID',
  `TYPE` varchar(50) DEFAULT NULL COMMENT '类型 (主表,main, onetoone,onetomany,manytomany)',
  `filter` varchar(500) DEFAULT NULL,
  `fk_to_pf` varchar(50) DEFAULT NULL,
  `fk` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BO定义实体关系';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bo_inst`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bo_inst` (
  `ID` varchar(64) NOT NULL COMMENT '业务实例ID',
  `DEF_ID` varchar(64) NOT NULL COMMENT '对象定义ID',
  `INST_DATA` text COMMENT '实例数据',
  `CREATE_TIME` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象实例';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `bo_service`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `bo_service` (
  `ID` varchar(64) NOT NULL COMMENT '服务配置ID',
  `DEF_ID` varchar(64) NOT NULL COMMENT '对象定义ID',
  `SERVICE_NAME` varchar(128) NOT NULL COMMENT '服务名称',
  `GROUP` varchar(128) DEFAULT NULL COMMENT '所属分组',
  `SERVICE_TYPE` varchar(40) DEFAULT NULL COMMENT '服务类型',
  `DEFAULT` char(1) NOT NULL COMMENT '是否默认配置',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '服务说明',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务对象服务调用配置';
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SET FOREIGN_KEY_CHECKS=0;
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `form` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `DEF_ID` varchar(50) DEFAULT NULL COMMENT '表单元数据定义ID',
  `NAME` varchar(200) DEFAULT NULL COMMENT '表单名称',
  `FORM_KEY` varchar(50) DEFAULT NULL COMMENT '表单key',
  `category` varchar(50) DEFAULT NULL COMMENT 'inner或frame',
  `DESC` varchar(200) DEFAULT NULL COMMENT '描述',
  `FORM_HTML` longtext COMMENT '表单定义HTML',
  `STATUS` varchar(20) DEFAULT NULL COMMENT '状态 draft=草稿；deploy=发布',
  `FORM_TYPE` varchar(20) DEFAULT NULL COMMENT '表单类型 分为 pc,mobile',
  `TYPE_ID` varchar(50) DEFAULT NULL COMMENT '所属分类ID',
  `TYPE_NAME` varchar(100) DEFAULT NULL COMMENT '分类名称',
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
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form_bo`;
;-- -. . -..- - / . -. - .-. -.--
CREATE TABLE `form_bo` (
  `ID` varchar(50) NOT NULL COMMENT '主键',
  `FORM_ID` varchar(50) DEFAULT NULL COMMENT '表单ID',
  `BO_DEF_ID` varchar(50) DEFAULT NULL COMMENT 'BO定义ID',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='表单和BO的关联';
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form_def`;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form_field`;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form_hi`;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form_inst`;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form_right`;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
DROP TABLE IF EXISTS `form_template`;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
SET FOREIGN_KEY_CHECKS=1;