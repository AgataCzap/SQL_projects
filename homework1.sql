CREATE DATABASE PARTS;
USE PARTS;

Create table PART(
P_ID varchar(50) NOT NULL,
PNAME varchar(50) NOT NULL,
COLOUR varchar(50),
WEIGHT float(10) NOT NULL,
CITY varchar(50)
);

Create table PROJECT(
J_ID varchar(50) NOT NULL,
JNAME varchar(50) NOT NULL,
CITY varchar(50)
);

Create table SUPPLIER(
S_ID varchar(50) NOT NULL,
SNAME varchar(50) NOT NULL,
STATUS INT,
CITY varchar(50)
);

INSERT INTO PART (P_ID, PNAME, COLOUR, WEIGHT, CITY)
Values
('P1', 'NUT', 'RED', 12, 'LONDON'),
('P2', 'BOLT', 'GREEN', 17, 'PARIS'),
('P3', 'SCREW', 'BLUE', 17, 'ROME'),
('P4', 'SCREW', 'RED', 14, 'LONDON'),
('P5', 'CAM', 'BLUE', 12, 'PARIS'),
('P6', 'COG', 'RED', 19, 'LONDON');

INSERT INTO PROJECT (J_ID, JNAME, CITY)
Values
('J1', 'SORTER', 'PARIS'),
('J2', 'DISPLAY', 'ROME'),
('J3', 'OCR', 'ATHENS'),
('J4', 'CONSOLE', 'ATHENS'),
('J5', 'RAID', 'LONDON'),
('J6', 'EDS', 'OSLO'),
('J7', 'TAPE', 'LONDON');

Insert into SUPPLIER(S_ID, SNAME, STATUS, CITY)
Values
('S1', 'SMITH', 20, 'LONDON'),
('S2', 'JONES', 10, 'PARIS'),
('S3', 'BLAKE', 30, 'PARIS'),
('S4', 'CLARK', 20, 'LONDON'),
('S5', 'ADAMS', 30, 'ATHENS')



