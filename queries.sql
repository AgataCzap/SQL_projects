USE BOOKSTORE;


-- create view using a join across multiple tables
CREATE VIEW checking_orders AS
SELECT
t1.customer_ID as Customer_ID,
t1.PRICE as price, 
t2.customer_name as Name,
t2.customer_surname as Surname,
t3.book_id AS book_ID,
t3.BOOK_TITLE AS Book
FROM Orders t1
CROSS JOIN books t3 ON t1.BOOK_ID = t3.book_id
CROSS JOIN customer_info t2 
ON t1.customer_ID = t2.customer_ID;

SELECT * FROM checking_orders;
DROP VIEW checking_orders;

-- create a query with subquery to extract information

-- looking for all customers that ordered books with price > 20

SELECT
customer_name, customer_surname
FROM
customer_info
WHERE
customer_ID IN (SELECT
	customer_ID
    FROM
    Orders
	WHERE
	Book_ID IN (SELECT 
				Book_ID
                FROM
				Orders
                WHERE
                    PRICE > 20));
                    
-- find all customers with monthly subscriptions who purchased an order

SELECT t1.customer_ID, t1.price, t2.customer_name, t2.customer_surname, t3.Membership_type
FROM Orders t1, customer_info t2, MEMBERSHIP_DETAILS t3
WHERE t1.customer_ID = t2.customer_ID AND t1.customer_ID = t3.customer_ID AND Membership_type =  'Monthly';

-- create a function
-- function to deduct order price from balance (money for purchasing books) 
-- to simulate transactions, anything that is higher than customer’s balance will not be deducted
DELIMITER //
CREATE FUNCTION purchasing_orders(
balance FLOAT(4), PRICE FLOAT(4))
RETURNS FLOAT(4)
DETERMINISTIC
BEGIN
	DECLARE NEW_BALANCE FLOAT(4);
    IF balance > PRICE THEN
        SET NEW_BALANCE = balance - PRICE ;
ELSEIF balance < PRICE THEN
        SET NEW_BALANCE = balance;
	END IF;
    RETURN (NEW_BALANCE);
END//balance
DELIMITER ;

select * from customer_bank_details;

SELECT
	t1.customer_ID,
    t1.balance,
    t2.price,
    purchasing_orders(t1.balance, t2.price) AS New_Balance
FROM
    customer_bank_details t1, Orders t2
    WHERE t1.customer_ID = t2.customer_ID;


-- create group by statement that can be used in an analysis that demonstrates how data is extracted

-- for marketing purposes I want to check how much I've earned from every location, purchases, subscriptions and then total
-- for marketing purposes I want to check how much I've earned from every location, purchases, subscriptions and then total

-- first I have to update Membership_details table by adding the cost of every membership type for the subscription


ALTER TABLE MEMBERSHIP_DETAILS
ADD Membership_price float(4);

SET SQL_SAFE_UPDATES = 0;

UPDATE MEMBERSHIP_DETAILS
SET Membership_price = 50.00
WHERE Membership_type = 'Annual';

UPDATE MEMBERSHIP_DETAILS
SET Membership_price = 20.00
WHERE Membership_type = 'Monthly';

UPDATE MEMBERSHIP_DETAILS
SET Membership_price = 30.00
WHERE Membership_type = 'Quarterly';

SET SQL_SAFE_UPDATES = 1;

-- check updates worked
SELECT * FROM MEMBERSHIP_DETAILS;

-- now use a group by statement
-- need to switch off the full group by otherwise get error 1055
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT
t1.customer_town,
SUM(t2.PRICE) AS PURCHASES,
SUM(t3.Membership_price) AS SUBSCRIPTIONS,	
t3.Membership_type,
SUM(t3.Membership_price + t2.PRICE) AS TOTAL_PROFIT
FROM customer_info t1, Orders t2, MEMBERSHIP_DETAILS t3
WHERE t1.customer_ID = t2.customer_ID AND t1.customer_ID = t3.customer_ID
GROUP BY t1.customer_town;

-- create view with 3-4 tables that can be used in a query
CREATE VIEW total_cost_with_physical_newsletter AS
SELECT
t1.customer_ID AS customer_ID,
t1.PRICE AS books_price,
t1.Delivery_option AS book_delivery,
t2.Membership_price AS Membership_price,
t3.postage_cost AS newsl_post_cost,
t3.delivery_mode AS delivery_mode,
t3.postage_cost + t1.PRICE + t2.Membership_price AS Total_cost
FROM Orders t1, MEMBERSHIP_DETAILS t2, newsletter t3
WHERE t3.delivery_mode = 'post';

SELECT * FROM total_cost_with_physical_newsletter;
DROP VIEW total_cost_with_physical_newsletter;

CREATE VIEW total_cost_with_physical_newsletter2 AS
SELECT
t1.customer_ID AS customer_ID,
t1.PRICE AS books_price,
t1.Delivery_option AS book_delivery,
t2.Membership_price AS Membership_price,
t3.postage_cost AS newsl_post_cost,
t3.delivery_mode AS delivery_mode,
t3.postage_cost + t1.PRICE + t2.Membership_price AS Total_cost
FROM Orders t1, MEMBERSHIP_DETAILS t2, newsletter t3
WHERE t3.delivery_mode = 'post' AND t1.Delivery_option = 'Royal Mail';

SELECT * FROM total_cost_with_physical_newsletter2;
DROP VIEW total_cost_with_physical_newsletter2;



-- Tyler's idea:

CREATE VIEW customer_status AS
SELECT
t1.customer_ID as Customer_ID,
t1.membership_ID as membership_ID,
t1.customer_name as Name,
t2.membership_type as membership_type,
t3.newsletter_type AS newsletter_type,
t3.delivery_mode AS delivery
from customer_info t1, MEMBERSHIP_DETAILS t2, newsletter t3
where membership_type = 'Annual';

SELECT * FROM customer_status;
DROP VIEW customer_status;

-- create an event - the code is correct but nothing happens

-- first join customer_bank_details and membership_details to create a new summary table
DROP TABLE MEMBERSHIP;

CREATE TABLE MEMBERSHIP AS(
SELECT
t1.customer_ID, t1.balance, t2.membership_type
FROM customer_bank_details t1
RIGHT JOIN
MEMBERSHIP_DETAILS t2
ON t1.customer_ID = t2.customer_ID);

ALTER TABLE MEMBERSHIP
	ADD CONSTRAINT membership PRIMARY KEY (customer_ID),
	ADD FOREIGN KEY (customer_ID) REFERENCES customer_info(customer_id);


SET GLOBAL event_scheduler = ON;

DELIMITER //

CREATE EVENT membership_payments_yearly
ON SCHEDULE AT NOW() + 1 QUARTER
DO 
	UPDATE MEMBERSHIP SET balance=balance - 50
    WHERE membership_type = 'Annual';

-- Change Delimiter
DELIMITER ;

select * from MEMBERSHIP;

drop event  membership_payments_yearly;

DELIMITER //

CREATE EVENT membership_payments_monthly
ON SCHEDULE AT NOW() + INTERVAL 1 MONTH
DO 
	UPDATE MEMBERSHIP SET balance=balance - 18
    WHERE membership_type = 'Monthly';

-- Change Delimiter
DELIMITER ;

DELIMITER //

CREATE EVENT membership_payments_quaterly
ON SCHEDULE AT NOW() + 1 QUARTER
DO 
	UPDATE MEMBERSHIP SET balance=balance - 30
    WHERE membership_type = 'Quaterly';

-- Change Delimiter
DELIMITER ;

SELECT * FROM MEMBERSHIP;

DROP EVENT membership_payments_quaterly;
DROP EVENT membership_payments_monthly;

