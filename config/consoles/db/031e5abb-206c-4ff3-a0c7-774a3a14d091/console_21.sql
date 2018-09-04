explain select *
        from biz_apply_order a left join biz_order_matter_record b on a.apply_no = b.apply_no

union select *
      from biz_apply_order c left join biz_order_matter_record d on c.apply_no = d.apply_no;;


SELECT apply_no,if(product_id like '%YSL%', '有赎楼','无赎楼'),product_id FROM biz_apply_order WHERE product_id like '%YSL%' OR product_id LIKE '%NSL%' order by create_time desc;


SELECT C.city_name AS '城市', A.apply_no AS '订单编号', A.handle_time AS '确认资金到账时间'
FROM biz_order_matter_record A,biz_apply_order B,s_area_info C
WHERE A.apply_no=B.apply_no AND B.branch_id=C.company_code
AND A.matter_key='fundsArrival'