drop schema if exists self_join_test;
create schema self_join_test;
use self_join_test;

create table person (
	`id` tinyint,
    `name` varchar(20)
);

insert into person values (1, 'Bob'), (2, 'Bob\'s dad');

select * from person;

alter table person add column `parent_id` tinyint;

alter table person add constraint primary key (`id`);

alter table person add constraint foreign key (`parent_id`) 
	references person(`id`);
-- Error Code: 1822. Failed to add the foreign key constraint. 
-- Missing index for constraint 'person_ibfk_1' in the referenced table 'person'

describe person;

select * from person;

-- update data
update person set parent_id = 20 where name = 'Bob';

select * from person;

