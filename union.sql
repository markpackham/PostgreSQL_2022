-- Unions and Outer Joins are rarely ever used in the real World
SELECT first_name, last_name, street, city, zip, birth_date
FROM customer
WHERE EXTRACT(MONTH FROM birth_date) = 12
UNION
SELECT first_name, last_name, street, city, zip, birth_date
FROM sales_person
WHERE EXTRACT(MONTH FROM birth_date) = 12
ORDER BY birth_date;