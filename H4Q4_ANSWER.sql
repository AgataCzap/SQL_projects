USE PARTS;

CREATE TABLE SUPPLY (
S_ID varchar(50) Not Null,
P_ID varchar(50) Not Null,
J_ID varchar(50) Not Null,
QUANTITY int not null
);

INSERT INTO SUPPLY 
(S_ID, P_ID, J_ID, QUANTITY)
VALUES
('S1', 'P1', 'J1', 200),
('S1', 'P1', 'J4', 700),
('S2', 'P3', 'J1', 400),
('S2', 'P3', 'J2', 200),
('S2', 'P3', 'J3', 200),
('S2', 'P3', 'J4', 500),
('S2', 'P3', 'J5', 600),
('S2', 'P3', 'J6', 400),
('S2', 'P3', 'J7', 800),
('S2', 'P5', 'J2', 100),
('S3', 'P3', 'J1', 200),
('S3', 'P4', 'J2', 500),
('S4', 'P6', 'J3', 300),
('S4', 'P6', 'J7', 300),
('S5', 'P2', 'J2', 200),
('S5', 'P2', 'J4', 100),
('S5', 'P5', 'J5', 500),
('S5', 'P5', 'J7', 100),
('S5', 'P6', 'J2', 200),
('S5', 'P1', 'J4', 100),
('S5', 'P3', 'J4', 200),
('S5', 'P4', 'J4', 800),
('S5', 'P5', 'J4', 400),
('S5', 'P6', 'J4', 500);

SELECT 
	SNAME, PNAME, JNAME
FROM 
	SUPPLY SY 
    JOIN 
	SUPPLIER SUP ON SY.S_ID = SUP.S_ID
    JOIN 
    PART P ON P.P_ID = SY.P_ID
    JOIN 
    PROJECT PJ ON SY.J_ID = PJ.J_ID 
WHERE 
	SUP.CITY = P.CITY AND P.CITY = PJ.CITY
    
-- INSTRUCTED TO FETCH COLUMNS, FROM SUPPLY TABLE, GIVE ME THE ID FROM BOTH TABLES
-- PROJECT, PART AND CITY
-- NEED THE SUPPLY TABLE!