SELECT sales_order.id, sales_item.quantity, item.price,
(sales_item.quantity * item.price) AS Total_Price
FROM sales_order
JOIN sales_item
ON sales_item.sales_order_id = sales_order.id
JOIN item
ON item.id = sales_item.item_id
ORDER BY sales_order.id;