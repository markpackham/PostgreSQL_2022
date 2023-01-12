/* a cross join is a type of join that returns the Cartesian product of rows from the tables in the join. 
In other words, it combines each row from the first table with each row from the second table.
*/
SELECT sales_order_id, quantity, product_id
FROM item CROSS JOIN sales_item
ORDER BY sales_order_id;