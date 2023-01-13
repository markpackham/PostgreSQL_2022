CREATE OR REPLACE FUNCTION fn_check_month_ordersCASE(the_month int) 
RETURNS varchar AS
$body$
	DECLARE
		total_orders int;
	BEGIN
		SELECT COUNT(purchase_order_number)
    	INTO total_orders
		FROM sales_order
		WHERE EXTRACT(MONTH FROM time_order_taken) = the_month;
		
		-- Case statements are essentially Switch statements, good when If statements would be too long winded
		CASE
			WHEN total_orders < 1 THEN
				RETURN CONCAT(total_orders, ' Orders : Terrible');
			WHEN total_orders > 0 AND total_orders < 5 THEN
				RETURN CONCAT(total_orders, ' Orders : Ok');
			-- Default
			ELSE
				RETURN CONCAT(total_orders, ' Orders : Amazing');
		END CASE;
	END;
$body$
LANGUAGE plpgsql

-- SELECT fn_check_month_ordersCASE(12);