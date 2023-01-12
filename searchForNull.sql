SELECT product_id, price
FROM item
WHERE price = NULL;

SELECT product_id, price
FROM item
WHERE price IS NOT NULL;