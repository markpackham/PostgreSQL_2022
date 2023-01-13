CREATE OR REPLACE FUNCTION fn_loop_test(max_num int) 
RETURNS int AS
$body$
	DECLARE
		num INT DEFAULT 1;
		total_sum INT DEFAULT 0;
	BEGIN
		-- regular loop (not a While loop since those are something else)
		LOOP
			total_sum := total_sum + num;
			num := num + 1;
            -- break out of the loop
			EXIT WHEN num > max_num;
			-- always end the loop
		END LOOP;
	RETURN total_sum;
END;
$body$
LANGUAGE plpgsql

-- SELECT fn_loop_test(5);