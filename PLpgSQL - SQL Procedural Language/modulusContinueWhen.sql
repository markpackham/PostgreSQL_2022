-- Prints the odd numbers from 1 to 10
DO
$body$
	DECLARE
		i int DEFAULT 1;
	BEGIN
		LOOP
			i := i + 1;
		EXIT WHEN i > 10;
		-- using Modulus aka MOD with CONTINUE WHEN
		CONTINUE WHEN MOD(i, 2) = 0;
		RAISE NOTICE 'Num : %', i;
		END LOOP;
	END;
$body$
LANGUAGE plpgsql