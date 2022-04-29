
use sakila;

# 1 Write a query to display for each store its store ID, city and country

select * from store;

select * from address;

select * from city;

select * from country;


SELECT 
    s.store_id, c.city, ctr.country
FROM
    store s
        JOIN
    address a USING (address_id)
        JOIN
    city c USING (city_id)
        JOIN
    country ctr USING (country_id);

#2 Write a query to display how much benefit amount, in dollars, each store brought in.

select * from payment;

select * from customer;

select * from store;

SELECT 
    s.store_id, SUM(p.amount)
FROM
    payment p
        JOIN
    customer c USING (customer_id)
        JOIN
    store s USING (store_id)
GROUP BY s.store_id;


#3 What is the average running time of films by category?

select * from film;

select * from film_category;

select * from category;

SELECT 
    c.name AS category, AVG(f.length) as avg_length
FROM
    film f
        JOIN
    film_category fc USING (film_id)
        JOIN
    category c USING (category_id)
GROUP BY category;


#4 Which film categories are longest on average?


SELECT 
    c.name AS category, AVG(f.length) as avg_length
FROM
    film f
        JOIN
    film_category fc USING (film_id)
        JOIN
    category c USING (category_id)
GROUP BY category
order by avg_length desc
limit 10;

#5 Display the most frequently rented movies in descending order.

select * from rental;

select * from inventory;

select * from film;

select f.title, count(r.rental_id) as n_rented
from rental r
join inventory i
using(inventory_id)
join film f 
using(film_id)
group by title
order by n_rented desc;

