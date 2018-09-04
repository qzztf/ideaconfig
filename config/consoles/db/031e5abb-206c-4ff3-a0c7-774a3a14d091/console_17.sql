select
  handle_time as columnValue,
  bao.apply_no
from biz_apply_order bao LEFT JOIN biz_order_matter_record ta
    ON bao.`apply_no` = ta.`apply_no` and ta.matter_key = 'returnConfirm'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'returnConfirm' and r.relate_type = 'bpm_task' and r.relate_id <> ''
              order by r.create_time desc) b
        group by apply_no, matter_key) taTmp on ta.id = taTmp.id and taTmp.STATUS_ = 'agree'
where bao.apply_no = 'FZC0120180507009'
limit 1