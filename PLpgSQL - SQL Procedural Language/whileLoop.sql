DO
$body$
	DECLARE
		j INT DEFAULT 1;
		total_sum INT DEFAULT 0;
	BEGIN
		WHILE j <= 10
		LOOP
		total_sum := total_sum + j;
			RAISE NOTICE 'J is %', j;
			j := j + 1;
		END LOOP;
		RAISE NOTICE 'Total Sum is %', total_sum;
	END;
$body$
LANGUAGE plpgsql