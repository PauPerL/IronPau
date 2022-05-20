use sakila;

select * from rental;

# p2
select * from rental where rental_date like "2005-05%";

select * from rental 
where date_format(rental_date, '%m-%y')='05-05';

#p 3
select * from rental 
where date_format(rental_date, '%m-%y')='06-05';

#p4

select customer_id, count(rental_id) from rental 
where date_format(rental_date, '%m-%y')='05-05'
group by customer_id;


#7
select customer_id, count(rental_id) as n_rents from rental 
where date_format(rental_date, '%m-%y')='06-05'
group by customer_id;

