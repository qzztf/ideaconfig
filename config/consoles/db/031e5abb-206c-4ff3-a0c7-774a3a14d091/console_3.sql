SELECT
							a.apply_no,
							b.handle_time
						FROM
							biz_apply_order a
						INNER JOIN biz_order_matter_record b ON a.apply_no = b.apply_no
						AND (
							a.partner_insurance_id LIKE concat('XTA-YN',"%")
						)
						WHERE

							(
								b.matter_key = 'returnConfirm'
								OR b.matter_key = 'custReceivableConfirm'
							)
						AND
							b.handle_time BETWEEN subdate(
								date_sub('2018-06-15', INTERVAL 1 MONTH),
								date_format(
									date_sub('2018-06-15', INTERVAL 1 MONTH),
									'%e'
								) - 1
							)
							AND subdate(
								'2018-06-15',
								date_format('2018-06-15', '%e')
							)

