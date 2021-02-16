drop schema if exists college;
create schema college;
use college;

create table student (
	student_id mediumint unsigned primary key,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(100) unique,
    gender char(1),
    date_of_birth date not null
);

create table course (
	course_id smallint unsigned primary key,
    course_code varchar(10) not null,
    course_name varchar(100) not null
);

create table enrollment (
	enrollment_id int primary key,
    student_id mediumint unsigned,
    course_id smallint unsigned, 
    semester varchar(6),
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

