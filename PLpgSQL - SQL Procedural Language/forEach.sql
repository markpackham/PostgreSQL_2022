-- FOREACH var IN ARRAY array_name
-- handy for printing out all the values in an array
DO
$body$
	DECLARE
	arr1 int[] := array[1,2,3,4,5];
		i int;
	BEGIN
		FOREACH i IN ARRAY arr1
		LOOP
			RAISE NOTICE '%', i;
		END LOOP;
	END;
$body$
LANGUAGE plpgsql