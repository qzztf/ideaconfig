select  * from bpmx5.sys_role where ALIAS_='yjcly';


select  * from bpmx5.sys_user_role where role_id_ = '80000000577305';


INSERT INTO bpmx5.sys_role (ID_, NAME_, ALIAS_, ENABLED_, DESCRIPTION) VALUES ('80000000577305', '预警处理员', 'yjcly', 1, '');
INSERT INTO bpmx5.sys_user_role (id_, role_id_, user_id_) VALUES ('80000000582916', '80000000577305', '70000000060278');