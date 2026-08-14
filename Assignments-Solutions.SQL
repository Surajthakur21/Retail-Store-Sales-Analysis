-- STEP 1: CREATE DATABASE
CREATE DATABASE RetailStoreDB;

USE RetailStoreDB;

-- STEP 2: CREATE TABLE
CREATE TABLE store_sales
(
sale_id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
customer_name VARCHAR(50),
gender VARCHAR(10),
age INT,
city VARCHAR(40),
state VARCHAR(40),
product_name VARCHAR(60),
category VARCHAR(40),
quantity INT,
unit_price DECIMAL(10,2),
discount DECIMAL(10,2),
total_amount DECIMAL(10,2),
payment_mode VARCHAR(20),
salesperson VARCHAR(50)
);

-- STEP 3: INSERT SAMPLE DATA
INSERT INTO store_sales
(order_date,customer_name,gender,age,city,state,product_name,category,quantity,unit_price,discount,total_amount,payment_mode,salesperson)
VALUES
('2026-01-01','Rahul','Male',24,'Delhi','Delhi','Laptop','Electronics',1,55000,5000,50000,'Credit Card','Amit'),
('2026-01-02','Priya','Female',29,'Delhi','Delhi','Mobile','Electronics',2,18000,1000,35000,'UPI','Rohit'),
('2026-01-03','Ankit','Male',32,'Noida','UP','Chair','Furniture',4,2500,500,9500,'Cash','Neha'),
('2026-01-05','Sneha','Female',28,'Mumbai','Maharashtra','Sofa','Furniture',1,30000,2000,28000,'Debit Card','Amit'),
('2026-01-06','Rohan','Male',35,'Pune','Maharashtra','Television','Electronics',1,45000,3000,42000,'Credit Card','Neha'),
('2026-01-08','Meena','Female',41,'Jaipur','Rajasthan','Dining Table','Furniture',1,25000,1500,23500,'UPI','Rahul'),
('2026-01-10','Amit','Male',30,'Delhi','Delhi','Refrigerator','Electronics',1,42000,2000,40000,'Credit Card','Neha'),
('2026-01-12','Pooja','Female',27,'Lucknow','UP','Washing Machine','Electronics',1,28000,1000,27000,'Cash','Rohit'),
('2026-01-14','Karan','Male',26,'Chandigarh','Punjab','Office Chair','Furniture',2,4500,500,8500,'UPI','Rahul'),
('2026-01-15','Komal','Female',31,'Delhi','Delhi','Microwave','Electronics',1,15000,500,14500,'Debit Card','Amit'),
('2026-01-18','Sahil','Male',36,'Jaipur','Rajasthan','Bed','Furniture',1,38000,3000,35000,'Cash','Neha'),
('2026-01-19','Ritika','Female',25,'Noida','UP','Laptop','Electronics',1,60000,4000,56000,'Credit Card','Rahul'),
('2026-01-21','Deepak','Male',38,'Mumbai','Maharashtra','Air Conditioner','Electronics',1,52000,3000,49000,'UPI','Amit'),
('2026-01-22','Anjali','Female',34,'Pune','Maharashtra','Wardrobe','Furniture',1,32000,2000,30000,'Cash','Neha'),
('2026-01-23','Manoj','Male',42,'Delhi','Delhi','Mobile','Electronics',3,16000,2000,46000,'UPI','Rohit'),
('2026-01-25','Neha','Female',29,'Lucknow','UP','Study Table','Furniture',2,7000,1000,13000,'Debit Card','Rahul'),
('2026-01-26','Tarun','Male',40,'Delhi','Delhi','Television','Electronics',1,47000,2000,45000,'Cash','Amit'),
('2026-01-27','Shweta','Female',33,'Mumbai','Maharashtra','Sofa','Furniture',1,35000,3000,32000,'Credit Card','Neha'),
('2026-01-29','Mohit','Male',37,'Jaipur','Rajasthan','Laptop','Electronics',1,62000,5000,57000,'UPI','Rahul'),
('2026-01-30','Nisha','Female',26,'Delhi','Delhi','Mixer Grinder','Home Appliance',2,4500,500,8500,'Cash','Rohit');


-- ==========================================
-- BASIC QUERIES (1-10)
-- ==========================================

-- 1. Display all records.
SELECT * FROM store_sales;

-- 2. Show customer name, city and product purchased.
SELECT customer_name, city, product_name FROM store_sales;

-- 3. Find all customers from Delhi.
SELECT * FROM store_sales WHERE city = 'Delhi';

-- 4. Display all Electronics products.
SELECT * FROM store_sales WHERE category = 'Electronics';

-- 5. Find sales greater than 30,000.
SELECT * FROM store_sales WHERE total_amount > 30000;

-- 6. Show customers aged above 30 years.
SELECT * FROM store_sales WHERE age > 30;

-- 7. Sort records by highest sale amount.
SELECT * FROM store_sales ORDER BY total_amount DESC;

-- 8. Display the first 5 records.
SELECT * FROM store_sales LIMIT 5;

-- 9. Find customers whose names start with 'R'.
SELECT * FROM store_sales WHERE customer_name LIKE 'R%';

-- 10. Display all unique cities.
SELECT DISTINCT city FROM store_sales;


-- ==========================================
-- INTERMEDIATE QUERIES (11-20)
-- ==========================================

-- 11. Calculate total sales revenue.
SELECT SUM(total_amount) AS total_revenue FROM store_sales;

-- 12. Calculate average sales amount.
SELECT AVG(total_amount) AS average_sales FROM store_sales;

-- 13. Find the maximum sale amount.
SELECT MAX(total_amount) AS max_sales FROM store_sales;

-- 14. Find the minimum sale amount.
SELECT MIN(total_amount) AS min_sales FROM store_sales;

-- 15. Count total orders.
SELECT COUNT(sale_id) AS total_orders FROM store_sales;

-- 16. Display city-wise total sales.
SELECT city, SUM(total_amount) AS total_sales FROM store_sales GROUP BY city;

-- 17. Display category-wise revenue.
SELECT category, SUM(total_amount) AS total_revenue FROM store_sales GROUP BY category;

-- 18. Display salesperson-wise revenue.
SELECT salesperson, SUM(total_amount) AS total_sales FROM store_sales GROUP BY salesperson;

-- 19. Count orders by payment mode.
SELECT payment_mode, COUNT(sale_id) AS total_orders FROM store_sales GROUP BY payment_mode;

-- 20. Find customers who have placed more than one order.
SELECT customer_name, COUNT(sale_id) AS total_orders FROM store_sales GROUP BY customer_name HAVING COUNT(sale_id) > 1;


-- ==========================================
-- ADVANCED QUERIES (21-35)
-- ==========================================

-- 21. Find the city with the highest sales.
SELECT city, SUM(total_amount) AS total_sales FROM store_sales GROUP BY city ORDER BY total_sales DESC LIMIT 1;

-- 22. Find the category generating the highest revenue.
SELECT category, SUM(total_amount) AS total_revenue FROM store_sales GROUP BY category ORDER BY total_revenue DESC LIMIT 1;

-- 23. Display monthly sales revenue.
SELECT MONTH(order_date) AS order_month, YEAR(order_date) AS order_year, SUM(total_amount) AS total_revenue FROM store_sales GROUP BY YEAR(order_date), MONTH(order_date);

-- 24. Find the top 5 highest sales transactions.
SELECT * FROM store_sales ORDER BY total_amount DESC LIMIT 5;

-- 25. Display product-wise quantity sold.
SELECT product_name, SUM(quantity) AS total_quantity FROM store_sales GROUP BY product_name;

-- 26. Calculate average sales by city.
SELECT city, AVG(total_amount) AS average_sales FROM store_sales GROUP BY city;

-- 27. Show gross amount before discount for every order.
SELECT sale_id, customer_name, (quantity * unit_price) AS gross_amount FROM store_sales;

-- 28. List customers who paid using UPI.
SELECT customer_name, payment_mode FROM store_sales WHERE payment_mode = 'UPI';

-- 29. Find the most popular payment mode.
SELECT payment_mode, COUNT(sale_id) AS order_count FROM store_sales GROUP BY payment_mode ORDER BY order_count DESC LIMIT 1;

-- 30. Display all Furniture products costing more than 20,000.
SELECT * FROM store_sales WHERE category = 'Furniture' AND total_amount > 20000;

-- 31. Find customers between ages 25 and 35.
SELECT * FROM store_sales WHERE age BETWEEN 25 AND 35;

-- 32. Count male and female customers.
SELECT gender, COUNT(sale_id) AS total_count FROM store_sales GROUP BY gender;

-- 33. Display state-wise revenue.
SELECT state, SUM(total_amount) AS total_revenue FROM store_sales GROUP BY state;

-- 34. Find the salesperson with the maximum revenue.
SELECT salesperson, SUM(total_amount) AS total_revenue FROM store_sales GROUP BY salesperson ORDER BY total_revenue DESC LIMIT 1;

-- 35. Create a business KPI report.
SELECT 
    COUNT(sale_id) AS Total_Orders,
    SUM(total_amount) AS Total_Revenue,
    AVG(total_amount) AS Average_Order_Value,
    MAX(total_amount) AS Highest_Sale,
    MIN(total_amount) AS Lowest_Sale
FROM store_sales;
