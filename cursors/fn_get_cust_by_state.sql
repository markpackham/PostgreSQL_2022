CREATE OR REPLACE FUNCTION fn_get_cust_by_state(c_state varchar)
RETURNS text
LANGUAGE PLPGSQL
AS
$body$
DECLARE
	cust_names text DEFAULT '';
	rec_customer record;
	cur_cust_by_state CURSOR (c_state varchar)
	FOR
		SELECT
			first_name, last_name, state
		FROM customer
		WHERE state = c_state;
	BEGIN
		OPEN cur_cust_by_state(c_state);
		LOOP
			FETCH cur_cust_by_state INTO rec_customer;
			EXIT WHEN NOT FOUND;
			cust_names := cust_names || rec_customer.first_name || ' ' || rec_customer.last_name || ', ';
		END LOOP;
		-- Always remember to close cursor
		CLOSE cur_cust_by_state;
		RETURN cust_names;
	END;
$body$


-- Test it works
-- SELECT fn_get_cust_by_state('CA');
-- Matthew Martinez, Lauren Anderson, Ashley Johnson, Jessica Garcia, 