SELECT distinct task.*
				FROM BPM_TASK task
				WHERE 1 = 1
				AND (( task.assignee_id_ = '0' and   task.id_ in (
					SELECT ca.task_id_ FROM BPM_TASK_CANDIDATE ca WHERE 1 = 1
					AND  ( (ca.executor_ = '10000025794856' AND  ca.type_ = 'user' )
					 or (ca.executor_ in
                                        ('10000201707221', '50000000000003', '10000073400858', '10000035761218', '50000000000213', '10000000050703', '10000044210201', '10000044210206')
                                        and ca.type_ = 'role')
					or (ca.executor_ in ('10000000050607') and ca.type_ = 'org')
					 or (ca.executor_ in ('10000000050781') and ca.type_ = 'position')
					)
				)) or task.assignee_id_ = '10000025794856')
				AND  task.status_ !='TRANSFORMING'