drop database if exists house_price_regression;

CREATE database house_price_regression;

use house_price_regression;


DROP TABLE IF EXISTS house_price_data;

CREATE TABLE house_price_data(
id VARCHAR(30) NOT NULL,
`date` VARCHAR(12) default NULL,
bedrooms int(3) DEFAULT NULL,
bathrooms float DEFAULT NULL,
sqft_living int(6) DEFAULT NULL,
sqft_lot int(8) DEFAULT NULL,
floors float DEFAULT NULL,
waterfront int(1) DEFAULT NULL,
view int(3) DEFAULT NULL,
`condition` int(1) DEFAULT NULL,
grade int(3) DEFAULT NULL,
sqft_above int(6) DEFAULT NULL,
sqft_basement int(6) DEFAULT NULL,
yr_built int(4) DEFAULT NULL,
yr_renovated int(4) DEFAULT NULL,
zipcode int(5) DEFAULT NULL,
lat float DEFAULT NULL,
`long` float DEFAULT NULL,
sqft_living15 int(6) DEFAULT NULL,
sqft_lot15 int(8) DEFAULT NULL,
price int(8) DEFAULT NULL
);

SHOW VARIABLES LIKE 'local_infile'; -- This query would show you the status of the variable ‘local_infile’. If it is off, use the next command, otherwise you should be good to go

SET GLOBAL local_infile = 1;


SELECT * FROM information_schema.user_privileges;

-- we had to use OPT_LOCAL_INFILE=1 to edit the conection (in advanced) so we could be able to use the load data local infile (by Federica)


LOAD DATA LOCAL INFILE 'C://Users//Krop//Documents//Ironhack//IronPau//week5//Project//regression_data.csv' 
INTO TABLE house_price_data FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';

select * from house_price_data;


ALTER TABLE house_price_data DROP COLUMN `date`;

select * from house_price_data
limit 10;

SELECT COUNT(*)
FROM house_price_data;

SELECT
DISTINCT bedrooms
FROM house_price_data;

SELECT
DISTINCT  bathrooms
FROM house_price_data;

SELECT
DISTINCT  floors
FROM house_price_data;

SELECT
DISTINCT  `condition`
FROM house_price_data;

SELECT
DISTINCT  grade
FROM house_price_data;


select * from house_price_data
order by price desc
limit 10;


select avg(price) from house_price_data;



select bedrooms, avg(price) as Average_Price from house_price_data
group by bedrooms;

select bedrooms, avg(sqft_living) as Average_Sqft_living from house_price_data
group by bedrooms;

select waterfront, avg(price) as Average_Price from house_price_data
group by waterfront;

select grade, avg(`condition`) as Average_Condition from house_price_data
group by grade;


select `condition`, avg(grade) as Average_Grade from house_price_data
group by `condition`;

-- There seems to be some correlation when we group by condition (maybe because we have enougth values) but there is no visible correlation the other way arround

select id, bedrooms, bathrooms, floors, waterfront, `condition`, grade, price from house_price_data
where 
(bedrooms = 3
AND bathrooms > 3.0
AND floors = 1.0
AND waterfront = 0
AND `condition` >= 3
AND grade >= 5 
AND price <= 300000)
OR  
(bedrooms = 4
AND bathrooms > 3.0
AND floors = 1.0
AND waterfront = 0
AND `condition` >= 3
AND grade >= 5 
AND price <= 300000);

-- I just made more long code to make it more clear as I m not geting results for the query


select avg(price) as Avg_price from house_price_data;


select id, price from house_price_data
where price >= 2*(select avg(price) as Avg_price from house_price_data);


create view Double_avg_price as
select id, price from house_price_data
where price >= 2*(select avg(price) as Avg_price from house_price_data);


select bedrooms, avg(price) as Average_Price from house_price_data
where (bedrooms=3) or (bedrooms=4)
group by bedrooms;


select t2.Avg_pr_b4-t1.Avg_pr_b3 as Dif_avg_pr from 
(select avg(price) as Avg_pr_b3 from house_price_data
where (bedrooms=3)
group by bedrooms) as t1, 
(select avg(price) as Avg_pr_b4 from house_price_data
where (bedrooms=4)
group by bedrooms) as t2;


select distinct zipcode from house_price_data;


select id from house_price_data
where yr_renovated!= 0;


select *, rank()over(order by price desc) as Rank_price from house_price_data;

select * from 
(select *, rank()over(order by price desc) as Rank_price from house_price_data
limit 11) s
where Rank_price=11;
