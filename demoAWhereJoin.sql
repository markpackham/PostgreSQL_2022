SELECT item_id, price
FROM item, sales_item
WHERE item.id = sales_item.item_id
AND price > 120.00
ORDER BY item_id;