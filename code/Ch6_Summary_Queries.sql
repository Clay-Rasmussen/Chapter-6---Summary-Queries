/*
Chapter 6 Assignment: Summary Queries
Name: Clay Rasmussen Jacob Mundt
Date: 
GitHub URL: https://github.com/Clay-Rasmussen/Chapter-6---Summary-Queries
*/

/*
Clay Rasmussen
Query 1: COUNT
   Write a query that returns the total number of rentals and the total returned
*/
SELECT COUNT(*) AS total_rentals, 
       COUNT(return_date) AS total_returns
FROM rental;
 
 /*
Jacob Mundt
 Query 2: COUNT(DISTINCT column)
Write a query that returns the total number of unique customers payments and the total number of payments
*/
SELECT
    count(DISTINCT customer_id) AS unique_customers,
    count(*) AS total_num_of_payment
FROM payment;

/*
Clay Rasmussen
Query 3: GROUP BY and HAVING
Write a query that returns total number of payments, min, max, and rounded avg payment, and the total amount pay
PER CUSTOMER which have a total amount paid over > $100.00
*/
SELECT 
    customer_id,
    COUNT(payment_id) AS number_of_payment,
    MIN(amount) AS min_payment,
    MAX(amount) AS max_payment,
    ROUND(AVG(amount), 2) AS avg_payment,
    SUM(amount) AS total_amount_paid
FROM 
    payment
GROUP BY 
    customer_id
HAVING 
    SUM(amount) > 100.00;

/*
Jacob Mundt
Query 4: Functionally dependent column
Rewrite query 3 to have a functionally dependent column customer name (last_name, ‘,’, first name)
*/ 
SELECT
    payment.customer_id,
        CONCAT(customer.last_name, ', ', customer.first_name) AS csutomer_name,
    COUNT(payment.payment_id) AS number_of_payment,
    MIN(payment.amount) AS min_payment,
    MAX(payment.amount) AS max_payment,
    ROUND(AVG(payment.amount), 2) AS avg_payment,
    SUM(payment.amount) AS total_amount_paid
FROM
    payment
INNER JOIN
        customer ON payment.customer_id=customer.customer_id
GROUP BY
    payment.customer_id
HAVING
    SUM(payment.amount) > 100.00;

/*
Clay Rasmussen
Query 5: WHERE vs HAVING - Part 1
Rewrite query 4 to only display store id = 1 and total amount > 100
IMPORTANT NOTE: store_id is NOT in the column list so you can NOT put it in the HAVING clause
*/
SELECT
    payment.customer_id,
	CONCAT(customer.last_name, ', ', customer.first_name) AS customer_name,
    COUNT(payment.payment_id) AS number_of_payment,
    MIN(payment.amount) AS min_payment,
    MAX(payment.amount) AS max_payment,
    ROUND(AVG(payment.amount), 2) AS avg_payment,
    SUM(payment.amount) AS total_amount_paid
FROM
    payment
INNER JOIN
        customer ON payment.customer_id=customer.customer_id
WHERE store_id = 1 
GROUP BY
    payment.customer_id
HAVING
	SUM(payment.amount) > 100.00;

/*
Query 6: WHERE vs HAVING - Part 2
Rewrite query 5 to include store_id in the column list. Now that store_id is in the column list, you can move the filter to
the HAVING clause. NOTE: Query 5 is more efficient than Query 6
*/

/*
Query 7: WITH ROLLUP
Rewrite query 6 to no longer summarize at the customer level.
Instead, it will summarize at the district and city, plus include WITH ROLLUP summary rows.
Also, do not filter any of the data using a HAVING clause.
*/

/*
Query 8: GROUPING and COALESCE functions
Rewrite Query 7 to replace the null summary values with City Sum and District Sum values
*/



