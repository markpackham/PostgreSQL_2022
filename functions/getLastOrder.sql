CREATE OR REPLACE FUNCTION fn_get_last_order()
RETURNS sales_order as
$body$
	SELECT *
    FROM sales_order
    ORDER BY time_order_taken DESC
    LIMIT 1;
$body$
LANGUAGE SQL

-- Don't do this, it looks ugly as hell
-- SELECT fn_get_last_order();
-- Instead you want the data in a tidy table format
-- SELECT (fn_get_last_order()).*;

-- Get specific column like time an order was taken
-- SELECT (fn_get_last_order()).time_order_taken;