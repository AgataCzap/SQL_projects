-- lesson 6
USE SHOP;

SELECT * FROM shop.sales1;

-- create view
CREATE VIEW vw_salesmen
AS
SELECT SalesPerson, SalesAmount
FROM sales1;

SELECT *
FROM vw_salesmen;

-- only shows the selected column, interested who has the highest money earned from sales
-- view is a snapshot

-- you can query the view  in same way as a table, treat as a table
-- top performers, sold items > 70 
SELECT DISTINCT SalesPerson, Max(SalesAmount)
FROM vw_salesmen
WHERE SalesAmount > 70
GROUP BY SalesPerson;

-- same people, using max function to call out salesamount

SELECT DISTINCT SalesPerson, Max(SalesAmount)
FROM vw_salesmen
WHERE SalesAmount > 50
GROUP BY SalesPerson;

DROP DATABASE practice; 
CREATE DATABASE practice;

USE practice;

-- use the check option in view
CREATE TABLE practice.staff (
`employeeID` INT NOT NULL,
`firstname` VARCHAR(50) NOT NULL,
`lastname` VARCHAR(50) NOT NULL,
`jobtitle` VARCHAR(50) NOT NULL,
`managerID` INT NOT NULL,
`department` VARCHAR(50) NOT NULL,
`salary` INT(11) NOT NULL,
`dateofbirth` DATE NOT NULL,
PRIMARY KEY (`employeeID`));

INSERT INTO staff (
employeeID,
firstname,
lastname,
jobtitle,
managerID,
department,
salary,
dateofbirth)
VALUES(
    1245,
    'Julie',
    'Smith',
    'DBA',
    '3333',
    'Database Administrators',
    60000,
    '1985-10-20'
),
(
    4578,
    'Jame',
    'Blogs',
    'DBA',
    '3333',
    'Database Administrators',
    52000,
    '1970-10-22'
);

-- alter table query
ALTER TABLE practice.staff 
CHANGE COLUMN `salary` `money` INT(11) NULL DEFAULT 0 ,
CHANGE COLUMN `dateofbirth` `dateofbirth` DATE NULL DEFAULT '1900-01-01' ;

-- change column name to see modification
SELECT * FROM practice.staff;

-- SETTING DEFAULT VALUES AUTOMATICALLY FOR NEW ROWS
-- creating a new view setting

CREATE OR REPLACE VIEW vw_staff_common 
AS
SELECT	
		employeeID,
        firstname,
        lastname,
        jobtitle,
        managerID,
        department
	FROM
		staff
	WHERE
    jobtitle LIKE  '%DB%';
    
    
-- to see the view, look at it, don't forget to select it
    SELECT * FROM vw_staff_common;

-- insert some info into the view, dob and salary/money
-- add Mike, no salary info

INSERT INTO vw_staff_common (
    employeeID,
    firstName,
    lastName,
    jobtitle,
    managerID,
    department
) 
VALUES(
    8888,
    'Mike',
    'Davies',
    'DB Developer',
    2323,
    'Database Administrators'
);

SELECT * FROM vw_staff_common;

-- can't see the new person

CREATE OR REPLACE VIEW vw_staff_common2 AS
    SELECT 
        employeeID,
        firstName,
        lastName,
        jobtitle,
        managerID,
        department
    FROM
        staff
    WHERE
        jobtitle LIKE '%DB%' 
	WITH CHECK OPTION;
    
-- Again let's try to insert a row into the staff table through vw_staff_common2
INSERT INTO vw_staff_common2 (
    employeeID,
    firstName,
    lastName,
    jobtitle,
    managerID,
    department
)
VALUES(
    5555,
    'Thomas',
    'Fisher',
    'DB Developer',
    8989,
    'Database Administrators'
);

SELECT * FROM vw_staff_common2;

-- Mike is replaced by Thomas
-- job title didn't have DB initially so couldn't see themaccounts