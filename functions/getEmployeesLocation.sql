CREATE OR REPLACE FUNCTION fn_get_employees_location(location varchar(2))
-- use SETOF when expecting multiple rows back
RETURNS SETOF sales_person as
$body$
	SELECT *
FROM sales_person
WHERE state = location;
$body$
LANGUAGE SQL

-- SELECT (fn_get_employees_location('CA')).*;

-- just get name and phone number
/*
SELECT first_name, last_name, phone
FROM fn_get_employees_location('CA');
*/