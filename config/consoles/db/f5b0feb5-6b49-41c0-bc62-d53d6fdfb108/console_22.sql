select * from sys_dic where KEY_='qfm';

select *
from sys_type where ID_='10000039280202';

select * from custom_dialog where ALIAS_='xzwcjd';


select *
from bpm_form where FORM_KEY_='pushLoanCommand_guaranty';


select * from plat_due_date_view where apply_no='WHC0320180620004';


select *
from fw_timenode where  timenode in ('TD10000053150206','TD10000053150205');


delete from biz_after_loan_material where partner_id is null;

update biz_after_loan_material set node_id = 'TransferIn' where node_id = 'TransferOut';
update s_material_partner set event_type = 'afterLoanMaterial-TransferIn' where event_type='afterLoanMaterial-TransferOut';


select *from fw_warn_hist where apply_no='GZC0120180517004';


select *
from s_material_partner where partner_code like '%wc%';

select *
from s_material_partner_detail where material_partner_id in ('10000051280209',
'10000051280222',
'10000051280235',
'10000051280248',
'10000051280261',
'10000051280274',
'10000051280287',
'10000051280300');

select *
from sys_type where TYPE_KEY_='afterLoanNode';

select * from sys_dic where TYPE_ID_='10000051280202';

select *
from sys_dic where KEY_ like 'afterLoanMaterial-%';
select * from material_type where type_no='M09028';

select *
from biz_bpm_matter_config where end_condition is not null;

select r.apply_no,r.matter_key,r.matter_name,o.STATUS_ from biz_order_matter_record r left join bpm_task t on r.relate_id = t.ID_ join bpm_check_opinion o on t.ID_=o.TASK_ID_;


select *
from (
select *
from (select r.apply_no,r.matter_key,r.matter_name,r.create_user_id,r.create_time, r.handle_user_id, r.handle_user_name, r.handle_time, o.STATUS_  from
  biz_order_matter_record r left join bpm_check_opinion o on r.relate_id=o.TASK_ID_
where r.relate_type='bpm_task' and r.relate_id <> '' and r.matter_key='SendLoanCommand' order by r.apply_no, r.matter_key, r.create_time desc) a group by apply_no,matter_key ) c where c.apply_no='WHC0320180119009';


explain select * from biz_apply_order bao
		LEFT JOIN biz_order_matter_record ta ON bao.`apply_no` = ta.`apply_no` and ta.matter_key = 'SendLoanCommand' join ( select * from
  (select r.id ,r.matter_key,r.apply_no,o.STATUS_ from biz_order_matter_record r
    left join bpm_check_opinion o on r.relate_id=o.TASK_ID_
where r.matter_key='SendLoanCommand' and  r.relate_type='bpm_task' and r.relate_id <> '' and o.STATUS_='agree' order by  r.create_time desc) b group by apply_no,matter_key) a
    on ta.id= a.id  where bao.apply_no = 'WHC0320180119009' and a.STATUS_ = 'agree' limit 1;


bao.`apply_no` = #{ta}.`apply_no` and #{ta}.matter_key = '#{flow_type}' join join ( select * from
  (select r.id, r.apply_no,r.matter_key from biz_order_matter_record r
    left join bpm_check_opinion o on r.relate_id=o.TASK_ID_
where r.matter_key='#{flow_type}' and  r.relate_type='bpm_task' and r.relate_id <> '' and o.STATUS_='agree' order by  r.create_time desc) b group by apply_no,matter_key) a
    on ta.id= a.id

select *
from fw_timenode;
update fw_timenode set rel_sql = 'bao.`apply_no` = #{ta}.`apply_no` and #{ta}.matter_key = ''#{flow_type}''  join ( select * from
  (select r.id, r.apply_no,r.matter_key ,o.STATUS_  from biz_order_matter_record r
    left join bpm_check_opinion o on r.relate_id=o.TASK_ID_
where r.matter_key=''#{flow_type}'' and  r.relate_type=''bpm_task'' and r.relate_id <> '''' order by  r.create_time desc) b group by apply_no,matter_key) #{ta}Tmp
    on #{ta}.id= #{ta}Tmp.id and #{ta}Tmp.STATUS_ = ''agree''' where dbtablename ='biz_order_matter_record';


select *
from biz_apply_order where partner_insurance_id like '%WC%';

select *
from material_type where name like '%进件%';