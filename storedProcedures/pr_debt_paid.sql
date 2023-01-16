CREATE OR REPLACE PROCEDURE pr_debt_paid(
	past_due_id int,
	payment numeric
)
AS
$body$
DECLARE

BEGIN
	UPDATE past_due
	SET balance = balance - payment
	WHERE id = past_due_id;
	COMMIT;
END;
$body$
LANGUAGE PLPGSQL;

-- Call the procedure
-- CALL pr_debt_paid(1, 10.00);

-- See if it all worked
-- SELECT * FROM past_due;

-- Balance was 123.45 before we ran the procedure
-- now it is 113.45 so it worked