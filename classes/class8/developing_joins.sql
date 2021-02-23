use sakila;

-- ace goldfinger
select * from film; -- film 2

-- actors in film id 2
select * from film_actor
where film_id = 2;

select * from actor
where actor_id in (19, 85, 90, 160);

-- Narrow down the column list to get all actors who were in 'ace goldfinger' 
-- query with a single join
select f.title, a.first_name, a.last_name from film f
inner join film_actor fa on f.film_id = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
where f.title = 'ACE GOLDFINGER'; 

