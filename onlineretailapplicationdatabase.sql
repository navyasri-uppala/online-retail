-- Create table for customers
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100),
  password VARCHAR(50)
);

-- Create table for products
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(100),
  price DECIMAL(10, 2),
  description VARCHAR(500)
);

-- Create table for orders
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create table for order items
CREATE TABLE order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert sample data into customers table
INSERT INTO customers (customer_id, name, email, password)
VALUES (1, 'Janardhan', 'janardhan@example.com', 'password153'),
       (2, 'Sunil', 'sunil@example.com', 'password956');

-- Insert sample data into products table
INSERT INTO products (product_id, name, price, description)
VALUES (1, 'Product A', 9.99, 'Description of Product A'),
       (2, 'Product B', 19.99, 'Description of Product B'),
       (3, 'Product C', 29.99, 'Description of Product C');

-- Insert sample data into orders table
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES (1, 1, '2024-05-10', 29.99),
       (2, 2, '2024-05-11', 39.98);

-- Insert sample data into order_items table
INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES (1, 1, 1, 9.99),
       (1, 3, 2, 19.99),
       (2, 2, 1, 19.99);

-- Query to retrieve customer's orders
SELECT c.name, o.order_id, o.order_date, o.total_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer
