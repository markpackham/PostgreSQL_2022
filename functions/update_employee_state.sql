CREATE OR REPLACE FUNCTION fn_update_employee_state()
RETURNS void AS
$body$
	UPDATE sales_person
	SET state = 'PA'
	WHERE state is Null
$body$
LANGUAGE SQL

-- SELECT fn_update_employee_state();