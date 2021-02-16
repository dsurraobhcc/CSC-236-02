use college;

select * from student
where student_id = 1235;

select * from enrollment
where student_id = 1235;

select * from course
where course_id in (10, 40);
-- where course_id = 10 or course_id = 40;

-- tablename.columnname
select * from enrollment 
inner join course on enrollment.course_id = course.course_id
where enrollment.student_id = 1235;

select enrollment.enrollment_id, 
    course.course_id
from enrollment 
inner join course on enrollment.course_id = course.course_id
where enrollment.student_id = 1235;

select course.course_name from course 
inner join enrollment on course.course_id = enrollment.course_id
inner join student on enrollment.student_id = student.student_id
where student.last_name = 'Kay'
and student.first_name = 'Mary';


