/*1)what is total amount each customer spent on zomato*/
SELECT s.user_id,SUM(p.price) AS Total_Amount
FROM Sales s
JOIN Product p ON s.product_id=p.product_id
GROUP BY s.user_id;

/*2)how many days has each customer visited zomato*/
SELECT COUNT(DISTINCT created_at),user_id
FROM Sales
GROUP BY user_id;

/*3)What was the first product purchased by each customer*/
SELECT * FROM
(SELECT *,RANK()OVER(PARTITION BY user_id ORDER BY created_at)rnk FROM Sales) a WHERE rnk=1;

/*4)What is the most purchased item on the menu and how many times was it purchased by all customer*/
SELECT product_id,COUNT(product_id)AS total_product_count
FROM Sales
GROUP BY product_id
ORDER BY COUNT(product_id) DESC;

/*5)which item is the most popular for each customer:*/
SELECT * FROM
(SELECT *,RANK()OVER (PARTITION BY user_id ORDER BY total_product_count DESC)rnk FROM 
(SELECT user_id,product_id,COUNT(product_id)AS total_product_count
FROM Sales
GROUP BY user_id,product_id)A)B
WHERE rnk=1;

/*6)which customer became earliest golden customer and when*/
SELECT user_id,MIN(gold_signup_date)
FROM golden_signup
GROUP BY user_id;

/*7)What is total revenue generated by each product*/
SELECT p.product_id,p.product_name,COUNT(s.product_id),SUM(p.price) AS total_revenue
FROM sales s
JOIN Product p ON s.product_id=p.product_id
GROUP BY p.product_id,p.product_name;

/*8)Number of customer who didn't purchased anything*/
SELECT u.user_id
FROM Users u
LEFT JOIN Sales s ON s.user_id=u.user_id
WHERE s.user_id IS NULL;

/*9)Find customer who purchase all available products*/
SELECT user_id
FROM Sales
GROUP BY user_id
HAVING COUNT(DISTINCT product_id)=(SELECT COUNT(*) FROM Product);

/*10)Month wise sales trend*/
SELECT DATE_FORMAT(created_at,'%Y-%M')AS month,COUNT(*)AS total_orders
FROM Sales
GROUP BY month
ORDER BY month;