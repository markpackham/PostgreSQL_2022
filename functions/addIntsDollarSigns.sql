-- using $ signs instead of single quotes ' '
CREATE OR REPLACE FUNCTION fn_add_intsDollarSigns(int, int)
RETURNS int AS
$body$
SELECT $1 + $2;
$body$
LANGUAGE SQL