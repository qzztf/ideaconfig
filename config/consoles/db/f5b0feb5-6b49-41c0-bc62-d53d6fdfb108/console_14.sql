explain  SELECT distinct
         task.*,
         inst.proc_def_name_     procDefName,
         inst.create_by_         creatorId,
         inst.CREATOR_           creator,
         inst.create_time_
                                 createDate,
         inst.status_            instStatus,
      --   type.id_                typeId,
         inst.PARENT_INST_ID_ as parent_inst_id_
      --   b.*
     --    isr.is_priority,
  -- isr.materials_upload_status,
 -- isr.tail_release_node
       FROM BPM_TASK_CANDIDATE ca
        join BPM_TASK task on task.ID_= ca.TASK_ID_
        JOIN
         BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_

       --  LEFT JOIN SYS_TYPE
         --          type ON type.id_ = inst.type_id_

     --    INNER JOIN
     --    biz_apply_order b ON (
     --      task.proc_inst_id_ = b.flow_instance_id
      --     OR inst.parent_inst_id_ = b.flow_instance_id
      --     )

     --    INNER JOIN
		--	s_area_info d on b.branch_id = d.company_code
        -- LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
       WHERE 1 = 1


       --     and d.city_name like concat("%", '深圳', "%")

AND  ( (ca.executor_ = '70000000060556' AND ca.type_ = 'user')

                    or (ca.executor_ in ('50000000000001', '40000001740528') and ca.type_ = 'role')


                    or (ca.executor_ in ('10000000755114') and ca.type_ = 'org')


                    or (ca.executor_ in ('60000000130793') and ca.type_ = 'position'))
              AND (task.assignee_id_ = '0'



        or task.assignee_id_ = '70000000060556')
             AND task.status_ != 'TRANSFORMING'