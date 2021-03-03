use college;

-- students without enrollments
select s.student_id, e.enrollment_id 
from student s left outer join enrollment e on s.student_id = e.student_id
where e.enrollment_id is null;

select s.student_id, e.enrollment_id 
from student s left outer join enrollment e using (student_id)
where e.enrollment_id is null;

-- KNOW YOUR DATA ---

select c.course_id, e.enrollment_id 
from course c left outer join enrollment e on c.course_id = e.course_id;





