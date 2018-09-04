select * from sys_type where ID_='10000052460373';

select  * from s_material_node where id ='10000046402336';



select  * from s_material_partner where id ='10000046405207';

delete  from s_material_partner_detail where material_partner_id in (select id from  s_material_partner  where partner_code='GDJRZFFWYXZRGSI774');


delete from s_material_relation  where not exists(select 1 from s_material_node n where material_config_id = n.id) and material_config_type= 1;

delete  from s_material_relation  where material_config_id in (select id from s_material_node  where product_id in ('ZYB_YSL_YJY_ISR','DZYB_YSL_YJY_ISR','ZYB_YSL_NJY_ISR'));


INSERT INTO biz_bpm_matter_config (id, key_, name_, create_condition, handle_condition, end_condition, pc_form_key, mb_form_key, update_user_id, update_time, create_time, create_user_id, rev, delete_flag, matter_key, matter_name, group_key, sn_, assign_model) VALUES ('10000048230683', 'UploadImg_guaranty', '资料反馈', '{type:"LOOP",candidateScript:"bimsApplyOrderScript.getLastNodeHandlerUser(bizApplyNo,''SendVerifyMaterial,SendLoanCommand,CheckMarSend'');"}', '{type:"ONCE","afterScript":"orderMatterBpmScript.uploadImgMatterHandle();"}', null, 'uploadImg_guaranty', '', '1', '2018-07-14 15:41:55', '2018-07-06 09:23:35', '1', 0, '0', 'UploadImg', '资料反馈', 'guaranty', 0, 'normal');



select ransom_cut_time as columnValue from biz_apply_order bao LEFT JOIN biz_ransom_floor ta ON bao.`house_no` = ta.`house_no` where bao.apply_no = 'DGS0420180619001' limit 1