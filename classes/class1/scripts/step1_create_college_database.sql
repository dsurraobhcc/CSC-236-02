drop schema if exists college;
create schema college;
use college;

create table students (
	student_id int,
    last_name varchar(50),
    first_name varchar(50),
    gender char(1),
    date_of_birth date
);

create table enrollments (
	enrollment_id int,
    student_id int,
    course_code varchar(10),
    course_name varchar(100),
    semester varchar(6)
);


