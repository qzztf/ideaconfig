explain SELECT tab2.*, isr.is_priority, isr.materials_upload_status, isr.tail_release_node
FROM (SELECT tab.ID_,
             tab.PROC_INST_ID_,
             b.apply_no,
             b.product_name,
             b.seller_name,
             b.buyer_name,
             b.partner_insurance_name,
             b.partner_bank_name,
             b.sales_user_name,
             b.apply_status,
             b.relate_type,
             b.delete_flag,
             b.group_apply_no,
             b.product_id,
             b.house_no,
             bt.NODE_ID_,
             bt.OWNER_ID_,
             bt.NAME_,
             bt.CREATE_TIME_,
             inst.status_ instStatus
      FROM (SELECT task.ID_, task.proc_inst_id_
            FROM BPM_TASK task
                   LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
                   INNER JOIN biz_apply_order b
                     ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
            WHERE 1 = 1
              AND ((task.assignee_id_ = '0' and task.id_ in (SELECT btc.TASK_ID_
                                                             FROM (SELECT ca.task_id_
                                                                   FROM BPM_TASK_CANDIDATE ca
                                                                   WHERE 1 = 1
                                                                     AND ((ca.executor_ = '10000024673028' AND ca.type_ = 'user') or
                                                                          (ca.executor_ in
                                                                           ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028') and
                                                                           ca.type_ = 'role') or (ca.executor_ in (
                                                                       '10000000371122',
                                                                       '10000000376121',
                                                                       '10000000760111') and ca.type_ = 'org') or
                                                                          (ca.executor_ in ('60000000100799',
                                                                                            '60003760101909') and
                                                                           ca.type_ = 'position'))) btc)) or
                   task.assignee_id_ = '10000024673028')
              AND task.status_ != 'TRANSFORMING'
              AND (b.city_no IS NULL OR b.city_no = '')
            ORDER BY task.PRIORITY_ DESC, task.CREATE_TIME_ DESC
            LIMIT 0, 10) tab
             LEFT JOIN bpm_task bt ON bt.id_ = tab.id_
             LEFT JOIN BPM_PRO_INST inst ON tab.proc_inst_id_ = inst.id_
             INNER JOIN biz_apply_order b
               ON (tab.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)) tab2
       LEFT JOIN biz_isr_mixed isr ON tab2.apply_no = isr.apply_no