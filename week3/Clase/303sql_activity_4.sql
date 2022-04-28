

use sakila;


#1 Create a query to show for each rating the average movie length (displayed as Mean_length). Sort the results in descending order of Mean_length.

SELECT 
    title, length, rating, round(avg(length)over(partition by rating), 0) as Mean_length
FROM
    film
order by Mean_length desc;


#2 Create a query to show for each movie the following data (in this order):

SELECT 
    rating, title, length,
    avg(length)over(partition by rating) as Mean_length_by_rating,
    dense_rank()OVER(partition by  rating order by length desc) as ranking   
FROM
    film;

#practicament lo mateix que 
SELECT 
    rating, title, length,
    avg(length)over(partition by rating) as Mean_length_by_rating,
    rank()OVER(partition by  rating order by length desc) as ranking   
FROM
    film;