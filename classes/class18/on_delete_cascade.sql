drop schema if exists on_delete_tests;
create schema on_delete_tests;
use on_delete_tests;

create table parent (
	id int primary key auto_increment,
    full_name varchar(20) not null
);

create table child (
	id int primary key auto_increment,
    parent_id int,
    full_name varchar(20) not null,
    foreign key (parent_id) references parent(id) on delete cascade
);

insert into parent (full_name) values 
	('James'), 
    ('Jill'), 
    ('Bill');
select * from parent;

insert into child (parent_id, full_name) values
	(1, 'James\' Child'),
    (2, 'Jill\'s Child'),
    (3, 'Bill\'s Child');
select * from child;

select * from parent p
inner join child c on p.id = c.parent_id;

delete from parent where full_name = 'Bill';

select * from parent;
select * from child; -- the delete was cascaded

