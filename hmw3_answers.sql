-- Find the total sales amount by each person by day

SELECT salesperson, Day, SUM(salesamount) as 'salesamount' FROM Sales1 GROUP BY salesperson, day ORDER BY day;

-- How much (sum) each person sold for the given period

SELECT s.salesperson, SUM(s.salesamount) FROM Sales1 s GROUP BY s.salesperson ORDER BY s.salesperson;

-- How much (sum) each person sold for the given period, including the number of sales per person, their average, lowest and highest sale amounts

SELECT s.salesperson, SUM(s.salesamount), COUNT(s.salesperson), AVG(s.salesamount), MIN(s.salesamount), MAX(s.salesamount)  FROM Sales1 s GROUP BY s.salesperson ORDER BY s.salesperson;

-- Find the total monetary sales amount achieved by each store

SELECT s.store, SUM(s.salesamount) FROM Sales1 s GROUP BY s.store ORDER BY s.store;

-- Find the number of sales by each person if they did less than 3 sales for the past period

SELECT s.salesperson, COUNT(s.salesperson) FROM Sales1 s GROUP BY s.salesperson HAVING COUNT(s.salesperson)<3;

-- Find the total amount of sales by month where combined total is less than £100
SELECT s.month, SUM(s.salesamount) FROM Sales1 s GROUP BY s.month HAVING SUM(s.salesamount)<100;