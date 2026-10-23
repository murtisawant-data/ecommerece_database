CREATE DATABASE ECOM; -- create database
USE ECOM; -- using the database

--  creating tables
-- customers
CREATE TABLE CUSTOMER(
CUST_ID varchar(255),
FIRST_NAME varchar(250),
LAST_NAME VARCHAR(255),
EMAIL varchar(250),
GENDER ENUM("MALE","FEMALE","OTHERS"),
PHONE varchar(10), 
ANNUAL_INCOME DECIMAL(10,2));
SELECT * FROM CUSTOMER;

DESCRIBE CUSTOMER;


CREATE TABLE PRODUCT(
PROD_ID INT PRIMARY KEY,
PROD_NAME VARCHAR(255) UNIQUE,
UNIT_PRICE DECIMAL(10,2),
CATEGORY VARCHAR(200));

ALTER TABLE CUSTOMER
MODIFY COLUMN CUST_ID VARCHAR(255)PRIMARY KEY;

DESCRIBE CUSTOMER;


CREATE TABLE SALES(
QUANTITY INT,
SALES DECIMAL(9,2),
CUSTOMER_ID VARCHAR(200),
PROD_ID INT,
DISCOUNT DECIMAL(3,2),
LOCATION CHAR(50),
ORDER_DATE DATE,
DELIVERY_DATE DATE,
PROFIT DECIMAL(9,2));

ALTER TABLE SALES
ADD CONSTRAINT FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUST_ID),
ADD CONSTRAINT FOREIGN KEY (PROD_ID) REFERENCES PRODUCT(PROD_ID);
DESCRIBE SALES;

INSERT INTO CUSTOMER(CUST_ID,FIRST_NAME,LAST_NAME,EMAIL,GENDER,PHONE,ANNUAL_INCOME)
VALUES
("CUST-101","MURTI","SAWANT","murti.sawant@gmail.com","FEMALE","8779605843",70000);
INSERT INTO CUSTOMER VALUES
("CUST-102","JANHAVI","THAKUR","janhavi.thakur@gmail.com","FEMALE","1234567890",60000),
("CUST-103","NEHA","SARDAR","neha.sardar@gmail.com","FEMALE","0987654321",50000),
("CUST-104","HARSH","PATIL","harsh.patil@gmail.com","MALE","8769320945",65000),
("CUST-105","DISHA","SAWANT","disha.sawant@gmail.com","FEMALE","309752659",75000);
SELECT *
FROM CUSTOMER;

SELECT FIRST_NAME,GENDER
FROM CUSTOMER;
-- MODIFY TABLE
ALTER TABLE SALES
ADD COLUMN SALE_ID INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE CUSTOMER
MODIFY COLUMN FIRST_NAME VARCHAR(255) NOT NULL;

ALTER TABLE PRODUCT
MODIFY COLUMN PROD_NAME VARCHAR(255) NOT NULL,
MODIFY COLUMN UNIT_PRICE DECIMAL(10,2) NOT NULL;

ALTER TABLE PRODUCT 
ADD CONSTRAINT CHECK (UNIT_PRICE>0);

ALTER TABLE SALES
ADD CONSTRAINT CHECK (QUANTITY >0);

ALTER TABLE SALES 
ADD CONSTRAINT CHECK (DISCOUNT BETWEEN 0 AND 1);

CREATE TABLE PAYMENT(
PAYMENT_ID INT AUTO_INCREMENT PRIMARY KEY,
ORDER_ID INT NOT NULL,
PAYMENT_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
PAYMENT_METHOD ENUM ('UPI','CARD','NET BANKING','COD'),
PAYMENT_AMOUNT DECIMAL(10,2) NOT NULL,
PAYMENT_STATUS ENUM ('PENDING','COMPLETED','FAILED','REFUNDED') DEFAULT 'PENDING');

SELECT * FROM PAYMENT;

CREATE TABLE ORDERS(
ORDER_ID INT AUTO_INCREMENT PRIMARY KEY,
CUST_ID VARCHAR(255),
ORDER_STATUS ENUM ('PENDING','SHIPPED','DELIVERED','CANCELLED','ON THE WAY') DEFAULT 'PENDING',
SHIPPING_ADDRESS VARCHAR(255),
FOREIGN KEY (CUST_ID) REFERENCES CUSTOMER(CUST_ID));

ALTER TABLE PAYMENT
ADD CONSTRAINT 
FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID);

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO PRODUCT VALUES
(1001,"MENS T-SHIRT",400,"CLOTHING"),
(1002,"SHOES",1500,"FOOTWEAR"),
(1003,"APPLE WATCH",68000,"ELECTRONICS"),
(1004,"TABLE",1500,"FURNITURE"),
(1005,"HEELS",400,"FOOTWEAR"),
(1006,"SAMSUNG",134000,"ELECTRONICS");

INSERT INTO ORDERS VALUE
( 1001,'CUST-103','PENDING','MUMBAI');

INSERT INTO ORDERS(CUST_ID,ORDER_STATUS,SHIPPING_ADDRESS) VALUES
('CUST-104','DELIVERED','PUNE'),
('CUST-101','ON THE WAY','DELHI'),
('CUST-102','SHIPPED','NAGPUR'),
('CUST-101','CANCELLED','NASHIK'),
('CUST-105','SHIPPED','GURGOAN'),
('CUST-101','DELIVERED','HARYANA'),
('CUST-104','CANCELLED','MUMBAI'),
('CUST-102','ON THE WAY','PUNE'),
('CUST-102','DELIVERED','NAGPUR');
select * FROM CUSTOMER;
select * FROM ORDERS;

ALTER TABLE SALES
ADD COLUMN ORDER_ID INT;

ALTER TABLE SALES
ADD CONSTRAINT FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID);

INSERT INTO CUSTOMER
(CUST_ID,FIRST_NAME,LAST_NAME,EMAIL,GENDER,PHONE,ANNUAL_INCOME)
VALUES
("CUST-106","MAMATA","SAWANT","mamata.sawant@gmail.com","FEMALE","8779605855",90000),
("CUST-107","MANTHAN","THAKUR","Manthan.thakur@gmail.com","MALE","1234567990",60000),
("CUST-108","MANOHAR","SHINDE","manohar.shide@gmail.com","MALE","1238867990",50000),
("CUST-109","POOJA","SAWANT","pooja.sawantr@gmail.com","FEMALE","1230067990",77000),
("CUST-110","MANSI","MHATRE","Mansi.mhatre@gmail.com","FEMALE","1233567990",60000),
("CUST-111","KESHAV","TUKARAM","keshav.tukaram@gmail.com","MALE","1994567990",30000),
("CUST-112","YASH","DAS","YASH.DAS@gmail.com","MALE","1294567990",60000),
("CUST-113","SNEHA","SAWANT","sneha.sawant@gmail.com","FEMALE","9923456799",90000),
("CUST-114","SUVARNA","RAWOOL","suvarna.rawool@gmail.com","feMALE","1234588990",40000),
("CUST-115","KRISHNA","PAWAR","krishna.pawar@gmail.com","MALE","1234886799",60000);

INSERT INTO PRODUCT
(PROD_ID, PROD_NAME, UNIT_PRICE, CATEGORY)
VALUES
(1007, 'LAPTOP', 7400, 'ELECTRONICS'),
(1008, 'MENS PANTS', 700, 'CLOTHING'),
(1009, 'MOBILE', 4400, 'ELECTRONICS'),
(1010, 'SMART WATCH', 2400, 'ELECTRONICS'),
(1011, 'AIR CONDITIONER', 9400, 'ELECTRONICS'),
(1012, 'TABLETS', 4400, 'ELECTRONICS'),
(1013, 'CUPBOARD', 5500, 'FURNITURE'),
(1014, 'CHAIR', 1500, 'FURNITURE'),
(1015, 'BED', 7500, 'FURNITURE');

INSERT INTO ORDERS
(CUST_ID,ORDER_STATUS,SHIPPING_ADDRESS)
VALUES
('CUST-106','DELIVERED','MUMBAI'),
('CUST-107','PENDING','BADLAPUR'),
('CUST-108','SHIPPED','KALYAN'),
('CUST-109','DELIVERED','NASHIK'),
('CUST-110','ON THE WAY','SAWANTWADI'),
('CUST-111','DELIVERED','SOLAPUR'),
('CUST-112','DELIVERED','PUNE'),
('CUST-113','DELIVERED','THAKURLI'),
('CUST-114','PENDING','MUMBAI'),
('CUST-115','DELIVERED','AMBERNATH');
set foreign_key_checks=0;



INSERT INTO PAYMENT
(ORDER_ID, PAYMENT_DATE, PAYMENT_METHOD, PAYMENT_AMOUNT, PAYMENT_STATUS)
VALUES
(1101, '2026-09-01 10:30:00', 'UPI', 1500.00, 'Pending'),
(1102, '2026-09-02 11:15:00', 'Card', 8500.00, 'Completed'),
(1103, '2026-09-03 12:00:00', 'UPI', 3200.00, 'Completed'),
(1104, '2026-09-04 14:20:00', 'Net Banking', 75000.00, 'Completed'),
(1105, '2026-09-05 15:10:00', 'Card', 400.00, 'Refunded'),
(1106, '2026-09-06 09:45:00', 'COD', 2800.00, 'Pending'),
(1107, '2026-09-07 16:00:00', 'UPI', 2500.00, 'Completed'),
(1108, '2026-09-08 17:30:00', 'Card', 22000.00, 'Completed'),
(1109, '2026-09-09 13:10:00', 'UPI', 1600.00, 'Failed'),
(1110, '2026-09-10 18:15:00', 'Net Banking', 135000.00, 'Completed'),
(1111, '2026-09-11 10:00:00', 'UPI', 4000.00, 'Completed'),
(1112, '2026-09-12 11:30:00', 'Card', 75000.00, 'Completed'),
(1113, '2026-09-13 12:45:00', 'COD', 3200.00, 'Pending'),
(1114, '2026-09-14 14:00:00', 'UPI', 1800.00, 'Completed'),
(1115, '2026-09-15 15:20:00', 'Card', 2500.00, 'Refunded'),
(1116, '2026-09-16 16:30:00', 'Net Banking', 8500.00, 'Completed'),
(1117, '2026-09-17 09:20:00', 'UPI', 1200.00, 'Failed'),
(1118, '2026-09-18 10:40:00', 'Card', 2800.00, 'Completed'),
(1119, '2026-09-19 13:50:00', 'COD', 1600.00, 'Pending'),
(1120, '2026-09-20 17:00:00', 'UPI', 2500.00, 'Completed');

INSERT INTO SALES
(QUANTITY, SALES, CUSTOMER_ID, PROD_ID, DISCOUNT,
 LOCATION, ORDER_DATE, DELIVERY_DATE, PROFIT, ORDER_ID)
VALUES
(2, 800.00, 'CUST-103', 1001, 0.00, 'Mumbai', '2026-09-01', '2026-09-04', 160.00, 1101),
(1, 1500.00, 'CUST-104', 1002, 0.00, 'Pune', '2026-09-02', '2026-09-05', 300.00, 1102),
(1, 3200.00, 'CUST-101', 1012, 0.00, 'Delhi', '2026-09-03', '2026-09-06', 640.00, 1103),
(1, 75000.00, 'CUST-102', 1007, 0.00, 'Nagpur', '2026-09-04', '2026-09-08', 7500.00, 1104),
(1, 400.00, 'CUST-101', 1005, 0.00, 'Nashik', '2026-09-05', NULL, 80.00, 1105),
(1, 2800.00, 'CUST-105', 1013, 0.00, 'Gurgaon', '2026-09-06', NULL, 560.00, 1106),
(1, 2500.00, 'CUST-101', 1015, 0.00, 'Haryana', '2026-09-07', '2026-09-10', 500.00, 1107),
(1, 22000.00, 'CUST-104', 1014, 0.00, 'Pune', '2026-09-08', NULL, 4400.00, 1108),
(1, 1600.00, 'CUST-102', 1016, 0.00, 'Nagpur', '2026-09-09', NULL, 320.00, 1109),
(1, 135000.00, 'CUST-102', 1006, 0.00, 'Mumbai', '2026-09-10', '2026-09-13', 13500.00, 1110),
(2, 800.00, 'CUST-106', 1001, 0.00, 'Mumbai', '2026-09-11', '2026-09-14', 160.00, 1111),
(1, 75000.00, 'CUST-107', 1007, 0.00, 'Pune', '2026-09-12', NULL, 7500.00, 1112),
(1, 3200.00, 'CUST-108', 1012, 0.00, 'Thane', '2026-09-13', NULL, 640.00, 1113),
(1, 1800.00, 'CUST-109', 1011, 0.00, 'Nashik', '2026-09-14', NULL, 360.00, 1114),
(1, 2500.00, 'CUST-110', 1015, 0.00, 'Delhi', '2026-09-15', '2026-09-18', 500.00, 1115),
(1, 8500.00, 'CUST-111', 1010, 0.00, 'Nagpur', '2026-09-16', NULL, 1700.00, 1116),
(1, 1200.00, 'CUST-112', 1008, 0.00, 'Mumbai', '2026-09-17', NULL, 240.00, 1117),
(1, 2800.00, 'CUST-113', 1013, 0.00, 'Bengaluru', '2026-09-18', NULL, 560.00, 1118),
(1, 1600.00, 'CUST-114', 1016, 0.00, 'Pune', '2026-09-19', '2026-09-22', 320.00, 1119),
(1, 2500.00, 'CUST-115', 1015, 0.00, 'Hyderabad', '2026-09-20', NULL, 500.00, 1120);


SELECT * FROM CUSTOMER;
SELECT * FROM ORDERS;
SELECT * FROM PAYMENT;
SELECT * FROM PTODUCT;
SELECT * FROM SALES;

SELECT GENDER, COUNT(*)  AS TOTAL_CUSTOMER FROM CUSTOMER GROUP BY GENDER;

SELECT SUM(PROFIT) AS TOTAL_PROFIT FROM SALES;

SELECT ROUND(AVG(ANNUAL_INCOME),2) AS AVG_INCOME FROM CUSTOMER;

SELECT * FROM CUSTOMER WHERE ANNUAL_INCOME > 62466.67;

SELECT * FROM CUSTOMER WHERE EMAIL IS NULL;

SELECT *FROM CUSTOMER WHERE EMAIL IS NOT NULL;

SELECT SHIPPING_ADDRESS, COUNT(CUST_ID) AS TOTAL_CUSTOMER FROM ORDERS GROUP BY SHIPPING_ADDRESS;

SELECT * FROM ORDERS WHERE ORDER_STATUS = 'PENDING' OR ORDER_STATUS = 'ON THE WAY';

SELECT * FROM ORDERS WHERE ORDER_STATUS IN('PENDING','ON THE WAY');



-- LEVEL 1:BASICS
-- 1)DISPLAY ALL CUSTOMER DETAILS
SELECT * FROM CUSTOMER;
-- 2)FIND THE TOTAL NUMBER OF CUSTOMER REGISTERED IN THE DATABASE
SELECT COUNT(*)AS TOTAL_CUSTOMER FROM CUSTOMER;
-- 3)FIND CUSTOMER WHOSE ANNUAL INCOME IS GREATER THAN 75000
SELECT * FROM CUSTOMER WHERE ANNUAL_INCOME>75000;
-- 4)DISPLAY CUSTOMER WHOES FIRST NAME STARTS WITH LETTER 'A'
SELECT * FROM CUSTOMER WHERE FIRST_NAME LIKE 'A%';
-- 5)FIND CUSTOMER WHOSE EMAIL ADDRESS IS MISSING
SELECT * FROM CUSTOMER WHERE EMAIL IS NULL;
-- 6)DISPLAY ALL DISTINCT PRODECT CATEGORIES
SELECT DISTINCT CATEGORY FROM PRODUCT;
-- 7)FIND PRODUCT WITH A UNIT PRICE GREATER THAN 5000
SELECT *FROM PRODUCTS WHERE UNIT_PRICE>5000;
-- 8)DISPLEY THE FIVE MOST EXPENSIVE PRODUCTS;
SELECT * FROM PRODUCT ORDER BY UNIT_PRICE DESC LIMIT 5;
-- 9)FIND ALL ORDER WITH STATUS 'DELIVERED'
SELECT * FROM ORDERS WHERE ORDER_STATUS ="DELIVERED";
-- 10)DISPLAY ALL PAYMENT WITH STATUS 'FAILED'
SELECT * FROM PAYMENT WHERE PAYMENT_STATUS = 'FAILED';
-- 11)FIND SALES RECORDS EHERE THE DILEVRY DATE IS "NULL"
SELECT * FROM SALES WHERE DELIVERY_DATE IS NULL;
-- 12)DISPLAY ALL ORDER PLACED FOR CUSTOMER FROM MUMBAI
SELECT * FROM ORDERS WHERE SHIPPING_ADDRESS='MUMBAI';


-- LEVEL 2:SALES AND REVENUE ANALYSIS
-- 13)CALCULATE TOTAL REVENUE GENERATED BY BUSSINESS
SELECT SUM(QUANTITY*SALES) AS TOTAL_REVENUE FROM SALES;
-- 14)CALCULATE TOTAL PROFIT GENERATED BY BUSSINESS
SELECT SUM(PROFIT) AS TOTAL_PROFIT FROM SALES;
-- 15)FIND THE AVERAGE SALES AMOUNT PERSALES TRANSACTION
SELECT ROUND(AVG(SALES),2) AS AVERAGE_SALES FROM SALES;
-- 16)CALCULATE TOTAL QUANTITY OF PRODUCT SALES
SELECT SUM(QUANTITY) AS TOTAL_QUANTITY FROM SALES;
-- 17)FIND THE HIGHTEST AND LOWEST SALES AMOUNT
SELECT MAX(SALES) AS HIGHEST_SALES,
    MIN(SALES) AS LOWEST_SALES
FROM SALES;
-- 18)CALCULATE TOTAL REVENUE GENERATED BY EACH PRODUCT
SELECT PROD_ID,
       SUM(QUANTITY * SALES) AS TOTAL_REVENUE
FROM SALES
GROUP BY PROD_ID;
-- 19)FIND TOTAL SALES GENERATED BY EACH PRODUCT CATEGORY
SELECT P.CATEGORY,SUM(S.SALES) AS TOTAL_SALES
FROM PRODUCT AS P
JOIN SALES AS S
ON P.PROD_ID= S.PROD_ID
GROUP BY P.CATEGORY;
-- 20)IDENTIFY THE PRODUCT CATEGORYN GENERAITNG THE HIGHEST REVENUNE
SELECT P.CATEGORY,SUM(S.QUANTITY*S.SALES) AS TOTAL_REVENUE
FROM PRODUCT AS P
JOIN SALES AS S
ON P.PROD_ID= S.PROD_ID
GROUP BY P.CATEGORY
ORDER BY TOTAL_REVENUE DESC LIMIT 1;  
-- 21)FIND TOTAL REVENUE GENERATED BY EACH LOACTION
SELECT O.SHIPPING_ADDRESS,
SUM(S.QUANTITY * S.SALES) AS TOTAL_REVENUE
FROM ORDERS AS O
JOIN SALES AS S
ON O.ORDER_ID = S.ORDER_ID
GROUP BY O.SHIPPING_ADDRESS;
SELECT * FROM ORDERS;
SELECT * FROM SALES;

-- 22)CALCULATE TOTAL PROFIT GENERATED BY EACH LOCATION
SELECT O.SHIPPING_ADDRESS,SUM(S.PROFIT) AS TOTAL_PROFIT
FROM ORDERS AS O
JOIN SALES AS S
    ON O.ORDER_ID = S.ORDER_ID
GROUP BY O.SHIPPING_ADDRESS;
-- 23)find the number of orders in each order status
select order_status,count(*) AS AVERAGE_INCOME
FROM CUSTOMERS;
-- 24)find the average annual income of cusyomer
select round(avg(annual_income),2) as average_income;
-- 25)indentify product that have generated total sales greater than 10,000
select p.prod_name,sum(s.sales) as total_sales
from product p
join sales s
on p.prod_id=s.prod_id
group by p.prod_name
having total_sales >10000;

-- 26)find customers whose total sales exceed 5000
select c.first_name,c.last_name,sum(s.sales) as total_sales
from customer c
left join sales s
on c.cust_id = s.customer_id
group by c.first_name,c.last_name
having total_sales>5000;

select concat(coalesce(c.first_name," "),' ',coalesce(c.last_name,""))as full_name,sum(s.sales) as total_sales
from customer c
left join sales s
on c.cust_id = s.customer_id
group by full_name
having total_sales>5000;

-- 27)identify location where total revenue exceeds 10,000
select o.shipping_address, sum(s.sales*s.quantity)as total_revenue
from orderS AS O
left join sales s
on O.ORDER_ID = s.ORDER_id
group by o.shipping_address
having total_REVENUE>10000;
-- DISPLAY EACH CUSTOMER FULL NAME AND ANNUAL INCOME

select concat(coalesce(first_name," "),' ',coalesce(last_name,""))as full_name,ANNUAL_INCOME
from customer;

-- 29)FIND CUSTOMER WHO HAVE PLACED MORE THAN ONE ORDER
SELECT CUST_ID, COUNT(*)  AS TOTAL_ORDERS
FROM ORDERS
GROUP BY cust_id
HAVING TOTAL_ORDERS>1;

-- 30)identify customers who have never placed an order
select*from customer
where cust_id not in(select distinct cust_id from orders);


-- 31)find customer who have made purchase worth more than 10,000 in total
select customer_id,sum(sales)as total_sales
from sales 
group by customer_id
having total_sales>10000; 
-- 32)identify the customer who generated the highest total revenue
select customer_id, sum(sales*quantity)as total_revenue
from sales
group by customer_id
order by total_revenue desc limit 1;

select * from customer
where cust_id = (select customer_id
from sales
group by customer_id
order by sum(sales*quantity) desc limit 1);

-- 33)find number of orders placed by each customer

SELECT
    CUSTOMER_ID,
    COUNT(DISTINCT ORDER_ID) AS total_orders
FROM SALES
GROUP BY CUSTOMER_ID;

-- 34)calculate the average oder value for each customer
select customer_id, avg (sales) as average_order_value
from sales
group by customer_id;

-- 35)identify customers who cancelled order

SELECT CUST_ID,ORDER_ID,ORDER_STATUS
FROM ORDERS
WHERE ORDER_STATUS = 'Cancelled';

-- 36)find customer who have both delivered and cancelled orders
select cust_id,order_id,order_status
from orders
where order_status = "cancelled" or order_status = "delivered";

-- 37)identify customer who have not made any succesful payments
select cust_id,payment_status
from payment
join orders
on payment.order_id=orders.order_id
where 
payment_status="pending";

-- 38)Find customers with annual income greater than the average annual income of all customers.
select *from customer
where annual_income>(select avg(annual_income)from customer);

-- 39)identify th top three customer based on total sales
select concat (coalesce(first_name,"")," ",coalesce(last_name,""))as full_name,
sum(sales)as total_sales
from customer c
join sales s
on c.cust_id=s.customer_id
group by full_name
order by total_sales desc limit 3;

-- 40)find customer who purchase products from more  than one category
select concat (coalesce(first_name,"")," ",coalesce(last_name,""))as full_name,
count(order_id)as total_order,
count(category) as total_categories
from sales as s
join customer as c
on s.customer_id=c.cust_id
join product as p
on s.prod_id = p.prod_id
group by full_name
having total_categories > 1;

-- 41)display each product name , categories , unit price and total quantity sold
select prod_name,category,unit_price,sum(quantity) as total_quantity
from product as p
join sales as s
on p.prod_id = s.prod_id
group by prod_name;

-- 42)identify product that have never been sold
select prod_name ,sum(quantity) as total_quantity
from product as p
join sales as s
on p.prod_id = s.prod_id
group by prod_name
having total_quantity is null;

-- 43)find the most frequently sold product based in total_quantity
select prod_name,category,unit_price,sum(quantity) as total_quantity
from sales as p
join customer as s
on p.prod_id=s.prod_id
join sales as s
on p.prod_id = s.prod_id
group by prod_name
order by total_quantity desc limit  1;

-- 44)identify the product generting the highest total profit
SELECT p.prod_name,SUM(s.profit) AS total_profit
FROM product AS p
JOIN sales AS s
ON p.prod_id = s.prod_id
GROUP BY p.prod_id, p.prod_name
ORDER BY total_profit DESC
limit 1;

-- 45)find the product whose unit price greater than the average price of all product
SELECT prod_name, unit_price
FROM product
WHERE unit_price > (
SELECT AVG(unit_price)
FROM product
);

-- 46)calculate the revenue contribution of each product category as a percentage of total revenue
select category,round(sum(sales*quantity)/346300,2)*100 as revenue_percentage
from product as p
join sales as s
on p.prod_id = s.prod_id
group by category;

-- 47)find products that generate revenue below the average product reveneue
select prod_name,sum(sales*quantity)as total_revenue
from product as p
join sales as s
on p.prod_id=s.prod_id
group by prod_name
having total_revenue < (select avg(sales*quantity) from sales);

-- 48)identify the top three products based on total quantity sold
select prod_name,category,unit_price,sum(quantity) as total_quantity
from product as p
join sales as s
on p.prod_id=s.prod_id
group by prod_name
order by total_quantity desc limit  3;

-- 49) Compare each product's unit price with its average sales value per unit.
select prod_name,
p.category,
p.unit_price,
avg(sales*quantity) as avg_value_per_unit
from product as p
join sales as s
on p.prod_id = s.prod_id
group by p.prod_id , prod_name,
p.category,
p.unit_price;

-- 50) Find products that have sales but generate zero or negative profit.
select prod_name,sales,profit
from product as p
join sales as s
on p.prod_id=s.prod_id
where profit <= 0;
-- 51\. Find the total number of orders placed in September 2026.
select 'september 2026 orders',count(*) as total_orders
from payment
where payment_date between '2026-09-01'
and  '2026-10-01';

-- 52\. Calculate the number of orders that have been delivered.
select order_status ,count(*) as total_orders_deliverd
from orders
where order_status = 'delivered';
      
 --  53\. Calculate the number of orders that have been cancelled. 
 select order_status, count(*) as total_order_cancelled
 from orders
 where order_status = 'cancelled';
 
--  54\. Find the average delivery time in days for delivered sales.
select order_status,avg(delivery_date - order_date) as DID
from orders as o
join sales as s
on o.order_id = s.order_id
where order_status='delivered'
group by order_status;

-- 55\. Identify sales records with a delivery time exceeding three days
select * ,delivery_date-order_date as delivery_in_days
from sales
having delivery_in_days > 3;

-- 56\. Find orders that have not yet been delivered.
select * from orders
where order_status not in ('delivered','cancelled');

select * from orders;

-- 57\. Calculate the percentage of orders delivered successfully.
select order_status,round((count(*)/20 )*100,2) as total_orders
from orders
where order_status = 'delivered'
group by order_status;

-- 58\. Identify customers who have placed orders with different delivery locations.
select c.cust_id,c.first_name,c.last_name,count(distinct shipping_address)as total_locations
from customer as c
join orders as o
on c.cust_id = o.cust_id
group by c.cust_id
having total_locations>1;
select * from orders;

-- 59\. Find the daily revenue generated by the business.
select order_date,sum(sales*quantity) as total_revenue
from sales
group by order_date;

-- 60\. Identify the day with the highest sales revenue.
select order_date, sum(sales*quantity) as total_revenue
from sales
group by order_date
order by total_revenue desc limit 1;

-- 61\. Calculate the total payment amount received from completed payments.
select payment_status,sum(payment_amount)as total_amount
from payment
where payment_status='completed'
group by payment_status;

-- 62\. Find the total value of pending payments.
select payment_status,sum(payment_amount)as total_amount
from payment
where payment_status='pending'
group by payment_status;

-- 63\. Calculate the total amount refunded.
select payment_status,sum(payment_amount)as total_amount
from payment
where payment_status='refunded'
group by payment_status;

-- 64\. Find the number of payments made using each payment method.
select payment_method,count(payment_id) as total_payment
from payment
group by payment_method;

-- 65\. Identify the payment method generating the highest completed payment value.
select payment_method,sum(payment_amount) as total_amount
from payment
where payment_status='completed'
group by payment_method
order by total_amount desc limit 1;

-- 66\. Find orders that do not have any payment record.
select o.order_id,p.payment_status 
from orders as o
left join payment p
on o.order_id = p.order_id
where payment_id is null;
-- 67\. Identify orders where the payment status is 'Failed'.
select payment_status,sum(payment_amount)as total_amount
from payment
where payment_status='failed'
group by payment_status;

-- 68\. Compare total sales revenue with total completed payments.
select(select sum(sales*quantity) from sales) as total_revenue,
(select sum(payment_amount) as total_amount 
from payment
 where payment_status= 'completed') as total_completed_payments;

-- 69\. Calculate the success rate of payments.
select count(*) as total_transactions,
sum(case 
when payment_status='completed' then 1 else 0 end) as successful_transactions,
round(100*sum(case
when payment_status='completed' then 1 else 0 end) /nullif(count(*),0),2) as payment_success_rate
from payment;
-- 70\. Identify orders where the payment amount differs from the corresponding sales amount.
create view sales_by_order as 
select order_id,sum(sales) as total_sales 
from sales
group by order_id;

create view payment_by_order as
select order_id,sum(payment_amount) as total_amount
from payment
group by order_id;

select s.order_id,s.total_sales,p.total_amount
from sales_by_orders as s
join payment_by_order as p
on s.order_id=p.order_id
where s.total_sales<>p.total_amount;
with sales_total as (select
order_id, sum(sales) as total_sales
from sales
group by order_id),
payment_total as (select order_id,sum(payment_amount) as total_amount
from payment
group by order_id)
select s.order_id,s.total_sales,p.total_amount from sales_total as s
join payment_total as p
on s.order_id=p.order_id
where s.total_sales<> p.total_amount;

-- 71\. Rank products based on total revenue using `RANK()`.
select c.cust_id,first_name,last_name,sum(sales*quantity) as total_revenue,
rank() over (order by sum(sales*quantity)desc) as revenue_rank
from customer as c
join sales as s
on c.cust_id=s.customer_id
group by c.cust_id;
-- rank skios the value
-- 72\. Rank customers based on their total sales using `DENSE_RANK()`.
select c.cust_id,first_name,last_name,sum(sales) as total_sales,
dense_rank() over (order by sum(sales)desc) as revenue_rank
from customer as c
join sales as s
on c.cust_id=s.customer_id
group by c.cust_id;
-- dense dont skip the values
-- 73\. Calculate cumulative daily revenue using a window function.
select order_date,
sum(sales*quantity)over (order by order_date) as cumulative_revenue
from sales;

-- 74\. Calculate the month-to-date sales revenue.
select sum(sales) as MTD_revenue
from sales
where order_date >= date_format(curdate(),'%Y-%M-01')
and order_date<curdate() + interval 1 day;

-- 75\. Find each product's percentage contribution to total revenue.
create view prod_revenue as
select prod_name, sum(sales*quantity) as total_revenue
from sale as s
join product as p
on p.prod_id=s.prod_id
group by prod_name;

select prod_name, total_revenue,
round(total_revenue * 100/sum(total_revenue) over (),2) as revenue_percentage
from prod_revenue;

-- 76\. Identify customers whose total spending is above the average customer spending.
select * from customer
where cust_id in
(select cust_id from sales where sales >
(select avg(sales) from sales));

-- 77\. Find the second-highest-revenue product.


78\. Calculate the difference between each day's revenue and the previous day's revenue using `LAG()`.

79\. Identify the top-performing product in each category.

80\. Calculate the running total of profit ordered by sale date.