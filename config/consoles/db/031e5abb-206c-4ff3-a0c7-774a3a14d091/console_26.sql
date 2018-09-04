select count(1) from BPM_TASK_CANDIDATE;

CREATE INDEX idx_bpmtask_userid_status ON bpm_task (ASSIGNEE_ID_, STATUS_);

desc bpm_task;

show create table bpm_task;

show create  table biz_apply_order;

ALTER TABLE biz_missing_materials ADD feedback varchar(500) NULL;