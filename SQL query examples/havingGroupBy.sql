SELECT EXTRACT(MONTH FROM birth_date) AS Month, COUNT(*) AS Amount
FROM customer
GROUP BY Month
HAVING COUNT(*) > 1
ORDER BY Month