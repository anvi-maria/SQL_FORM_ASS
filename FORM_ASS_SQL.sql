create database global_store_db;
CREATE TABLE products (product_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100),price DECIMAL(10, 2),quantity INT);
CREATE TABLE orders (order_id INT AUTO_INCREMENT PRIMARY KEY,product_id INT,quantity_ordered INT,order_date DATE,
FOREIGN KEY (product_id) REFERENCES products(product_id));
ALTER TABLE products
ADD COLUMN category VARCHAR(50) AFTER price;
RENAME TABLE products TO inventory;
INSERT INTO inventory (name, price, category, quantity) VALUES 
('Laptop', 750.00, 'Electronics', 15),
('Smartphone', 350.00, 'Electronics', 30),
('Book', 15.00, 'Books', 50),
('Desk Chair', 120.00, 'Furniture', 10),
('Water Bottle', 8.50, 'Accessories', 100),
('Headphones', 40.00, 'Electronics', 25),
('Notebook', 2.50, 'Stationery', 200),
('Gaming Console', 400.00, 'Electronics', 5),
('Backpack', 30.00, 'Accessories', 20),
('Desk Lamp', 25.00, 'Furniture', 15);
INSERT INTO orders (product_id, quantity_ordered, order_date) VALUES 
(1, 2, '2023-08-15'),
(2, 5, '2023-08-16'),
(3, 1, '2023-08-17'),
(5, 10, '2023-08-18'),
(6, 4, '2023-08-19');
SELECT * FROM inventory;
SELECT * FROM orders;
SELECT DISTINCT category
FROM inventory;
SELECT * FROM inventory ORDER BY price DESC LIMIT 5;
SELECT SUM(price) AS total_price FROM inventory;
SELECT category, COUNT(*) AS product_count FROM inventory GROUP BY category;
SELECT name, price FROM inventory WHERE quantity = 0;
CREATE VIEW expensive_products AS
SELECT *
FROM inventory
WHERE price > (SELECT AVG(price) FROM inventory);
SELECT i.name, o.quantity_ordered
FROM inventory i
INNER JOIN orders o ON i.product_id = o.product_id;
