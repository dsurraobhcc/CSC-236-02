use college;

-- show tables
show tables;

-- get all rows from students
select * from students;

-- the number of rows from students
select count(*) from students;
select count(student_id) from students;

-- all female students
select * from students
where gender = 'F';

-- all students sorted by date_of_birth
select * from students
order by date_of_birth;

-- all students sorted in descending order by date_of_birth
select * from students
order by date_of_birth desc;

-- all male students born after in or after 1996
select * from students
where gender = 'M'
and date_of_birth >= '1996-01-01';

-- students born between 1996 and 2000
select * from students
where date_of_birth between '1996-01-01' and '2000-12-31';

-- the number of male students born in or after 1996
select count(student_id) from students
where gender = 'M'
and date_of_birth >= '1996-01-01'; 

-- first name 'Keith'
select * from students
where first_name = 'Keith';

-- first name 'Keith' and last name 'Richards'
select * from students
where first_name = 'Keith'
and last_name = 'Richards';

-- students whose first name is NOT 'Keith'
select * from students
where first_name != 'Keith';

select * from students
where first_name <> 'Keith';

-- students with first name OR last name 'Keith'
select * from students
where first_name = 'Keith' or last_name = 'Keith';

-- first names starting with 'T'
select first_name from students
where first_name like 't%';

-- first names not starting with 'T'
select first_name from students
where first_name not like 't%';

-- students without date_of_birth specified
select * from students
where date_of_birth is null;

-- students with date_of_birth specified
select * from students
where date_of_birth is not null;

-- don't use != to check for NULLs, it will return an empty set
select * from students
where date_of_birth != null;






