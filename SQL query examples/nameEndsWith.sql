-- tilde ~ used for regex
SELECT first_name, last_name
FROM customer
WHERE last_name ~ 'ez$';