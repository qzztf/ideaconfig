select 'insert into fw_warn_rules (id, warn_rule, warn_rule_desc, warn_level, branch_id, branch_name, warn_type, od_node_desc, od_node, od_period, warn_msg,  wd_nd) values (''',concat('\'',timeline_desc,'超时触发1天\''),'''P2''',concat('\'',branch_id,'\''),concat('\'',branch_name,'\''),'''OT''',concat('\'',timeline_desc,'\''),concat('\'',timeline_code,'\''),period+1,concat('\'',timeline_desc,'超时触发1天\''),'1',')' from fw_std_timeline where branch_id in ('769000','752000');