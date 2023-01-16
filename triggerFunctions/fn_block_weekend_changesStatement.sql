CREATE OR REPLACE FUNCTION fn_block_weekend_changes()
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS
$body$
BEGIN
	RAISE NOTICE 'No database changes allowed on a Weekend!!!!';
	RETURN null;
END;
$body$


-- bind our trigger function to the trigger
CREATE OR REPLACE TRIGGER tr_block_weekend_changes
	BEFORE UPDATE OR INSERT OR DELETE OR TRUNCATE
	ON distributor
	-- we target the STATEMENT rather than the ROW
	-- DOW is day of the week which we are checking for weekends
	-- Saturday and Sunday are day 6 AND 7
	FOR EACH STATEMENT
	WHEN(
	EXTRACT('DOW' FROM CURRENT_TIMESTAMP) BETWEEN 6 AND 7
	)
	EXECUTE PROCEDURE  fn_block_weekend_changes();


-- This should not be allowed to happen on a Saturday or Sunday
/*
UPDATE distributor
SET name = 'I Am Changed'
WHERE id = 2;
*/

