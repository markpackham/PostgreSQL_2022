/*
Natural Join: Guidelines

- The associated tables have one or more pairs of identically named columns.
- The columns must be the same data type.
- Don’t use ON clause in a natural join.

Inner Join joins two table on the basis of the column which is explicitly specified in the ON clause.

In Natural Join, The resulting table will contain all the attributes of both the tables but keep only one copy of each common column
In Inner Join, The resulting table will contain all the attribute of both the tables including duplicate columns also

In Inner Join, only those records will return which exists in both the tables

Visual Example of Natural Join
https://www.w3resource.com/sql/joins/natural-join.php
*/

SELECT COUNT(*)
FROM sales_order
NATURAL JOIN customer
WHERE customer.first_name = 'Christopher' AND customer.last_name = 'Jones';