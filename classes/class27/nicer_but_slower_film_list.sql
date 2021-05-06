SELECT film.film_id AS FID, film.title AS title, film.description AS description, 
	category.name AS category, film.rental_rate AS price,
	film.length AS length, film.rating AS rating, 
    GROUP_CONCAT(CONCAT(CONCAT(UCASE(SUBSTR(actor.first_name,1,1)),
		LCASE(SUBSTR(actor.first_name,2,LENGTH(actor.first_name)))
		,_utf8mb4' ',CONCAT(UCASE(SUBSTR(actor.last_name,1,1)),
	LCASE(SUBSTR(actor.last_name,2,LENGTH(actor.last_name)))))) SEPARATOR ', ') AS actors
FROM category LEFT JOIN film_category ON category.category_id = film_category.category_id LEFT JOIN film ON film_category.film_id = film.film_id
        JOIN film_actor ON film.film_id = film_actor.film_id
	JOIN actor ON film_actor.actor_id = actor.actor_id
GROUP BY film.film_id, category.name;

-- formatting of names
select CONCAT(UCASE(SUBSTR(first_name,1,1)),
	LCASE(SUBSTR(first_name,2,LENGTH(actor.first_name))))
from actor;

-- group_concat()
select f.title, 
	group_concat(a.first_name, ' ', a.last_name) as actors
from film f
inner join film_actor fa on f.film_id = fa.film_id
inner join actor a on fa.actor_id = a.actor_id
group by f.title
order by f.title;

