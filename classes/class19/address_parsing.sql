drop schema if exists address_schema;
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
-- parse full_address into these new columns: use substring_index() 

SELECT SUBSTRING_INDEX(full_address, ',', 1) from address;

alter table address add column address_line_1 varchar(25);

select * from address;

update address set address_line_1 = full_address;
-- Error Code: 1406. Data too long for column 'address_line_1' at row 1

alter table address modify column address_line_1 varchar(200);
-- 3 row(s) affected Records: 3  Duplicates: 0  Warnings: 0

update address set address_line_1 = full_address;

select * from address;

-- SELECT SUBSTRING_INDEX(full_address, ',', 1) from address;
update address set address_line_1 = substring_index(full_address,',',1);

-- add city column
alter table address add column city varchar(50);


set @a = SUBSTRING_INDEX('10 Main Street, Somerville, MA', ',', 2);
select @a;
set @city = substring_index(@a, ',', -1);
select @city;

select trim(substring_index(substring_index(full_address, ',', 2), ',', -1)) 
from address;

-- update city column for all rows
update address
set city = trim(substring_index(substring_index(full_address, ',', 2), ',', -1));

select * from address;






