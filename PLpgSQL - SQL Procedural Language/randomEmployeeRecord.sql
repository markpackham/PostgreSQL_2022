CREATE OR REPLACE FUNCTION fn_get_random_salesperon() 
RETURNS varchar AS
$body$
	DECLARE
	rand int;
	-- store the employee's table record
	emp record;
BEGIN
	-- we have 5 employees in the database
	SELECT random()*(5 - 1) + 1 INTO rand;
	SELECT *
	FROM sales_person
	INTO emp
	WHERE id = rand;
	RETURN CONCAT(emp.first_name, ' ', emp.last_name);
END;
$body$
LANGUAGE plpgsql

SELECT fn_get_random_salesperon();
