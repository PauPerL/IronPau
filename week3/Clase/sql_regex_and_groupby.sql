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


# order from the bank

SELECT 
    account_id, COUNT(order_id), ROUND(SUM(amount), 2) AS total
FROM
    bank.order
GROUP BY account_id;


#la expresion en orden completa
#mostrando que despues del grup by en vez de where utilizamos having
SELECT 
    account_id, COUNT(order_id), ROUND(SUM(amount), 2) AS total
FROM
    bank.order
GROUP BY account_id
HAVING COUNT(order_id) > 1
ORDER BY COUNT(order_id) DESC;
