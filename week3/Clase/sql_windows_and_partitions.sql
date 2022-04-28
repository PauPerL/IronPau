
#window functions
-- aggregation - but dont want a summary table
use bank;

SELECT 
    district_id, COUNT(account_id)
FROM
    account
GROUP BY district_id;

#the keyword for selectin with the window is over

SELECT 
    *, avg(amount)over() as avg_amount
FROM
    loan
WHERE
    duration = 12;

SELECT 
    *, round(avg(amount)over(), 2) as avg_amount
FROM
    loan
WHERE
    duration = 12;
    
    
# so there is another keyword
#partition by duration
# de manera que tendermos el calculo de los avg pero solo de los valores que hayamos particionado (como solo los de duracion 12)
# en este caso estamos particionando por duracion y calculara los avg de cada grupo de duration (12, 24, 36...)
SELECT 
    *, round(avg(amount)over(partition by duration), 0) as avgbydur
FROM
    loan;
    
#se puede particionar por mas de una columna ahora lo haremos por status y duracion

SELECT 
    *, round(avg(amount)over(partition by status,duration), 0) as avgbystadur
FROM
    loan;
    
#todo esto lo estamos haciendo con el round que es un poco engorroso y no hace falta en realidad es solo para dejarlo bonito

#ahora por ultimo podriamos ordena tambien poniendo order by
select 
account_id, date, amount, round(sum(amount)OVER(partition by account_id order by date), 0) as running_sum
from trans ;

