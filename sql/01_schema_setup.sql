CREATE TABLE IF NOT EXISTS customers(customer_id INT PRIMARY KEY,
customer_name VARCHAR,
region VARCHAR,
segment VARCHAR,
signup_date DATE
);

CREATE TABLE IF NOT EXISTS products(product_id INT PRIMARY KEY,
product_name VARCHAR,
category VARCHAR,
unit_price NUMERIC(12,2)
);

CREATE TABLE IF NOT EXISTS orders(order_id INT PRIMARY KEY,
order_date date,
customer_id INT REFERENCES customers(customer_id),
product_id INT REFERENCES products(product_id),
quantity INT,
unit_price NUMERIC(12,2),
discount_rate NUMERIC(5,2),
total_amount NUMERIC(12,2),
order_status VARCHAR,
sales_channel VARCHAR
); 

SELECT *
FROM customers, products,orders
LIMIT 5;

SELECT 
  COUNT (*)
FROM customers;

SELECT 
  COUNT (*)
FROM products;

SELECT 
  COUNT (*)
FROM orders;