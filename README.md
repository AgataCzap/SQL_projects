# SQL_projects
This depository contains code from SQL courses and my own projects. 

CFG course:
Project was completed in a team of 4.
Created for CFG SQL course project.

project.sql
This script contains the body of the database (8 tables).
The database is designed to resemble an online book store e.g. Amazon.
Tables include - order table with book price and customer details - newsletter table with subscription types and pricing - bank account table with balance etc.
Another file contains script with queries created to use this database.

queries.sql
- create view by joining 3 tables from bookstore DB to check orders
- subnested query to check which customers had ordered book with price > 20
- function to deduct order price from balance (money for purchasing books), to simulate transactions, anything that is higher than customer’s balance will not be deducted
- group by statement that can be used in an analysis that demonstrates how data is extracted - for marketing purposes I want to check how much I've earned from every location, purchases, subscriptions and then total
- event that deducts customer's reading membership subscriptions from their bank balance, on a regular basis
