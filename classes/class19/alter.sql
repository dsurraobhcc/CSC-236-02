drop schema if exists online_orders_alter;
create schema online_orders_alter;
use online_orders_alter;

create table customer (
	customer_id mediumint,
    last_name varchar(25),
    first_name varchar(25),
    middle_initial char(1)
);

-- add an email column
alter table customer add column email varchar(100) not null;

-- add a primary key, make it auto increment
alter table customer modify column customer_id mediumint auto_increment,
	add primary key (customer_id);
    
-- insert some data
insert into customer (last_name, first_name, middle_initial, email)
values ('Mohan', 'Ram', 'A', 'rm@test.com'),
	('Jones', 'Sue', null, 'sj@test.com'),
    ('Ko', 'Marie', 'H', 'mko@test.com'),
    ('White', 'Barry', 'M', 'bw@testing.com'),
    ('Monster', 'Cookie', null, 'cm@sesamestreet.com');

select * from customer;

-- add not null constraints for last_name, first_name
alter table customer modify column last_name varchar(25) not null;
alter table customer modify column first_name varchar(25) not null;

-- try to make MI not null
alter table customer modify column middle_initial char(1) not null;
-- Error Code: 1138. Invalid use of NULL value
-- try using an update command to fill in null values and re-run above

-- replace middle initial with middle name 

-- add middle name
alter table customer add column middle_name varchar(25);

-- copy middle initial to middle name
update customer set middle_name = middle_initial;

-- drop middle initial
alter table customer drop column middle_initial;
-- alter table customer drop middle_initial;

-- change of order of middle initial in a resultset
alter table customer modify column middle_name varchar(25) after first_name;

-- verify updates
select * from customer;






