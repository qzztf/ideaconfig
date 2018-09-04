create view v_fd_ret as
  select
    `fd`.`apply_no`  AS `apply_no`,
    `fd`.`fin_date`  AS `fin_date`,
    `ret`.`fin_date` AS `ret_fin_date`,
    `fd`.`adv_type`  AS `adv_type`
  from (`bpms`.`fd_advance` `fd`
  left  join `bpms`.`fd_advance_ret` `ret` on ((`fd`.`id` = `ret`.`apply_id`)));

