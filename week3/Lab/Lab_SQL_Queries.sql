use sakila;

#1 Using the rental table, find out how many rentals were processed by each employee.

SELECT 
    staff_id, count(rental_id)
FROM
    rental
GROUP BY staff_id;


#2 Using the film table, find out how many films were released.

select * from film;

SELECT 
    count(film_id) as film_released
FROM
    film;
    

#3 Using the film table, find out how many films there are of each rating. Sort the results in descending order of the number of films.

SELECT 
    rating, COUNT(film_id)
FROM
    film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;


#4 Which kind of movies (rating) have a mean duration of more than two hours?

select * from film;

SELECT 
    rating, AVG(length)
FROM
    film
GROUP BY rating
HAVING AVG(length) > 120
ORDER BY AVG(length) DESC;
