-- 2019 - 08 - 10 14:47:22 - will be a string when you enter it
-- function to convert

SELECT convert('2019-08-10 14:47:22', DATE);
-- appears converted at the bottom
SELECT convert('2019-08-10 14:47:30', DATE);

-- remember that there are 60s in a minute! 88 has given NULL result
-- TIME DATA TYPE, function comes within (), attributes that have to be specified
-- if nothing specified get error, convert requires 2 inputs
SELECT convert('144722', TIME);
-- one parameter enabled in the function

-- datetime another data type that can hold both
SELECT convert('2019-08-10 14:47:22', DATETIME);
-- ASSIGN TO A COLUMN
SELECT convert('2019-08-10 14:47:22', DATETIME) AS DATEnTIME;

-- decimal(number of decimal points) - 4 - total number of digits, 2 - number od decial places
SELECT convert('11.12',DECIMAL(4,2)) AS DEC1;

SELECT convert('11.14562',DECIMAL(4,2)) AS DEC1;

-- if 3 decimal points, increase the number of digits to 5
SELECT convert('11.124563',DECIMAL(5,3)) AS DEC1;

-- adding a date, ADDDATE() OR DATE_ADD() - ADD TIME VALUES (INTERVALS) TO A DATE VALUE
SELECT adddate('2020-01-01', INTERVAL 15 DAY);
-- ADDED 15 DAY INTERVAL TO THE DATE VALUE
SELECT date_add('2020-01-01', INTERVAL 15 DAY);

-- subtract days
SELECT subdate('2020-01-01', INTERVAL 15 DAY);
SELECT date_sub('2020-01-01', INTERVAL 15 DAY);

-- return the current date, NO PARAMETER
SELECT curdate();
SELECT CURRENT_DATE();

-- USED IN MANY PLACES, current_date(), CURRENT_DATE(), multiple functions that do the same thibng
-- community that finalises the function names

SELECT CURRENT_TIME();
SELECT NOW(), current_time();

SELECT NOW(),
	DATE(NOW()),
    TIME(NOW()),
    YEAR(NOW()),
    WEEK(NOW()),
    DAY(NOW()),
    DAYNAME(NOW()),
    HOUR(NOW()),
    MINUTE(NOW()),
    SECOND(NOW());
    
-- USING FUNCTION WITHIN ANOTHER FUNCTION, NO NEED FOR INPUT
-- date format, in any way 
-- converts into day, month, year
SELECT DATE_FORMAT('2020-10-05 11:22:00', '%W %M %Y');
-- day number, month, year and time, check w3 school on date format, all functions
SELECT DATE_FORMAT('2020-10-05 11:22:00', '%d %b %Y %T:%f');

-- check all SQL functions on W3 school

-- example of case operator
SET @VAR = 1; -- assigning variables with @

-- change VARIABLE/VAR value based on conditions
-- python switchcase function

SELECT 
	CASE @Var 
		WHEN 1 THEN 'one'
		WHEN 2 THEN 'two'
		ELSE 'higher than 2'
	END AS TheNumberIs;


-- takes the value of 5 (var), checking if the number meets the first 2 conditions
-- if both cases are False, goes to the else statement, return in an assigned column
-- use operators in different ways
-- no return name of column
SELECT 
	CASE @Var 
		WHEN 1 THEN 'one'
		WHEN 2 THEN 'two'
		ELSE 'higher than 2'
	END;
    
    
-- var can be boolean, string, date and other data types 
SET @Var = 'z';

SELECT 
	CASE @Var 
		WHEN 'a' THEN 'one'
		WHEN 'b' THEN 'two'
		ELSE 'higher than 2'
	END;
    
-- if functions

SELECT IF(1<2, 2, 3);
SELECT IFNULL(1,0);

-- DISPLAYING OF CARD NUMBERS AND OTHERS, USING SQL STRING FUNCTIONS

SELECT LENGTH('CodeFirstGirls');
-- joining strings together
SELECT CONCAT('Code', 'First', 'Girls') AS ConcentratedResult;

-- lowercase and upper case
SELECT LCASE('CodeFirstGirls'), LOWER('LOWER CASE WORD');

-- select substr('SQL Tutorial', 5, 3) AS Extractedstring; returns Tut - 5 is total number of strings
-- 5, 5 gives tutor
 -- 3,5 - returns L Tut
 