CREATE OR REPLACE FUNCTION fn_for_loop_test(max_num int) 
RETURNS int AS
$body$
	DECLARE
		total_sum INT DEFAULT 0;
	BEGIN
	-- keep counting from 1 to the max number in increments of 1
	FOR i IN 1 .. max_num BY 1
		LOOP
			total_sum := total_sum + i;
		END LOOP;
	RETURN total_sum;
END;
$body$
LANGUAGE plpgsql

-- SELECT fn_for_loop_test(5);
-- gives us 15
-- if we changed the increment from 1 to 2 then we'd get 9 as the answer
-- if we changed the increment to 3 then we'd get 5 as the answer