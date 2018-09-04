explain



select task.ID_,task.PROC_INST_ID_, inst.PARENT_INST_ID_
from (
select task.ID_, task.PROC_INST_ID_
        from bpm_task task
        where ((task.assignee_id_ = '0' and (task.id_ in (SELECT ca.task_id_
                                                          FROM BPM_TASK_CANDIDATE ca
                                                          WHERE (ca.executor_ = '10000024673028' AND
                                                                 ca.type_ = 'user')
                                                             or (
                                                                    ca.executor_ in
                                                                    ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                      and ca.type_ = 'role')
                                                             or (ca.executor_ in ('10000000755114')
                                                                   and ca.type_ = 'org')
                                                             or (ca.executor_ in ('60000000130793')
                                                                   and ca.type_ = 'position')))))
          AND task.status_ != 'TRANSFORMING'
        union all
        select task.ID_, task.PROC_INST_ID_
        from bpm_task task
        where task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING') task

join bpm_pro_inst inst on task.PROC_INST_ID_ = inst.ID_

join biz_apply_order b on b.flow_instance_id in (task.PROC_INST_ID_,inst.PARENT_INST_ID_);



show index from biz_apply_order;

show profiles ;


