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


select *
from biz_p2p_ret where partner_id = 'XDA-WC001';