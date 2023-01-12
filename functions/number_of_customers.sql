CREATE OR REPLACE FUNCTION fn_number_customers()
RETURNS numeric AS
$body$
	SELECT COUNT(*)
	FROM customer;
$body$
LANGUAGE SQL