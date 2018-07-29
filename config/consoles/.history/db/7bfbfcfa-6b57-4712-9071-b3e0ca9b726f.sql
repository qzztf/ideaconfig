select * from s_material_partner_detail where material_partner_id='80000000760026';
;-- -. . -..- - / . -. - .-. -.--
select * from s_material_relation where material_config_id in (select id from s_material_partner_detail where material_partner_id in (select id from s_material_partner where partner_code='XDA-SC001'));
;-- -. . -..- - / . -. - .-. -.--
select * from s_material_partner where partner_code='XDA-SC001';
;-- -. . -..- - / . -. - .-. -.--
select * from s_material_partner_detail where material_partner_id in (select id from s_material_partner where partner_code='XDA-SC001');
;-- -. . -..- - / . -. - .-. -.--
select *
from bpmx5.material_partner_rel where partner_code='XDA-SC001';
;-- -. . -..- - / . -. - .-. -.--
select *
from s_material_partner where partner_code like '%wc%';
;-- -. . -..- - / . -. - .-. -.--
DROP INDEX index_apply_no ON biz_after_loan_material;
;-- -. . -..- - / . -. - .-. -.--
ALTER TABLE `biz_after_loan_material`
  ADD COLUMN `node_id` VARCHAR(200) NULL AFTER `handle_user_name`;
;-- -. . -..- - / . -. - .-. -.--
use bpmx5;
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM sys_type WHERE type_key_='afterLoanNode';
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO sys_type (ID_, TYPE_GROUP_KEY_, NAME_, TYPE_KEY_, STRU_TYPE_, PARENT_ID_, DEPTH_, PATH_, IS_LEAF_, OWNER_ID_, SN_, CREATE_BY_, CREATE_TIME_, CREATE_ORG_ID_, UPDATE_BY_, UPDATE_TIME_) VALUES ('10000051280202', 'DIC', '贷后资料节点', 'afterLoanNode', '1', '10000039870067', 1, '4.10000039870067.10000051280202.', 'Y', '0', 0, '1', '2018-07-25 15:25:20', null, null, null);
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO sys_dic (ID_, TYPE_ID_, KEY_, NAME_, PARENT_ID_, SN_, status_) VALUES ('10000051280204', '10000051280202', 'MortgagePass', '抵押递件', '10000051280202', null, 'active');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO sys_dic (ID_, TYPE_ID_, KEY_, NAME_, PARENT_ID_, SN_, status_) VALUES ('10000051280205', '10000051280202', 'returnConfirm', '资金归还确认', '10000051280202', null, 'active');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO sys_dic (ID_, TYPE_ID_, KEY_, NAME_, PARENT_ID_, SN_, status_) VALUES ('10000051280203', '10000051280202', 'TransferIn', '过户', '10000051280202', null, 'active');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO sys_dic (ID_, TYPE_ID_, KEY_, NAME_, PARENT_ID_, SN_, status_) VALUES ('10000051280206', '10000061710234', 'afterLoanMaterial-TransferIn', '贷后资料交互-过户', '10000061710234', null, 'active');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO sys_dic (ID_, TYPE_ID_, KEY_, NAME_, PARENT_ID_, SN_, status_) VALUES ('10000051280207', '10000061710234', 'afterLoanMaterial-MortgagePass', '贷后资料交互-抵押递件', '10000061710234', null, 'active');
;-- -. . -..- - / . -. - .-. -.--
INSERT INTO sys_dic (ID_, TYPE_ID_, KEY_, NAME_, PARENT_ID_, SN_, status_) VALUES ('10000051280208', '10000061710234', 'afterLoanMaterial-returnConfirm', '贷后资料交互-资金归还确认', '10000061710234', null, 'active');
;-- -. . -..- - / . -. - .-. -.--
select * from bpmx5.material_file where apply_no='NJC0120180723002';