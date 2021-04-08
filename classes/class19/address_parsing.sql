drop schema if exists address_schema;
create schema address_schema;
use address_schema;

create table address (
	full_address varchar(500)
);

insert into address values 
	('123 ABC Lane, Boston, MA 02114'),
    ('10 Main Street, Somerville, MA'),
    ('10 Wall Street,New York, NY');
    
select * from address;

-- create columns: address_line_1, city, state, zip
-- parse full_address into these new columns
