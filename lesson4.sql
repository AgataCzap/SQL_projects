use customers;

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(55),
    ManagerID INT
);

-- Insert Sample Data
INSERT INTO Employee
(EmployeeID, Name, ManagerID)
VALUES
(1, 'Mike', 3),
(2, 'David', 3),
(3, 'Roger', NULL),
(4, 'Marry',2),
(5, 'Joseph',2),
(7, 'Ben',2);


SELECT e.first_name, e.last_name, e.salary,
  d.name as department_name
FROM employees   AS e
JOIN departments AS d ON e.department_id = d.id;

-- create tables for join syntax

CREATE DATABASE JOINS_PRACTICE;

USE JOINS_PRACTICE;

-- creating table
CREATE TABLE Table1_fruit_basket
(ID INT,
Fruit VARCHAR(50));

INSERT INTO Table1_fruit_basket
(ID, Fruit)
VALUES
(1,  'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');

CREATE TABLE Table2_fruit_basket
(ID INT,
Fruit VARCHAR(50));

INSERT INTO Table2_fruit_basket
(ID, Fruit)
VALUES
(1,  'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');

-- always reduce number in varchar for DB to take less space, use smallest possible

-- use the joining syntax
SELECT *
FROM Table1_fruit_basket;
SELECT *
FROM Table2_fruit_basket;

-- always write queries in capitals, easier to see and for SQL to work with

-- inner join
SELECT t1.*, t2.*
FROM Table1_fruit_basket t1
INNER JOIN
Table2_fruit_basket t2
ON
t1.ID = t2.ID;

SELECT
t1.ID as T1ID,
t1.Fruit as T1FRUIT,
t2.ID as T2ID,
t2.Fruit as T2FRUIT
FROM 
Table1_fruit_basket t1
INNER JOIN
Table2_fruit_basket t2
ON
t1.ID = t2.ID;

-- left join

SELECT t1.*, t2.*
FROM Table1_fruit_basket t1
LEFT JOIN
Table2_fruit_basket t2
ON
t1.ID = t2.ID;

-- right join

SELECT t1.*, t2.*
FROM Table1_fruit_basket t1
RIGHT JOIN
Table2_fruit_basket t2
ON
t1.ID = t2.ID;


-- /* OUTER JOIN */
-- -- Throws an error !!!!!!!!
-- SELECT 
 --	t1.*,t2.*
-- FROM 
 	-- Table1_fruit_basket t1
-- FULL OUTER JOIN 
 	-- Table2_fruit_basket t2 
 		-- ON 
        --  t1.ID = t2.ID;
         
-- union join, emulates full outer join
SELECT * FROM 
Table1_fruit_basket t1
LEFT JOIN 
Table2_fruit_basket t2 
	ON t1.ID = t2.ID

UNION

SELECT * FROM 
Table1_fruit_basket t1
RIGHT JOIN 
Table2_fruit_basket t2 
	ON t1.id = t2.id;
    
-- left join where NULL -- gives only NULL values
SELECT t1.*, t2.*
FROM
Table1_fruit_basket t1
LEFT JOIN
Table2_fruit_basket t2
ON t1.ID = t2.ID
WHERE
t2.ID IS NULL;

DROP TABLE T1_fruit_basket;
DROP TABLE T2_fruit_basket;

-- cross join
SELECT t1.*, t2.*
FROM
Table1_fruit_basket t1
CROSS JOIN
Table2_fruit_basket t2;

-- Clean up (optional)
DROP TABLE Table1_fruit_basket;
DROP TABLE Table2_fruit_basket;


SELECT * 
FROM Employee;

-- inner join

SELECT
e1.Name EmployeeName,
e2.name as ManagerName
FROM Employee e1
INNER JOIN
Employee e2
ON 
e1.ManagerID = e2.EmployeeID;

-- outer join

SELECT
e1.Name EmployeeName,
e2.name as ManagerName
FROM Employee e1
LEFT JOIN
Employee e2
ON 
e1.ManagerID = e2.EmployeeID;

DROP TABLE Employee;

-- union operators
USE JOINS_PRACTICE;

-- union all
SELECT
t1.ID as T1ID,
t1.Fruit as T1FRUIT
From Table1_fruit_basket t1

UNION ALL

SELECT
t2.ID as T2ID,
t2.Fruit as T2FRUIT
From Table2_fruit_basket t2;


-- duplicated rows, no total, inefficient

-- union, similar
SELECT
t1.ID as T1ID,
t1.Fruit as T1FRUIT
From Table1_fruit_basket t1

UNION

SELECT
t2.ID as T2ID,
t2.Fruit as T2FRUIT
From Table2_fruit_basket t2;

-- data is ordered, combined into one table

-- subquery
USE customers;

SELECT
first_name, last_name
FROM
customers.customer c
WHERE
c.customer_id IN (SELECT
ph.phone_number_customer_id
FROM
customers.phone_number ph
WHERE
ph.phone_number = '555-3344');

-- fetches data based on subsquery, used aliases