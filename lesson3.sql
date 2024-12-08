USE Bakery;

-- selecting rows based on ingredients, all items
SELECT * FROM savoury WHERE main_ingredient = 'beef';
SELECT * FROM savoury WHERE main_ingredient = 'pork';
-- best practice, table separately to make space for all tables
SELECT * FROM savoury 
WHERE main_ingredient = 'beef' OR main_ingredient = 'pork';

SELECT * FROM savoury sav
WHERE sav.main_ingredient = 'beef' OR sav.main_ingredient = 'pork';

SELECT sav.item_name FROM savoury sav
WHERE sav.main_ingredient IN ('pork', 'beef');

-- price 50 cents or less
SELECT * FROM sweet
WHERE price <= 0.5;

SELECT sw.item_name FROM sweet sw
WHERE sw.price <= 0.5;

-- all sweets except cannoli, <> IS ALSO !=
SELECT sw.item_name, sw.price FROM sweet sw
WHERE sw.item_name <> 'cannoli';

SELECT sw.item_name, sw.price FROM sweet sw
WHERE sw.item_name != 'cake';

-- all items starting with c
SELECT sw.item_name FROM sweet sw
WHERE sw.item_name LIKE 'c%';

SELECT sw.item_name, sw.price FROM sweet sw
WHERE sw.price > 1 and sw.price < 3.0;

SELECT sav.item_name FROM savoury sav
WHERE sav.price BETWEEN 1 and 3;

USE SHOP;

-- select all sales from London
SELECT * from SALES1 where Store = 'London';

-- not in December
SELECT * from SALES1 where Store = 'London' AND Month != 'Dec';
SELECT * from SALES1 where Store = 'London' AND Month <> 'Dec';

-- sales concluded by bill or frank
SELECT * from SALES1 where Store = 'London' AND Month <> 'Dec' AND (SalesPerson = 'Bill' OR SalesPerson =  'Frank');
-- can use brackets to include the OR statement

-- >50, split all different conditions, easy to read
SELECT * from SALES1 where Store = 'London' 
AND Month <> 'Dec' 
AND (SalesPerson = 'Bill' 
OR SalesPerson =  'Frank');

-- greater than 50, keep using AND statements
SELECT * from SALES1 where Store = 'London' 
AND Month <> 'Dec' 
AND (SalesPerson = 'Bill' 
OR SalesPerson =  'Frank')
AND SalesAmount >50.00;

-- how many sales took each week in any order, * COUNT ALL, AGGREGATE OPERATOR
-- gives error, need to group by
SELECT Week, COUNT(*) FROM SALES1;
SELECT Week, COUNT(*) FROM SALES1 GROUP BY Week;

-- counts number of rows
SELECT COUNT(*) FROM SALES1;

-- how many sales but in ascending and descending order
SELECT Week, COUNT(*) FROM SALES1 GROUP BY Week ORDER BY Week;
-- need to specify descending order
SELECT Week, COUNT(*) FROM SALES1 GROUP BY Week ORDER BY Week DESC;

-- sales on different days of the week, can group and order by >1 column
SELECT Week, Day, COUNT(*) FROM SALES1 GROUP BY Week, Day ORDER BY Week, Day;

SELECT Week, Day, COUNT(Week) FROM SALES1 GROUP BY Week, Day ORDER BY Week, Day;
SELECT Week, Day, COUNT(Week) as 'NUM_sales' FROM SALES1 GROUP BY Week, Day ORDER BY Week, Day;
-- specified new column name

-- how many sales Inga did
SELECT * FROM SALES1 WHERE SalesPerson = 'Inga';
-- change her name, use update statement, update data, no changes happening when table is updated
-- activate safe mode to update, avoid data mismatch and consistency
SET SQL_SAFE_UPDATES = 0;

-- WRITE UPDATE QUERY, SIMILAR INSERT
UPDATE SALES1 SET SalesPerson = 'Annette' WHERE SalesPerson = 'Inga';
-- CRUD CREATE READ UPDATE DELETE, DONT TURN OFF SAFE MODE

SELECT * FROM SALES1 WHERE SalesPerson = 'Annette';

-- total sales by each person by day, use sum to calculate total amount
Select SalesPerson, Day, SUM(SalesAmount) as 'totalSales' FROM SALES1 Group By SalesPerson, Day;
Select SalesPerson, Day, SUM(SalesAmount) as 'totalSales' FROM SALES1 Group By SalesPerson, Day Order by SalesPerson, Day;

-- min and max works the same as sum and count