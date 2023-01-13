CREATE OR REPLACE FUNCTION fn_get_random_number(min_val int, max_val int) 
RETURNS int AS
$body$
	DECLARE
	rand int;
BEGIN
	SELECT random()*(max_val - min_val) + min_val INTO rand;
	RETURN rand;
END;
$body$
LANGUAGE plpgsql

-- SELECT fn_get_random_number(1,10);
