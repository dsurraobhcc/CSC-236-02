use sakila;

select max(amount), min(amount), avg(amount), sum(amount) from payment;

-- get the most recent payment date
select max(payment_date) from payment;

-- get the first payment date
select min(payment_date) from payment;

-- get all payments on the most recent payment date
select * from payment
where payment_date = (
	select max(payment_date) from payment
);

-- get all payments that were above average
select * from payment
where amount > (
	select avg(amount) from payment
);

-- get all aggregates GROUPED BY customer
select customer_id, 
	max(amount) as maximum_payed, 
	min(amount) as minimum_payed, 
    avg(amount) as average_payed, 
    sum(amount) as total_payed,
    max(payment_date) as most_recent_payment_date,
    min(payment_date) as first_payment_date
from payment
group by customer_id;

-- get the count of films grouped by rating
select rating, count(film_id) from film
group by rating
order by rating;

-- get the count of films grouped by rating AND special_features
-- NOTE: all group by columns need to be in the SELECT statement!
select rating, special_features, count(film_id) from film
group by rating, special_features
order by rating;

-- using a group by with a join
-- NOTE: this is not accurate geographic data
select country.country, count(city_id) as number_of_cities from city
inner join country on city.country_id = country.country_id
group by country;

-- get the recipe with the largest title
use RecipesExample;

select * from Recipes
where length(RecipeTitle) = (
	select max(length(RecipeTitle)) from Recipes
);


