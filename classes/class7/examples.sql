use college;

/*
Which statement selects students sorted by last name and then first name?
*/
select * from student
order by last_name asc, first_name desc;

-- implicit inner join
select * from student
join enrollment 
	on student.student_id = enrollment.student_id;

select student.last_name,
	student.first_name,
    enrollment.semester,
    course.course_name
from student
inner join enrollment 
	on student.student_id = enrollment.student_id
inner join course
	on enrollment.course_id = course.course_id
where student.last_name = 'Kay';

-- aliases
select s.last_name,
	s.first_name,
    s.date_of_birth,
    e.semester 
from student s
inner join enrollment e
	on s.student_id = e.student_id;
    
select s.last_name,
	s.first_name,
    e.semester,
    c.course_name
from student s
inner join enrollment e
	on s.student_id = e.student_id
inner join course c
	on e.course_id = c.course_id
where s.last_name = 'Kay';

select concat(s.first_name, ' ', s.last_name),
    e.semester,
    c.course_name
from student s
inner join enrollment e
	on s.student_id = e.student_id
inner join course c
	on e.course_id = c.course_id;

-- alias column names
select concat(s.first_name, ' ', s.last_name) as student_name,
	c.course_name,
    	e.semester
from student s
inner join enrollment e
	on s.student_id = e.student_id
inner join course c
	on e.course_id = c.course_id
where e.semester = 'Spring'
order by s.first_name, s.last_name;

