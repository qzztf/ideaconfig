select * from (
		select distinct b.*,isr.is_priority,isr.materials_upload_status,isr.tail_release_node,task.* from
        (
		SELECT distinct task.*,
		inst.proc_def_name_ procDefName,
		inst.create_by_ creatorId,inst.CREATOR_ creator,
		inst.create_time_
		createDate,
		inst.status_ instStatus,
		type.id_ typeId,
		inst.PARENT_INST_ID_ as parent_inst_id_

		FROM BPM_TASK task
		LEFT JOIN
		BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		LEFT JOIN SYS_TYPE
		type ON type.id_ = inst.type_id_
		WHERE 1 = 1
		AND (( task.assignee_id_ = '0' and   task.id_ in (
		SELECT ca.task_id_ FROM BPM_TASK_CANDIDATE ca WHERE 1 = 1
		AND  ( (ca.executor_ = '10000025794856' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('10000201707221','50000000000003','10000073400858','10000035761218','50000000000213','10000000050703','10000044210201','10000044210206') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000050607') and ca.type_ ='org')


			or ( ca.executor_ in ('10000000050781') and ca.type_ ='position')

		)
		)) or task.assignee_id_ = '10000025794856')
		AND  task.status_ !='TRANSFORMING'
     ) task
		INNER JOIN
		biz_apply_order b ON (
		task.proc_inst_id_ = b.flow_instance_id
		)

			INNER JOIN
			s_area_info d on b.branch_id = d.company_code

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		WHERE 1 = 1


			and d.city_name like concat("%",'深圳',"%")






		--	and task.NODE_ID_ = ?

		 and (b.city_no is  null or b.city_no  ='')


		union

		select distinct b.*,isr.is_priority,isr.materials_upload_status,isr.tail_release_node,task.* from
		(
		SELECT distinct task.*,
		inst.proc_def_name_ procDefName,
		inst.create_by_ creatorId,inst.CREATOR_ creator,
		inst.create_time_
		createDate,
		inst.status_ instStatus,
		type.id_ typeId,
		inst.PARENT_INST_ID_ as parent_inst_id_

		FROM BPM_TASK task
		LEFT JOIN
		BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		LEFT JOIN SYS_TYPE
		type ON type.id_ = inst.type_id_
		WHERE 1 = 1
		AND (( task.assignee_id_ = '0' and   task.id_ in (
		SELECT ca.task_id_ FROM BPM_TASK_CANDIDATE ca WHERE 1 = 1
		AND  ( (ca.executor_ = '10000025794856' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('10000201707221','50000000000003','10000073400858','10000035761218','50000000000213','10000000050703','10000044210201','10000044210206') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000050607') and ca.type_ ='org')


			or ( ca.executor_ in ('10000000050781') and ca.type_ ='position')

		)
		)) or task.assignee_id_ = '10000025794856')
		AND  task.status_ !='TRANSFORMING'
     ) task
		INNER JOIN
		biz_apply_order b ON (
		task.parent_inst_id_ = b.flow_instance_id
		)

			INNER JOIN
			s_area_info d on b.branch_id = d.company_code

		LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		WHERE 1 = 1


			and d.city_name like concat("%",'深圳',"%")






		--	and task.NODE_ID_ = ?

		and (b.city_no is  null or b.city_no  ='')
	 ) a
		  order by a.PRIORITY_ DESC ,  a.CREATE_TIME_ DESC