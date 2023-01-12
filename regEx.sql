-- tilde ~ used for regex
SELECT first_name, last_name
FROM customer
WHERE first_name ~ '^Ma';