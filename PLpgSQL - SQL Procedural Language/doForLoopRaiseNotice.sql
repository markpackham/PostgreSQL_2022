-- https://www.postgresql.org/docs/current/sql-do.html
-- DO executes an anonymous code block, or in other words a transient anonymous function in a procedural language.
-- The code block is treated as though it were the body of a function with no parameters, returning void. 
-- It is parsed and executed a single time.

-- our DO Block
DO
$body$
	DECLARE
		rec record;
	BEGIN
		FOR rec IN
			SELECT first_name, last_name
			FROM sales_person
		LOOP
			-- use RAISE NOTICE with % to output to screen
			RAISE NOTICE '% %', rec.first_name, rec.last_name;
		END LOOP;
	END;
$body$
LANGUAGE plpgsql