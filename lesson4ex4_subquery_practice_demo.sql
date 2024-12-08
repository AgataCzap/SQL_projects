USE customers;

SELECT 
    first_name, last_name
FROM
    customers.customer c
WHERE
    c.customer_id IN (SELECT 
            ph.phone_number_customer_id
        FROM
            customers.phone_number ph
        WHERE
            ph.phone_number = '555-3344');