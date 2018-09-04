explain select distinct
          b.*,
          isr.is_priority,
          isr.materials_upload_status,
          isr.tail_release_node,
          task.*
        from (SELECT
                task.*,
                inst.proc_def_name_     procDefName,
                inst.create_by_         creatorId,
                inst.CREATOR_           creator,
                inst.create_time_       createDate,
                inst.status_            instStatus,
                type.id_                typeId,
                inst.PARENT_INST_ID_ as parent_inst_id_
              FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
                LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              WHERE 1 = 1 AND (task.assignee_id_ = '70000000060556'
              ) AND task.status_ != 'TRANSFORMING'
              union all
              SELECT
                task.*,
                inst.proc_def_name_     procDefName,
                inst.create_by_         creatorId,
                inst.CREATOR_           creator,
                inst.create_time_       createDate,
                inst.status_            instStatus,
                type.id_                typeId,
                inst.PARENT_INST_ID_ as parent_inst_id_
              FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
                LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              WHERE 1 = 1 AND task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                       FROM BPM_TASK_CANDIDATE ca
                                                                       WHERE 1 = 1 AND (
                                                                         (ca.executor_ = '70000000060556' AND
                                                                          ca.type_ = 'user') or (
                                                                           ca.executor_ in
                                                                           ('50000000000001', '40000001740528') and
                                                                           ca.type_ = 'role') or
                                                                         (ca.executor_ in ('10000000755114') and
                                                                          ca.type_ = 'org') or
                                                                         (ca.executor_ in ('60000000130793') and
                                                                          ca.type_ = 'position')))
                    AND task.status_ != 'TRANSFORMING') task INNER JOIN
          biz_apply_order b ON b.flow_instance_id =task.parent_inst_id_
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
        from (SELECT
                task.*,
                inst.proc_def_name_     procDefName,
                inst.create_by_         creatorId,
                inst.CREATOR_           creator,
                inst.create_time_       createDate,
                inst.status_            instStatus,
                type.id_                typeId,
                inst.PARENT_INST_ID_ as parent_inst_id_
              FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
                LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              WHERE 1 = 1 AND (task.assignee_id_ = '70000000060556'
              ) AND task.status_ != 'TRANSFORMING'
              union all
              SELECT
                task.*,
                inst.proc_def_name_     procDefName,
                inst.create_by_         creatorId,
                inst.CREATOR_           creator,
                inst.create_time_       createDate,
                inst.status_            instStatus,
                type.id_                typeId,
                inst.PARENT_INST_ID_ as parent_inst_id_
              FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
                LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              WHERE 1 = 1 AND task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                       FROM BPM_TASK_CANDIDATE ca
                                                                       WHERE 1 = 1 AND (
                                                                         (ca.executor_ = '70000000060556' AND
                                                                          ca.type_ = 'user') or (
                                                                           ca.executor_ in
                                                                           ('50000000000001', '40000001740528') and
                                                                           ca.type_ = 'role') or
                                                                         (ca.executor_ in ('10000000755114') and
                                                                          ca.type_ = 'org') or
                                                                         (ca.executor_ in ('60000000130793') and
                                                                          ca.type_ = 'position')))
                    AND task.status_ != 'TRANSFORMING') task INNER JOIN
          biz_apply_order b ON b.flow_instance_id  = task.proc_inst_id_
          LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
        WHERE 1 = 1
        and (b.city_no is null or b.city_no = '')
#         order by task.PRIORITY_ DESC, task.CREATE_TIME_ DESC;


# select count(  id) from biz_apply_order;
-- show create table biz_apply_order;