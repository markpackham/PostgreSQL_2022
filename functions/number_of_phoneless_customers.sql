CREATE OR REPLACE FUNCTION fn_number_customers_no_phone()
RETURNS numeric AS
$body$
	SELECT COUNT(*)
	FROM customer
	WHERE phone IS NULL;
$body$
LANGUAGE SQL