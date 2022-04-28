

use bank;

#how many clients per district?
SELECT 
    A2 AS districtname,
    A3 AS regionname,
    COUNT(DISTINCT client_id) AS n_of_clients
FROM
    district			 	#this is the first table -- LEFT table
        LEFT JOIN client	#this is the second table -- RIGHT table
		ON district.A1 = client.district_id 	#here we have the column that we are using to join the tables
GROUP BY A2 , A3;

# utilizar alias en tablas -- ponemos una letra despues del nombre de la tabla en el from
# y asi podemos abreviar para referirnos a la tabla solo con la letra

SELECT 
    d.A2 AS districtname,
    d.A3 AS regionname,
    COUNT(DISTINCT client_id) AS n_of_clients
FROM
    district d			 	#look at the distrct d -- we are using then that d for eveything that is on distrct
        LEFT JOIN client c	#the same here with c
		ON d.A1 = c.district_id 	
GROUP BY d.A2 , d.A3;

#aqui estamos usando using despues del join porque la columna por la que queremos
#joinear las tablas (la columna que comparten ambas tablas) tiene el mismo nombre. No como antes

SELECT 
    a.account_id, a.date, COUNT(l.loan_id), AVG(l.amount)
FROM
    loan l
	INNER JOIN
    account a USING(account_id)
GROUP BY a.account_id, a.date;# we are agregatin by these terms . IMPORTANTE tenemos que grupear por cada field que no este agregado en si mismo (count avg etc)



# mas ejemplos donde la junta por izquierda o derecha importa

select * from account 
join loan 
using(account_id);

select * from account 
left join loan 
using(account_id);	#los nulls significa que no hay entrada correspondiente en la tabla de la derecha

select * from account 
right join  loan
using(account_id); 


# join = inner join in mysql 


# now lets go join more than 2 table
# how many loans per region

SELECT 
    A3 AS Region,
    COUNT(loan_id) AS Nofloans,
    COUNT(account_id) AS Nofaccounts
FROM
    loan
        INNER JOIN
    account USING (account_id)
        INNER JOIN
    district ON account.district_id = district.A1
GROUP BY Region;


#mas diversion


SELECT 
    a.account_id,
    a.district_id,
    dp.type,
    c.client_id
FROM
    account a
        INNER JOIN
    disp dp USING (account_id)
        INNER JOIN
    client c USING (client_id)
where dp.type='OWNER';
