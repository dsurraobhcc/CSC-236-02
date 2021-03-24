use sakila;

select * from payment
where payment_date = (
	select max(payment_date) from payment
);

-- get the highest paying customer
select customer_id, sum(amount) as total_payed from payment
group by customer_id
order by total_payed desc limit 1;

-- using with as an alias of a resultset
with customer_totals as (
	select customer_id, sum(amount) as total_payed from payment
	group by customer_id
)
select customer.* from customer
inner join customer_totals on customer.customer_id = customer_totals.customer_id
where total_payed = (select max(total_payed) from customer_totals);

