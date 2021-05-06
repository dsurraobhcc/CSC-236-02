use sakila;

select * from film;
-- Error Code: 1142. SELECT command denied to user 
-- 'store1_staff1'@'localhost' for table 'film'

select * from film_list_store1;
