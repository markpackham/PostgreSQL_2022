CREATE OR REPLACE FUNCTION fn_add_ints(int, int)
RETURNS int AS
'
SELECT $1 + $2;
'
LANGUAGE SQL

-- to run the function
-- SELECT fn_add_ints(1,2);