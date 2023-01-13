CREATE OR REPLACE FUNCTION fn_for_reverse_loop_test(max_num int) 
RETURNS int AS
$body$
	DECLARE
		total_sum INT DEFAULT 0;
	BEGIN
	-- put the Reverse here
	-- make sure the max_num is placed before the min num
	FOR i IN REVERSE max_num .. 1 BY 1
		LOOP
			total_sum := total_sum + i;
		END LOOP;
	RETURN total_sum;
END;
$body$
LANGUAGE plpgsql

-- SELECT fn_for_reverse_loop_test(5);