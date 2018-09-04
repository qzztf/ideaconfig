delete from s_material_node where product_id in ('ZYB_YSL_YJY_ISR','DZYB_YSL_YJY_ISR','ZYB_YSL_NJY_ISR');


 select * from s_material_node where product_id in ('ZYB_YSL_YJY_ISR','DZYB_YSL_YJY_ISR','ZYB_YSL_NJY_ISR') and id='10000046402336';


select  * from s_material_relation where id ='10000046402337';


select * from s_material_node where id ='10000046402336';

select *
from  s_material_relation  where not exists(select 1 from s_material_node n where material_config_id = n.id) and material_config_type= 1;


select * from fw_timenode where timenode ='TD10000053150205';
select * from fw_timenode where timenode ='TD10000053150206';
