use bank;

SELECT 
    *
FROM
    trans
ORDER BY  date, amount;

SELECT 
    *
FROM
    trans
ORDER BY  date desc , amount desc; #create a partition


SELECT 
    *
FROM
    trans
WHERE
    k_symbol = 'UROK'
ORDER BY date DESC , amount DESC; #create a partition


SELECT 
    *
FROM
    trans
WHERE
    k_symbol = 'UROK'
    #and operation !=' '
ORDER BY date DESC , amount DESC; #create a partition


#LIKE '%' string match - wildcard

SELECT 
    *
FROM
    district
WHERE
    A2 LIKE 'K%';


SELECT 
    *
FROM
    district
WHERE
    A2 LIKE 'U%' or A2 LIKE '%u%';

#like '_' cada underscore es un char
SELECT 
    *
FROM
    district
WHERE
    A2 LIKE '_____';
    

