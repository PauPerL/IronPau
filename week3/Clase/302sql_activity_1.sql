
#p1
SELECT 
    A2 AS district_name, A11 AS average_salary
FROM
    district
WHERE
    A11 > 10000;
    
#p2
SELECT 
    *
FROM
    loan
WHERE
    status = 'B';
 
 #p3
SELECT 
    *
FROM
    card
WHERE
    card.type = 'junior'
LIMIT 10;

#p4
SELECT 
    amount, loan_id, account_id, amount-payments as debt
FROM
    loan
WHERE
    status = 'B';
    
#p5
SELECT 
    A2, A4*A10/100 as urban_inhabitants
FROM
    district;
    
#p6
SELECT 
    A2, A4*A10/100 as urban_inhabitants, A10
FROM
    district
where A10<50;
