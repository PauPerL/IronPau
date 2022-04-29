


-- DDL 
# CREATE ALTER DROP TRUNCATE RENAME UPDATE


#primer creem la database
drop database if exists booksauthors; #aixo per asegurarnos de que no hi ha una db ja amb aquest nom
CREATE database booksauthors;

use booksauthors;


#ara comencem a definir les columnes de una taula
drop table if exists authors;
create table authors
(
author_id INT auto_increment NOT NULL,
authorname VARCHAR(30) default NULL,
country VARCHAR(30) default NULL,
primary key (author_id)
);

#creating another table inside the db
drop table books;
create table books
(
book_id INT auto_increment NOT NULL,
author_id int not null,
bookname VARCHAR(50) default NULL,
primary key (book_id),
key idx_fk_author_id(author_id), #todo esto es para hacer la foreging key
constraint fk_author_id foreign key(author_id)
references authors(author_id) on delete restrict on update cascade
);

#populate with data
insert into authors(authorname, country)
Values('unkown','sumeria'),('Terry Pratchet','UK'),('John Reed','USA'),('Ernest Hemingway','USA'),('Douglas Hofstadter','USA'),('JRR Tolkien','Sudafrica');

#UPDATE  authors set country='britain' where author_id in(2,4,5)

#aqui añadimos una linia mas
insert into authors(authorname, country)
Values('Virginie Despentes','Francia');

#ahora hacemos los libros
insert into books(author_id, bookname)
Values(1,'El poema de Gilgamesh'),(2,'El color de la magia'),(3,'Diez dias que estremecieron el mundo'),
(4,'Por quien doblan las campanas'),(5,'Godel, Escher, Bach: an eternal golden braid'),(6,'El silmarillion'),(7,'Teoria king kong');


#probemos hacer joins

select * from books
right join authors
using(author_id);


#CTES - common table expressions
#subqueries
#views
#more window fx


#create view
use bank;

drop view clients_loan_combo;

CREATE OR REPLACE VIEW clients_loan_combo AS
    SELECT 
        c.client_id,
        c.district_id,
        l.loan_id,
        l.status,
        l.amount,
        l.duration,
        l.payments,
        l.date AS loan_date
    FROM
        client c
            LEFT JOIN
        disp dp USING (client_id)
            LEFT JOIN
        account a USING (account_id)
            LEFT JOIN
        loan l USING (account_id)
    WHERE
        dp.type = 'OWNER';


#subqueries = a query inside a query

-- step 2 outer query 
-- step 1 (inner query) -check it


#per exmple primer porbem el inner query
SELECT 
    AVG(amount)
FROM
    loan;

#i ara mirem de ferho com a subquery de lo que volem en general
SELECT 
    *
FROM
    loan
WHERE
    amount > (SELECT 
            AVG(amount) FROM loan);
            
# one value (>=) , a column of values (IN), a table of values (subquerys needs an alias)



#CTE's - we want to join x+y but x does not exist
-- transactions table - get the total amount for each account and any axx info
-- then draw on tat tabl to get information
-- use the table to join to another table


with cte_trans as 
(select ....
)
select ct.field , ct.field, ct.field
from cte_trans as ct;


#ejemplo

-- get the biggest and smallest trans
-- wtih trans id for those transaction

select max(amount), trans_id from trans
where amount != 0
group by trans_id;



with cte_loan as (select * from loan)
select loan_id from cte_loan 
where status ='B';

