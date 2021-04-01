use sakila;

drop table if exists copy_film;

-- creates an empty table
create table copy_film like film;

-- add data rows to the table
insert into copy_film
select * from film;

select * from copy_film;

-- delete all rows: BE CAREFUL!!!
delete from copy_film;
truncate table copy_film;

insert into copy_film
select * from film;




