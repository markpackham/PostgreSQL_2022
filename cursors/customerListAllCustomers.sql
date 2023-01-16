-- Cursors are an  efficient way to return large row sets from functions.
-- in PL/pgSQL FOR loops automatically use a cursor internally to avoid memory problems
-- https://www.postgresql.org/docs/current/plpgsql-cursors.html

DO
$body$
DECLARE
	msg text DEFAULT '';
	rec_customer record;
	cur_customers CURSOR
	FOR
		SELECT * FROM customer;
	BEGIN
		-- you must OPEN the cursor first
		OPEN cur_customers;
		LOOP
			FETCH cur_customers INTO rec_customer;
			EXIT WHEN NOT FOUND;
			msg := msg || rec_customer.first_name || ' ' || rec_customer.last_name || ', ';
		END LOOP;
		RAISE NOTICE 'Customers : %', msg;
	END;
$body$

-- outputs
/*
NOTICE:  Customers : Christopher Jones, Matthew Martinez, Melissa Moore, Melissa Brown, Jennifer Thomas, Stephanie Martinez, Daniel Williams, Lauren Anderson, Michael Jackson, Ashley Johnson, Brittany Thomas, Matthew Smith, Lauren Wilson, Justin Smith, Jessica Garcia, Matthew Jackson, Stephanie Thomas, Jessica Jackson, James Martinez, Christopher Robinson, 
DO
*/