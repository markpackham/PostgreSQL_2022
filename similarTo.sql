-- a bit like LIKE in MySQL
SELECT first_name, last_name
FROM customer
WHERE first_name SIMilAR TO 'M%';