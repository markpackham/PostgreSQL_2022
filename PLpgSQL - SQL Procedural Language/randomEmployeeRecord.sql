CREATE OR REPLACE FUNCTION fn_get_random_salesperon() 
RETURNS varchar AS
$body$
	DECLARE
	rand int;
	-- store the employee's table record in a variable
	employee record;
BEGIN
	-- we have 5 employees in the database
	SELECT random()*(5 - 1) + 1 INTO rand;
	SELECT *
	FROM sales_person
	INTO employee
	WHERE id = rand;
	RETURN CONCAT(employee.first_name, ' ', employee.last_name);
END;
$body$
LANGUAGE plpgsql

SELECT fn_get_random_salesperon();
