#point 2 Get all the data from tables actor, film and customer.
SELECT 
    *
FROM
    actor;
    
SELECT 
    *
FROM
    film;
    
SELECT 
    *
FROM
     customer;
     

#point 3 Get film titles
SELECT 
    title
FROM
    film;
    
#point 4 Get unique list of film languages under the alias language. Note that we are not asking you to obtain the language per each film,
# but this is a good time to think about how you might get that information in the future.
SELECT DISTINCT
    language.name as language
FROM
    sakila.language;
    
#point 5.1 Find out how many stores does the company have?

SELECT 
    COUNT(DISTINCT store_id)
FROM
    store;
    
#point 5.2 Find out how many employees staff does the company have?

SELECT 
    count(distinct staff_id)
FROM
    staff;
    
#point 5.3 Return a list of employee first names only?

SELECT DISTINCT
    first_name
FROM
    staff;