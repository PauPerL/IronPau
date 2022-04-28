use sakila;

#1 Get the total rental revenue using the column amount from table payment. Display it as Total_revenue.

SELECT 
    SUM(amount) AS Total_revenue
FROM
    payment;


#2 Get the total rental revenue by customer_id sorted by total benefit in descending order.

SELECT 
    customer_id, SUM(amount) AS rental_revenue
FROM
    payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;
