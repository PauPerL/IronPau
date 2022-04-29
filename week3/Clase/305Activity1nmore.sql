
#3.05 Activity 1
#Hint: Compute first the number of transactions by account.

SELECT 
    account_id, COUNT(trans_id)
FROM
    trans
GROUP BY account_id;


#Find out the average of the number of transactions by account

Select avg(n_trans_acc) 
from 
(SELECT 
    account_id, COUNT(trans_id) as n_trans_acc
FROM
    trans
GROUP BY account_id) as trans_t2;

#3.05 Activity 2

#1 Get a list of accounts from Central Bohemia using a subquery.

select * from district
where A3='central Bohemia';

select distinct account_id, A3
from account, (select A3 from district) as s
where A3='central Bohemia';

#2 Rewrite the previous as a join query.

SELECT
    a.account_id, d.A3
FROM
    account a
        JOIN
    district d ON d.A1 = a.district_id
WHERE
    A3='central Bohemia';
    
    

