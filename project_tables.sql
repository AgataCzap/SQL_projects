CREATE DATABASE BOOKSTORE;

USE BOOKSTORE;

DROP TABLE bank_info;
DROP TABLE Orders;

CREATE TABLE bank_info(
CUSTOMER_ID VARCHAR(50) NOT NULL,
ACCOUNT_ID INT NOT NULL,
FIRST_NAME VARCHAR(50) NOT NULL,
LAST_NAME VARCHAR(50) NOT NULL,
BANK_NAME VARCHAR(50) NOT NULL,
BALANCE INT NOT NULL, 
CONSTRAINT bank_info PRIMARY KEY (ACCOUNT_ID));

INSERT INTO bank_info
(CUSTOMER_ID, ACCOUNT_ID, FIRST_NAME, LAST_NAME, BANK_NAME, BALANCE)
VALUES
('C1', 111333, 'John', 'Johnson', 'NatWest', -20),
('C2', 111528, 'Ada', 'Lovelace', 'Barclays', 1000),
('C3', 200666, 'Catherine', 'Smith', 'Royal Bank of Scotland', 40),
('C4', 348750, 'Alexis', 'Yu', 'Barclays', 200),
('C5', 555555, 'Adam', 'Williams', 'NatWest', 500),
('C6', 661666, 'Dude', 'Lebowski', 'Royal Bank of Scotland', 10),
('C7', 535177, 'Emily', 'Thomas', 'Barclays', 5000);

SELECT * FROM bank_info;

CREATE TABLE Orders(
ORDER_ID VARCHAR(50) NOT NULL,
BOOK_ID VARCHAR(50) NOT NULL,
BOOK_TITLE VARCHAR(5000) NOT NULL,
PRICE FLOAT(4) NOT NULL,
CUSTOMER_ID VARCHAR(50) NOT NULL,
CUSTOMER_NAME VARCHAR(50) NOT NULL,
CUSTOMER_SURNAME VARCHAR(50) NOT NULL,
CONSTRAINT Orders PRIMARY KEY (ORDER_ID));

ALTER TABLE Orders ADD CUSTOMER_SURNAME VARCHAR(50) NOT NULL AFTER CUSTOMER_NAME;

INSERT INTO Orders
(ORDER_ID, BOOK_ID, BOOK_TITLE, PRICE, CUSTOMER_ID, CUSTOMER_NAME, CUSTOMER_SURNAME)
VALUES
('O1', 'B1', "SQL: Database Fundamentals & Essentials", 50.00, 'C2', 'Ada', 'Lovelace'),
('O2', 'B5', "The Fall of Numenor: And Other Tales from the Second Age of Middle-Earth", 25.00, 'C5', 'Adam', 'Williams'),
('O3', 'B7', "Surrender", 20.00, 'C4',  'Alexis', 'Yu'),
('O4', 'B2', "God Killer", 16.99, 'C6', 'Dude', 'Lebowski'),
('O5', 'B3', "The Body Illustrated", 30.00, 'C1', 'John', 'Johnson');

SELECT * FROM Orders;

-- testing joining orders and bank info

/* INNER JOIN */
SELECT t1.*, t2.*
FROM
    Orders t1
        INNER JOIN
    bank_info t2
		ON 
        t1.CUSTOMER_ID = t2.CUSTOMER_ID;
        
SELECT 
    t1.BOOK_TITLE AS BOOK_NAME,
    t1.PRICE AS BOOK_PRICE,
    t2.FIRST_NAME AS CUSTOMER_NAME,
    t2.LAST_NAME AS CUSTOMER_SURNAME,
    t2.BALANCE AS BALANCE
FROM
    Orders t1
        INNER JOIN
    bank_info t2 
		ON 
        t1.CUSTOMER_ID = t2.CUSTOMER_ID;