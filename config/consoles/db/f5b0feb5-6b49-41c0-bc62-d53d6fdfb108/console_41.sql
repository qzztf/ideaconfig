replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000048610012', '10000029340015', '订单流转信息', 'orderFlowInfo_v2', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    var formBoService = AngularUtil.getService(''formBoService'');
    scope.bizIsrMixed = formBoService.getScopeTable(scope,''bizApply'',''biz_isr_mixed'')[0];
   scope.bizFansomFloor = formBoService.getScopeTable(scope,''bizApply'',''biz_ransom_floor'')[0];
  scope.uploadImgRecord = {applyNo:scope.data.bizApply.apply_no};
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}</style><div><div upload-missing-img="uploadImgRecord"></div><div upload-img-record="uploadImgRecord"></div><div class="block-title"><span class="form-title">关联信息</span></div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList  track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div><div class="block-title"><span class="form-title">节点流转相关信息 </span></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>风险等级</th><td><div name="bizIsrMixed.risk_level" ht-dic="bizIsrMixed.risk_level" dickey="RISKLEVEL" permission="permission.fields.biz_isr_mixed.risk_level" desc="风险等级" type="text" ng-model="bizIsrMixed.risk_level" class="form-control"></div></td><th>是否加急</th><td><div name="bizIsrMixed.is_priority" ht-dic="bizIsrMixed.is_priority" dickey="SF" permission="permission.fields.biz_isr_mixed.is_priority" desc="是否加急" type="text" ng-model="bizIsrMixed.is_priority" class="form-control"></div></td></tr><tr class="firstRow"><th>产品组合</th><td><div name="bizIsrMixed.test" ht-dic="bizIsrMixed.test" dickey="RISKLEVEL" permission="permission.fields.biz_isr_mixed.risk_level" desc="风险等级" type="text" ng-model="bizIsrMixed.test" class="form-control"></div></td><th>是否先审批</th><td><div name="data.bizApply.man_check_first" ht-dic="data.bizApply.man_check_first" dickey="SF" permission="permission.fields.biz_isr_mixed.is_priority" desc="是否先审批" type="text" ng-model="data.bizApply.man_check_first" class="form-control"></div></td></tr><tr><th>情况说明/申诉意见</th><td colspan="3" style="width: 84%;"><textarea ht-textarea="bizIsrMixed.remark" class="form-control" ng-model="bizIsrMixed.remark" style="width: 93%;" cols="3" permission="permission.fields.biz_isr_mixed.remark"></textarea></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2017-09-14 10:11:05', null, null, '2018-08-10 10:55:31', '主页面', 32);



replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000056901006', '10000029340015', '流转信息-过渡', 'orderFlowInfo_transition', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    console.log(scope);
    var formBoService = AngularUtil.getService(''formBoService'');

  scope.buttons.save = false;
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}</style><div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList  track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2018-08-10 10:09:40', null, null, null, '主页面', 1);



replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000056901005', '10000029340015', '流转信息-按接', 'orderFlowInfo_mort', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    console.log(scope);
    var formBoService = AngularUtil.getService(''formBoService'');

  scope.buttons.save = false;
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}</style><div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList  track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2018-08-10 10:09:40', null, null, null, '主页面', 1);





replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000048610012', '10000029340015', '订单流转信息', 'orderFlowInfo_v2', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    var formBoService = AngularUtil.getService(''formBoService'');
    scope.bizIsrMixed = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_isr_mixed'')[0];
   scope.bizFansomFloor = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_ransom_floor'')[0];
  scope.uploadImgRecord = {applyNo:scope.data.bizOrderFlow.apply_no};
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}</style><div><div upload-missing-img="uploadImgRecord"></div><div upload-img-record="uploadImgRecord"></div><div class="block-title"><span class="form-title">关联信息 </span></div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div><div class="block-title"><span class="form-title">节点流转相关信息 </span></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>风险等级</th><td><div name="bizIsrMixed.risk_level" ht-dic="bizIsrMixed.risk_level" dickey="RISKLEVEL" permission="permission.fields.biz_isr_mixed.risk_level" desc="风险等级" type="text" ng-model="bizIsrMixed.risk_level" class="form-control"></div></td><th>是否加急</th><td><div name="bizIsrMixed.is_priority" ht-dic="bizIsrMixed.is_priority" dickey="SF" permission="permission.fields.biz_isr_mixed.is_priority" desc="是否加急" type="text" ng-model="bizIsrMixed.is_priority" class="form-control"></div></td></tr><tr class="firstRow"><th>产品组合</th><td><div name="bizIsrMixed.test" ht-dic="bizIsrMixed.test" dickey="RISKLEVEL" permission="permission.fields.biz_isr_mixed.risk_level" desc="风险等级" type="text" ng-model="bizIsrMixed.test" class="form-control"></div></td><th>是否先审批</th><td><div name="data.bizApply.man_check_first" ht-dic="data.bizApply.man_check_first" dickey="SF" permission="permission.fields.biz_isr_mixed.is_priority" desc="是否先审批" type="text" ng-model="data.bizApply.man_check_first" class="form-control"></div></td></tr><tr><th>情况说明/申诉意见</th><td colspan="3" style="width: 84%;"><textarea ht-textarea="bizIsrMixed.remark" class="form-control" ng-model="bizIsrMixed.remark" style="width: 93%;" cols="3" permission="permission.fields.biz_isr_mixed.remark"></textarea></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2017-09-14 10:11:05', null, null, '2018-08-15 18:15:18', '主页面', 40);




replace INTO form_bus_set (ID_, FORM_KEY_, JS_PRE_SCRIPT, JS_AFTER_SCRIPT, SHOW_SCRIPT, PRE_SCRIPT, AFTER_SCRIPT, ISTREELIST, TREECONF) VALUES ('10000049050345', 'orderFlowInfo_v2', null, null, 'bimsScriptImpl.productMateRelation(boData);', null, null, null, '{}');


replace INTO form_bus_set (ID_, FORM_KEY_, JS_PRE_SCRIPT, JS_AFTER_SCRIPT, SHOW_SCRIPT, PRE_SCRIPT, AFTER_SCRIPT, ISTREELIST, TREECONF) VALUES ('10000060390210', 'orderFlowInfo_mort', null, null, 'bimsScriptImpl.productMateRelation(boData);', null, null, null, '{}');

replace INTO form_bus_set (ID_, FORM_KEY_, JS_PRE_SCRIPT, JS_AFTER_SCRIPT, SHOW_SCRIPT, PRE_SCRIPT, AFTER_SCRIPT, ISTREELIST, TREECONF) VALUES ('10000060390211', 'orderFlowInfo_transition', null, null, 'bimsScriptImpl.productMateRelation(boData);', null, null, null, '{}');



replace INTO bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000055490201', '10000029030167', '资料反馈', 'uploadImg', null, '<script type="text/javascript" src="#ctx#/js/custform/bims_v25/materialFeedback.js"></script><script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();

  scope.uploadImgRecord = {applyNo:scope.data.bizApply.apply_no};
  scope.buttons.save = false;
  })</script><style>.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}</style><div ng-controller="uploadImgCtrl"><div head-common="orderInfo"></div><div class="wrapper"><div class="wrapper-left"><div><div upload-img-record="uploadImgRecord"></div><div upload-missing-img="uploadImgRecord"></div></div></div><div><div ddjf-data-material="orderInfo"></div></div></div></div>', 'deploy', 'pc', '10000010470102', '业务系统-v2', 'Y', 1, null, '2018-08-07 14:52:50', null, null, '2018-08-16 09:28:07', '主页面', 24);




replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000055490201', '10000029030167', '资料反馈', 'uploadImg', null, '<script type="text/javascript" src="#ctx#/js/custform/bims_v25/materialFeedback.js"></script><script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();

  scope.uploadImgRecord = {applyNo:scope.data.bizApply.apply_no};
  scope.buttons.save = false;
  })</script><style>.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}
.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 5px 5px rgba(0,0,0,.05);
	box-shadow: 0 5px 5px rgba(0,0,0,.05);
}</style><div ng-controller="uploadImgCtrl"><div head-common="orderInfo"></div><div id="wrap"><div class="li1"><div><div upload-img-record="uploadImgRecord"></div><div upload-missing-img="uploadImgRecord"></div></div></div><div class="li2"><div ddjf-data-material="orderInfo"></div></div></div></div>', 'deploy', 'pc', '10000010470102', '业务系统-v2', 'Y', 1, null, '2018-08-07 14:52:50', null, null, '2018-08-16 11:28:23', '主页面', 27);



replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000048610012', '10000029340015', '订单流转信息', 'orderFlowInfo_v2', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    var formBoService = AngularUtil.getService(''formBoService'');
    scope.bizIsrMixed = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_isr_mixed'')[0];
   scope.bizFansomFloor = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_ransom_floor'')[0];
  scope.uploadImgRecord = {applyNo:scope.data.bizOrderFlow.apply_no};
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}
.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 5px 5px rgba(0,0,0,.05);
	box-shadow: 0 5px 5px rgba(0,0,0,.05);
}</style><div><div upload-missing-img="uploadImgRecord"></div><div upload-img-record="uploadImgRecord"></div><div class="block-title"><span class="form-title">关联信息 </span></div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div><div class="block-title"><span class="form-title">节点流转相关信息 </span></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>风险等级</th><td><div name="bizIsrMixed.risk_level" ht-dic="bizIsrMixed.risk_level" dickey="RISKLEVEL" permission="permission.fields.biz_isr_mixed.risk_level" desc="风险等级" type="text" ng-model="bizIsrMixed.risk_level" class="form-control"></div></td><th>是否加急</th><td><div name="bizIsrMixed.is_priority" ht-dic="bizIsrMixed.is_priority" dickey="SF" permission="permission.fields.biz_isr_mixed.is_priority" desc="是否加急" type="text" ng-model="bizIsrMixed.is_priority" class="form-control"></div></td></tr><tr class="firstRow"><th>产品组合</th><td><div name="bizIsrMixed.test" ht-dic="bizIsrMixed.test" dickey="RISKLEVEL" permission="permission.fields.biz_isr_mixed.risk_level" desc="风险等级" type="text" ng-model="bizIsrMixed.test" class="form-control"></div></td><th>是否先审批</th><td><div name="data.bizApply.man_check_first" ht-dic="data.bizApply.man_check_first" dickey="SF" permission="permission.fields.biz_isr_mixed.is_priority" desc="是否先审批" type="text" ng-model="data.bizApply.man_check_first" class="form-control"></div></td></tr><tr><th>情况说明/申诉意见</th><td colspan="3" style="width: 84%;"><textarea ht-textarea="bizIsrMixed.remark" class="form-control" ng-model="bizIsrMixed.remark" style="width: 93%;" cols="3" permission="permission.fields.biz_isr_mixed.remark"></textarea></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2017-09-14 10:11:05', null, null, '2018-08-16 11:42:30', '主页面', 41);
replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000052920203', '10000029340015', '流转信息-转易保', 'orderFlowInfo_zyb', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    console.log(scope);
    var formBoService = AngularUtil.getService(''formBoService'');
    scope.bizIsrMixed = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_isr_mixed'')[0];
   scope.bizRansomFloor = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_ransom_floor'')[0];
  scope.bizFeeSummary = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_fee_summary'')[0];
   scope.bizHouseTransfer = formBoService.getScopeTable(scope,''bizOrderFlow'',''biz_house_transfer'')[0];
  scope.uploadImgRecord = {applyNo:scope.data.bizOrderFlow.apply_no};
  scope.buttons.save = false;
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}
.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 5px 5px rgba(0,0,0,.05);
	box-shadow: 0 5px 5px rgba(0,0,0,.05);
}</style><div><div class="div-form"><table class="table-form" style="background-color: #f2f2f2;"><tbody><tr class="firstRow"><td>订单流转相关信息</td></tr></tbody></table></div><div upload-missing-img="uploadImgRecord"></div><div upload-img-record="uploadImgRecord"></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>风险等级</th><td><div ng-bind="bizIsrMixed.risk_level | dic:&#39;RISKLEVEL&#39;"></div></td><th>是否加急</th><td><div ng-bind="bizIsrMixed.is_priority | dic:&#39;SF&#39;"></div></td></tr></tbody></table></div><div class="div-form"><table class="table-form column-2"><tbody><tr class="firstRow"><th style="width:16%;">情况说明/申诉意见</th><td colspan="3" style="width: 84%;"><div ng-bind="bizIsrMixed.remark"></div></td></tr></tbody></table></div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList  track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div><div class="div-form"><table class="table-form" style="background-color: #f2f2f2;"><tbody><tr class="firstRow"><td>面签信息</td></tr></tbody></table></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>预计赎楼/借款金额（元）</th><td><div ng-bind="bizFeeSummary.pre_ransom_borrow_amount | number:2"></div></td><th>业务是否持证</th><td><div ng-bind="bizRansomFloor.is_hold_cert| dic:&#39;SF&#39;"></div></td></tr></tbody></table></div><div class="div-form"><table class="table-form" style="background-color: #f2f2f2;"><tbody><tr class="firstRow"><td>赎楼信息（失败）</td></tr></tbody></table></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>赎楼状态</th><td><div ng-bind="bizRansomFloor.ransom_flag| dic:&#39;cgzt&#39;"></div></td><th>预计下次赎楼时间</th><td><div ng-bind="bizRansomFloor.pre_ransom_next_time | date:&#39;yyyy-MM-dd HH:mm:ss&#39;"></div></td></tr><tr><th>赎楼失败原因</th><td colspan="3" ng-bind="bizRansomFloor.ransom_fail_reason"><br/></td></tr></tbody></table></div><div class="div-form"><table class="table-form" style="background-color: #f2f2f2;"><tbody><tr class="firstRow"><td>赎楼信息（成功）</td></tr></tbody></table></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>赎楼扣款金额（元）</th><td><div ng-bind="bizRansomFloor.ransom_cut_amount | number:2"></div></td><th>银行联系人</th><td><div ng-bind="bizRansomFloor.qzjzxcl_linkman"></div></td></tr><tr><th>赎楼扣款日期</th><td><div ng-bind="bizRansomFloor.ransom_cut_time | date:&#39;yyyy-MM-dd HH:mm:ss&#39;"></div></td><th>联系方式</th><td><div ng-bind="bizRansomFloor.qzjzxcl_phone"></div></td></tr><tr><th>预计取注销资料时间</th><td><div ng-bind="bizRansomFloor.predict_qzjzxcl_time | date:&#39;yyyy-MM-dd HH:mm:ss&#39;"></div></td><th>取注销资料地址</th><td><div ng-bind="bizRansomFloor.qzjzxcl_branch_bank"></div></td></tr></tbody></table></div><div class="div-form"><table class="table-form" style="background-color: #f2f2f2;"><tbody><tr class="firstRow"><td>注销、过户、抵押等相关信息</td></tr></tbody></table></div><div class="div-form" style="overflow: inherit;"><table class="table-form column-2"><tbody><tr class="firstRow"><th>预计过户出件时间</th><td><div ng-bind="bizHouseTransfer.transfer_expect_time_more| date:&#39;yyyy-MM-dd HH:mm:ss&#39;"></div></td><th>预计抵押出件时间</th><td><div ng-bind="bizHouseTransfer.mortgage_expect_time_more | date:&#39;yyyy-MM-dd HH:mm:ss&#39;"></div></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2018-07-16 20:46:40', null, null, '2018-08-16 11:43:08', '主页面', 28);
replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000056901005', '10000029340015', '流转信息-按接', 'orderFlowInfo_mort', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    console.log(scope);
    var formBoService = AngularUtil.getService(''formBoService'');

  scope.buttons.save = false;
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}
.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 5px 5px rgba(0,0,0,.05);
	box-shadow: 0 5px 5px rgba(0,0,0,.05);
}</style><div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList  track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2018-08-10 10:09:40', null, null, '2018-08-16 11:43:27', '主页面', 2);
replace into bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000056901006', '10000029340015', '流转信息-过渡', 'orderFlowInfo_transition', null, '<script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    console.log(scope);
    var formBoService = AngularUtil.getService(''formBoService'');

  scope.buttons.save = false;
  })</script><style>.collapse{
    display:block;
  }
.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}
.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 5px 5px rgba(0,0,0,.05);
	box-shadow: 0 5px 5px rgba(0,0,0,.05);
}</style><div><div class="div-form" style="overflow: inherit;"><table class="table-form form-center"><tbody><tr class="firstRow"><th style="width:14%;">订单编号</th><th style="width:14%;">关联订单编号</th><th style="width:14%;">关联产品名称</th><th style="width:10%;">放款节点</th><th style="width:20%;">关联类型</th><th style="width:20%;">二级类型</th></tr><tr class="firstRow" ng-repeat="item in data.bizOrderFlow.productRelationInfoList  track by $index"><td><div ng-bind="item.masterApplyorder"></div></td><td><div ng-bind="item.followApplyorder"></div></td><td><div ng-bind="item.followProductName"></div></td><td><div ng-bind="item.tailReleaseNode | dic:&#39;fkjd_ql&#39;"></div></td><td><div ng-bind="item.ruleType | dic:&#39;RelateType&#39;"></div></td><td><div ng-bind="item.subRuleType"></div></td></tr></tbody></table></div></div>', 'deploy', 'pc', '10000029030161', '集中录入', 'Y', 1, null, '2018-08-10 10:09:40', null, null, '2018-08-16 11:43:41', '主页面', 2);



replace INTO bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000055490201', '10000029030167', '资料反馈', 'uploadImg', null, '<script type="text/javascript" src="#ctx#/js/custform/bims_v25/materialFeedback.js"></script><script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();

  scope.uploadImgRecord = {applyNo:scope.data.bizApply.apply_no};
  scope.buttons.save = false;
  })</script><style>.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}
.panel {
	margin-bottom: 20px;
	background-color: #fff;
	border: 1px solid transparent;
	border-radius: 4px;
	-webkit-box-shadow: 0 5px 5px rgba(0,0,0,.05);
	box-shadow: 0 5px 5px rgba(0,0,0,.05);
}
#wrap .li1 {
    background: #fff;
    overflow: visible;
    float: left;
}</style><div ng-controller="uploadImgCtrl"><div head-common="orderInfo"></div><div id="wrap"><div class="li1"><div><div upload-img-record="uploadImgRecord"></div><div upload-missing-img="uploadImgRecord"></div></div></div><div class="li2"><div ddjf-data-material="orderInfo"></div></div></div></div>', 'deploy', 'pc', '10000010470102', '业务系统-v2', 'Y', 1, null, '2018-08-07 14:52:50', null, null, '2018-08-16 17:42:05', '主页面', 28);