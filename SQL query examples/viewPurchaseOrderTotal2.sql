CREATE VIEW purchase_order_overview2 AS
SELECT sales_order.purchase_order_number, customer.company,
sales_item.quantity, product.supplier,
product.name, item.price,
CONCAT(sales_person.first_name, ' ', sales_person.last_name) AS Sales_Person
FROM sales_order
JOIN sales_item
ON sales_item.sales_order_id = sales_order.id
JOIN item
ON item.id = sales_item.item_id
JOIN customer
ON sales_order.cust_id = customer.id
JOIN product
ON product.id = item.product_id
JOIN sales_person
ON sales_person.id = sales_order.sales_person_id
ORDER BY purchase_order_number;

SELECT *, (quantity * price) AS Total FROM purchase_order_overview2;