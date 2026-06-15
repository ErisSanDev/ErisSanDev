-- =========================================== DAILY TASK ============================================================  
# DAY 01:(15-06-2026)

-- SQL Questions
# Q1: The Sales Manager wants to see all products that belong to the Furniture category.
SELECT product_id, product_name, price
  FROM DataAnalyst_Practice.products
   WHERE category = 'Furniture';

# Q2: Identify customers who have placed more than 1 order.
SELECT customer_id, 
        SUM(quantity) AS Total_Orders
  FROM DataAnalyst_Practice.orders
GROUP BY customer_id
HAVING SUM(quantity) > 1
ORDER BY Total_Orders DESC;

# Q3: Create a report showing every order along with the customer name.
SELECT o.order_id, c.customer_name, o.order_date, o.quantity
FROM dataanalyst_practice.customers c
INNER JOIN dataanalyst_practice.orders o ON c.customer_id = o.customer_id

# Q4: The Customer Success team wants to identify customers even if they have never placed an order.
SELECT c.customer_id, c.customer_name, o.order_id
FROM dataanalyst_practice.customers c
LEFT JOIN dataanalyst_practice.orders o ON c.customer_id = o.customer_id

# Q5: Management wants to know how many units were sold for each product.
SELECT p.product_name, SUM(o.quantity) AS Total_Quantity_Sold
FROM dataanalyst_practice.products p
LEFT JOIN dataanalyst_practice.orders o ON p.product_id = o.product_id
GROUP BY p.product_name
ORDER BY Total_Quantity_Sold DESC;

CREATE DATABASE DataAnalyst_Practice;
USE DataAnalyst_Practice;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);
INSERT INTO Customers VALUES
(1,'Aarav','Bangalore'),
(2,'Diya','Mumbai'),
(3,'Rohan','Delhi'),
(4,'Ananya','Chennai'),
(5,'Kabir','Pune');

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
(101,'Wireless Mouse','Electronics',800),
(102,'Keyboard','Electronics',1200),
(103,'Notebook','Stationery',100),
(104,'Office Chair','Furniture',5000),
(105,'Desk Lamp','Furniture',1500);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);

INSERT INTO Orders VALUES
(1001,1,101,2,'2026-06-01'),
(1002,2,102,1,'2026-06-01'),
(1003,1,103,5,'2026-06-02'),
(1004,3,104,1,'2026-06-03'),
(1005,2,105,2,'2026-06-03'),
(1006,4,101,1,'2026-06-04');


