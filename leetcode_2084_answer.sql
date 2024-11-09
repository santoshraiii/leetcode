
Orders table:
+----------+-------------+------------+
| order_id | customer_id | order_type | min_order | sum
+----------+-------------+------------+
| 1        | 1           | 0          |    0      | 0
| 2        | 1           | 0          |    0      |0
| 11       | 2           | 0          |    0      |0
| 12       | 2           | 1          |    0      |1
| 21       | 3           | 1          |    0      |1
| 22       | 3           | 0          |    0      |0
| 31       | 4           | 1          |    1      |2
| 32       | 4           | 1          |    1      |2
+----------+-------------+------------+

WITH cte AS
(SELECT *, MIN(order_type) OVER(PARTITION BY customer_id) AS min_order
FROM Orders)

SELECT order_id, customer_id, order_type
FROM cte
WHERE (order_type + min_order <> 1)