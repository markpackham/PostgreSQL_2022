CREATE OR REPLACE FUNCTION fn_check_month_orders(the_month int) 
RETURNS varchar AS
$body$
	-- Variables
	DECLARE
		total_orders int;
	BEGIN
		--Check total orders
		SELECT COUNT(purchase_order_number)
        -- store this in our variable total_orders
    	INTO total_orders
		FROM sales_order
		WHERE EXTRACT(MONTH FROM time_order_taken) = the_month;
		
		--Use conditionals to provide different output like if sales are good or bad for the month
        -- IF, ELSEIF, ELSE
		IF total_orders > 10 THEN
			RETURN CONCAT(total_orders, ' Orders : Sales Amazing');
		ELSEIF total_orders < 5 THEN
			RETURN CONCAT(total_orders, ' Orders : Sales Bad');
		ELSE
			RETURN CONCAT(total_orders, ' Orders : Sales Ok');
        -- Remember to end any IF with an END IF
		END IF;	
	END;
$body$
LANGUAGE plpgsql

-- SELECT fn_check_month_orders(12);