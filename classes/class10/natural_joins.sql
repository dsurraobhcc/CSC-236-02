use college;

select * from enrollment e
inner join student s on e.student_id = s.student_id;

select enrollment_id, student_id from enrollment inner join student 
using (student_id);

select * from enrollment natural join student;