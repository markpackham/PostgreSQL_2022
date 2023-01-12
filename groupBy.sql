SELECT EXTRACT(MONTH FROM birth_date) AS Month, COUNT(*) AS Amount
FROM customer
GROUP BY Month
ORDER BY Month