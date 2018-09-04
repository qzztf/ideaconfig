select * from material_product_rel where product_id='ZYB_YSL_NJY_ISR';


update material_product_rel set delete_flag='1' where product_id='ZYB_YSL_YJY_ISR';

select * from material_product_rel where product_id='ZYB_YSL_YJY_ISR';

select * from material_product_rel where product_id='DZYB_YSL_YJY_ISR';


update s_material_node set delete_flag = '1' where product_id in ('ZYB_YSL_YJY_ISR','DZYB_YSL_YJY_ISR','ZYB_YSL_NJY_ISR');




select r.* from s_material_node n join s_material_relation r on r.material_config_id = n.id  where product_id in ('ZYB_YSL_YJY_ISR','DZYB_YSL_YJY_ISR','ZYB_YSL_NJY_ISR');

select * from s_material_relation r where r.material_config_id in (select id from s_material_node  where product_id in ('ZYB_YSL_YJY_ISR','DZYB_YSL_YJY_ISR','ZYB_YSL_NJY_ISR'));


select * from s_material_partner where partner_name like '%太平%';


select * from s_material_relation where material_config_id in (select id from s_material_partner_detail where material_partner_id in ('10000052461014','10000052461024'));

select * from s_material_relation where material_config_id in (select id from s_material_partner_detail where material_partner_id in ('10000046405207'));





