select ret_fin_date, bao.apply_no from biz_apply_order bao join  v_fd_ret ta on bao.`apply_no` = ta.`apply_no` and ta.adv_type='floorAdvance';

select * from fw_timenode where timenode ='TD10000053150205';
select * from fw_timenode where timenode ='TD10000053150206';


INSERT INTO bpms.fw_timenode (id, timenode, timenodedesc, time_node_type, flow_type_name, flow_type, dbtablename, dbcolname, dbdatatype, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, pre_time_node, rel_sql) VALUES ('10000053150205', 'TD10000053150205', '到期归还垫资确认', 1, '', '', 'v_fd_ret', 'ret_fin_date', 'date', '1', '2018-07-17 17:10:04', '1', '2018-07-17 17:10:04', 0, '0', null, 'bao.`apply_no` = #{ta}.`apply_no`  and #{ta}.adv_type=''expireAdvance''');



INSERT INTO bpms.fw_timenode (id, timenode, timenodedesc, time_node_type, flow_type_name, flow_type, dbtablename, dbcolname, dbdatatype, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, pre_time_node, rel_sql) VALUES ('10000053150206', 'TD10000053150206', '赎楼垫资确认', 1, '', '', 'v_fd_ret', 'ret_fin_date', 'date', '1', '2018-07-17 17:14:58', '1', '2018-07-17 17:14:58', 0, '0', null, 'bao.`apply_no` = #{ta}.`apply_no` and #{ta}.adv_type=''floorAdvance''');



INSERT INTO bpms.biz_bpm_matter_config (id, key_, name_, create_condition, handle_condition, end_condition, pc_form_key, mb_form_key, update_user_id, update_time, create_time, create_user_id, rev, delete_flag, matter_key, matter_name, group_key, sn_, assign_model) VALUES ('10000048990361', 'QueryArchive_guaranty', '查档', '{type:"ONCE",nodeId:"ApplyOrder",eventType:"taskComplete",actionName:"agree",candidateScript:"bimsScriptImpl.getUserListOrg(instanceId_,''WQG2,NQG(JH)'');"}', '{type:"LOOP",afterScript:"dingMsgScriptImplV3.sendDingDingMessageThree(''JFLR'','''');"}', null, 'queryArchive_guaranty', 'QueryArchive_Mobile_guaranty', '1', '2018-07-06 11:51:48', '2018-07-06 11:48:23', '1', 0, '0', 'QueryArchive', '查档', 'guaranty', 0, 'normal');



select * from bpm_form where FORM_KEY_='queryArchive_guaranty';


select * from biz_apply_order limit 1c