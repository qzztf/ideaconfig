explain select
  b.*,
  isr.is_priority,
  isr.materials_upload_status,
  isr.tail_release_node
from (SELECT
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_,
        b.*
      FROM
          biz_apply_order b
, BPM_TASK task
LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_

      WHERE  ( b.flow_instance_id in( task.proc_inst_id_    ) ) AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                 FROM BPM_TASK_CANDIDATE ca
                                                                 WHERE 1 = 1 AND ((ca.executor_ = '10000024673028' AND
                                                                                   ca.type_ = 'user') or (
                                                                                    ca.executor_ in
                                                                                    ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028')
                                                                                    and ca.type_ = 'role') or
                                                                                  (ca.executor_ in ('10000000755114')
                                                                                   and ca.type_ = 'org') or
                                                                                  (ca.executor_ in ('60000000130793')
                                                                                   and ca.type_ = 'position')))) or
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING'  and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
