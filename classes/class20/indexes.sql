/*
NOTE: This program may run for more than 30 seconds.

Before executing it, modify this setting to, say, 300 seconds:

MySQLWorkbench > Preferences > SQL Editor 
	> DBMS connection read timeout interval (in seconds)
*/

drop schema if exists index_tests;
create schema index_tests;
use index_tests;

create table large_table_1 (
	id int primary key,
    code varchar(20),
    index `idx_code` (`code`)
);

-- create a stored procedure to populate the above table

delimiter //

create procedure populate_large_table()
begin
	set @count = 0;
    
    while @count <= 1000000 do
		set @count = @count + 1;
        insert into large_table_1 (id, code)
		values (@count, concat('code', @count));
    end while;
end;
//

delimiter ;

-- call the procedure to populate the table with a million rows
-- this may take a few minutes to run
call populate_large_table();

select count(*) from large_table_1;

-- select a row by code, and look at performance of the query
select * from large_table_1
where code = 'code9999';
-- Duration/Fetch Time: 0.00039 sec / 0.0000072 sec

alter table large_table_1 drop key `idx_code`;

select * from large_table_1
where code = 'code9999';
-- Duration/Fetch Time: 0.254 sec / 0.0000069 sec

-- NOTICE THE DIFFERENCE IN PERFORMANCE AFTER THE INDEX IS DROPPED!!!



