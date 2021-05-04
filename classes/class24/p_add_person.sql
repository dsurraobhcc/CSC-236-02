drop schema if exists procedure_tests;
create schema procedure_tests;
use procedure_tests;

create table person (
	id smallint auto_increment primary key,
    last_name varchar(25),
    first_name varchar(25)
);

-- create a procedure to add rows to the above table
delimiter //
	create procedure p_add_person(
		IN i_last_name varchar(25),		-- input
        IN i_first_name varchar(25),	-- input 
        OUT o_person_id smallint		-- output
	)
	begin
		-- insert the row
		insert into person (last_name, first_name)
        values (i_last_name, i_first_name);
        
        -- now get the inserted row's id using the function last_insert_id()
        -- and set the output parameter to it
        select last_insert_id() into o_person_id;
    end //
delimiter ;

-- invoke the stored procedure, store the output 
-- in the @person_id variable
call p_add_person('Shareef', 'Omar', @person_id);

-- view the inserted id
select @person_id;

call p_add_person('Bond', 'James', @person_id);
select @person_id;

call p_add_person('Jones', 'Grace', @person_id);
select @person_id;

-- get all inserted rows
select * from person;



