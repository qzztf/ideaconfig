explain select *
from (
       select distinct
         b.*,
         isr.is_priority,
         isr.materials_upload_status,
         isr.tail_release_node,
         task.*
       from
         (
           SELECT distinct
             task.*,
             inst.proc_def_name_     procDefName,
             inst.create_by_         creatorId,
             inst.CREATOR_           creator,
             inst.create_time_
                                     createDate,
             inst.status_            instStatus,
             type.id_                typeId,
             inst.PARENT_INST_ID_ as parent_inst_id_

           FROM BPM_TASK task
             LEFT JOIN
             BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
             LEFT JOIN SYS_TYPE
                       type ON type.id_ = inst.type_id_
           WHERE
             task.assignee_id_ = '1'
             AND task.status_ != 'TRANSFORMING'
           union all
           SELECT distinct
             task.*,
             inst.proc_def_name_     procDefName,
             inst.create_by_         creatorId,
             inst.CREATOR_           creator,
             inst.create_time_
                                     createDate,
             inst.status_            instStatus,
             type.id_                typeId,
             inst.PARENT_INST_ID_ as parent_inst_id_

           FROM BPM_TASK task
             LEFT JOIN
             BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
             LEFT JOIN SYS_TYPE
                       type ON type.id_ = inst.type_id_
           WHERE
             (task.assignee_id_ = '0' and task.id_ in (
               SELECT ca.task_id_
               FROM BPM_TASK_CANDIDATE ca
               WHERE 1 = 1
                     AND ((ca.executor_ = '1' AND ca.type_ = 'user')

                          or (ca.executor_ in ('10000000050760') and ca.type_ = 'role')


                          or (ca.executor_ in ('10000000050612') and ca.type_ = 'org')


                     )
             ))
             AND task.status_ != 'TRANSFORMING'
         ) task
         INNER JOIN
         biz_apply_order b ON (
         task.proc_inst_id_ = b.flow_instance_id
         )

         LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
       WHERE 1 = 1


             and (b.city_no is null or b.city_no = '')


       union

       select distinct
         b.*,
         isr.is_priority,
         isr.materials_upload_status,
         isr.tail_release_node,
         task.*
       from
         (
           SELECT distinct
             task.*,
             inst.proc_def_name_     procDefName,
             inst.create_by_         creatorId,
             inst.CREATOR_           creator,
             inst.create_time_
                                     createDate,
             inst.status_            instStatus,
             type.id_                typeId,
             inst.PARENT_INST_ID_ as parent_inst_id_

           FROM BPM_TASK task
             LEFT JOIN
             BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
             LEFT JOIN SYS_TYPE
                       type ON type.id_ = inst.type_id_
           WHERE
             task.assignee_id_ = '1'
             AND task.status_ != 'TRANSFORMING'
           union all
           SELECT distinct
             task.*,
             inst.proc_def_name_     procDefName,
             inst.create_by_         creatorId,
             inst.CREATOR_           creator,
             inst.create_time_
                                     createDate,
             inst.status_            instStatus,
             type.id_                typeId,
             inst.PARENT_INST_ID_ as parent_inst_id_

           FROM BPM_TASK task
             LEFT JOIN
             BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
             LEFT JOIN SYS_TYPE
                       type ON type.id_ = inst.type_id_
           WHERE
             (task.assignee_id_ = '0' and task.id_ in (
               SELECT ca.task_id_
               FROM BPM_TASK_CANDIDATE ca
               WHERE 1 = 1
                     AND ((ca.executor_ = '1' AND ca.type_ = 'user')

                          or (ca.executor_ in ('10000000050760') and ca.type_ = 'role')


                          or (ca.executor_ in ('10000000050612') and ca.type_ = 'org')


                     )
             ))
             AND task.status_ != 'TRANSFORMING'
         ) task
         INNER JOIN
         biz_apply_order b ON (
         task.parent_inst_id_ = b.flow_instance_id
         )

         LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
       WHERE 1 = 1


             and (b.city_no is null or b.city_no = '')
     ) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC