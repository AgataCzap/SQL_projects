-- Practice exercise and example page 20 --

use joins_practice;

-- USE THE SAME FRUIT TABLES THAT WE PRACTICED WITH FOR JOINS

/* UNION ALL */
SELECT t1.ID AS T1ID, t1.Fruit AS T1Fruit
FROM Table1_fruit_basket t1
UNION ALL
SELECT  t2.ID AS T2ID, t2.Fruit AS T2Fruit
FROM Table2_fruit_basket t2;

/* UNION */
SELECT t1.ID AS T1ID, t1.Fruit AS T1Fruit
FROM Table1_fruit_basket t1
UNION
SELECT  t2.ID AS T2ID, t2.Fruit AS T2Fruit
FROM Table2_fruit_basket t2;