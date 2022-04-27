#1 Select all the actors with the first name "Scarlett".
SELECT 
    *
FROM
    actor
WHERE
    first_name = 'Scarlett';


#2 How many films (movies) are available for rent and how many films have been rented?

SELECT 
    COUNT(DISTINCT rental_id)
FROM
    rental
WHERE
    return_date IS not NULL;
    
SELECT 
    count(distinct rental_id)
FROM
    rental;
    
#3 What are the shortest and longest movie duration? Name the values max_duration and min_duration.

SELECT 
    MIN(length) AS min_duration, MAX(length) AS max_duration
FROM
    film;

#4 What's the average movie duration expressed in format (hours, minutes)?

SELECT 
	 sec_to_time(avg(length)*60)
FROM
    film;
    
    
#5 How many distinct (different) actors' last names are there?

SELECT 
    COUNT(DISTINCT last_name)
FROM
    actor;

#6 Since how many days has the company been operating (check DATEDIFF() function)?


SELECT 
    DATEDIFF(MAX(last_update),
            MIN(rental_date))
FROM
    rental;

#7 Show rental info with additional columns month and weekday. Get 20 results

SELECT 
    *,
    DATE_FORMAT(CONVERT( rental_date , DATE), '%M') AS 'month',
    DATE_FORMAT(CONVERT( rental_date , DATE), '%W') AS weekday
FROM
    rental
LIMIT 20;

#8 Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week

SELECT 
    *,
    DATE_FORMAT(CONVERT( rental_date , DATE), '%M') AS 'month',
    DATE_FORMAT(CONVERT( rental_date , DATE), '%W') AS weekday,
	CASE DATE_FORMAT(CONVERT( rental_date , DATE), '%W')
        WHEN 'Saturday' THEN 'weekend'
        WHEN 'Sunday' THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM
    rental;

#optimized code by Sean
SELECT 
    *,
    DATE_FORMAT(CONVERT( rental_date , DATE), '%M') AS 'month',
    DATE_FORMAT(CONVERT( rental_date , DATE), '%W') AS weekday,
	CASE 
        WHEN DATE_FORMAT(CONVERT( rental_date , DATE), '%W') IN ('Saturday', 'Sunday')  THEN 'weekend'
        ELSE 'workday'
    END AS day_type
FROM
    rental;

#9 How many rentals were in the last month of activity?

    
SELECT 
    DATE_SUB(MAX(rental_date),
        INTERVAL 30 DAY)
FROM
    rental;
    
SELECT 
    count(distinct rental_id)
FROM
    rental
WHERE
    rental_date > '2006-01-15 15:16:03';
    
#with subquerys
SELECT 
    COUNT(*)
FROM
    rental
WHERE
    rental_date >= (SELECT 
            DATE_SUB(MAX(rental_date),
                    INTERVAL 30 DAY)
        FROM
            rental);