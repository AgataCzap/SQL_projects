CREATE DATABASE SHOP;

USE SHOP;

CREATE TABLE SALES1
(Store VARCHAR(50) NOT NULL,
Week INTEGER,
Day VARCHAR(50) NOT NULL,
SalesPerson VARCHAR(50) NOT NULL,
SalesAmount FLOAT(2),
Month VARCHAR(50) );

Insert into SALES1(Store, Week, Day, SalesPerson, SalesAmount, Month)
Values
('London', 2, 'Monday', 'Frank', 56.25, 'May'),
('London', 5, 'Tuesday', 'Frank', 74.32, 'Sep'),
('London', 5, 'Monday', 'Bill', 98.42, 'Sep'),
('London', 5, 'Saturday', 'Bill', 73.90, 'Dec'),
('London', 1, 'Tuesday', 'Rosie', 44.72, 'Sep'),
('Dusseldorf', 4, 'Monday', 'Manfred', 77.00, 'Jul'),
('Dusseldorf', 3, 'Tuesday', 'Inga', 9.99, 'Jun'),
('Dusseldorf', 4, 'Wednesday', 'Manfred', 86.81, 'Jul'),
('London', 6, 'Friday', 'Josie', 74.02, 'Oct'),
('Dusseldorf', 1, 'Saturday', 'Manfred', 43.11, 'Apr');

USE PARTS;

SELECT PNAME, WEIGHT FROM PART WHERE COLOUR = 'RED';

SELECT SNAME, CITY FROM SUPPLIER WHERE CITY = 'LONDON';