select * from s_material_partner where partner_code='XDA-SC001';

select *
from bpmx5.material_partner_rel where partner_code='XDA-SC001';

select * from s_material_partner_detail where material_partner_id in (select id from s_material_partner where partner_code='XDA-SC001');

select * from s_material_relation where material_config_id in (select id from s_material_partner_detail where material_partner_id in (select id from s_material_partner where partner_code='XDA-SC001'));