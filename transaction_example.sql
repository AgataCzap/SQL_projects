 -- TRANSACTIONS
 
 -- transfer £50 into account, first take money from an account
 -- 1. check balance, if >50 then send it over
 -- 2. deduct 50 from my account
 -- 3. add 50 to the desired owner's account
 
-- create bank
CREATE DATABASE bank;

USE bank;

-- drop table accounts; 

CREATE TABLE accounts(
account_number INT NOT NULL PRIMARY KEY,
account_holder_name VARCHAR(50),
account_holder_surname VARCHAR(50),	
balance float,
overdraft_allowed BOOLEAN);

insert into accounts
(account_number, account_holder_name, account_holder_surname, balance, overdraft_allowed)
VALUES
(111112, 'Julie', 'Smith', 150, true),
(111113, 'James', 'Andrews', 20, false),
(111114, 'Jack', 'Oakes', -70, true),
(111115, 'Jasper', 'Wolf', 200, true);

SELECT * FROM accounts;

-- transactions transfer 50 pounds 
START TRANSACTION;

-- selecting variable, assigning value using :=
-- check if balance > 50, return balance, if not then return 0


SELECT IF(balance > 50, balance, 0) AS MONEY
FROM
	bank.accounts
WHERE
	account_number = 111112
		AND account_holder_surname = 'Smith';
        
SET @Transferamount = 50;

-- set variable to hold the amount required
-- then deduct from the balance
-- need to specify var that uses key column
UPDATE accounts
SET
	balance = balance - 50
WHERE
	account_number = 111112
		AND account_holder_surname = 'Smith';
        
UPDATE accounts
SET 
	balance = balance + 50
WHERE
	account_number = 111115
		AND account_holder_surname = 'Wolf';
        
SELECT * FROM accounts;
        
-- need to set commit

COMMIT;	

-- always set primary key otherwise get an error, especially for transactions, unique variable is always required
-- even if you are using a single table
        



