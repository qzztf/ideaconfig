DROP INDEX index_apply_no ON biz_after_loan_material;

ALTER TABLE `biz_after_loan_material`
  ADD COLUMN `node_id` VARCHAR(200) NULL AFTER `handle_user_name`;
