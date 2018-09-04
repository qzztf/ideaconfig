select *
from bpm_task_candidate where PROC_INST_ID_='10000051830242';

select *
from bpm_task where PROC_INST_ID_ ='10000051830242';


select branch_id from fw_warn_hist where warn_date > '2018-07-18';

select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.flow_instance_id
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and ca.ID_ is null
and task.NODE_ID_ = 'UserTask2'
  group by task.ID_, ur.user_id_
  and hist.apply_no='NTC0320180530001';



select task.ID_,hist.flow_instance_id from fw_warn_hist hist  join  bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where   ca.ID_ is null
and task.NODE_ID_ = 'UserTask3'
  group by task.ID_;

select * from sys_user where account_ like '%liuhuiyuan%';

select *
from biz_after_loan_material where partner_id <> 'XDA-WC001' group by apply_no having count(id) > 1;


select * from base_sys_resource;

select *
from bpm_form where FORM_KEY_='orderFlowInfo_transition';

10000029030167   10000029030161   集中录入  deploy
select *
from biz_apply_order where version is null;


select * from biz_bpm_matter_config where matter_key='UploadImg' ;


select *
from b_product;

10000029340015
select *
from bpm_form where FORM_KEY_ = 'UploadImg';

select *
from form_bus_set where FORM_KEY_ = 'orderFlowInfo_transition';



replace INTO bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000055490201', '10000029030167', '资料反馈', 'uploadImg', null, '<script type="text/javascript" src="#ctx#/js/custform/bims_v25/materialFeedback.js"></script><script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();

  scope.uploadImgRecord = {applyNo:scope.data.bizApply.apply_no};
  scope.buttons.save = false;
  })</script><style>.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}</style><div ng-controller="uploadImgCtrl"><div head-common="orderInfo"></div><div class="wrapper"><div class="wrapper-left"><div><div upload-img-record="uploadImgRecord"></div><div upload-missing-img="uploadImgRecord"></div></div></div><div><div ddjf-data-material="orderInfo"></div></div></div></div>', 'deploy', 'pc', '10000010470102', '业务系统-v2', 'Y', 1, null, '2018-08-07 14:52:50', null, null, '2018-08-16 09:28:07', '主页面', 24);





