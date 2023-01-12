CREATE OR REPLACE FUNCTION fn_max_product_price()
RETURNS numeric AS
$body$
	SELECT MAX(price)
	FROM item;
$body$
LANGUAGE SQL