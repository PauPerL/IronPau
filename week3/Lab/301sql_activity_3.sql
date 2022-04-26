SELECT 'hello world';

SELECT 2 + 3;

SELECT DISTINCT
    card.type
FROM
    card;

SELECT 
    COUNT(DISTINCT card.type)
FROM
    card;
    


SELECT DISTINCT
    *
FROM
    district;

SELECT DISTINCT
    A2
FROM
    district;

SELECT DISTINCT
    A2 as district, A3 as region
FROM
    district
LIMIT 30;