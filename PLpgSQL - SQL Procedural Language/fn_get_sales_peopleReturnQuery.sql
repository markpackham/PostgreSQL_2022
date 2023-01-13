CREATE OR REPLACE FUNCTION fn_get_sales_people()
-- notice use of RETURNS instead of just RETURN
RETURNS SETOF sales_person AS
$body$
	BEGIN
		-- RETURN the QUERY
		RETURN QUERY
		SELECT *
		FROM sales_person;
	END;
$body$
LANGUAGE plpgsql

-- SELECT (fn_get_sales_people()).*;

-- SELECT (fn_get_sales_people()).street;