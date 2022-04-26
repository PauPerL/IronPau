SELECT 
    *
FROM
    bank.client;

SELECT 
    *
FROM
    trans;

#esto es un comentario, y estamos haciendo un ejemplo de peticiones simples
#podemos hacer que nuestro schema sea default y asi no tener que ir poniendo el nombre(right click en el schema -set default)

use bank; #aixo tambe es com fer default bank

SELECT     account_id as id, balance as bal, amount as amnt, amount-balance as difference 
#pillamos estas columnas y creamos una columna la que le damos nombre
FROM    trans
order by amnt DESC #default order is ascending to hcnage it use DESC
LIMIT 10;
#ponemos que sean las top 10

#the blue words are operators
#count the number of records in a table
select count(*) from trans; #cunt is a function

#para contar cosas distintas o countd
SELECT 
    COUNT(DISTINCT account_id) AS countofacc
FROM
    trans;

#para sacar las diferentes operaciones
SELECT DISTINCT
    operation
FROM
    trans;

#es diferente que contar porque te esta mostrando los que son diferentes
SELECT 
    COUNT(DISTINCT operation)
FROM
    trans;


#querys basicos 
#select, from, where, group by, having, order by, limit


#operators maths and logic

# +-*/
#= >= <=  !=  <>

#from the bank loan , get loans_id and amount in thousands

SELECT 
    loan_id, amount / 1000 AS amountk
FROM
    loan;
    
#only loans where status is A or B

SELECT 
    *
FROM
    loan
WHERE
    status = 'A' OR status = 'B'; #es A o B el estatus

SELECT 
    *
FROM
    loan
WHERE
    status IN ('A' , 'B'); # el estatus es A o B
    
SELECT 
    *
FROM
    loan
WHERE
    status <>'B' AND status !='A'; #no es ni A ni B

#lets add an and to our where
#status is B and amount >100.000

SELECT 
    *
FROM
    loan
WHERE
    status = 'B' AND amount >= 100000
ORDER BY amount;#podemos ordenar por ascendente o desc

#ahora lo mismo pero con la condicion de que la duracion sea igual o menor a 24 meses
SELECT 
    *
FROM
    loan
WHERE
    status = 'B' AND amount >= 100000
        AND duration <= 24
ORDER BY amount DESC;

#lower trim upper.... ceiling floor round min max ..... etc funciones utiles 

#como conseguir the biggest transaction
SELECT 
    MAX(amount), MIN(amount)
FROM
    loan;

#hagamos un avarage order amount
SELECT 
    FLOOR(AVG(amount)),
    ROUND(AVG(amount), 3),
    CEILING(AVG(amount))
FROM
    bank.order;

#useful string functions- lower, upper, length, concat, left right ltrim rtrim

SELECT 
    A2, LEFT(A2, 5)
FROM
    district;

SELECT LTRIM('   praga'); #es para sacar los espacios en blanco por la izquierda, lo mismo para rtrim pero la derecha


#dates convert() substring_index(), date_format()


SELECT 
    *, CONVERT( account.date , DATE)
FROM
    bank.account;

select *, if(right(left(birth_number, 4), 2)>12) then 'female' else 'male' end as gender from bank.client;

SELECT 
    *, CONVERT( account.date , DATE) AS mydate
FROM
    bank.account;

SELECT 
    *, SUBSTRING_INDEX(issued, ' ', 1)
FROM
    bank.card;

SELECT 
    *,
    CONVERT( SUBSTRING_INDEX(issued, ' ', 1) , DATE) AS newdate
FROM
    bank.card;

SELECT 
    *,
    DATE_FORMAT(CONVERT( loan.date , DATE), '%y-%m-%d') AS newdate,
    DATE_FORMAT(CONVERT( loan.date , DATE), '%Y,%M') AS yearnmonth
FROM
    bank.loan;
 
 #nulls -- is null()-- ejemplo: where is not null()
 
 #case - we have done in tableau
 

 
SELECT 
    *,
    CASE loan.status
        WHEN 'A' THEN 'finished_payed'
        WHEN 'B' THEN 'finished_notpayed'
        WHEN 'C' THEN 'runing_paying'
        ELSE 'runing_notpaying'
    END AS contract
FROM
    loan;
