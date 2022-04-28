
#1 Get transactions in the first 15 days of 1993.

SELECT 
    *
FROM
    trans
WHERE
    trans.date BETWEEN '930101' AND '930115';
    
#2 Find the different values from the field A2 that start with the letter 'M

SELECT DISTINCT
    A2
FROM
    district
WHERE
    A2 LIKE 'M%';
    
#3 Find the different values from the field A2 that end with the letter 'M'.

SELECT DISTINCT
    A2
FROM
    district
WHERE
    A2 LIKE '%m';

-- ejemplo con regex para encontrar expresiones que contengas cierto caracter en cualquier posicion
SELECT 
    A2
FROM
    district
WHERE
    A2 REGEXP '[u]';

-- ejemplo regex que contenga p r a en cualquier orden    
SELECT 
    A2
FROM
    district
WHERE
    A2 REGEXP 'pra?';
    
-- ejemplo regex buscando cualquier V o s
SELECT 
    A2
FROM
    district
WHERE
    A2 REGEXP '[Vs]';
    
-- mas regex busca digito

SELECT 
    A2
FROM
    district
WHERE
    A2 REGEXP '[:digit:]';
    

-- mas regex busca b i e, o a i e
SELECT 
    A2
FROM
    district
WHERE
    A2 REGEXP '[be|ae]';
    
#group by -- agregate the data by.....
#count sum min max avg
SELECT 
    sum(amount), duration
FROM
    loan
GROUP BY duration;
