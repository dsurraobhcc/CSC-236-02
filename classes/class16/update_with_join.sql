use sakila;

select * from category;

-- update all horror films to 'R' (except 'NC-17')

select f.film_id, f.title, f.rating, c.name from copy_film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c.name = 'Horror'
and f.rating != 'NC-17'; -- 49 rows


update copy_film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
set f.rating = 'R'
where c.name = 'Horror'
and f.rating != 'NC-17';
-- 35 row(s) affected Rows matched: 49  Changed: 35  Warnings: 0

-- check result
select f.film_id, f.title, f.rating, c.name from copy_film f
inner join film_category fc on f.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id
where c.name = 'Horror'
order by f.rating;





