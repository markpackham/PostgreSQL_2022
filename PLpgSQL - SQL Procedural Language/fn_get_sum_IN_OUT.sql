-- since we're using IN & OUT we don't need RETRUN
CREATE OR REPLACE FUNCTION fn_get_sum_IN_OUT(IN v1 int, IN v2 int, OUT answer int)
AS
$body$
BEGIN
	answer := v1 + v2;
END;
$body$
LANGUAGE plpgsql

-- SELECT fn_get_sum_IN_OUT(1,2);
