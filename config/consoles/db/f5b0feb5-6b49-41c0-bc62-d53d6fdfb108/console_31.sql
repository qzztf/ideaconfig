select
  bao.`apply_no`,
  bao.house_no,
  bao.`flow_instance_id`,
  bao.product_id         AS prod_type,
  bao.product_name       AS prod_name,
  bao.branch_id,
  bao.seller_name        AS custName,
  startTable.handle_time as start_timenode_col,
  endTable.handle_time   as end_timenode_col,
  so.name_               as branch_name
from biz_apply_order bao left join sys_org so on bao.branch_id = so.code_
  join biz_order_matter_record startTable
    ON bao.`apply_no` = startTable.`apply_no` and startTable.matter_key = 'GetCancelMaterial'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'GetCancelMaterial' and r.relate_type = 'bpm_task' and r.relate_id <> ''
              order by r.create_time desc) b
        group by apply_no, matter_key) a
    on startTable.id = a.id and a.STATUS_ = 'agree' AND startTable.handle_time IS NOT NULL
  LEFT JOIN biz_order_matter_record endTable
    ON bao.`apply_no` = endTable.`apply_no` and endTable.matter_key = 'TransferIn'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'TransferIn' and r.relate_type = 'bpm_task' and r.relate_id <> ''
              order by r.create_time desc) b
        group by apply_no, matter_key) a on endTable.id = a.id and a.STATUS_ = 'agree'
where bao.flow_instance_id is not null AND bao.branch_id = ? and
      bao.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '') AND
      bao.apply_status IS NOT NULL and bao.apply_time between ? and now()
group by bao.apply_no