CREATE TABLE `custom_query` (
  `ID_` varchar(64) NOT NULL COMMENT '主键',
  `NAME_` varchar(64) NOT NULL COMMENT '名字',
  `ALIAS_` varchar(64) NOT NULL COMMENT '别名',
  `OBJ_NAME_` varchar(64) NOT NULL COMMENT '对象名称，如果是表就是表名，视图则视图名',
  `NEED_PAGE_` smallint(6) DEFAULT NULL COMMENT '是否分页',
  `PAGE_SIZE_` int(11) DEFAULT NULL COMMENT '分页大小',
  `CONDITIONFIELD_` text COMMENT '条件字段的json',
  `RESULTFIELD_` text COMMENT '返回字段json',
  `SORTFIELD_` text COMMENT '排序字段',
  `DSALIAS_` varchar(64) NOT NULL COMMENT '数据源的别名',
  `IS_TABLE_` smallint(6) NOT NULL COMMENT '是否数据库表0:视图,1:数据库表',
  `DIY_SQL_` varchar(1000) DEFAULT NULL,
  `SQL_BUILD_TYPE_` smallint(6) DEFAULT NULL COMMENT 'SQL构建类型',
  `data_source_` varchar(64) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义查询';