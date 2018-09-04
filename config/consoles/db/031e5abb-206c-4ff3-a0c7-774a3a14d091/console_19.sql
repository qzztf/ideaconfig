select
  handle_time as columnValue,
  bao.apply_no
from biz_apply_order bao LEFT JOIN biz_order_matter_record ta
    ON bao.`apply_no` = ta.`apply_no` and ta.matter_key = 'MortgagePass'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'MortgagePass' and r.relate_type = 'bpm_task' and r.relate_id <> ''
              order by r.create_time desc) b
        group by apply_no, matter_key) taTmp on ta.id = taTmp.id and taTmp.STATUS_ in ('agree', 'awaiting_check')
where bao.apply_no = 'FZC0120180516002'
limit 1



replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429005 ', 'STD10000040429005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 3, '1', '2018-07-27 16:45:41', '1', '2018-07-27 16:45:41', 0, '0', '东莞公司', '769000');
replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429006 ', 'STD10000040429006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 3, '1', '2018-07-27 16:45:42', '1', '2018-07-27 16:45:42', 0, '0', '东莞公司', '769000');
replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430005 ', 'STD10000040430005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)5工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 5, '1', '2018-07-27 16:50:24', '1', '2018-07-27 16:50:24', 0, '0', '惠州公司', '752000');
replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430006 ', 'STD10000040430006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)5工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 5, '1', '2018-07-27 16:50:24', '1', '2018-07-27 16:50:24', 0, '0', '惠州公司', '752000');


SELECT u.*,r.alias_ from sys_user u inner JOIN sys_user_role ur on u.id_=ur.user_id_ inner join sys_role r on ur.role_id_=r.id_ and r.alias_='WRLXR1C'