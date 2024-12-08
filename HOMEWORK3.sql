USE SHOP;

-- 1. HOW MUCH EACH PERSON SOLD PER PERIOD - we did day and week in lesson, so I did per month here

Select SalesPerson, Month, 
SUM(SalesAmount) as 'totalSales' 
FROM SALES1 
Group By SalesPerson, Month;

-- 2. total sales, average, min and max sales per person per period 
-- Month
Select SalesPerson, Month, 
SUM(SalesAmount) as 'totalSales',
COUNT(*) as 'NumberofSales',
MAX(SalesAmount) as 'MaxSales',
MIN(SalesAmount) as 'MinSales',
AVG(SalesAmount) as 'AverageSales'
FROM SALES1 
Group By SalesPerson, Month;

-- Day
Select SalesPerson, Day, 
SUM(SalesAmount) as 'totalSales',
COUNT(*) as 'NumberofSales',
MAX(SalesAmount) as 'MaxSales',
MIN(SalesAmount) as 'MinSales'
FROM SALES1 
Group By SalesPerson, Day;

-- Week
Select SalesPerson, Week, 
SUM(SalesAmount) as 'totalSales',
COUNT(*) as 'NumberofSales',
MAX(SalesAmount) as 'MaxSales',
MIN(SalesAmount) as 'MinSales'
FROM SALES1 
Group By SalesPerson, Week;

-- 3. Total sales per store
Select Store,
SUM(SalesAmount) as 'totalSales'
FROM SALES1
Group by Store;

-- 4. Number of sales per person if they did less than 3 sales
SELECT SalesPerson,
COUNT(SalesAmount) as 'NumberofSales'
FROM SALES1
GROUP BY SalesPerson
HAVING COUNT(SalesAmount) <3
ORDER BY SalesPerson;

-- CHECK OVERALL NUMBERS
SELECT SalesPerson,
COUNT(SalesAmount) as 'NumberofSales'
FROM SALES1
GROUP BY SalesPerson;

-- 5. total number of sales per month where sales < 100
Select SalesPerson,  Month,
SUM(SalesAmount) as 'TotalSales'
FROM SALES1
GROUP BY SalesPerson, Month
HAVING SUM(SalesAmount) < 100
ORDER BY SalesPerson, Month;
