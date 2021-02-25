use sakila;

-- films that don't have inventory
select f.film_id, i.inventory_id 
from film f left outer join inventory i on f.film_id = i.film_id
where i.inventory_id is null;

select f.film_id, i.inventory_id 
from film f right outer join inventory i on f.film_id = i.film_id;
