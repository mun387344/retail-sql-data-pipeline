SELECT 
    SUM(total_amount) AS total_sales_amount,
	COUNT(*) AS total_qualifying_orders
FROM orders o 
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date BETWEEN '2026-01-01' AND '2026-06-30'
AND o.order_status = 'Completed'   
AND c.region IN ('Lagos', 'Abuja')
AND o.sales_channel IN ('Web', 'Mobile');

SELECT
    c.customer_id,
	c.customer_name,
	COUNT(*) AS total_orders,
	SUM(o.total_amount) AS total_spent,
    CASE
      WHEN SUM(o.total_amount) > 1500000 THEN 'High Value'
	  WHEN SUM(o.total_amount) BETWEEN 500000 AND 1500000 THEN 'Medium Value'
	  ELSE 'Low Value'
    END AS customer_segment
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'Completed'
GROUP BY (c.customer_id, c.customer_name);
