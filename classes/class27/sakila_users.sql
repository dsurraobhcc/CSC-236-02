use sakila;

-- listing films by store
create view film_list_store1 as
select distinct film_list.* from film_list
inner join inventory on film_list.FID = inventory.film_id
where store_id = 1;

select * from film_list_store1;

-- create a staff member in store 1
create user 'store1_staff1'@'localhost' identified by 'password';
grant select on film_list_store1 to 'store1_staff1'@'localhost';

