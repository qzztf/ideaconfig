

delete from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%NSL_YJY%' or product_id like '%NSL_NJY%') and node_id ='TransferIn';


delete from biz_after_loan_material  where partner_id = 'XDA-WC001'  and apply_no in(select apply_no from biz_apply_order where product_id like '%YSL_NJY%' or product_id like '%NSL_NJY%') and node_id ='MortgagePass';

select *
from biz_order_matter_record where apply_no='FZC0120180712004';


select *
 from biz_after_loan_material where apply_no='FZC0120180712004' and node_id='TransferIn';

SELECT f.apply_no, f.outside_status, f.node_id
FROM (SELECT d.apply_no, e.outside_status, e.node_id
      FROM (SELECT a.apply_no, b.handle_time, b.matter_key
            FROM biz_apply_order a
                   INNER JOIN biz_order_matter_record b
                     ON a.apply_no = b.apply_no AND (a.partner_insurance_id LIKE concat('XDA-WC001', '%'))
            WHERE (b.matter_key in ('returnConfirm', 'TransferIn', 'MortgagePass'))
              AND b.handle_time is not null) d
             LEFT JOIN biz_after_loan_material e ON d.apply_no = e.apply_no and d.matter_key = e.node_id) f
WHERE (f.outside_status != 1
   OR f.outside_status IS NULL) and f.apply_no='FZC0120180712004';


select *
from sys_properties where ALIAS like '%wc%';


select *
from bpm_form where FORM_KEY_ = 'uploadImg';