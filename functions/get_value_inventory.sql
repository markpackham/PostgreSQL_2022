CREATE OR REPLACE FUNCTION fn_get_value_inventory()
RETURNS numeric AS
$body$
	SELECT SUM(price)
	FROM item;
$body$
LANGUAGE SQL