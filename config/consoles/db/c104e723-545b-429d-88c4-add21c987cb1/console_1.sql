create table houhe_loan.repayments_plan
(
	rpt_id int not null auto_increment
		primary key,
	loan_record_id int default '0' not null,
	user_mobile varchar(50) default '' null,
	username varchar(50) default '' null,
	member_id int default '0' null,
	principal decimal(10,2) default '0.00' not null,
	total_pay decimal(10,2) default '0.00' not null,
	arrears decimal(10,2) default '0.00' not null,
	current_term smallint(6) default '0' not null,
	interest decimal(10,2) default '0.00' not null,
	real_pay decimal(10,2) default '0.00' not null,
	late_fee decimal(10,2) default '0.00' not null,
	remind_fee decimal(10,2) default '0.00' not null,
	status tinyint default '0' null,
	pay_date date null,
	real_pay_date datetime default '1999-01-01 00:00:00' null,
	createdon datetime default CURRENT_TIMESTAMP not null,
	remark varchar(30) default '' null,
	constraint FK_repayments_plan_loan_record
		foreign key (loan_record_id) references houhe_loan.loan_record (loan_id)
)
;

create index FK_repayments_plan_loan_record
	on repayments_plan (loan_record_id)
;

comment on table repayments_plan is '还款计划'
;

comment on column repayments_plan.rpt_id is '主键'
;

comment on column repayments_plan.loan_record_id is '贷款id'
;

comment on column repayments_plan.user_mobile is '贷款人手机'
;

comment on column repayments_plan.username is '贷款人姓名'
;

comment on column repayments_plan.member_id is '用户id'
;

comment on column repayments_plan.principal is '本期应还本金'
;

comment on column repayments_plan.total_pay is '本期应还总额（最初生成的还款计划的应还总额）'
;

comment on column repayments_plan.arrears is '往期欠款'
;

comment on column repayments_plan.current_term is '当前期数（1代表第一期）'
;

comment on column repayments_plan.interest is '本期利息'
;

comment on column repayments_plan.real_pay is '实际偿还金额'
;

comment on column repayments_plan.late_fee is '滞纳金'
;

comment on column repayments_plan.remind_fee is '催收费'
;

comment on column repayments_plan.status is '还款状态(0,一分未还，1部分还款，2已还清)'
;

comment on column repayments_plan.pay_date is '应还款日期'
;

comment on column repayments_plan.real_pay_date is '实际还款日期'
;

comment on column repayments_plan.createdon is '创建时间'
;

comment on column repayments_plan.remark is '备注'
;

