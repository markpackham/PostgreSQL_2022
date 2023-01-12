-- Looking for Ashley, search for A then 5 other letters
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'A_____';