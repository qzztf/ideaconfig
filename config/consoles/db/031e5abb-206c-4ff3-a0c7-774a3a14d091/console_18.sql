select *
from biz_ransom_floor r
  join biz_apply_order o on r.house_no = o.house_no
  join biz_order_matter_record m on o.apply_no = m.apply_no and m.matter_key = 'GetCancelMaterial'
where ransom_cut_time is not null and m.handle_time is null and o.branch_id='532000'
      and o.product_id = 'SLY_YSL_YJY_CSH' and o.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '')
order by o.create_time asc
limit 10;


select
  bao.`apply_no`,
  bao.house_no,
  bao.`flow_instance_id`,
  bao.product_id             AS prod_type,
  bao.product_name           AS prod_name,
  bao.branch_id,
  bao.seller_name            AS custName,
  startTable.ransom_cut_time as start_timenode_col,
  endTable.handle_time       as end_timenode_col,
  so.name_                   as branch_name
from biz_apply_order bao left join sys_org so on bao.branch_id = so.code_
  join biz_ransom_floor startTable ON bao.`house_no` = startTable.`house_no` AND startTable.ransom_cut_time IS NOT NULL
  LEFT JOIN biz_order_matter_record endTable
    ON bao.`apply_no` = endTable.`apply_no` and endTable.matter_key = 'GetCancelMaterial'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'GetCancelMaterial' and r.relate_type = 'bpm_task' and r.relate_id <> '' and r.apply_no = 'QDC0120180613001'
              order by r.create_time desc) b
        group by apply_no, matter_key) endTableTmp on endTable.id = endTableTmp.id and endTableTmp.STATUS_ in( 'agree','awaiting_check')
where bao.flow_instance_id is not null AND bao.branch_id = '532000' and
      bao.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '') AND
      bao.apply_status IS NOT NULL and bao.apply_no = 'QDC0120180613001' and bao.apply_time between '2017-11-16' and now()
group by bao.apply_no