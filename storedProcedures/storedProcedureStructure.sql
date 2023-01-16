-- Stored Procedure structure
-- cannot be called by SELECT, can excute with EXECUTE
-- If it has no params it is a "Static Procedure", while one with params is a "Dynamic Procedure"
-- Procedures don't allow you to return values (unless you use IN OUT)
CREATE OR REPLACE PROCEDURE procedure_name(params)
AS
$body$
DECLARE
BEGIN
END;
$body$
LANGUAGE PLPGSQL;