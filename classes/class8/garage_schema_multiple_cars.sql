drop schema if exists garage;
create schema garage;
use garage;

-- create tables
create table car_owner (
	owner_id int unsigned primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null
);

create table car (
	car_id int unsigned primary key,
    owner_id int unsigned,
    make varchar(50) not null,
    model varchar(50) not null,
    car_year year(4) not null,
	foreign key (owner_id) references car_owner(owner_id) on delete cascade
);






