use sakila;

drop table if exists copy_film;
create table copy_film as select * from film;
select * from copy_film;

-- update all action films by setting the rating to 'R'

-- get all action films
select f.film_id, f.title, f.rating, c.name from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c.name = 'Action';

select distinct f.film_id from film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c.name = 'Action';

update copy_film
set rating = 'R'
where film_id IN (
	select f.film_id from film f
	inner join film_category fc on f.film_id = fc.film_id
	inner join category c on fc.category_id = c.category_id
	where c.name = 'Action'
);
-- 50 rows updated

-- double check result: should return empty resultset
select f.film_id, f.title, f.rating, c.name from copy_film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c.name = 'Action'
and f.rating != 'R';



