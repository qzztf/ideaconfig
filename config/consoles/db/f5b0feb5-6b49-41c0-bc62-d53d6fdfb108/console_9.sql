select * from s_material_partner where partner_code = 'XDA-WC001';


select  * from material_partner_rel where partner_code = 'XDA-WC001' and delete_flag = '0';


select  * from s_material_partner_detail where material_partner_id in (select id from s_material_partner where partner_code = 'XDA-WC001');


select  * from s_material_relation where material_config_id in (select  id from s_material_partner_detail where material_partner_id in (select id from s_material_partner where partner_code = 'XDA-WC001'));



update material_partner_rel set delete_flag = '1' where partner_code = 'XDA-WC001';

update s_material_partner set delete_flag = '1' where partner_code = 'XDA-WC001';

update  s_material_partner_detail set delete_flag = '1' where material_partner_id in (select id from s_material_partner where partner_code = 'XDA-WC001');

update s_material_relation set delete_flag = '1' where material_config_id in (select  id from s_material_partner_detail where material_partner_id in (select id from s_material_partner where partner_code = 'XDA-WC001'));