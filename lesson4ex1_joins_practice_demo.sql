CREATE DATABASE JOINS_PRACTICE;

USE JOINS_PRACTICE;

-- Create table 1
CREATE TABLE Table1_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table1_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(4, 'orange'),
(5, 'banana');


-- Create table 2
CREATE TABLE Table2_fruit_basket
(ID INT, Fruit VARCHAR(50));
INSERT INTO Table2_fruit_basket 
(ID, Fruit)
VALUES
(1, 'pear'),
(2, 'apple'),
(3, 'kiwi'),
(6, 'melon'),
(7, 'peach'),
(8, 'plum');


SELECT *
FROM Table1_fruit_basket;
SELECT *
FROM Table2_fruit_basket;


/* INNER JOIN */
SELECT 
    t1.*, t2.*
FROM
    Table1_fruit_basket t1
        INNER JOIN
    Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;


/* INNER JOIN */
SELECT 
    t1.ID AS T1ID,
    t1.Fruit AS T1Fruit,
    t2.ID AS T2ID,
    t2.Fruit AS T2Fruit
FROM
    Table1_fruit_basket t1
        INNER JOIN
    Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;

/* LEFT JOIN */
SELECT 
    t1.*, t2.*
FROM
    Table1_fruit_basket t1
        LEFT JOIN
    Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;

/* RIGHT JOIN */
SELECT 
    t1.*, t2.*
FROM
    Table1_fruit_basket t1
        RIGHT JOIN
    Table2_fruit_basket t2 
		ON 
        t1.ID = t2.ID;

-- /* OUTER JOIN */
-- -- Throws an error !!!!!!!!
-- SELECT 
-- 	t1.*,t2.*
-- FROM 
-- 	Table1_fruit_basket t1
-- 	FULL OUTER JOIN 
-- 	Table2_fruit_basket t2 
-- 		ON 
--         t1.ID = t2.ID;
        
-- You can emulate FULL OUTER JOIN using UNION with two tables t1, t2:

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




/* LEFT JOIN - WHERE NULL */
SELECT  t1.*, t2.*
FROM
    Table1_fruit_basket t1
	LEFT JOIN
    Table2_fruit_basket t2 ON t1.ID = t2.ID
WHERE
    t2.ID IS NULL;


-- PRACTICE DEMO CONTINUES

/* CROSS JOIN */
SELECT t1.*,t2.*
FROM Table1_fruit_basket t1
CROSS JOIN Table2_fruit_basket t2;

-- Clean up (optional)
DROP TABLE Table1_fruit_basket;
DROP TABLE Table2_fruit_basket;