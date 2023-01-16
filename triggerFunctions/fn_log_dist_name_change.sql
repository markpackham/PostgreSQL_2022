CREATE OR REPLACE FUNCTION fn_log_dist_name_change()
	-- must use RETURNS and not RETURN
	RETURNS TRIGGER
	LANGUAGE PLPGSQL
AS
$body$
BEGIN
	-- see if name change has occured
	IF NEW.name != OLD.name THEN
		INSERT INTO distributor_audit
		(dist_id, name, edit_date)
		VALUES
		(OLD.id, OLD.name, NOW());
	END IF;
	-- tell me the trigger has run
	RAISE NOTICE ' Trigger Name : %', TG_NAME;
	RAISE NOTICE ' TABLE Name : %', TG_TABLE_NAME;
	RAISE NOTICE ' Operation : %', TG_OP;
	RAISE NOTICE ' When Executed : %', TG_WHEN;
	RAISE NOTICE ' Row or Statement Trigger : %', TG_Level;
	RAISE NOTICE ' Table Schema : %', TG_TABLE_SCHEMA;
	RETURN NEW;
END;
$body$

-- bind our trigger to the relevant action (kind of like having an Event and a Listener)
/*
CREATE TRIGGER tr_dist_name_changed
	BEFORE UPDATE
	ON distributor
	FOR EACH ROW
	EXECUTE PROCEDURE fn_log_dist_name_change();
*/



--
--
-- Test it worked
/*
UPDATE distributor
SET name = 'Western Clothing'
WHERE id = 2;
*/

-- We see this output
/*
NOTICE:   Trigger Name : tr_dist_name_changed
NOTICE:   TABLE Name : distributor
NOTICE:   Operation : UPDATE
NOTICE:   When Executed : BEFORE
NOTICE:   Row or Statement Trigger : ROW
NOTICE:   Table Schema : public
*/

-- Check the auditing table actually got updated
-- SELECT * FROM distributor_audit;