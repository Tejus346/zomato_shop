CREATE DATABASE Zomato_Shop;
USE Zomato_Shop;

CREATE TABLE Users(user_id INT PRIMARY KEY,Signup_date DATE);
INSERT INTO Users VALUES(1,'2014-04-21');
INSERT INTO Users VALUES(2,'2015-04-01');
INSERT INTO Users VALUES(3,'2014-11-04');

CREATE TABLE Product(product_id INT PRIMARY KEY,product_name VARCHAR(50),price NUMERIC(10,2));
INSERT INTO Product VALUES(1,'p1',580);
INSERT INTO Product VALUES(2,'p2',820);
INSERT INTO Product VALUES(3,'p3',350);

CREATE TABLE Golden_Signup(user_id INT REFERENCES Users(user_id),gold_signup_date DATE);
INSERT INTO Golden_Signup VALUES(1,'2017-09-22');
INSERT INTO Golden_Signup VALUES(1,'2017-04-21');
INSERT INTO Golden_Signup VALUES(2,'2016-10-15');
INSERT INTO Golden_Signup VALUES(2,'2017-07-20');
INSERT INTO Golden_Signup VALUES(3,'2018-08-25');

CREATE TABLE Sales(user_id INT REFERENCES Users(user_id),created_at DATE,product_id INT REFERENCES Product(product_id));
INSERT INTO Sales(user_id,created_at,product_id) VALUES(1,'2017-04-19',2),
(3,'2019-12-18',1),
(2,'2020-07-20',3),
(1,'2019-10-23',2),
(1,'2018-03-19',3),
(3,'2017-04-24',2),
(2,'2016-12-03',1),
(3,'2018-11-23',2),
(2,'2019-09-07',3);

SELECT * FROM Sales;
SELECT * FROM Users;
SELECT * FROM Product;
SELECT * FROM Golden_Signup;


