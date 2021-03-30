use sakila;

-- create a copy of the film table: does not copy FK constraints
create table copy_film as select * from film;

select * from copy_film;

-- update release year to 2007, for all rows
update copy_film
set release_year = 2007;

-- update rental rate: increase the rate by $1 for all films
select title, rental_rate from copy_film;

update copy_film
set rental_rate = rental_rate + 1;
/*1000 row(s) affected Rows matched: 1000  Changed: 1000  Warnings: 0 */

-- undo the increment
update copy_film
set rental_rate = rental_rate - 1;

/* update using where clause */

-- set the rental rate for all 'PG-13' movies to .99
select title, rental_rate from copy_film 
where rating = 'PG-13'; -- 223 rows

update copy_film
set rental_rate = .99
where rating = 'PG-13'; 
-- 151 row(s) affected Rows matched: 223  Changed: 151  Warnings: 0

-- double checking the result with the original film table
select count(*) from film 
where rating = 'PG-13' and rental_rate = .99;
-- 72 + 151 = 223

-- Double the rental duration for films longer than 120 minutes
select title, rental_duration, length from copy_film
where length > 120; -- 457 rows

update copy_film
set rental_duration = rental_duration * 2
where length > 120;
-- 457 row(s) affected Rows matched: 457  Changed: 457  Warnings: 0

/* 
 Update multiple columns in a single statement
*/
-- increase the rental duration by 2 days, and lower the rental rate by 50 cents
-- for all movies rated G
select title, rental_duration, rental_rate from copy_film
where rating = 'G'; -- 178

update copy_film 
set rental_duration = rental_duration + 2,
	rental_rate = rental_rate - .50 
where rating = 'G';
-- 178 row(s) affected Rows matched: 178  Changed: 178  Warnings: 0


