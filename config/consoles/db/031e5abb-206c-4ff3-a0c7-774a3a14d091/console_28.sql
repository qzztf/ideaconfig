explain
  select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*

  from
    (
      SELECT task.*,
        inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    inst.PARENT_INST_ID_ as parent_inst_id_
      FROM BPM_TASK task
        LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*,
        inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    inst.PARENT_INST_ID_ as parent_inst_id_
      FROM BPM_TASK task
        LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        join BPM_TASK_CANDIDATE ca
          on task.assignee_id_ = '0'

             and task.id_ = ca.task_id_
             where ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')

                  or (ca.executor_ in
                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                      and ca.type_ = 'role')


                  or (ca.executor_ in ('10000000371122', '10000000376121') and ca.type_ = 'org')


                  or (ca.executor_ in ('60000000100799', '60003760101909') and ca.type_ = 'position')

             )
             AND task.status_ != 'TRANSFORMING'
    ) task


#     LEFT JOIN SYS_TYPE
#               type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b FORCE index (flow_instance_id_index) ON (
    b.flow_instance_id in (task.proc_inst_id_ , task.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '')


