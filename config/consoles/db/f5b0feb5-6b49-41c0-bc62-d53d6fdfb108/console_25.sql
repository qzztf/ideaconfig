insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429005 ', 'STD10000040429005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000032960002', 'TD10000040428006', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429006 ', 'STD10000040429006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000032960002', 'TD10000040428006', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429007 ', 'STD10000040429007', '银行放款(保险)->赎楼还款(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000040428005', 'TD10000040428006', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429008 ', 'STD10000040429008', '银行放款(保险)->过户(交易保（无赎楼）)1工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR',
  'TD10000040428005', 'TD10000033790004', '0', '1', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429009 ', 'STD10000040429009', '银行放款(保险)->赎楼还款(提放保（有赎楼）)3工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000040428005', 'TD10000040428006', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429010 ', 'STD10000040429010', '银行放款(保险)->办理抵押(提放保（无赎楼）)3工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR',
  'TD10000040428005', 'TD10000028340009', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429011 ', 'STD10000040429011', '赎楼还款->取证及注销材料(及时贷（交易赎楼）)15工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000040428006', 'TD10000033790002', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429012 ', 'STD10000040429012', '赎楼还款->取证及注销材料(及时贷（非交易赎楼）)15工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000040428006', 'TD10000033790002', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429013 ', 'STD10000040429013', '赎楼还款->取证及注销材料(交易保（有赎楼）)15工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000040428006', 'TD10000033790002', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040429014 ', 'STD10000040429014', '过户->取证(交易保（无赎楼）)5工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790004',
    'TD10000033790006', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429015 ', 'STD10000040429015', '赎楼还款->取证及注销材料(提放保（有赎楼）)15工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000040428006', 'TD10000033790002', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429016 ', 'STD10000040429016', '办理抵押->完结(保险)(提放保（无赎楼）)5工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429017 ', 'STD10000040429017', '取证及注销材料->过户(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000033790002', 'TD10000033790004', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429019 ', 'STD10000040429019', '取证及注销材料->注销抵押(及时贷（非交易赎楼）)2工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000033790002', 'TD10000033790008', '0', '2', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429021 ', 'STD10000040429021', '取证及注销材料->过户(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000033790002', 'TD10000033790004', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040429022 ', 'STD10000040429022', '取证->办理抵押(交易保（无赎楼）)3工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790006',
    'TD10000028340009', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429023 ', 'STD10000040429023', '取证及注销材料->注销抵押(提放保（有赎楼）)2工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000033790002', 'TD10000033790008', '0', '2', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040429024 ', 'STD10000040429024', '过户->取证(及时贷（交易赎楼）)5工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790004',
    'TD10000033790006', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040429025 ', 'STD10000040429025', '过户->取证(及时贷（交易提放）)5工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790004',
    'TD10000033790006', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429026 ', 'STD10000040429026', '注销抵押->办理抵押(及时贷（非交易赎楼）)5工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000033790008', 'TD10000028340009', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429027 ', 'STD10000040429027', '注销抵押->办理抵押(及时贷（非交易提放）)5工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH',
  'TD10000033790008', 'TD10000028340009', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040429028 ', 'STD10000040429028', '过户->取证(交易保（有赎楼）)5工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790004',
    'TD10000033790006', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429029 ', 'STD10000040429029', '办理抵押->完结(保险)(交易保（无赎楼）)5工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429030 ', 'STD10000040429030', '注销抵押->办理抵押(提放保（有赎楼）)5工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000033790008', 'TD10000028340009', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429031 ', 'STD10000040429031', '取证->办理抵押(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000033790006', 'TD10000028340009', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429032 ', 'STD10000040429032', '取证->办理抵押(及时贷（交易提放）)3工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH',
  'TD10000033790006', 'TD10000028340009', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429033 ', 'STD10000040429033', '办理抵押->按揭银行放款(现金)(及时贷（非交易赎楼）)15工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429034 ', 'STD10000040429034', '办理抵押->按揭银行放款(现金)(及时贷（非交易提放）)15工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040429035 ', 'STD10000040429035', '取证->办理抵押(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790006',
    'TD10000028340009', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429036 ', 'STD10000040429036', '办理抵押->完结(保险)(提放保（有赎楼）)5工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429037 ', 'STD10000040429037', '办理抵押->按揭银行放款(现金)(及时贷（交易赎楼）)15工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429038 ', 'STD10000040429038', '办理抵押->按揭银行放款(现金)(及时贷（交易提放）)15工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '15', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429039 ', 'STD10000040429039', '按揭银行放款(现金)->完结(现金)(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429040 ', 'STD10000040429040', '按揭银行放款(现金)->完结(现金)(及时贷（非交易提放）)3工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429041 ', 'STD10000040429041', '办理抵押->完结(保险)(交易保（有赎楼）)5工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '5', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429042 ', 'STD10000040429042', '按揭银行放款(现金)->完结(现金)(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '3', '东莞公司', '769000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040429043 ', 'STD10000040429043', '按揭银行放款(现金)->完结(现金)(及时贷（交易提放）)3工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '3', '东莞公司', '769000');



insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430005 ', 'STD10000040430005', '银行放款(现金)->赎楼还款(及时贷（交易赎楼）)5工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000032960002', 'TD10000040428006', '0', '5', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430006 ', 'STD10000040430006', '银行放款(现金)->赎楼还款(及时贷（非交易赎楼）)5工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000032960002', 'TD10000040428006', '0', '5', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430007 ', 'STD10000040430007', '银行放款(保险)->赎楼还款(交易保（有赎楼）)5工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000040428005', 'TD10000040428006', '0', '5', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430008 ', 'STD10000040430008', '银行放款(保险)->过户(交易保（无赎楼）)5工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR',
  'TD10000040428005', 'TD10000033790004', '0', '5', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430009 ', 'STD10000040430009', '银行放款(保险)->赎楼还款(提放保（有赎楼）)5工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000040428005', 'TD10000040428006', '0', '5', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430010 ', 'STD10000040430010', '银行放款(保险)->办理抵押(提放保（无赎楼）)20工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR',
  'TD10000040428005', 'TD10000028340009', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430011 ', 'STD10000040430011', '赎楼还款->取证及注销材料(及时贷（交易赎楼）)15工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000040428006', 'TD10000033790002', '0', '15', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430012 ', 'STD10000040430012', '赎楼还款->取证及注销材料(及时贷（非交易赎楼）)15工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000040428006', 'TD10000033790002', '0', '15', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430013 ', 'STD10000040430013', '赎楼还款->取证及注销材料(交易保（有赎楼）)15工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000040428006', 'TD10000033790002', '0', '15', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040430014 ', 'STD10000040430014', '过户->取证(交易保（无赎楼）)30工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790004',
    'TD10000033790006', '0', '30', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430015 ', 'STD10000040430015', '赎楼还款->取证及注销材料(提放保（有赎楼）)15工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000040428006', 'TD10000033790002', '0', '15', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430016 ', 'STD10000040430016', '办理抵押->完结(保险)(提放保（无赎楼）)20工作日', '提放保（无赎楼）', 'TFB_NSL_NJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430017 ', 'STD10000040430017', '取证及注销材料->过户(及时贷（交易赎楼）)3工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000033790002', 'TD10000033790004', '0', '3', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430019 ', 'STD10000040430019', '取证及注销材料->注销抵押(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000033790002', 'TD10000033790008', '0', '3', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430021 ', 'STD10000040430021', '取证及注销材料->过户(交易保（有赎楼）)3工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000033790002', 'TD10000033790004', '0', '3', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040430022 ', 'STD10000040430022', '取证->办理抵押(交易保（无赎楼）)7工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR', 'TD10000033790006',
    'TD10000028340009', '0', '7', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430023 ', 'STD10000040430023', '取证及注销材料->注销抵押(提放保（有赎楼）)3工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000033790002', 'TD10000033790008', '0', '3', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040430024 ', 'STD10000040430024', '过户->取证(及时贷（交易赎楼）)30工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH', 'TD10000033790004',
    'TD10000033790006', '0', '30', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040430025 ', 'STD10000040430025', '过户->取证(及时贷（交易提放）)30工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH', 'TD10000033790004',
    'TD10000033790006', '0', '30', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430026 ', 'STD10000040430026', '注销抵押->办理抵押(及时贷（非交易赎楼）)7工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000033790008', 'TD10000028340009', '0', '7', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430027 ', 'STD10000040430027', '注销抵押->办理抵押(及时贷（非交易提放）)7工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH',
  'TD10000033790008', 'TD10000028340009', '0', '7', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040430028 ', 'STD10000040430028', '过户->取证(交易保（有赎楼）)30工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790004',
    'TD10000033790006', '0', '30', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430029 ', 'STD10000040430029', '办理抵押->完结(保险)(交易保（无赎楼）)20工作日', '交易保（无赎楼）', 'JYB_NSL_YJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430030 ', 'STD10000040430030', '注销抵押->办理抵押(提放保（有赎楼）)7工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000033790008', 'TD10000028340009', '0', '7', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430031 ', 'STD10000040430031', '取证->办理抵押(及时贷（交易赎楼）)7工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000033790006', 'TD10000028340009', '0', '7', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430032 ', 'STD10000040430032', '取证->办理抵押(及时贷（交易提放）)7工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH',
  'TD10000033790006', 'TD10000028340009', '0', '7', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430033 ', 'STD10000040430033', '办理抵押->按揭银行放款(现金)(及时贷（非交易赎楼）)20工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430034 ', 'STD10000040430034', '办理抵押->按揭银行放款(现金)(及时贷（非交易提放）)20工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values
  ('10000040430035 ', 'STD10000040430035', '取证->办理抵押(交易保（有赎楼）)7工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR', 'TD10000033790006',
    'TD10000028340009', '0', '7', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430036 ', 'STD10000040430036', '办理抵押->完结(保险)(提放保（有赎楼）)20工作日', '提放保（有赎楼）', 'TFB_YSL_NJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430037 ', 'STD10000040430037', '办理抵押->按揭银行放款(现金)(及时贷（交易赎楼）)30工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '30', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430038 ', 'STD10000040430038', '办理抵押->按揭银行放款(现金)(及时贷（交易提放）)30工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH',
  'TD10000028340009', 'TD10000033790012', '0', '30', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430039 ', 'STD10000040430039', '按揭银行放款(现金)->完结(现金)(及时贷（非交易赎楼）)3工作日', '及时贷（非交易赎楼）', 'SLY_YSL_NJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '3', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430040 ', 'STD10000040430040', '按揭银行放款(现金)->完结(现金)(及时贷（非交易提放）)3工作日', '及时贷（非交易提放）', 'JSD_NSL_NJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '3', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430041 ', 'STD10000040430041', '办理抵押->完结(保险)(交易保（有赎楼）)20工作日', '交易保（有赎楼）', 'JYB_YSL_YJY_ISR',
  'TD10000028340009', 'TD10000041028001', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430042 ', 'STD10000040430042', '按揭银行放款(现金)->完结(现金)(及时贷（交易赎楼）)20工作日', '及时贷（交易赎楼）', 'SLY_YSL_YJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '20', '惠州公司', '752000');
insert into fw_std_timeline (id, timeline_code, timeline_desc, prod_type_name, prod_type, start_timenode, end_timenode, wd_nd, period, branch_name, branch_id)
values ('10000040430043 ', 'STD10000040430043', '按揭银行放款(现金)->完结(现金)(及时贷（交易提放）)20工作日', '及时贷（交易提放）', 'JSD_NSL_YJY_CSH',
  'TD10000033790012', 'TD10000040428007', '0', '20', '惠州公司', '752000');



