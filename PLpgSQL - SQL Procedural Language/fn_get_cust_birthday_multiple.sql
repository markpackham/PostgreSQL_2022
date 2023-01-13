-- multiple OUTs
CREATE OR REPLACE FUNCTION fn_get_cust_birthday(IN the_month int, OUT bd_month int, OUT bd_day int, OUT f_name varchar, OUT l_name varchar) AS
$body$
	BEGIN
		SELECT EXTRACT(MONTH FROM birth_date), EXTRACT(DAY FROM birth_date), 
		first_name, last_name 
		INTO bd_month, bd_day, f_name, l_name
    	FROM customer
    	WHERE EXTRACT(MONTH FROM birth_date) = the_month
		LIMIT 1;
		END;
$body$
LANGUAGE plpgsql

-- SELECT (fn_get_cust_birthday_multiple(9)).*;
