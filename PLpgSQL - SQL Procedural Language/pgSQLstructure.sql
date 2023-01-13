-- PL/pgSQL (sadly can't create a folder called PL/pgSQL since the / is a reserved character)
-- you can do fancy things like looping using this

CREATE OR REPLACE FUNCTION funct_name(parameter par_type) RETURNS ret_type AS
$body$
BEGIN
--statements
END;
$body$
LANGUAGE plpgsql