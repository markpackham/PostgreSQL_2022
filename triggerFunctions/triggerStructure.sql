-- Trigger structure
-- you want then to occur when another event occurs eg after a database Inertion has occured
-- they can occur before or after an event executes or instead of another event
-- a single table can have multiple triggers that execute in a specific order
-- they can't recieve params or be executed by a user
-- they can be Row Level or Statement Level
-- triggers are great for auditing and maintaining data integrity, they can be recursive
-- nested trigger erros can be hard to debug and they have an execution overhead, plus they are hidden from the average user
CREATE FUNCTION trigger_function()
    RETURN TRIGGER
    LANGUAGE PLPGSQL
AS
$body$
BEGIN
END;
$body$

CREATE TRIGGER trigger_name
    {BEFORE | AFTER} {event} -- Event: INSERT, UPDATE, TRUNCATE
ON table_name
    [FOR [EACH] {ROW | STATEMENT}]
        EXECUTE PROCEDURE trigger_function