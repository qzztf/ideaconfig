select
  bao.`apply_no`,
  bao.house_no,
  bao.`flow_instance_id`,
  bao.product_id             AS prod_type,
  bao.product_name           AS prod_name,
  bao.branch_id,
  bao.seller_name            AS custName,
  startTable.ransom_cut_time as start_timenode_col,
  endTable.handle_time       as end_timenode_col,
  so.name_                   as branch_name
from biz_apply_order bao left join sys_org so on bao.branch_id = so.code_
  join biz_ransom_floor startTable ON bao.`house_no` = startTable.`house_no` AND startTable.ransom_cut_time IS NOT NULL
  LEFT JOIN biz_order_matter_record endTable
    ON bao.`apply_no` = endTable.`apply_no` and endTable.matter_key = 'GetCancelMaterial'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'GetCancelMaterial' and r.relate_type = 'bpm_task' and r.relate_id <> ''
              order by r.create_time desc) b
        group by apply_no, matter_key) endTableTmp on endTable.id = endTableTmp.id and endTableTmp.STATUS_ in( 'agree','awaiting_check')
where bao.flow_instance_id is not null AND bao.branch_id = '532000' and
      bao.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '') AND
      bao.apply_status IS NOT NULL and bao.apply_no = 'QDC0220180426003' and bao.apply_time between '2017-11-16' and now()
group by bao.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'GetCancelMaterial' and r.relate_type = 'bpm_task' and r.relate_id <> '' and r.apply_no = 'QDC0220180426003'
              order by r.create_time desc) b
        group by apply_no, matter_key;
;-- -. . -..- - / . -. - .-. -.--
select
  bao.`apply_no`,
  bao.house_no,
  bao.`flow_instance_id`,
  bao.product_id             AS prod_type,
  bao.product_name           AS prod_name,
  bao.branch_id,
  bao.seller_name            AS custName,
  startTable.ransom_cut_time as start_timenode_col,
  endTable.handle_time       as end_timenode_col,
  so.name_                   as branch_name
from biz_apply_order bao left join sys_org so on bao.branch_id = so.code_
  join biz_ransom_floor startTable ON bao.`house_no` = startTable.`house_no` AND startTable.ransom_cut_time IS NOT NULL
  LEFT JOIN biz_order_matter_record endTable
    ON bao.`apply_no` = endTable.`apply_no` and endTable.matter_key = 'GetCancelMaterial'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'GetCancelMaterial' and r.relate_type = 'bpm_task' and r.relate_id <> '' and r.apply_no = 'QDC0220180426003'
              order by r.create_time desc) b
        group by apply_no, matter_key) endTableTmp on endTable.id = endTableTmp.id and endTableTmp.STATUS_ in( 'agree','awaiting_check')
where bao.flow_instance_id is not null AND bao.branch_id = '532000' and
    --  bao.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '') AND
      bao.apply_status IS NOT NULL and bao.apply_no = 'QDC0220180426003' and bao.apply_time between '2017-11-16' and now()
group by bao.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_ransom_floor r
  join biz_apply_order o on r.house_no = o.house_no
  join biz_order_matter_record m on o.apply_no = m.apply_no and m.matter_key = 'GetCancelMaterial'
where ransom_cut_time is not null and m.handle_time is null and o.branch_id='532000' and o.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '') 
order by o.create_time asc
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_ransom_floor r
  join biz_apply_order o on r.house_no = o.house_no
  join biz_order_matter_record m on o.apply_no = m.apply_no and m.matter_key = 'GetCancelMaterial'
where ransom_cut_time is not null and m.handle_time is null and o.branch_id='532000' and o.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '')
order by o.create_time asc
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select
  bao.`apply_no`,
  bao.house_no,
  bao.`flow_instance_id`,
  bao.product_id             AS prod_type,
  bao.product_name           AS prod_name,
  bao.branch_id,
  bao.seller_name            AS custName,
  startTable.ransom_cut_time as start_timenode_col,
  endTable.handle_time       as end_timenode_col,
  so.name_                   as branch_name
from biz_apply_order bao left join sys_org so on bao.branch_id = so.code_
  join biz_ransom_floor startTable ON bao.`house_no` = startTable.`house_no` AND startTable.ransom_cut_time IS NOT NULL
  LEFT JOIN biz_order_matter_record endTable
    ON bao.`apply_no` = endTable.`apply_no` and endTable.matter_key = 'GetCancelMaterial'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'GetCancelMaterial' and r.relate_type = 'bpm_task' and r.relate_id <> '' and r.apply_no = 'QDC0220180510003'
              order by r.create_time desc) b
        group by apply_no, matter_key) endTableTmp on endTable.id = endTableTmp.id and endTableTmp.STATUS_ in( 'agree','awaiting_check')
where bao.flow_instance_id is not null AND bao.branch_id = '532000' and
      bao.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '') AND
      bao.apply_status IS NOT NULL and bao.apply_no = 'QDC0220180510003' and bao.apply_time between '2017-11-16' and now()
group by bao.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_ransom_floor r
  join biz_apply_order o on r.house_no = o.house_no
  join biz_order_matter_record m on o.apply_no = m.apply_no and m.matter_key = 'GetCancelMaterial'
where ransom_cut_time is not null and m.handle_time is null and o.branch_id='532000' 
      and o.product_id = 'SLY_YSL_YJY_CSH' and o.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '')
order by o.create_time asc
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select
  bao.`apply_no`,
  bao.house_no,
  bao.`flow_instance_id`,
  bao.product_id             AS prod_type,
  bao.product_name           AS prod_name,
  bao.branch_id,
  bao.seller_name            AS custName,
  startTable.ransom_cut_time as start_timenode_col,
  endTable.handle_time       as end_timenode_col,
  so.name_                   as branch_name
from biz_apply_order bao left join sys_org so on bao.branch_id = so.code_
  join biz_ransom_floor startTable ON bao.`house_no` = startTable.`house_no` AND startTable.ransom_cut_time IS NOT NULL
  LEFT JOIN biz_order_matter_record endTable
    ON bao.`apply_no` = endTable.`apply_no` and endTable.matter_key = 'GetCancelMaterial'
  join (select *
        from (select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'GetCancelMaterial' and r.relate_type = 'bpm_task' and r.relate_id <> '' and r.apply_no = 'QDC0120180613001'
              order by r.create_time desc) b
        group by apply_no, matter_key) endTableTmp on endTable.id = endTableTmp.id and endTableTmp.STATUS_ in( 'agree','awaiting_check')
where bao.flow_instance_id is not null AND bao.branch_id = '532000' and
      bao.apply_status not in ('refuse', 'recover', 'draft', 'pigeonhole', 'finished', 'fundsreturnconfirm', '') AND
      bao.apply_status IS NOT NULL and bao.apply_no = 'QDC0120180613001' and bao.apply_time between '2017-11-16' and now()
group by bao.apply_no;
;-- -. . -..- - / . -. - .-. -.--
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
limit 1;
;-- -. . -..- - / . -. - .-. -.--
select
                r.id,
                r.apply_no,
                r.matter_key,
                o.STATUS_
              from biz_order_matter_record r left join bpm_check_opinion o on r.relate_id = o.TASK_ID_
              where r.matter_key = 'MortgagePass' and r.relate_type = 'bpm_task' and r.relate_id <> ''
              order by r.create_time desc;
;-- -. . -..- - / . -. - .-. -.--
replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429005 ', 'STD10000040429005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 3, '1', '2018-07-27 16:45:41', '1', '2018-07-27 16:45:41', 0, '0', '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429006 ', 'STD10000040429006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 3, '1', '2018-07-27 16:45:42', '1', '2018-07-27 16:45:42', 0, '0', '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430005 ', 'STD10000040430005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)5工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 5, '1', '2018-07-27 16:50:24', '1', '2018-07-27 16:50:24', 0, '0', '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430006 ', 'STD10000040430006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)5工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 5, '1', '2018-07-27 16:50:24', '1', '2018-07-27 16:50:24', 0, '0', '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
SELECT u.*,r.alias_ from sys_user u inner JOIN sys_user_role ur on u.id_=ur.user_id_ inner join sys_role r on ur.role_id_=r.id_ and r.alias_='WRLXR1C';
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430005 ', 'STD10000040430005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)5工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 5, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430006 ', 'STD10000040430006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)5工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 5, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430007 ', 'STD10000040430007', '银行放款(保险)->赎楼还款(交易保（有赎楼）)5工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000040428005', 'TD10000040428006', '0', 5, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430008 ', 'STD10000040430008', '银行放款(保险)->过户(交易保（无赎楼）)5工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000040428005', 'TD10000033790004', '0', 5, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430009 ', 'STD10000040430009', '银行放款(保险)->赎楼还款(提放保（有赎楼）)5工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000040428005', 'TD10000040428006', '0', 5, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430010 ', 'STD10000040430010', '银行放款(保险)->办理抵押(提放保（无赎楼）)20工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR', 'TD10000040428005', 'TD10000028340009', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430011 ', 'STD10000040430011', '赎楼还款->取证及注销材料(及时贷（交易赎楼）)15工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430012 ', 'STD10000040430012', '赎楼还款->取证及注销材料(及时贷（非交易赎楼）)15工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430013 ', 'STD10000040430013', '赎楼还款->取证及注销材料(交易保（有赎楼）)15工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430014 ', 'STD10000040430014', '过户->取证(交易保（无赎楼）)30工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790004', 'TD10000033790006', '0', 30, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430015 ', 'STD10000040430015', '赎楼还款->取证及注销材料(提放保（有赎楼）)15工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430016 ', 'STD10000040430016', '办理抵押->完结(保险)(提放保（无赎楼）)20工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430017 ', 'STD10000040430017', '取证及注销材料->过户(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790002', 'TD10000033790004', '0', 3, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430019 ', 'STD10000040430019', '取证及注销材料->注销抵押(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000033790002', 'TD10000033790008', '0', 3, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430021 ', 'STD10000040430021', '取证及注销材料->过户(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790002', 'TD10000033790004', '0', 3, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430022 ', 'STD10000040430022', '取证->办理抵押(交易保（无赎楼）)7工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790006', 'TD10000028340009', '0', 7, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430023 ', 'STD10000040430023', '取证及注销材料->注销抵押(提放保（有赎楼）)3工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000033790002', 'TD10000033790008', '0', 3, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430024 ', 'STD10000040430024', '过户->取证(及时贷（交易赎楼）)30工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790004', 'TD10000033790006', '0', 30, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430025 ', 'STD10000040430025', '过户->取证(及时贷（交易提放）)30工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790004', 'TD10000033790006', '0', 30, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430026 ', 'STD10000040430026', '注销抵押->办理抵押(及时贷（非交易赎楼）)7工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000033790008', 'TD10000028340009', '0', 7, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430027 ', 'STD10000040430027', '注销抵押->办理抵押(及时贷（非交易提放）)7工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH', 'TD10000033790008', 'TD10000028340009', '0', 7, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430028 ', 'STD10000040430028', '过户->取证(交易保（有赎楼）)30工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790004', 'TD10000033790006', '0', 30, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430029 ', 'STD10000040430029', '办理抵押->完结(保险)(交易保（无赎楼）)20工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430030 ', 'STD10000040430030', '注销抵押->办理抵押(提放保（有赎楼）)7工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000033790008', 'TD10000028340009', '0', 7, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430031 ', 'STD10000040430031', '取证->办理抵押(及时贷（交易赎楼）)7工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790006', 'TD10000028340009', '0', 7, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430032 ', 'STD10000040430032', '取证->办理抵押(及时贷（交易提放）)7工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790006', 'TD10000028340009', '0', 7, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430033 ', 'STD10000040430033', '办理抵押->按揭银行放款(现金)(及时贷（非交易赎楼）)20工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430034 ', 'STD10000040430034', '办理抵押->按揭银行放款(现金)(及时贷（非交易提放）)20工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430035 ', 'STD10000040430035', '取证->办理抵押(交易保（有赎楼）)7工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790006', 'TD10000028340009', '0', 7, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430036 ', 'STD10000040430036', '办理抵押->完结(保险)(提放保（有赎楼）)20工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430037 ', 'STD10000040430037', '办理抵押->按揭银行放款(现金)(及时贷（交易赎楼）)30工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 30, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430038 ', 'STD10000040430038', '办理抵押->按揭银行放款(现金)(及时贷（交易提放）)30工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 30, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430039 ', 'STD10000040430039', '按揭银行放款(现金)->完结(现金)(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 3, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430040 ', 'STD10000040430040', '按揭银行放款(现金)->完结(现金)(及时贷（非交易提放）)3工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 3, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430041 ', 'STD10000040430041', '办理抵押->完结(保险)(交易保（有赎楼）)20工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430042 ', 'STD10000040430042', '按揭银行放款(现金)->完结(现金)(及时贷（交易赎楼）)20工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040430043 ', 'STD10000040430043', '按揭银行放款(现金)->完结(现金)(及时贷（交易提放）)20工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 20, null, '2018-07-27 16:50:24', null, '2018-07-27 16:50:24', null, null, '惠州公司', '752000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429005 ', 'STD10000040429005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 3, null, '2018-07-27 16:45:41', null, '2018-07-27 16:45:41', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429006 ', 'STD10000040429006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000032960002', 'TD10000040428006', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429007 ', 'STD10000040429007', '银行放款(保险)->赎楼还款(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000040428005', 'TD10000040428006', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429008 ', 'STD10000040429008', '银行放款(保险)->过户(交易保（无赎楼）)1工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000040428005', 'TD10000033790004', '0', 1, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429009 ', 'STD10000040429009', '银行放款(保险)->赎楼还款(提放保（有赎楼）)3工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000040428005', 'TD10000040428006', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429010 ', 'STD10000040429010', '银行放款(保险)->办理抵押(提放保（无赎楼）)3工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR', 'TD10000040428005', 'TD10000028340009', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429011 ', 'STD10000040429011', '赎楼还款->取证及注销材料(及时贷（交易赎楼）)15工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429012 ', 'STD10000040429012', '赎楼还款->取证及注销材料(及时贷（非交易赎楼）)15工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429013 ', 'STD10000040429013', '赎楼还款->取证及注销材料(交易保（有赎楼）)15工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429014 ', 'STD10000040429014', '过户->取证(交易保（无赎楼）)5工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790004', 'TD10000033790006', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429015 ', 'STD10000040429015', '赎楼还款->取证及注销材料(提放保（有赎楼）)15工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000040428006', 'TD10000033790002', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429016 ', 'STD10000040429016', '办理抵押->完结(保险)(提放保（无赎楼）)5工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429017 ', 'STD10000040429017', '取证及注销材料->过户(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790002', 'TD10000033790004', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429019 ', 'STD10000040429019', '取证及注销材料->注销抵押(及时贷（非交易赎楼）)2工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000033790002', 'TD10000033790008', '0', 2, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429021 ', 'STD10000040429021', '取证及注销材料->过户(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790002', 'TD10000033790004', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429022 ', 'STD10000040429022', '取证->办理抵押(交易保（无赎楼）)3工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790006', 'TD10000028340009', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429023 ', 'STD10000040429023', '取证及注销材料->注销抵押(提放保（有赎楼）)2工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000033790002', 'TD10000033790008', '0', 2, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429024 ', 'STD10000040429024', '过户->取证(及时贷（交易赎楼）)5工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790004', 'TD10000033790006', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429025 ', 'STD10000040429025', '过户->取证(及时贷（交易提放）)5工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790004', 'TD10000033790006', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429026 ', 'STD10000040429026', '注销抵押->办理抵押(及时贷（非交易赎楼）)5工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000033790008', 'TD10000028340009', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429027 ', 'STD10000040429027', '注销抵押->办理抵押(及时贷（非交易提放）)5工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH', 'TD10000033790008', 'TD10000028340009', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429028 ', 'STD10000040429028', '过户->取证(交易保（有赎楼）)5工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790004', 'TD10000033790006', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429029 ', 'STD10000040429029', '办理抵押->完结(保险)(交易保（无赎楼）)5工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429030 ', 'STD10000040429030', '注销抵押->办理抵押(提放保（有赎楼）)5工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000033790008', 'TD10000028340009', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429031 ', 'STD10000040429031', '取证->办理抵押(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790006', 'TD10000028340009', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429032 ', 'STD10000040429032', '取证->办理抵押(及时贷（交易提放）)3工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790006', 'TD10000028340009', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429033 ', 'STD10000040429033', '办理抵押->按揭银行放款(现金)(及时贷（非交易赎楼）)15工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429034 ', 'STD10000040429034', '办理抵押->按揭银行放款(现金)(及时贷（非交易提放）)15工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429035 ', 'STD10000040429035', '取证->办理抵押(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790006', 'TD10000028340009', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429036 ', 'STD10000040429036', '办理抵押->完结(保险)(提放保（有赎楼）)5工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429037 ', 'STD10000040429037', '办理抵押->按揭银行放款(现金)(及时贷（交易赎楼）)15工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429038 ', 'STD10000040429038', '办理抵押->按揭银行放款(现金)(及时贷（交易提放）)15工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000028340009', 'TD10000033790012', '0', 15, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429039 ', 'STD10000040429039', '按揭银行放款(现金)->完结(现金)(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429040 ', 'STD10000040429040', '按揭银行放款(现金)->完结(现金)(及时贷（非交易提放）)3工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429041 ', 'STD10000040429041', '办理抵押->完结(保险)(交易保（有赎楼）)5工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000028340009', 'TD10000041028001', '0', 5, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429042 ', 'STD10000040429042', '按揭银行放款(现金)->完结(现金)(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
replace INTO fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, create_user_id, create_time, update_user_id, update_time, rev, delete_flag, branch_name, branch_id) VALUES ('10000040429043 ', 'STD10000040429043', '按揭银行放款(现金)->完结(现金)(及时贷（交易提放）)3工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790012', 'TD10000040428007', '0', 3, null, '2018-07-27 16:45:42', null, '2018-07-27 16:45:42', null, null, '东莞公司', '769000');
;-- -. . -..- - / . -. - .-. -.--
update fw_timenode set rel_sql = 'bao.`apply_no` = #{ta}.`apply_no` and #{ta}.matter_key = ''#{flow_type}''  join ( select * from
  (select r.id, r.apply_no,r.matter_key ,o.STATUS_  from biz_order_matter_record r
    left join bpm_check_opinion o on r.relate_id=o.TASK_ID_
where r.matter_key=''#{flow_type}'' and  r.relate_type=''bpm_task'' and r.relate_id <> '''' order by  r.create_time desc) b group by apply_no,matter_key) #{ta}Tmp
    on #{ta}.id= #{ta}Tmp.id and #{ta}Tmp.STATUS_ in( ''agree'',''awaiting_check'')' where dbtablename ='biz_order_matter_record';
;-- -. . -..- - / . -. - .-. -.--
explain select *
        from biz_apply_order;
;-- -. . -..- - / . -. - .-. -.--
explain select *
        from biz_apply_order a left join biz_order_matter_record b on a.apply_no = b.apply_no;
;-- -. . -..- - / . -. - .-. -.--
explain select *
        from biz_apply_order a left join biz_order_matter_record b on a.apply_no = b.apply_no

union select *
      from biz_apply_order a left join biz_order_matter_record b on a.apply_no = b.apply_no;
;-- -. . -..- - / . -. - .-. -.--
explain select *
        from biz_apply_order a left join biz_order_matter_record b on a.apply_no = b.apply_no

union select *
      from biz_apply_order c left join biz_order_matter_record d on c.apply_no = d.apply_no;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM biz_apply_order WHERE product_id like '%YSL%' OR product_id LIKE '%NSL%';
;-- -. . -..- - / . -. - .-. -.--
SELECT apply_no,if(product_id like '%YSL%', '有赎楼','无赎楼') FROM biz_apply_order WHERE product_id like '%YSL%' OR product_id LIKE '%NSL%';
;-- -. . -..- - / . -. - .-. -.--
SELECT apply_no,if(product_id like '%YSL%', '有赎楼','无赎楼'),product_id FROM biz_apply_order WHERE product_id like '%YSL%' OR product_id LIKE '%NSL%';
;-- -. . -..- - / . -. - .-. -.--
SELECT apply_no,if(product_id like '%YSL%', '有赎楼','无赎楼'),product_id FROM biz_apply_order WHERE product_id like '%YSL%' OR product_id LIKE '%NSL%' order by create_time desc;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select distinct
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*
      from (SELECT distinct
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
            WHERE task.assignee_id_ = '1' AND task.status_ != 'TRANSFORMING'
            union all SELECT distinct
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
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '1' AND ca.type_ = 'user') or
                                                                        (ca.executor_ in ('10000000050760') and
                                                                         ca.type_ = 'role') or (ca.executor_ in
                                                                                                ('10000000050612', '10000000050607')
                                                                                                and ca.type_ = 'org') or
                                                                        (ca.executor_ in ('10000000050782') and
                                                                         ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '')
      union select distinct
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*
            from (SELECT distinct
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
                  WHERE task.assignee_id_ = '1' AND task.status_ != 'TRANSFORMING'
                  union all SELECT distinct
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
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '1' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in ('10000000050760') and
                                                                                  ca.type_ = 'role') or (ca.executor_ in
                                                                                                         ('10000000050612', '10000000050607')
                                                                                                         and ca.type_ =
                                                                                                             'org') or
                                                                              (ca.executor_ in ('10000000050782') and
                                                                               ca.type_ = 'position')))) AND
                                  task.status_ != 'TRANSFORMING') task INNER JOIN biz_apply_order b
                ON (task.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1 and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select count(1)
from (select *
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


                                or (ca.executor_ in ('10000000050612', '10000000050607') and ca.type_ = 'org')


                                or (ca.executor_ in ('10000000050782') and ca.type_ = 'position')

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


                                or (ca.executor_ in ('10000000050612', '10000000050607') and ca.type_ = 'org')


                                or (ca.executor_ in ('10000000050782') and ca.type_ = 'position')

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
      order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC) tmp_count;
;-- -. . -..- - / . -. - .-. -.--
explain select count(1)
from (select *
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


                                or (ca.executor_ in ('10000000050612', '10000000050607') and ca.type_ = 'org')


                                or (ca.executor_ in ('10000000050782') and ca.type_ = 'position')

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


                                or (ca.executor_ in ('10000000050612', '10000000050607') and ca.type_ = 'org')


                                or (ca.executor_ in ('10000000050782') and ca.type_ = 'position')

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
      order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC) tmp_count;
;-- -. . -..- - / . -. - .-. -.--
select count(1) from BPM_TASK_CANDIDATE;
;-- -. . -..- - / . -. - .-. -.--
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
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
select *
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
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select distinct
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '70000000060556' AND task.status_ != 'TRANSFORMING'
            union all SELECT distinct task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '70000000060556' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '')
      union select distinct
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '70000000060556' AND task.status_ != 'TRANSFORMING'
                  union all SELECT distinct task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '70000000060556' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1 and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC
limit 10;
;-- -. . -..- - / . -. - .-. -.--
explain select *
from (select distinct
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '70000000060556' AND task.status_ != 'TRANSFORMING'
            union all SELECT distinct task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '70000000060556' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '')
      union select distinct
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '70000000060556' AND task.status_ != 'TRANSFORMING'
                  union all SELECT distinct task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '70000000060556' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1 and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC
limit 10;
;-- -. . -..- - / . -. - .-. -.--
select *
from (select distinct
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '70000000060556' AND task.status_ != 'TRANSFORMING'
            union all SELECT distinct task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '70000000060556' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '')
      union select distinct
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '70000000060556' AND task.status_ != 'TRANSFORMING'
                  union all SELECT distinct task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '70000000060556' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1 and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
select distinct *
from (select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
            union all SELECT task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1  and (b.city_no is null or b.city_no = '')
      union select distinct
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
                  union all SELECT task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1   and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC
limit 10;
;-- -. . -..- - / . -. - .-. -.--
explain select distinct *
from (select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
            union all SELECT task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1  and (b.city_no is null or b.city_no = '')
      union select distinct
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
                  union all SELECT task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1   and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
select distinct *
from (select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
            union all SELECT task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1  and (b.city_no is null or b.city_no = '')
      union select distinct
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
                  union all SELECT task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1   and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
select distinct *
from (select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
            union all SELECT task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1  and (b.city_no is null or b.city_no = '')
      union select 
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
                  union all SELECT task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1   and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
select distinct * from (
		select b.*,isr.is_priority,isr.materials_upload_status,isr.tail_release_node,task.*,
		inst.proc_def_name_ procDefName,
		inst.create_by_ creatorId,inst.CREATOR_ creator,
		inst.create_time_
		createDate,
		inst.status_ instStatus,
		type.id_ typeId,
		inst.PARENT_INST_ID_ as parent_inst_id_ from
		(
		SELECT task.*
		FROM BPM_TASK task
		WHERE
		task.assignee_id_ = '10000024673028'

		AND  task.status_ !='TRANSFORMING'
		union all
		SELECT task.*
		FROM BPM_TASK task
		join BPM_TASK_CANDIDATE ca
		on  task.assignee_id_ = '0'

		and   task.id_ = ca.task_id_
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000371122','10000000376121') and ca.type_ ='org')


			or ( ca.executor_ in ('60000000100799','60003760101909') and ca.type_ ='position')

		)
		AND  task.status_ !='TRANSFORMING'
     ) task

		LEFT JOIN
		BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		LEFT JOIN SYS_TYPE
		type ON type.id_ = inst.type_id_
		INNER JOIN
		biz_apply_order b ON (
		task.proc_inst_id_ = b.flow_instance_id
		)

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		WHERE 1 = 1







		 and (b.city_no is  null or b.city_no  ='')


		union

		select b.*,isr.is_priority,isr.materials_upload_status,isr.tail_release_node,task.*,
		inst.proc_def_name_ procDefName,
		inst.create_by_ creatorId,inst.CREATOR_ creator,
		inst.create_time_
		createDate,
		inst.status_ instStatus,
		type.id_ typeId,
		inst.PARENT_INST_ID_ as parent_inst_id_ from
		(
		SELECT task.*
		FROM BPM_TASK task
		WHERE
		task.assignee_id_ = '10000024673028'

		AND  task.status_ !='TRANSFORMING'
		union all
		SELECT task.*
		FROM BPM_TASK task
		join BPM_TASK_CANDIDATE ca
		on  task.assignee_id_ = '0'

		and   task.id_ = ca.task_id_
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000371122','10000000376121') and ca.type_ ='org')


			or ( ca.executor_ in ('60000000100799','60003760101909') and ca.type_ ='position')

		)
		AND  task.status_ !='TRANSFORMING'
     ) task

		LEFT JOIN
		BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		LEFT JOIN SYS_TYPE
		type ON type.id_ = inst.type_id_
		INNER JOIN
		biz_apply_order b ON (
		inst.parent_inst_id_ = b.flow_instance_id
		)

		LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		WHERE 1 = 1







		and (b.city_no is  null or b.city_no  ='')
	 ) a
		order by a.PRIORITY_ DESC ,  a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
explain select distinct * from (
		select b.*,isr.is_priority,isr.materials_upload_status,isr.tail_release_node,task.*,
		inst.proc_def_name_ procDefName,
		inst.create_by_ creatorId,inst.CREATOR_ creator,
		inst.create_time_
		createDate,
		inst.status_ instStatus,
		type.id_ typeId,
		inst.PARENT_INST_ID_ as parent_inst_id_ from
		(
		SELECT task.*
		FROM BPM_TASK task
		WHERE
		task.assignee_id_ = '10000024673028'

		AND  task.status_ !='TRANSFORMING'
		union all
		SELECT task.*
		FROM BPM_TASK task
		join BPM_TASK_CANDIDATE ca
		on  task.assignee_id_ = '0'

		and   task.id_ = ca.task_id_
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000371122','10000000376121') and ca.type_ ='org')


			or ( ca.executor_ in ('60000000100799','60003760101909') and ca.type_ ='position')

		)
		AND  task.status_ !='TRANSFORMING'
     ) task

		LEFT JOIN
		BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		LEFT JOIN SYS_TYPE
		type ON type.id_ = inst.type_id_
		INNER JOIN
		biz_apply_order b ON (
		task.proc_inst_id_ = b.flow_instance_id
		)

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		WHERE 1 = 1







		 and (b.city_no is  null or b.city_no  ='')


		union

		select b.*,isr.is_priority,isr.materials_upload_status,isr.tail_release_node,task.*,
		inst.proc_def_name_ procDefName,
		inst.create_by_ creatorId,inst.CREATOR_ creator,
		inst.create_time_
		createDate,
		inst.status_ instStatus,
		type.id_ typeId,
		inst.PARENT_INST_ID_ as parent_inst_id_ from
		(
		SELECT task.*
		FROM BPM_TASK task
		WHERE
		task.assignee_id_ = '10000024673028'

		AND  task.status_ !='TRANSFORMING'
		union all
		SELECT task.*
		FROM BPM_TASK task
		join BPM_TASK_CANDIDATE ca
		on  task.assignee_id_ = '0'

		and   task.id_ = ca.task_id_
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000371122','10000000376121') and ca.type_ ='org')


			or ( ca.executor_ in ('60000000100799','60003760101909') and ca.type_ ='position')

		)
		AND  task.status_ !='TRANSFORMING'
     ) task

		LEFT JOIN
		BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		LEFT JOIN SYS_TYPE
		type ON type.id_ = inst.type_id_
		INNER JOIN
		biz_apply_order b ON (
		inst.parent_inst_id_ = b.flow_instance_id
		)

		LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		WHERE 1 = 1







		and (b.city_no is  null or b.city_no  ='')
	 ) a
		order by a.PRIORITY_ DESC ,  a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
explain select distinct *
from (select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
              join BPM_TASK_CANDIDATE ca on (task.assignee_id_ = '10000024673028' or
                                             (task.assignee_id_ = '0' and task.id_ = ca.task_id_ AND (
                                               (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))) AND
                                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '')
      union select
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                    join BPM_TASK_CANDIDATE ca on (task.assignee_id_ = '10000024673028' or
                                                   (task.assignee_id_ = '0' and task.id_ = ca.task_id_ AND (
                                                     (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                  and ca.type_ = 'role')
                                                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                                                         ca.type_ = 'org') or
                                                     (ca.executor_ in ('60000000100799', '60003760101909') and
                                                      ca.type_ = 'position')))) AND
                                                  task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1 and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC
limit 10;
;-- -. . -..- - / . -. - .-. -.--
explain select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
              join BPM_TASK_CANDIDATE ca on (task.assignee_id_ = '10000024673028' or
                                             (task.assignee_id_ = '0' and task.id_ = ca.task_id_ AND (
                                               (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))) AND
                                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
              join BPM_TASK_CANDIDATE ca on (task.assignee_id_ = '10000024673028' or
                                             (task.assignee_id_ = '0' and task.id_ = ca.task_id_ AND (
                                               (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))) AND
                                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select distinct * from (
		select b.*,isr.is_priority,isr.materials_upload_status,isr.tail_release_node,task.*,
		inst.proc_def_name_ procDefName,
		inst.create_by_ creatorId,inst.CREATOR_ creator,
		inst.create_time_
		createDate,
		inst.status_ instStatus,
		type.id_ typeId,
		inst.PARENT_INST_ID_ as parent_inst_id_ from
		(
		SELECT task.*
		FROM BPM_TASK task
		WHERE
		task.assignee_id_ = '10000024673028'

		AND  task.status_ !='TRANSFORMING'
		union all
		SELECT task.*
		FROM BPM_TASK task
		join BPM_TASK_CANDIDATE ca
		on  task.assignee_id_ = '0'

		and   task.id_ = ca.task_id_
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000371122','10000000376121') and ca.type_ ='org')


			or ( ca.executor_ in ('60000000100799','60003760101909') and ca.type_ ='position')

		)
		AND  task.status_ !='TRANSFORMING'
     ) task

		LEFT JOIN
		BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		LEFT JOIN SYS_TYPE
		type ON type.id_ = inst.type_id_
		INNER JOIN
		biz_apply_order b ON (
		task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id
		)

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		WHERE 1 = 1







		 and (b.city_no is  null or b.city_no  ='');
;-- -. . -..- - / . -. - .-. -.--
explain  
  select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
        join BPM_TASK_CANDIDATE ca
          on task.assignee_id_ = '0'

             and task.id_ = ca.task_id_
             AND ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')

                  or (ca.executor_ in
                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                      and ca.type_ = 'role')


                  or (ca.executor_ in ('10000000371122', '10000000376121') and ca.type_ = 'org')


                  or (ca.executor_ in ('60000000100799', '60003760101909') and ca.type_ = 'position')

             )
             AND task.status_ != 'TRANSFORMING'
    ) task

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain
  select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
        join BPM_TASK_CANDIDATE ca
          on task.assignee_id_ = '0'

             and task.id_ = ca.task_id_
             AND ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')

                  or (ca.executor_ in
                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                      and ca.type_ = 'role')


                  or (ca.executor_ in ('10000000371122', '10000000376121') and ca.type_ = 'org')


                  or (ca.executor_ in ('60000000100799', '60003760101909') and ca.type_ = 'position')

             )
             AND task.status_ != 'TRANSFORMING'
    ) task

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
        join BPM_TASK_CANDIDATE ca
          on task.assignee_id_ = '0'

             and task.id_ = ca.task_id_
             AND ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')

                  or (ca.executor_ in
                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                      and ca.type_ = 'role')


                  or (ca.executor_ in ('10000000371122', '10000000376121') and ca.type_ = 'org')


                  or (ca.executor_ in ('60000000100799', '60003760101909') and ca.type_ = 'position')

             )
             AND task.status_ != 'TRANSFORMING'
    ) task

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain
  select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
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

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain
  select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
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

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    b.flow_instance_id in (task.proc_inst_id_ , inst.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain
  select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
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

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    b.flow_instance_id in (inst.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
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

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    b.flow_instance_id in (inst.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain
  select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
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

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    b.flow_instance_id in (task.proc_inst_id_)
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select
    b.*,
    isr.is_priority,
    isr.materials_upload_status,
    isr.tail_release_node,
    task.*,
    inst.proc_def_name_     procDefName,
    inst.create_by_         creatorId,
    inst.CREATOR_           creator,
    inst.create_time_
                            createDate,
    inst.status_            instStatus,
    type.id_                typeId,
    inst.PARENT_INST_ID_ as parent_inst_id_
  from
    (
      SELECT task.*
      FROM BPM_TASK task
      WHERE
        task.assignee_id_ = '10000024673028'

        AND task.status_ != 'TRANSFORMING'
      union all
      SELECT task.*
      FROM BPM_TASK task
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

    LEFT JOIN
    BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
    LEFT JOIN SYS_TYPE
              type ON type.id_ = inst.type_id_
    INNER JOIN
    biz_apply_order b ON (
    b.flow_instance_id in (task.proc_inst_id_)
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
    biz_apply_order b ON (
    b.flow_instance_id in (task.proc_inst_id_ , task.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
use bpms;
;-- -. . -..- - / . -. - .-. -.--
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
                  task.assignee_id_ = '10000024673028' or (task.assignee_id_ = '0' and task.id_ in (
                     SELECT ca.task_id_
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE  (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))
                   AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
SELECT
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
                  task.assignee_id_ = '10000024673028' or (task.assignee_id_ = '0' and
                                       exists(
                     SELECT 1
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE task.id_ = ca.task_id_ and  (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))
                   AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain  SELECT
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
                  (task.assignee_id_ = '0' and
                                       exists(
                     SELECT 1
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE task.id_ = ca.task_id_ and  (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))
                   AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain  SELECT
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
                  task.assignee_id_ = '10000024673028' or (task.assignee_id_ = '0' and
                                       exists(
                     SELECT 1
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE task.id_ = ca.task_id_ and  (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))
                   AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain  SELECT
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
                            (task.assignee_id_ = '10000024673028' or (task.assignee_id_ = '0' and
                                       exists(
                     SELECT 1
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE task.id_ = ca.task_id_ and  (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position'))))
                   AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain  SELECT
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
                            task.assignee_id_ = '10000024673028' 
                   AND task.status_ != 'TRANSFORMING'
               
               union  all 
               
               SELECT
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
                            ( (task.assignee_id_ = '0' and
                                       exists(
                     SELECT 1
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE task.id_ = ca.task_id_ and  (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position'))))
                   AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain  SELECT
                   task.*

                 FROM BPM_TASK task
                   
                 WHERE
                            task.assignee_id_ = '10000024673028'
                   AND task.status_ != 'TRANSFORMING'

               union  all

               SELECT
                   task.*

                 FROM BPM_TASK task
                 WHERE
                            ( (task.assignee_id_ = '0' and
                                       exists(
                     SELECT 1
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE task.id_ = ca.task_id_ and  (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position'))))
                   AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE task.id_ = ca.task_id_ and (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position')))
          AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE task.id_ = ca.task_id_ and ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position'))))
          AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE task.id_ = ca.task_id_ and ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position'))))
          AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position'))and task.id_ = ca.task_id_ ))
          AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position'))
                    and task.id_ = ca.task_id_ ))
          AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain select * from 
                      (SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position'))
                    and task.id_ = ca.task_id_ ))
          AND task.status_ != 'TRANSFORMING') task 
LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join
                      (SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position'))
                    and task.id_ = ca.task_id_ ))
          AND task.status_ != 'TRANSFORMING') task
                          ON (task.proc_inst_id_ = b.flow_instance_id)
LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_  and inst.parent_inst_id_ = b.flow_instance_id

        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select * from
                      biz_apply_order b join
                      (SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and
                exists(
                  SELECT 1
                  FROM BPM_TASK_CANDIDATE ca
                  WHERE ((ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position'))
                    and task.id_ = ca.task_id_ ))
          AND task.status_ != 'TRANSFORMING') task
                          ON (task.proc_inst_id_ = b.flow_instance_id)
LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_  and inst.parent_inst_id_ = b.flow_instance_id

        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
SELECT ca.task_id_
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE 1 = 1
                           AND ((ca.executor_ = '1' AND ca.type_ = 'user')

                                or (ca.executor_ in ('10000000050760') and ca.type_ = 'role')


                                or (ca.executor_ in ('10000000050612', '10000000050607') and ca.type_ = 'org')


                                or (ca.executor_ in ('10000000050782') and ca.type_ = 'position')

                           );
;-- -. . -..- - / . -. - .-. -.--
SELECT ca.task_id_
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE 1 = 1
                           AND (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position');
;-- -. . -..- - / . -. - .-. -.--
explain SELECT ca.task_id_
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE 1 = 1
                           AND (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position');
;-- -. . -..- - / . -. - .-. -.--
desc bpm_task;
;-- -. . -..- - / . -. - .-. -.--
show create  table biz_apply_order;
;-- -. . -..- - / . -. - .-. -.--
show create table bpm_task;
;-- -. . -..- - / . -. - .-. -.--
select * from
                      biz_apply_order b join
                      (SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position')))
          AND task.status_ != 'TRANSFORMING') task
                          ON (task.proc_inst_id_ = b.flow_instance_id)
LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_  and inst.parent_inst_id_ = b.flow_instance_id

        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join
                      (SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position')))
          AND task.status_ != 'TRANSFORMING') task
                          ON (task.proc_inst_id_ = b.flow_instance_id)
LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_  and inst.parent_inst_id_ = b.flow_instance_id

        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join
                      (SELECT task.*

        FROM BPM_TASK task

        WHERE task.assignee_id_ = '10000024673028'
          AND task.status_ != 'TRANSFORMING'
        union all

        SELECT task.*

        FROM BPM_TASK task
        WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                     FROM BPM_TASK_CANDIDATE ca
                     WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                     or (ca.executor_ in
                         ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                           and ca.type_ = 'role')
                     or (ca.executor_ in ('10000000371122', '10000000376121') and
                         ca.type_ = 'org')
                     or (ca.executor_ in ('60000000100799', '60003760101909') and
                         ca.type_ = 'position')))
          AND task.status_ != 'TRANSFORMING') task
                          ON (task.proc_inst_id_ = b.flow_instance_id)
LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_

        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join ((SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task
                          
                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) ptask
                          ON (ptask.proc_inst_id_ = b.flow_instance_id   or ptask.parent_inst_id_ = b.flow_instance_id)
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join (select * from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON (ptask.proc_inst_id_ = b.flow_instance_id   or ptask.parent_inst_id_ = b.flow_instance_id)
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,
                   
                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON (ptask.proc_inst_id_ = b.flow_instance_id   or ptask.parent_inst_id_ = b.flow_instance_id)
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON (ptask.proc_inst_id_ = b.flow_instance_id   or ptask.parent_inst_id_ = b.flow_instance_id)
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON (ptask.parent_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON (ptask.parent_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '')
union all 
select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON ( ptask.proc_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON (ptask.parent_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '')
union all
select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON ( ptask.proc_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
desc BPM_PRO_INST;
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON (ptask.parent_inst_id_ = b.flow_instance_id or ptask.proc_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
desc biz_apply_order;
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON b.flow_instance_id is not null and (ptask.parent_inst_id_ = b.flow_instance_id or ptask.proc_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select
  b.*,
  isr.is_priority,
  isr.materials_upload_status,
  isr.tail_release_node
from (SELECT distinct
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_,
        b.*
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING' and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
explain select
  b.*,
  isr.is_priority,
  isr.materials_upload_status,
  isr.tail_release_node
from (SELECT distinct
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_,
        b.*
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING' and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING' and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING' and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON b.flow_instance_id is not null and (ptask.parent_inst_id_ = b.flow_instance_id or ptask.proc_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING' and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
explain select * from
                      biz_apply_order b join (select task.*,
                   inst.proc_def_name_     procDefName,
                   inst.create_by_         creatorId,
                   inst.CREATOR_           creator,
                   inst.create_time_
                                           createDate,
                   inst.status_            instStatus,

                   inst.PARENT_INST_ID_ as parent_inst_id_ from (SELECT task.*

                                               FROM BPM_TASK task

                                               WHERE task.assignee_id_ = '10000024673028'
                                                 AND task.status_ != 'TRANSFORMING'
                                               union all

                                               SELECT task.*

                                               FROM BPM_TASK task
                                               WHERE (task.assignee_id_ = '0' and task.ID_ in (SELECT ca.task_id_
                                                                                               FROM BPM_TASK_CANDIDATE ca
                                                                                               WHERE (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                                                  or (ca.executor_ in
                                                                                                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                                        and
                                                                                                      ca.type_ = 'role')
                                                                                                  or (ca.executor_ in (
                                                                                                   '10000000371122',
                                                                                                   '10000000376121') and
                                                                                                      ca.type_ = 'org')
                                                                                                  or (ca.executor_ in (
                                                                                                   '60000000100799',
                                                                                                   '60003760101909') and
                                                                                                      ca.type_ = 'position')))
                                                 AND task.status_ != 'TRANSFORMING') task

                          LEFT JOIN BPM_PRO_INST inst
                          ON task.proc_inst_id_ = inst.id_
                          ) as ptask
                          ON  (ptask.parent_inst_id_ = b.flow_instance_id or ptask.proc_inst_id_ = b.flow_instance_id )
        LEFT JOIN SYS_TYPE type ON type.id_ = ptask.type_id_

        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING' and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
                       task.assignee_id_ = '10000024673028') AND task.status_ != 'TRANSFORMING' and
            (b.city_no is null or b.city_no = '')
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
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
join BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE 1 = 1 AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
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
          
      WHERE  (  (task.proc_inst_id_ = b.flow_instance_id) or inst.parent_inst_id_ = b.flow_instance_id ) AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
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

      WHERE  ( b.flow_instance_id in( task.proc_inst_id_   ,  b.flow_instance_id =inst.parent_inst_id_ ) ) AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
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

      WHERE  ( b.flow_instance_id in( task.proc_inst_id_   ,  inst.parent_inst_id_ ) ) AND ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
explain select *
from bpm_task task
where ((task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                 FROM BPM_TASK_CANDIDATE ca
                                                 WHERE 1 = 1
                                                   AND ((ca.executor_ = '10000024673028' AND
                                                         ca.type_ = 'user') or (
                                                            ca.executor_ in
                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                              and ca.type_ = 'role') or
                                                        (ca.executor_ in ('10000000755114')
                                                           and ca.type_ = 'org') or
                                                        (ca.executor_ in ('60000000130793')
                                                           and ca.type_ = 'position')))) or
       task.assignee_id_ = '10000024673028')
  AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
task.id_ in (SELECT ca.task_id_
                                                 FROM BPM_TASK_CANDIDATE ca
                                                 WHERE 1 = 1
                                                   AND ((ca.executor_ = '10000024673028' AND
                                                         ca.type_ = 'user') or (
                                                            ca.executor_ in
                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                              and ca.type_ = 'role') or
                                                        (ca.executor_ in ('10000000755114')
                                                           and ca.type_ = 'org') or
                                                        (ca.executor_ in ('60000000130793')
                                                           and ca.type_ = 'position'))) and task.assignee_id_ = '0' ;
;-- -. . -..- - / . -. - .-. -.--
SELECT ca.task_id_
                                                 FROM BPM_TASK_CANDIDATE ca
                                                 WHERE 1 = 1
                                                   AND ((ca.executor_ = '10000024673028' AND
                                                         ca.type_ = 'user') or (
                                                            ca.executor_ in
                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                              and ca.type_ = 'role') or
                                                        (ca.executor_ in ('10000000755114')
                                                           and ca.type_ = 'org') or
                                                        (ca.executor_ in ('60000000130793')
                                                           and ca.type_ = 'position'));
;-- -. . -..- - / . -. - .-. -.--
explain select *
from bpm_task task
where ((task.id_ in (SELECT ca.task_id_
                                                 FROM BPM_TASK_CANDIDATE ca
                                                 WHERE 1 = 1
                                                   AND ((ca.executor_ = '10000024673028' AND
                                                         ca.type_ = 'user') or (
                                                            ca.executor_ in
                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                              and ca.type_ = 'role') or
                                                        (ca.executor_ in ('10000000755114')
                                                           and ca.type_ = 'org') or
                                                        (ca.executor_ in ('60000000130793')
                                                           and ca.type_ = 'position'))) and task.assignee_id_ = '0' ) or
       task.assignee_id_ = '10000024673028')
  AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain select *
from bpm_task task
where ((task.id_ in (SELECT ca.task_id_
                                                 FROM BPM_TASK_CANDIDATE ca
                                                 WHERE 1 = 1
                                                   AND ((ca.executor_ = '10000024673028' AND
                                                         ca.type_ = 'user') or (
                                                            ca.executor_ in
                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                              and ca.type_ = 'role') or
                                                        (ca.executor_ in ('10000000755114')
                                                           and ca.type_ = 'org') or
                                                        (ca.executor_ in ('60000000130793')
                                                           and ca.type_ = 'position'))) and task.assignee_id_ = '0' ))
  AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain select *
from bpm_task task
where (task.assignee_id_ = '0' and (task.id_ in (SELECT ca.task_id_
                                                 FROM BPM_TASK_CANDIDATE ca
                                                 WHERE 1 = 1
                                                   AND ((ca.executor_ = '10000024673028' AND
                                                         ca.type_ = 'user') or (
                                                            ca.executor_ in
                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                              and ca.type_ = 'role') or
                                                        (ca.executor_ in ('10000000755114')
                                                           and ca.type_ = 'org') or
                                                        (ca.executor_ in ('60000000130793')
                                                           and ca.type_ = 'position')))  ))
  AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain select *
        from bpm_task task
        where ((task.assignee_id_ = '0' and (task.id_ in (SELECT ca.task_id_
                                                         FROM BPM_TASK_CANDIDATE ca
                                                         WHERE 1 = 1
                                                           AND ((ca.executor_ = '10000024673028' AND
                                                                 ca.type_ = 'user') or (
                                                                    ca.executor_ in
                                                                    ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                      and ca.type_ = 'role') or
                                                                (ca.executor_ in ('10000000755114')
                                                                   and ca.type_ = 'org') or
                                                                (ca.executor_ in ('60000000130793')
                                                                   and ca.type_ = 'position'))))) or
task.assignee_id_ = '10000024673028')
          AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain select *
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
          AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain select task.ID_, task.PROC_INST_ID_ 
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


        union  all 
    

select task.ID_, task.PROC_INST_ID_ from bpm_task task where  
               task.assignee_id_ = '10000024673028';
;-- -. . -..- - / . -. - .-. -.--
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


        union  all


select task.ID_, task.PROC_INST_ID_ from bpm_task task where
               task.assignee_id_ = '10000024673028';
;-- -. . -..- - / . -. - .-. -.--
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


        union  all


select task.ID_, task.PROC_INST_ID_ from bpm_task task where
               task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING';
;-- -. . -..- - / . -. - .-. -.--
explain

select *
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

join bpm_pro_inst inst on task.PROC_INST_ID_ = inst.ID_;
;-- -. . -..- - / . -. - .-. -.--
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

join biz_apply_order b on b.flow_instance_id in (task.PROC_INST_ID_);
;-- -. . -..- - / . -. - .-. -.--
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

join biz_apply_order b on b.flow_instance_id in (task.PROC_INST_ID_);
;-- -. . -..- - / . -. - .-. -.--
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

join biz_apply_order b on b.flow_instance_id in (task.PROC_INST_ID_, inst.PARENT_INST_ID_)

union 
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

join biz_apply_order b on b.flow_instance_id in (inst.PARENT_INST_ID_);
;-- -. . -..- - / . -. - .-. -.--
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

join biz_apply_order b on b.flow_instance_id in (inst.PARENT_INST_ID_);
;-- -. . -..- - / . -. - .-. -.--
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

join biz_apply_order b on b.flow_instance_id in (task.PROC_INST_ID_, inst.PARENT_INST_ID_);
;-- -. . -..- - / . -. - .-. -.--
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

join biz_apply_order b on b.flow_instance_id in (task.PROC_INST_ID_)

union 
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

join biz_apply_order b on b.flow_instance_id in (inst.PARENT_INST_ID_);
;-- -. . -..- - / . -. - .-. -.--
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

join biz_apply_order b on b.flow_instance_id in (task.PROC_INST_ID_)

union
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

join biz_apply_order b on b.flow_instance_id in (inst.PARENT_INST_ID_);
;-- -. . -..- - / . -. - .-. -.--
show profiles;
;-- -. . -..- - / . -. - .-. -.--
show index from biz_apply_order;
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
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
;-- -. . -..- - / . -. - .-. -.--
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
      order by task.PRIORITY_ DESC, CREATE_TIME_ DESC) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select distinct
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE   (( task.assignee_id_ = '0' and   task.id_ in (
		SELECT ca.task_id_ FROM BPM_TASK_CANDIDATE ca WHERE 1 = 1
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000371122','10000000376121') and ca.type_ ='org')


			or ( ca.executor_ in ('60000000100799','60003760101909') and ca.type_ ='position')

		)
		)) or task.assignee_id_ = '10000024673028')
		AND  task.status_ !='TRANSFORMING' and
            (b.city_no is null or b.city_no = '')) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		order by b.PRIORITY_ DESC , b.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
explain select distinct
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
      FROM BPM_TASK task LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b
          ON (task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id)
      WHERE   (( task.assignee_id_ = '0' and   task.id_ in (
		SELECT ca.task_id_ FROM BPM_TASK_CANDIDATE ca WHERE 1 = 1
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in ('50000000000006','50000000000011','50000000000007','50000000000008','50000000000009','50000000000010','50000000000012','10000055728052','10000044210201','10000044210208','10000041080003','10000041080004','10000037242101','10000049179001','50000000000028') and ca.type_ ='role')


			or ( ca.executor_ in ('10000000371122','10000000376121') and ca.type_ ='org')


			or ( ca.executor_ in ('60000000100799','60003760101909') and ca.type_ ='position')

		)
		)) or task.assignee_id_ = '10000024673028')
		AND  task.status_ !='TRANSFORMING' and
            (b.city_no is null or b.city_no = '')) as b LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
		order by b.PRIORITY_ DESC , b.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
SELECT f.apply_no
FROM (SELECT d.apply_no, e.outside_status
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferOut', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE f.outside_status != 1
   OR f.outside_status IS NULL;
;-- -. . -..- - / . -. - .-. -.--
SELECT f.apply_no,f.outside_status
FROM (SELECT d.apply_no, e.outside_status
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferOut', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE f.outside_status != 1
   OR f.outside_status IS NULL;
;-- -. . -..- - / . -. - .-. -.--
SELECT f.*
FROM (SELECT d.apply_no, e.outside_status,d.handle_time,d.matter_key
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferOut', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE f.outside_status != 1
   OR f.outside_status IS NULL;
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_p2p_ret where partner_id = 'XDA-WC001';
;-- -. . -..- - / . -. - .-. -.--
select * from biz_apply_order where product_id like '%YJY%';
;-- -. . -..- - / . -. - .-. -.--
select  * from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select * from biz_apply_order where product_id like '%NSL_YJY%');
;-- -. . -..- - / . -. - .-. -.--
select  * from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%NSL_YJY%');
;-- -. . -..- - / . -. - .-. -.--
select  * from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%NSL_YJY%') and node_id ='TransferIn';
;-- -. . -..- - / . -. - .-. -.--
select  * from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%NSL_NJY%');
;-- -. . -..- - / . -. - .-. -.--
select  * from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%YSL_NJY%' or product_id like '%NSL_NJY%') and node_id ='MortgagePass';
;-- -. . -..- - / . -. - .-. -.--
SELECT  * from biz_after_loan_material  where partner_id = 'XDA-WC001';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_apply_order where apply_no='FSC0320180727011';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_order_matter_record where apply_no='HZC0220180726001';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_order_matter_record where apply_no='WHC0320180713001';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_order_matter_record where house_no='20180700030489';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_order_matter_record where apply_no='FSC0320180727011';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_order_matter_record where apply_no='FSC0320180727010';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_order_matter_record where apply_no='FSC0220180724003';
;-- -. . -..- - / . -. - .-. -.--
delete from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%NSL_YJY%' or product_id like '%NSL_NJY%') and node_id ='TransferIn';
;-- -. . -..- - / . -. - .-. -.--
delete from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%YSL_NJY%' or product_id like '%NSL_NJY%') and node_id ='MortgagePass';
;-- -. . -..- - / . -. - .-. -.--
delete from biz_after_loan_material  where partner_id = 'XDA-WC001';
;-- -. . -..- - / . -. - .-. -.--
delete from biz_after_loan_material where apply_no='FZC0120180712004' and node_id='TransferIn';
;-- -. . -..- - / . -. - .-. -.--
SELECT f.apply_no, f.outside_status, f.node_id
FROM (SELECT d.apply_no, e.outside_status, e.node_id
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE f.outside_status != 1
   OR f.outside_status IS NULL;
;-- -. . -..- - / . -. - .-. -.--
SELECT f.apply_no, f.outside_status, f.node_id
FROM (SELECT d.apply_no, e.outside_status, e.node_id
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE f.outside_status != 1
   OR f.outside_status IS NULL and apply_no='FZC0120180712004';
;-- -. . -..- - / . -. - .-. -.--
SELECT f.apply_no, f.outside_status, f.node_id
FROM (SELECT d.apply_no, e.outside_status, e.node_id
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE f.outside_status != 1
   OR f.outside_status IS NULL and f.apply_no='FZC0120180712004';
;-- -. . -..- - / . -. - .-. -.--
SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null and a.apply_no='FZC0120180712004';
;-- -. . -..- - / . -. - .-. -.--
SELECT f.apply_no, f.outside_status, f.node_id
FROM (SELECT d.apply_no, e.outside_status, e.node_id
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null) d
              JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE f.outside_status != 1
   OR f.outside_status IS NULL and f.apply_no='FZC0120180712004';
;-- -. . -..- - / . -. - .-. -.--
SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null;
;-- -. . -..- - / . -. - .-. -.--
SELECT d.apply_no, e.outside_status, e.node_id
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id;
;-- -. . -..- - / . -. - .-. -.--
SELECT f.apply_no, f.outside_status, f.node_id
FROM (SELECT d.apply_no, e.outside_status, e.node_id
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE (f.outside_status != 1
   OR f.outside_status IS NULL) and f.apply_no='FZC0120180712004';
;-- -. . -..- - / . -. - .-. -.--
select *
 from biz_after_loan_material where apply_no='FZC0120180712004';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_order_matter_record where apply_no='FZC0120180712004';
;-- -. . -..- - / . -. - .-. -.--
select *
from sys_properties where ALIAS like '%wc%';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_ = 'uploadImg_guaranty';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_ = 'uploadImg';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_task_candidate;
;-- -. . -..- - / . -. - .-. -.--
select *
from fw_warn_hist where warn_date > '2018-07-18';
;-- -. . -..- - / . -. - .-. -.--
from sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join sys_org_user u on u.USER_ID_=ur.user_id_ where r.ALIAS_ IN( 'YYZG','yjcly') and u.ORG_ID_ in (select branch_id from fw_warn_hist where warn_date > '2018-07-18');;
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_
from sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join sys_org_user u on u.USER_ID_=ur.user_id_ where r.ALIAS_ IN( 'YYZG','yjcly') and u.ORG_ID_ in (select branch_id from fw_warn_hist where warn_date > '2018-07-18');
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_
from sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_

where r.ALIAS_ IN( 'YYZG','yjcly') and uor.companyCode in (select branch_id from fw_warn_hist where warn_date > '2018-07-18');
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_, hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id

where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_, hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id

where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and hist.apply_no='NTC0320180530001';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id

where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and hist.apply_no='NTC0320180530001';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id

where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='0' and hist.apply_no='NTC0320180530001';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id

where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and hist.apply_no='NTC0320180530001';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_task_candidate where PROC_INST_ID_='10000051830242';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_task where PROC_INST_ID_ ='10000051830242';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_

where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and hist.apply_no='NTC0320180530001';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and ca.ID_ is null and hist.apply_no='NTC0320180530001';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.*
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and ca.ID_ is null;
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.flow_instance_id
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and ca.ID_ is null and hist.apply_no='NTC0320180530001';
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.flow_instance_id
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and ca.ID_ is null;
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.flow_instance_id
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where r.ALIAS_ IN( 'YYZG','yjcly') and warn_date > '2018-07-18' and uor.status_ ='1' and ca.ID_ is null 
  
  group by task.ID_, ur.user_id_;
;-- -. . -..- - / . -. - .-. -.--
select ur.user_id_,uor.fullname_,uor.account_, task.TASK_ID_,hist.flow_instance_id
from  sys_user_role ur join  sys_role r on ur.role_id_ = r.ID_ join v_user_org_role uor on r.id_=uor.roleID and ur.user_id_ = uor.id_
join fw_warn_hist hist on uor.companyCode = hist.branch_id join bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where  warn_date > '2018-07-18' and uor.status_ ='1' and ca.ID_ is null
and task.NODE_ID_ = 'UserTask3'
  group by task.ID_, ur.user_id_;
;-- -. . -..- - / . -. - .-. -.--
select * from fw_warn_hist hist  join  bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where  warn_date > '2018-07-18'  and ca.ID_ is null
and task.NODE_ID_ = 'UserTask3'
  group by task.ID_;
;-- -. . -..- - / . -. - .-. -.--
select * from fw_warn_hist hist  join  bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where  warn_date > '2018-07-18'  and ca.ID_ is null
and task.NODE_ID_ = 'UserTask3';
;-- -. . -..- - / . -. - .-. -.--
select * from fw_warn_hist hist  join  bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where   ca.ID_ is null
and task.NODE_ID_ = 'UserTask3'
  group by task.ID_;
;-- -. . -..- - / . -. - .-. -.--
select task.ID_,hist.flow_instance_id from fw_warn_hist hist  join  bpm_task task on hist.flow_instance_id = task.PROC_INST_ID_
left join bpm_task_candidate ca on task.ID_ = ca.TASK_ID_
where   ca.ID_ is null
and task.NODE_ID_ = 'UserTask3'
  group by task.ID_;
;-- -. . -..- - / . -. - .-. -.--
select * from sys_user where account_ like '%liuhuiyuan%';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_after_loan_material where partner_id <> 'XDA-WC001' group by apply_no having count(id) > 1;
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_='orderFlowInfo_zyb';
;-- -. . -..- - / . -. - .-. -.--
select *
from biz_apply_order where version is null;
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_='orderFlowInfo_v2';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_='orderFlowInfo_mort';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_='orderFlowInfo_transition';
;-- -. . -..- - / . -. - .-. -.--
explain select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
              join BPM_TASK_CANDIDATE ca on (task.assignee_id_ = '10000024673028' or
                                             ( task.id_ = ca.task_id_ AND (
                                               (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))) AND
                                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
              join BPM_TASK_CANDIDATE ca on (task.assignee_id_ = '10000024673028' or
                                             ( task.id_ = ca.task_id_ AND (
                                               (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (ca.executor_ in
                                                                                            ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                            and ca.type_ = 'role') or
                                               (ca.executor_ in ('10000000371122', '10000000376121') and
                                                ca.type_ = 'org') or
                                               (ca.executor_ in ('60000000100799', '60003760101909') and
                                                ca.type_ = 'position')))) AND
                                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id or inst.parent_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1 and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
explain select distinct *
from (select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
            union all SELECT task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1  and (b.city_no is null or b.city_no = '')
      union select
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
                  union all SELECT task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1   and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
select distinct *
from (select
        b.*,
        isr.is_priority,
        isr.materials_upload_status,
        isr.tail_release_node,
        task.*,
        inst.proc_def_name_     procDefName,
        inst.create_by_         creatorId,
        inst.CREATOR_           creator,
        inst.create_time_       createDate,
        inst.status_            instStatus,
        type.id_                typeId,
        inst.PARENT_INST_ID_ as parent_inst_id_
      from (SELECT task.*
            FROM BPM_TASK task
            WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
            union all SELECT task.*
                      FROM BPM_TASK task
                      WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                      FROM BPM_TASK_CANDIDATE ca
                                                                      WHERE 1 = 1 AND (
                                                                        (ca.executor_ = '10000024673028' AND ca.type_ = 'user') or (
                                                                          ca.executor_ in
                                                                          ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                          and ca.type_ = 'role') or (ca.executor_ in
                                                                                                     ('10000000371122', '10000000376121')
                                                                                                     and
                                                                                                     ca.type_ = 'org')
                                                                        or (ca.executor_ in
                                                                            ('60000000100799', '60003760101909') and
                                                                            ca.type_ = 'position')))) AND
                            task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
          ON task.proc_inst_id_ = inst.id_
        LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
        INNER JOIN biz_apply_order b ON (task.proc_inst_id_ = b.flow_instance_id)
        LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
      WHERE 1 = 1  and (b.city_no is null or b.city_no = '')
      union select
              b.*,
              isr.is_priority,
              isr.materials_upload_status,
              isr.tail_release_node,
              task.*,
              inst.proc_def_name_     procDefName,
              inst.create_by_         creatorId,
              inst.CREATOR_           creator,
              inst.create_time_       createDate,
              inst.status_            instStatus,
              type.id_                typeId,
              inst.PARENT_INST_ID_ as parent_inst_id_
            from (SELECT task.*
                  FROM BPM_TASK task
                  WHERE task.assignee_id_ = '10000024673028' AND task.status_ != 'TRANSFORMING'
                  union all SELECT task.*
                            FROM BPM_TASK task
                            WHERE (task.assignee_id_ = '0' and task.id_ in (SELECT ca.task_id_
                                                                            FROM BPM_TASK_CANDIDATE ca
                                                                            WHERE 1 = 1 AND (
                                                                              (ca.executor_ = '10000024673028' AND ca.type_ = 'user')
                                                                              or (ca.executor_ in
                                                                                  ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                                                                                  and ca.type_ = 'role') or (
                                                                                ca.executor_ in
                                                                                ('10000000371122', '10000000376121') and
                                                                                ca.type_ = 'org') or (ca.executor_ in
                                                                                                      ('60000000100799', '60003760101909')
                                                                                                      and ca.type_ =
                                                                                                          'position'))))
                                  AND task.status_ != 'TRANSFORMING') task LEFT JOIN BPM_PRO_INST inst
                ON task.proc_inst_id_ = inst.id_
              LEFT JOIN SYS_TYPE type ON type.id_ = inst.type_id_
              INNER JOIN biz_apply_order b ON (inst.parent_inst_id_ = b.flow_instance_id)
              LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
            WHERE 1 = 1   and (b.city_no is null or b.city_no = '')) a
order by a.PRIORITY_ DESC, a.CREATE_TIME_ DESC;
;-- -. . -..- - / . -. - .-. -.--
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
    biz_apply_order b ON (
    b.flow_instance_id in (task.proc_inst_id_ , task.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
    biz_apply_order b ON (
    b.flow_instance_id in (task.proc_inst_id_ , task.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
    biz_apply_order b use index (flow_instance_id_index) ON (
    b.flow_instance_id in (task.proc_inst_id_ , task.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
    b.flow_instance_id in (task.proc_inst_id_  )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
    b.flow_instance_id in (task.proc_inst_id_  )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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
    biz_apply_order b FORCE index ('flow_instance_id_index') ON (
    b.flow_instance_id in (task.proc_inst_id_ , task.parent_inst_id_ )
    )

    LEFT join biz_isr_mixed isr on b.apply_no = isr.apply_no
  WHERE 1 = 1


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
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


        and (b.city_no is null or b.city_no = '');
;-- -. . -..- - / . -. - .-. -.--
select * from biz_bpm_matter_config where matter_key='UploadImg';
;-- -. . -..- - / . -. - .-. -.--
select *
from b_product;
;-- -. . -..- - / . -. - .-. -.--
SELECT
		tab2.*,
		isr.is_priority,
		isr.materials_upload_status,
		isr.tail_release_node
		FROM
		(
		SELECT
		tab.ID_,
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
		FROM
		(
		SELECT
		task.ID_,
		task.proc_inst_id_
		FROM
		BPM_TASK task
		LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		INNER JOIN biz_apply_order b ON ( task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id )
		WHERE
		1 = 1


		AND ( task.assignee_id_ = '0' and   task.id_ in (
		SELECT btc.TASK_ID_ FROM (
		SELECT ca.task_id_ FROM BPM_TASK_CANDIDATE ca WHERE 1 = 1
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in
                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                      and ca.type_ = 'role')

			or (ca.executor_ in ('10000000371122', '10000000376121') and ca.type_ = 'org')

			or (ca.executor_ in ('60000000100799', '60003760101909') and ca.type_ = 'position')

		)
		) btc
		)) or task.assignee_id_ = '10000024673028'

		AND task.status_ != 'TRANSFORMING'

		AND ( b.city_no IS NULL OR b.city_no = '' )
		ORDER BY
		task.PRIORITY_ DESC,
		task.CREATE_TIME_ DESC
		LIMIT 1, 10
		) tab
		LEFT JOIN bpm_task bt ON bt.id_ = tab.id_
		LEFT JOIN BPM_PRO_INST inst ON tab.proc_inst_id_ = inst.id_
		INNER JOIN biz_apply_order b ON ( tab.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id )
		) tab2
		LEFT JOIN biz_isr_mixed isr ON tab2.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
explain SELECT
		tab2.*,
		isr.is_priority,
		isr.materials_upload_status,
		isr.tail_release_node
		FROM
		(
		SELECT
		tab.ID_,
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
		FROM
		(
		SELECT
		task.ID_,
		task.proc_inst_id_
		FROM
		BPM_TASK task
		LEFT JOIN BPM_PRO_INST inst ON task.proc_inst_id_ = inst.id_
		INNER JOIN biz_apply_order b ON ( task.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id )
		WHERE
		1 = 1


		AND ( task.assignee_id_ = '0' and   task.id_ in (
		SELECT btc.TASK_ID_ FROM (
		SELECT ca.task_id_ FROM BPM_TASK_CANDIDATE ca WHERE 1 = 1
		AND  ( (ca.executor_ = '10000024673028' AND  ca.type_ = 'user' )

			or (ca.executor_ in
                      ('50000000000006', '50000000000011', '50000000000007', '50000000000008', '50000000000009', '50000000000010', '50000000000012', '10000055728052', '10000044210201', '10000044210208', '10000041080003', '10000041080004', '10000037242101', '10000049179001', '50000000000028')
                      and ca.type_ = 'role')

			or (ca.executor_ in ('10000000371122', '10000000376121') and ca.type_ = 'org')

			or (ca.executor_ in ('60000000100799', '60003760101909') and ca.type_ = 'position')

		)
		) btc
		)) or task.assignee_id_ = '10000024673028'

		AND task.status_ != 'TRANSFORMING'

		AND ( b.city_no IS NULL OR b.city_no = '' )
		ORDER BY
		task.PRIORITY_ DESC,
		task.CREATE_TIME_ DESC
		LIMIT 1, 10
		) tab
		LEFT JOIN bpm_task bt ON bt.id_ = tab.id_
		LEFT JOIN BPM_PRO_INST inst ON tab.proc_inst_id_ = inst.id_
		INNER JOIN biz_apply_order b ON ( tab.proc_inst_id_ = b.flow_instance_id OR inst.parent_inst_id_ = b.flow_instance_id )
		) tab2
		LEFT JOIN biz_isr_mixed isr ON tab2.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
SELECT tab2.*, isr.is_priority, isr.materials_upload_status, isr.tail_release_node
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
       LEFT JOIN biz_isr_mixed isr ON tab2.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
SELECT task.ID_, task.proc_inst_id_
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
            LIMIT 0, 10;
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_ = 'orderFlowInfo_zyb';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_ = 'orderFlowInfo_transition';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_ = 'orderFlowInfo_mort';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_ = 'orderFlowInfo_v2';
;-- -. . -..- - / . -. - .-. -.--
select *
from form_bus_set where FORM_KEY_ = 'orderFlowInfo_v2';
;-- -. . -..- - / . -. - .-. -.--
select *
from form_bus_set where FORM_KEY_ = 'orderFlowInfo_mort';
;-- -. . -..- - / . -. - .-. -.--
select *
from form_bus_set where FORM_KEY_ = 'orderFlowInfo_transition';
;-- -. . -..- - / . -. - .-. -.--
select *
from bpm_form where FORM_KEY_ = 'UploadImg';
;-- -. . -..- - / . -. - .-. -.--
replace INTO bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000055490201', '10000029030167', '资料反馈', 'uploadImg', null, '<script type="text/javascript" src="#ctx#/js/custform/bims_v25/materialFeedback.js"></script><script type="text/javascript">$(function(){
     var scope = AngularUtil.getChildScope();
    
  scope.uploadImgRecord = {applyNo:scope.data.bizApply.apply_no};
  scope.buttons.save = false;
  })</script><style>.table-form {
    width: 99.2%;
    float: none;
    margin: 5px 0.4%;
}</style><div ng-controller="uploadImgCtrl"><div head-common="orderInfo"></div><div class="wrapper"><div class="wrapper-left"><div><div upload-img-record="uploadImgRecord"></div><div upload-missing-img="uploadImgRecord"></div></div></div><div><div ddjf-data-material="orderInfo"></div></div></div></div>', 'deploy', 'pc', '10000010470102', '业务系统-v2', 'Y', 1, null, '2018-08-07 14:52:50', null, null, '2018-08-16 09:28:07', '主页面', 24);
;-- -. . -..- - / . -. - .-. -.--
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
       LEFT JOIN biz_isr_mixed isr ON tab2.apply_no = isr.apply_no;
;-- -. . -..- - / . -. - .-. -.--
select  * from biz_apply_order o join biz_after_loan_material m on o.apply_no = m.apply_no group by m.apply_no having count(m.apply_no) > 1;
;-- -. . -..- - / . -. - .-. -.--
replace INTO bpm_form (ID_, DEF_ID_, NAME_, FORM_KEY_, DESC_, FORM_HTML_, STATUS_, FORM_TYPE_, TYPE_ID_, TYPE_NAME_, IS_MAIN_, VERSION_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_, FORM_TAB_TITLE_, rev_) VALUES ('10000046960002', '10000046010027', ' 房产信息-v2-保险和现金共用', 'bizPropertyInfo_v2', null, '<script type="text/javascript" src="#ctx#/js/custform/bims_v2/bizPropertyInfo.js"></script><div><table class="table-form column-2" ng-repeat="item in data.bizPropertyInfo.sub_biz_house | filter:propertyFilter"><tbody><tr class="firstRow"><td colspan="4" class="form-title">房产证信息</td></tr><tr><th><span style="color: red">※</span>房产证类型</th><td><div ht-dic="item.cert_type" dickey="houseLandCertFlag" permission="permission.fields.biz_house.cert_type" desc="房产证类型" type="text" name="biz_house.cert_type" ng-model="item.cert_type" class="form-control" ht-validate="{&quot;required&quot;:true}" ht-filter="certTypeFilter"></div></td><th><span style="color: red">※</span>产证编号</th><td><input ht-input="item.house_cert_no" desc="产证编号" class="form-control" type="text" name="biz_house.house_cert_no" ng-model="item.house_cert_no" permission="permission.fields.biz_house.house_cert_no" ht-validate="{&quot;required&quot;:true}"/></td></tr><tr><th><span style="color: red">※</span>房产用途</th><td><div ht-dic="item.house_type" dickey="fcyt" permission="permission.fields.biz_house.house_type" desc="房产用途" type="text" name="biz_house.house_type" ng-model="item.house_type" class="form-control" ht-validate="{&quot;required&quot;:true}"></div></td><th><span style="color: red">※</span>所在区域</th><td style="word-break: break-all;"><input ht-input="item.house_area" disabled="true" style="width: 70%" desc="所在区域" class="form-control" type="text" name="biz_house.house_area" ng-model="item.house_area" permission="permission.fields.biz_house.house_area" ht-validate="{&quot;required&quot;:true}"/><span ht-custdialog="{&quot;name&quot;:&quot;选择&quot;,&quot;custQueryList&quot;:[],&quot;custDialog&quot;:{&quot;conditions&quot;:[{&quot;field&quot;:&quot;company_code&quot;,&quot;comment&quot;:&quot;分公司编号，如深圳分公司755000&quot;,&quot;condition&quot;:&quot;EQ&quot;,&quot;dbType&quot;:&quot;varchar&quot;,&quot;defaultType&quot;:&quot;4&quot;,&quot;defaultValue&quot;:&quot;&quot;,&quot;bind&quot;:&quot;bizPropertyInfo.branch_id&quot;,&quot;isMain&quot;:true,&quot;$$hashKey&quot;:&quot;051&quot;,&quot;isScript&quot;:false}],&quot;selectNum&quot;:1,&quot;alias&quot;:&quot;getCityArea_v2&quot;,&quot;type&quot;:&quot;custDialog&quot;,&quot;mappingConf&quot;:[{&quot;from&quot;:&quot;id&quot;,&quot;target&quot;:[&quot;bizPropertyInfo.biz_house.house_area_code&quot;]},{&quot;from&quot;:&quot;name&quot;,&quot;target&quot;:[&quot;bizPropertyInfo.biz_house.house_area&quot;]}]},&quot;isInSub&quot;:true}" class="btn  btn-sm btn-primary undefined">选择</span></td></tr><tr><th><span style="color: red">※</span>房产地址（坐落）</th><td><input ht-input="item.house_address" desc="房产地址（坐落）" class="form-control" type="text" name="biz_house.house_address" ng-model="item.house_address" permission="permission.fields.biz_house.house_address" ht-validate="{&quot;required&quot;:true}"/></td><th><span style="color: red">※</span>房屋面积（㎡）</th><td><input ht-input="item.house_acreage" desc="房屋面积" class="form-control" type="text" name="biz_house.house_acreage" ng-model="item.house_acreage" permission="permission.fields.biz_house.house_acreage" ht-validate="{&quot;required&quot;:true}"/></td></tr><tr><th>登记价（元）</th><td><input ht-input="item.register_price" desc="登记价（元）" class="form-control" type="text" name="biz_house.register_price" ng-model="item.register_price" permission="permission.fields.biz_house.register_price" ht-validate="{&quot;required&quot;:false,&quot;number&quot;:true}" ht-number="{&quot;isShowComdify&quot;:true,&quot;decimalValue&quot;:2,&quot;intValue&quot;:&quot;&quot;}"/></td><th>土地使用期限</th><td><input ht-input="item.land_expiry" desc="土地使用期限" class="form-control" type="text" name="biz_house.land_expiry" ng-model="item.land_expiry" permission="permission.fields.biz_house.land_expiry" ht-validate="{&quot;required&quot;:false}"/></td></tr><tr><th>丘权号</th><td><input ht-input="item.land_right_no" desc="丘权号" class="form-control" type="text" name="biz_house.land_right_no" ng-model="item.land_right_no" permission="permission.fields.biz_house.land_right_no" ht-validate="{&quot;required&quot;:false}"/></td><th>备注</th><td><input ht-input="item.remark" desc="备注" class="form-control" type="text" name="biz_house.remark" ng-model="item.remark" permission="permission.fields.biz_house.remark" ht-validate="{&quot;required&quot;:false}"/></td></tr><tr><th>竣工日期</th><td><div type="div" data-toggle="tooltip" data-placement="bottom" title="如竣工日期仅为年份的，日期选择1月1日"><input desc="竣工日期" class="form-control" type="text" name="biz_house.completion_date" ng-model="item.completion_date" permission="permission.fields.biz_house.completion_date" ht-validate="{&quot;required&quot;:false,&quot;date&quot;:true}" ht-date="yyyy-MM-dd"/></div></td><th>登记日期</th><td><input desc="登记日期" class="form-control" type="text" name="biz_house.register_date" ng-model="item.register_date" permission="permission.fields.biz_house.register_date" ht-validate="{&quot;required&quot;:false,&quot;date&quot;:true}" ht-date="yyyy-MM-dd HH:mm:ss"/></td></tr><tr><th><span style="color: red">※</span>土地类型</th><td><div ht-dic="item.land_type" dickey="tdlxv2" permission="permission.fields.biz_house.land_type" desc="土地类型" type="text" name="biz_house.land_type" ng-model="item.land_type" class="form-control" ht-validate="{&quot;required&quot;:true}"></div></td><th><br/></th><td style="word-break: break-all;"><br/></td></tr></tbody></table><table class="table-form column-2" ng-repeat="item in propertyOwnerInfo track by $index"><tbody><tr class="firstRow"><th>产权人</th><td><input style="width: 70%;" readonly="true" ht-input="item.name" desc="产权人" class="form-control" type="text" name="biz_house.name" ng-model="item.name" permission="permission.fields.biz_house.property_owner_info" ht-validate="{&quot;required&quot;:true}"/><span ht-custdialog="{&quot;name&quot;:&quot;选择&quot;,&quot;custQueryList&quot;:[],&quot;custDialog&quot;:{&quot;conditions&quot;:[{&quot;field&quot;:&quot;apply_no&quot;,&quot;comment&quot;:&quot;apply_no&quot;,&quot;condition&quot;:&quot;EQ&quot;,&quot;dbType&quot;:&quot;varchar&quot;,&quot;defaultType&quot;:&quot;4&quot;,&quot;defaultValue&quot;:&quot;&quot;,&quot;$$hashKey&quot;:&quot;01W&quot;,&quot;bind&quot;:&quot;bizPropertyInfo.apply_no&quot;,&quot;isMain&quot;:true},{&quot;field&quot;:&quot;role&quot;,&quot;comment&quot;:&quot;role&quot;,&quot;condition&quot;:&quot;EQ&quot;,&quot;dbType&quot;:&quot;varchar&quot;,&quot;defaultType&quot;:&quot;4&quot;,&quot;defaultValue&quot;:&quot;getCustomerRole&quot;,&quot;$$hashKey&quot;:&quot;01X&quot;,&quot;isScript&quot;:true},{&quot;field&quot;:&quot;relation&quot;,&quot;comment&quot;:&quot;relation&quot;,&quot;condition&quot;:&quot;EQ&quot;,&quot;dbType&quot;:&quot;varchar&quot;,&quot;defaultType&quot;:&quot;4&quot;,&quot;defaultValue&quot;:&quot;getCustomerRelation&quot;,&quot;$$hashKey&quot;:&quot;01Y&quot;,&quot;isScript&quot;:true}],&quot;alias&quot;:&quot;checkCustomer&quot;,&quot;type&quot;:&quot;custDialog&quot;,&quot;mappingConf&quot;:[{&quot;from&quot;:&quot;name&quot;,&quot;target&quot;:[&quot;bizPropertyInfo.biz_house.name&quot;]},{&quot;from&quot;:&quot;customerNo&quot;,&quot;target&quot;:[&quot;bizPropertyInfo.biz_house.customer_no&quot;]}],&quot;selectNum&quot;:1},&quot;isInSub&quot;:true,&quot;icon&quot;:&quot;fa fa-align-justify&quot;,&quot;permission&quot;:&quot;biz_house.property_owner_info&quot;}" class="btn  btn-sm btn-primary fa">选择</span></td><th>房产份额（%）</th><td><input style="width: 70%;" ht-input="item.house_portion" desc="房产份额" class="form-control" type="text" name="biz_house.house_portion" ng-model="item.house_portion" permission="permission.fields.biz_house.property_owner_info" ht-validate="{&quot;required&quot;:true,&quot;number&quot;:true,&quot;minvalue&quot;:&quot;0.01&quot;,&quot;maxvalueend&quot;:100}"/><span ng-if="permission.fields.biz_house.property_owner_info!=&#39;r&#39; &amp;&amp; !$index" ng-click="addPropertyOwner()" class="btn btn-primary btn-sm fa-add"> </span> <span ng-if="permission.fields.biz_house.property_owner_info!=&#39;r&#39; &amp;&amp; $index" ng-click="deletePropertyOwner($index)" class="fa fa-delete actionBtn block-delete" title="移除"></span></td></tr></tbody></table></div>', 'deploy', 'pc', '10000029030164', '保险类-特殊', 'Y', 1, null, '2017-09-12 11:36:40', null, null, '2018-08-28 15:44:08', '主页面', 53);