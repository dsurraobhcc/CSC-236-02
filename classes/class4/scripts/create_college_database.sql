drop schema if exists college;
create schema college;
use college;

create table students (
	student_id int primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(100) unique,
    gender char(1),
    date_of_birth date not null
);

create table enrollments (
	enrollment_id int primary key,
    student_id int,
    course_code varchar(10) not null,
    course_name varchar(100) not null,
    semester varchar(6),
    foreign key (student_id) references students(student_id)
);


