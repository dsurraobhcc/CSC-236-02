drop schema if exists savepoint_tests;
create schema savepoint_tests;
use savepoint_tests;

create table pharmacy (
	id int primary key auto_increment,
    pharmacy_name varchar(25)
);

insert into pharmacy (pharmacy_name) values ('CVS');
insert into pharmacy (pharmacy_name) values ('Walgreens');

select * from pharmacy;

-- Create a named savepoint 'mysavepoint1'
savepoint mysavepoint1;
insert into pharmacy (pharmacy_name) values ('Rite-Aid');
insert into pharmacy (pharmacy_name) values ('BMC');
select * from pharmacy;
rollback to mysavepoint1;

-- remove the savepoint
release savepoint mysavepoint1;

-- Only CVS and Walgreens are returned
select * from pharmacy;


