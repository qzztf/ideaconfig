select * from bpm_form where FORM_KEY_='mortgageSendCommand';


select * from sys_dic where TYPE_ID_='10000057640173';


select * from sys_type where TYPE_KEY_='RL_GUARANTY';



SELECT * FROM biz_missing_materials WHERE apply_no = 'NJF0420180717003' ORDER BY node_id ASC,group_rev DESC limit 20;


select * from biz_bpm_matter_config where matter_key = 'QueryArchive';


update s_material_node set product_name='交易保(两笔)-保险' where product_id='ZYB_YSL_YJY_ISR';
update material_product_rel set product_name='交易保(两笔)-保险' where product_id='ZYB_YSL_YJY_ISR';


select *
from bpm_form where FORM_KEY_='pushLoanCommand_guaranty';