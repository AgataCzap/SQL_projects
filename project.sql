DROP DATABASE BOOKSTORE;

CREATE DATABASE BOOKSTORE;

USE BOOKSTORE;

create table BOOKS (
book_id varchar(50) Not Null UNIQUE, 
book_title varchar(50) not null, 
author varchar(50) not null,
genre varchar(50), 
publication_date int, 
constraint book_type primary key (book_id));

insert into BOOKS (book_id, book_title, author, genre, publication_date)
values 
('B1', "SQL: Database Fundamentals & Essentials", 'Aaron Wilkes', 'Non Fiction', 2011), 
('F4', "The Hunger Games", 'Suzanne Collins', 'Adventure Fiction',2008), 
('T7', "Malibu Rising", 'Taylor Jenkins Reid', 'Romantic Fiction', 2021),
('R5', "The Girl with all the Gifts", 'M.R Carey', 'Thriller', 2014),
('G6', "Do Androids dreams of electric sheep?", 'Phillip K.Dick', 'sci-fi', 1968), 
('B3', "The Body Illustrated", 'Bill Bryson', 'Non-Fiction', 2019); 

SELECT * FROM BOOKS;

CREATE TABLE customer_info(
customer_ID VARCHAR(10) NOT NULL,
membership_ID INT NOT NULL UNIQUE,
customer_name VARCHAR(50),
customer_surname VARCHAR(50),
customer_address VARCHAR(100),
customer_town VARCHAR(20),
customer_postcode VARCHAR(10),
CONSTRAINT customer_info primary key (customer_ID));

INSERT INTO customer_info
(customer_ID, membership_ID, customer_name, customer_surname, customer_address, customer_town, customer_postcode)
VALUES
('C1', 100143, 'John', 'Johnson', '143 Birch Alley', 'London', 'SE24 0AB'),
    ('C2', 210899, 'Ada', 'Lovelace', '1927 Oak Street', 'Portsmouth', 'PO25 0XY'),
    ('C3', 210065, 'Catherine', 'Smith', '53 Orwell Avenue', 'Glasgow', 'G43 2QU'),
    ('C4', 100732, 'Alexis', 'Yu', '36 Shakespeare Drive', 'Manchester', 'M18 6TF'),
    ('C5', 320909, 'Adam', 'Williams', '115 Great Windmill Lane', 'Cardiff', 'CF72 7MR'),
    ('C6', 100529, 'Dude', 'Lebowski', '9 Holton Road', 'Telford', 'TF11 5PL'),
    ('C7', 320348, 'Emily', 'Thomas', '76 Marine Terrace', 'Aberystwyth', 'SY23 3RE'),
    ('C8', 100188, 'Sandy', 'Donaghue', '118 Racecourse Drive', 'Belfast', 'BF4 4IC'),
    ('C9', 210922, 'Andrea', 'Webster', '10 Epsom Close', 'Oswestry', 'SY11 2PG'),
    ('C0', 100586, 'Peter', 'Dupert', '225 Morpurgo Road', 'St Andrews', 'KY16 7TY');
	    
SELECT * FROM customer_info;

DROP TABLE MEMBERSHIP_DETAILS;

	CREATE TABLE MEMBERSHIP_DETAILS(
	customer_ID VARCHAR(10) NOT NULL,
	membership_ID INT NOT NULL UNIQUE,
	Membership_Type VARCHAR(20) NOT NULL,
	Renewal_Date DATE,
	CONSTRAINT Membership_Details FOREIGN KEY (customer_ID) REFERENCES Customer_info(customer_ID),
	FOREIGN KEY (membership_ID) REFERENCES Customer_info(membership_ID));
		
	INSERT INTO MEMBERSHIP_DETAILS(
	customer_ID, membership_ID, Membership_Type, Renewal_Date)
	VALUES
	('C1', 100143, 'Annual', '2023-06-14'),
	('C2', 210899, 'Monthly', '2023-01-02'),
	('C3', 210065, 'Monthly', '2022-12-28'),
	('C4', 100732, 'Annual', '2023-05-05'),
	('C5', 320909, 'Quarterly', '2023-04-23'),
	('C6', 100529, 'Annual', '2023-10-31'),
	('C7', 320348, 'Quarterly', '2022-12-11'),
	('C8', 100188, 'Annual', '2023-07-31'),
	('C9', 210922, 'Monthly', '2023-01-08'),
	('C0', 100586, 'Annual', '2023-06-12');

	SELECT * FROM MEMBERSHIP_DETAILS;
		
	CREATE TABLE customer_bank_details(
	customer_ID VARCHAR(10) NOT NULL,
	Bank_Account_ID INT NOT NULL UNIQUE,
	Bank_Name VARCHAR(50),
	Balance float,
	CONSTRAINT customer_bank_details PRIMARY KEY (Bank_Account_ID),
	FOREIGN KEY (customer_ID) REFERENCES customer_info(customer_ID));
		
	INSERT INTO customer_bank_details(
	customer_ID, Bank_Account_ID, Bank_Name, Balance)
	VALUES
	 ('C1', 111333, 'NatWest', -20),
	 ('C2', 111528, 'Barclays', 1000),
	 ('C3', 200666, 'Royal Bank of Scotland', 40),
	 ('C4', 348750, 'Barclays', 200),
	 ('C5', 555555, 'NatWest', 500),
	('C6', 661666, 'Royal Bank of Scotland', 10),
	('C7', 535177, 'Barclays', 5000),
	('C8', 650728, 'NatWest', 3456),
	('C9', 802565, 'CITI Bank', 10000),
	('C0', 932945, 'Royal Bank of Scotland', 2000);

	SELECT * FROM customer_bank_details;
	DROP TABLE Member_Contact_Details;

	CREATE TABLE Member_Contact_Details(
	customer_ID VARCHAR(10) NOT NULL,
	membership_ID INT NOT NULL UNIQUE,
	Member_Email_Address VARCHAR(50),
	Member_Phone_Number VARCHAR(20),
	CONSTRAINT Member_Contact_Details FOREIGN KEY (membership_ID) REFERENCES MEMBERSHIP_DETAILS(membership_ID),
	FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer_Info(Customer_ID));
		
	INSERT INTO Member_Contact_Details(
	customer_ID, membership_ID, Member_Email_Address, Member_Phone_Number)
	VALUES
	('C1', 100143, 'jjohnson@gmail.com', '07433981256'),
	('C2', 210899, 'lovelace_a@virginmedia.com', '07743223543'),
	('C3', 210065, 'smith.cath@aol.com', '07852461980'),
	('C4', 100732, 'alexisyu1978@gmail.com', NULL),
	('C5', 320909, NULL, '07093221496'),
	('C6', 100529, NULL, '07944677881'),
	('C7', 320348, 'thomasemily0408@yahoo.com', '07772900541'),
	('C8', 100188, 'sandydonaghue@aol.com', NULL),
	('C9', 210922, 'web.andr12@gmail.com', '07329941002'),
	('C0', 100586, 'pete.d@yahoo.com', NULL);

	SELECT * FROM Member_Contact_Details;

	DROP TABLE Orders;

	CREATE TABLE Orders(
	ORDER_ID VARCHAR(50) NOT NULL UNIQUE,
	BOOK_ID VARCHAR(50) NOT NULL UNIQUE,
	customer_ID VARCHAR(10) NOT NULL,
	PRICE FLOAT(4) NOT NULL,
	ORDER_STATUS VARCHAR(50) NOT NULL,
	PURCHASE_DATE date, 
	DELIVERY_DATE Date, 
	Delivery_option varchar(50), 
	CONSTRAINT Orders PRIMARY KEY (ORDER_ID),
	FOREIGN KEY (book_id) REFERENCES BOOKS(book_id),
	FOREIGN KEY (customer_ID) REFERENCES customer_info (customer_ID));


INSERT INTO Orders
(ORDER_ID, book_id, customer_ID, PRICE, ORDER_STATUS, PURCHASE_DATE, DELIVERY_DATE, Delivery_Option)
VALUES
('O1', 'F4', 'C3', 25.00,  'Fulfilled', 20221106, 20221110, 'Evri'), 
('O2', 'B1', 'C5', 50.00, 'Out for delivery', 20221031, 20221105, 'Royal Mail'),
('O3', 'R5', 'C4',  38.00, 'Unfullfilled', 20220823, 20220829, 'Locker Pick-up'),
('O4', 'B3', 'C6', 18.50, 'Fulfilled', 20220927, 20220929, 'Royal Mail'), 
('O5', 'T7', 'C5', 20.20, 'Unfulfilled', 20220516, 20220521, 'Evri'), 
('O6', 'G6', 'C4', 35.60, 'Preparing order', 20220304, 20220309,'Royal Mail'); 

SELECT * FROM Orders;


-- creating book status table 

CREATE TABLE BOOK_INVENTORY (
book_id VARCHAR(50) NOT NULL UNIQUE,
book_title VARCHAR(500) NOT NULL,
in_stock BOOLEAN NOT NULL,
quantity_in_stock INT,
quantity_sold INT,	
CONSTRAINT BOOK_INVENTORY FOREIGN KEY (book_id) REFERENCES BOOKS (book_id));
    
INSERT INTO BOOK_INVENTORY (
book_id, book_title, in_stock, quantity_in_stock, quantity_sold)

VALUES
('B1', "SQL: Database Fundamentals & Essentials", TRUE, 4, 2),
('F4', "The Hunger Games", TRUE, 1, 13),
('T7', "Malibu Rising", FALSE, NULL, 6),
('G6', "Do Androids dreams of electric sheep?", TRUE, 12, 1),
('R5', "The Girl with all the Gifts", FALSE, NULL, 4),
('B3', "The Body Illustrated", TRUE, 2, 0);

SELECT * FROM BOOK_INVENTORY;

CREATE TABLE newsletter (
customer_ID VARCHAR(10) NOT NULL,
membership_ID INT NOT NULL UNIQUE,
renewal_date DATE,
newsletter_type VARCHAR (50) NOT NULL,
newsletter_frequency VARCHAR (10) NOT NULL,
delivery_mode VARCHAR (10) NOT NULL,
customer_town VARCHAR (20) NOT NULL,
postage_cost FLOAT(6),
FOREIGN KEY (customer_ID) REFERENCES  MEMBERSHIP_DETAILS (customer_ID),
FOREIGN KEY (membership_ID) REFERENCES customer_info(membership_ID)
);


INSERT INTO newsletter (
customer_ID, membership_ID, renewal_date, newsletter_type, newsletter_frequency, delivery_mode, customer_town, postage_cost)
VALUES 
('C1', 100143, '2023-06-14', 'magazine-style','quarterly', 'post','London', 3.50),
('C2', 210899, '2023-01-02', 'blog-style', 'weekly', 'email', 'London', 0.00),
('C3', 210065, '2022-12-28', 'festive', 'seasonal', 'email','Glasgow', 0.00),
('C4', 100732, '2023-05-05', 'magazine-style', 'annually', 'post', 'Manchester', 2.20),
('C5', 320909, '2023-04-23', 'blog-style', 'monthly', 'email', 'Glasgow',0.00),
('C6', 100529, '2023-10-31', 'blog-style', 'quarterly', 'post', 'Manchester', 2.20),
('C7', 320348, '2022-12-11', 'blog-style', 'quarterly', 'email','London',0.00),
('C8', 100188, '2023-07-31', 'blog-style', 'monthly', 'post','Belfast', 1.90),
('C9', 210922, '2023-01-08', 'blog-style', 'monthly', 'email','Manchester', 0.00),
('C0', 100586, '2023-06-12', 'magazine-style', 'quarterly', 'post','London', 3.50);

ALTER TABLE NEWSLETTER
ADD CONSTRAINT Newsletter PRIMARY KEY (customer_ID, membership_ID),
	ADD FOREIGN KEY (customer_ID) REFERENCES customer_info(customer_id),
    ADD FOREIGN KEY (membership_ID) REFERENCES membership_details(membership_ID);

SELECT * FROM bookstore.newsletter;

