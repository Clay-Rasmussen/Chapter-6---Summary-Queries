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
 Query 2: COUNT(DISTINCT column)
Write a query that returns the total number of unique customers payments and the total number of payments
*/

