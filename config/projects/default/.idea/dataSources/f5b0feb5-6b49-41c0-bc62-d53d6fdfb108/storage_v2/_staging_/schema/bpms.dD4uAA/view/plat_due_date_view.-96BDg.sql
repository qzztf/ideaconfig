create view v_fd_ret as
  select
    fd.apply_no,fd.fin_date, ret.fin_date as ret_fin_date,fd.adv_type from fd_advance fd join fd_advance_ret ret on fd.id = ret.apply_id

