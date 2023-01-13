CREATE OR REPLACE FUNCTION fn_get_sum(val1 int, val2 int) 
RETURNS int AS
$body$
	-- DECLARE block holds variables
	DECLARE
	answer int;
BEGIN
	answer := val1 + val2;
	RETURN answer;
END
$body$
LANGUAGE plpgsql

-- SELECT fn_get_sum(1,2);
