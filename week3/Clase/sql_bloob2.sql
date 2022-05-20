

use bank;

select * from account;

select * from trans;

select * from loan;


select a.account_id, c.client_id, count(distinct o.order_id), a.date from bank.order as o
join bank.account as a
on(a.account_id)
join disp as d
on(a.account_id)
join client as c
on(c.client_id)
group by c.client_id, a.account_id, a.date;


create view account_orders as 
select a.account_id, count(distinct o.order_id), a.date from bank.order as o
join bank.account as a
on(a.account_id)
group by a.account_id, a.date ;


create view acc_trans as 
select a.account_id, a.date as acc_date, trans_id, t.date as trans_date, t.type, t.amount, t.balance, t.bank as bnk_partner, t.account as acc_partner from trans as t
join bank.account as a using(account_id);

select * from loan;

create view acc_trans_loan_disp as
select a.account_id, count(client_id), count(trans_id), sum(a.amount) ,status , date from acc_trans a
join loan l using(account_id)
join disp d  using(account_id)
where d.type='OWNER';

create view acc_trans_loan_disp_agr as
select  count(client_id), count(trans_id), sum(a.amount) ,status , date from acc_trans a
join loan l using(account_id)
join disp d  using(account_id)
where d.type='OWNER'
group by status, date;


select status, date, sum(amount), count(trans_id), count(client_id) from acc_trans_loan_disp
group by status, date;