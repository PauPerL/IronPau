

#Extend the query below and list district_name, client_id, and account_id for those clients who are the owner of the account. 
#Order the results by district_name:

select * from district;

select da.A2 as district_name, d.client_id, d.account_id
from bank.disp as d
join bank.client as c
on d.client_id = c.client_id
join bank.district as da
on da.A1 = c.district_id
where d.type='OWNER'
order by district_name;