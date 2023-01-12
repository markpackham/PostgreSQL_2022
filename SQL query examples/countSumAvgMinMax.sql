SELECT COUNT(*) AS Items, SUM(price) AS Value, ROUND(AVG(price),2) AS Avg,
MIN(price) AS Min, MAX(price) AS Max
FROM item;