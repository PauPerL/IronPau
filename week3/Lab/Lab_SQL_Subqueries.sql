

#1 How many copies of the film Hunchback Impossible exist in the inventory system?

select * from film
where title='Hunchback Impossible';

select * from inventory;

SELECT 
    COUNT(i.inventory_id) as n_copies
FROM
    inventory i
        JOIN
    film f USING (film_id)
WHERE
    f.title = 'Hunchback Impossible';

#2 List all films whose length is longer than the average of all the films

-- this is what i would try but wont work bc of the order execution
select film_id, avg(length) as avg_length from film
where length > avg_length
group by film_id;

-- so to do the subquery lets go step by step
select avg(length) from film;


SELECT 
    f.film_id, f.title, f.length
FROM
    film f
WHERE
    length > (SELECT 
            AVG(length)
        FROM
            film);


#3 Use subqueries to display all actors who appear in the film Alone Trip.


select film_id from film
where title='Alone Trip';

SELECT 
    a.first_name, a.actor_id, f.title, f.film_id
FROM
    film f
        JOIN
    film_actor fa USING (film_id)
        JOIN
    actor a USING (actor_id)
WHERE
    film_id = (SELECT  film_id
        FROM
        film
        WHERE
            title = 'Alone Trip');



#4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.


select * from category
where name='Family';

select title, film_id, category_id from category
join film_category
using(category_id)
join film
using(film_id)
where category_id = 
(select category_id 
from category
where name='Family');

#5 Get name and email from customers from Canada using subqueries. Do the same with joins.
# Note that to create a join, you will have to identify the correct tables with their 
# primary keys and foreign keys, that will help you get the relevant information.



select * from country
where country='Canada';


select first_name, email from customer
where address_id in (
select address_id from address
where city_id in (
select city_id from city
where country_id in (
select country_id from country
where country='Canada')));

select first_name, email from customer
join address a
using(address_id)
join city
using(city_id)
join country c
using(country_id)
where c.country='Canada';

#6 	Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
#First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.

-- lets see the most prolific actors
select actor_id, count(distinct film_id) as films_acted from film_actor
group by actor_id
order by films_acted desc;

-- lets break our heads trying to get the max of the count





#FUNCIONA
#mas codigo pero de w3
SELECT max(mycount) as maxcount
FROM (SELECT actor_id,COUNT(film_id) mycount 
FROM film_actor 
GROUP BY actor_id) t;

# I dont know whats happening here :-$
select actor_id
from film_actor
where
(SELECT max(mycount) as maxcount
FROM (SELECT actor_id,COUNT(film_id) mycount 
FROM film_actor fa
GROUP BY actor_id) t);


-- se me ha ocurrido coger solo primer chunk de codigo y sacar el id del top 1

#iner query1
select actor_id, count(distinct film_id) as films_acted from film_actor
group by actor_id
order by films_acted desc
limit 1;


#inerqurey 2 o midlequery
select actor_id from (
select actor_id, count(distinct film_id) as films_acted from film_actor
group by actor_id
order by films_acted desc
limit 1
) t;


#outer query and resolution of the problem
select title from film
join film_actor using(film_id)
where 
actor_id=(
select actor_id from (
select actor_id, count(distinct film_id) as films_acted from film_actor
group by actor_id
order by films_acted desc
limit 1
) t);


# 7 Films rented by most profitable customer. You can use the customer table and payment table
# to find the most profitable customer ie the customer that has made the largest sum of payments


#inner query
select customer_id, sum(amount) from payment
join customer using(customer_id)
group by customer_id
order by sum(amount) desc
limit 1;

#innerquery 2
select customer_id from (
select customer_id, sum(amount) from payment
join customer using(customer_id)
group by customer_id
order by sum(amount) desc
limit 1) t;


select title from film 
join inventory using(film_id)
join rental using(inventory_id)
where customer_id = (
select customer_id from (
select customer_id, sum(amount) from payment
join customer using(customer_id)
group by customer_id
order by sum(amount) desc
limit 1) t);

# 8 Get the client_id and the total_amount_spent of those clients who spent more than the average of the total_amount spent by each client.

#inner query
select customer_id, sum(amount)  as amnt from payment
group by customer_id;



#inner query 2
select avg(amnt) from
(
select customer_id, sum(amount)  as amnt from payment
group by customer_id) s;

#outer query
select customer_id, sum(amount)
from payment
group by customer_id having sum(amount) >
(
select avg(amnt) from
(
select customer_id, sum(amount)  as amnt from payment
group by customer_id) s);

