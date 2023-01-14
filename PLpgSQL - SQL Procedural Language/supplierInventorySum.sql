CREATE OR REPLACE FUNCTION fn_get_supplier_value(the_supplier varchar) 
RETURNS varchar AS
$body$
DECLARE
	supplier_name varchar;
	price_sum numeric;
BEGIN
	SELECT product.supplier, SUM(item.price)
 	INTO supplier_name, price_sum
	FROM product, item
	WHERE product.supplier = the_supplier
	GROUP BY product.supplier;
	RETURN CONCAT(supplier_name, ': Inventory Value : $', price_sum);
END;
$body$
LANGUAGE plpgsql

-- SELECT fn_get_supplier_value('Nike');
-- Output is 
-- Nike: Inventory Value : $21694.74