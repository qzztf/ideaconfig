select * from biz_order_matter_record where apply_no ='QDC0220180727001';

select * from fw_timenode where timenode='TD10000050428004';


update fw_timenode set rel_sql = 'bao.`apply_no` = #{ta}.`apply_no` and #{ta}.matter_key = ''#{flow_type}''  join ( select * from
  (select r.id, r.apply_no,r.matter_key ,o.STATUS_  from biz_order_matter_record r
    left join bpm_check_opinion o on r.relate_id=o.TASK_ID_
where r.matter_key=''#{flow_type}'' and  r.relate_type=''bpm_task'' and r.relate_id <> '''' order by  r.create_time desc) b group by apply_no,matter_key) #{ta}Tmp
    on #{ta}.id= #{ta}Tmp.id and #{ta}Tmp.STATUS_ in( ''agree'',''awaiting_check'')' where dbtablename ='biz_order_matter_record';