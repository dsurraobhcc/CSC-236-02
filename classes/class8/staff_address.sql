use sakila;

-- staff address
select s.first_name, 
	s.last_name, 
    a.address, 
    a.district 
from staff s
inner join address a on s.address_id = a.address_id;

-- Get the number of films that are not in English
select f.title, l.name from film f
inner join language l on f.language_id = l.language_id
where l.name <> 'English';

select count(*) from film f
inner join language l on f.language_id = l.language_id
where l.name <> 'English';

-- Get a list of all films available in inventory at the store on '47 MySakila Drive'
select s.store_id, 
	a.address, 
    f.title
from store s
inner join address a on s.address_id = a.address_id
inner join inventory i on s.store_id = i.store_id
inner join film f on i.film_id = f.film_id;

