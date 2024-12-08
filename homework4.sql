USE PARTS;

SELECT
SNAME, STATUS
FROM
SUPPLIER
WHERE
S_ID IN (SELECT
S_ID
FROM
PROJECT
WHERE
J_ID = 'J2');

-- find all projects from London supplier

SELECT
JNAME, CITY
FROM
PROJECT
WHERE
J_ID IN (SELECT
	J_ID
    FROM
	SUPPLIER
	WHERE
	S_ID IN (SELECT 
				S_ID
                FROM
				SUPPLIER
                WHERE
                    CITY = 'LONDON'));
                    
-- ALL PROJECTS SUPPLIED BY NON LONDON SUPPLIER
SELECT
JNAME, CITY
FROM
PROJECT
WHERE
J_ID IN (SELECT
	J_ID
    FROM
	SUPPLIER
	WHERE
	S_ID IN (SELECT 
				S_ID
                FROM
				SUPPLIER
                WHERE
                    CITY <> 'LONDON'));

-- find all parts where part, supplier and project name are all the same
-- indentation is important, will not run right, need to fix it yourself in mySQL
-- had a look at the tables, unfortunately the part names are different in every table
-- only the city records are same across different tables
-- decided to use Donna's approach by joining all tables by the city, as it is easier than multiple nested subqueries
SELECT
p.P_ID, p.PNAME, p.CITY, j.JNAME, j.CITY, s.SNAME, s.STATUS, s.CITY
FROM
PART p
LEFT JOIN
	PROJECT j
		ON
		p.CITY = j.CITY
LEFT JOIN
	SUPPLIER s
		ON
		p.CITY = s.CITY;
        
-- creates duplicates, use inner join
SELECT
p.P_ID, p.PNAME, p.CITY, j.JNAME, j.CITY, s.SNAME, s.CITY
FROM
PART p
INNER JOIN
	PROJECT j
		ON
		p.CITY = j.CITY
INNER JOIN
	SUPPLIER s
		ON
		j.CITY = s.CITY;
        
-- cleaner when I removed city names from j and s tables
SELECT
p.P_ID, p.PNAME, p.CITY, j.JNAME, s.SNAME
FROM
PART p
INNER JOIN
	PROJECT j
		ON
		p.CITY = j.CITY
INNER JOIN
	SUPPLIER s
		ON
		j.CITY = s.CITY;

-- https://www.freecodecamp.org/news/sql-inner-join-how-to-join-3-tables-in-sql-and-mysql/
-- https://stackoverflow.com/questions/14995000/sql-inner-join-more-than-two-tables
