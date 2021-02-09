use college;

-- delete old data
-- truncate table enrollments;
-- truncate table students;

-- populate students table
insert into students (student_id, last_name, first_name, gender, date_of_birth)
	values (1234, 'Smith', 'Dave', 'M', '2000-01-01'),
    (1235, 'Kay', 'Mary', 'F', '1995-01-01'),
	(1236, 'Vance', 'Theresa', 'F', '1995-11-01'),
	(1237, 'Skinner', 'Angela', 'F', '1997-02-02'),
	(1238, 'Burgess', 'Sean', 'M', '1999-09-11'),
	(1239, 'Hart', 'Kevin', 'M', '1997-02-02'),
	(1240, 'Campbell', 'Anthony', 'M', '1997-02-02'),
	(1241, 'Greene', 'Tracey', 'F', '2000-09-12'),
	(1242, 'Mathis', 'Jack', 'M', '2001-11-12'),
	(1243, 'Avery', 'Ian', 'M', '1998-12-15'),
	(1244, 'Tucker', 'Piers', 'M', '1995-05-23'),
	(1245, 'Wilkins', 'Owen', 'M', '2002-06-19'),
	(1246, 'Coleman', 'Yvonne', 'F', '1997-02-02'),
	(1247, 'Morgan', 'Lily', 'F', '1998-03-01'),
	(1248, 'Mathis', 'Fiona', 'F', '1997-08-01'),
	(1249, 'Fraser', 'Michelle', 'F', '1985-07-19'),
	(1250, 'Manning', 'Evan', 'M', '1987-09-02'),
	(1251, 'Burgess', 'Keith', 'M', '1991-11-01'),
    (1252, 'Richards', 'Keith', 'M', '1994-09-01'),
    (1253, 'Keith', 'Jim', 'M', '1994-10-10');

-- populate enrollments table
insert into enrollments (enrollment_id, student_id, course_code, course_name, semester)
	values (1, 1234, 'CSC-236', 'SQL Programming', 'Spring'),
	(2, 1235, 'CSC-129', 'Mobile App Development', 'Spring'),
	(3, 1235, 'CIT-236', 'SQL Programming', 'Spring'),
	(4, 1237, 'CSC-125', 'Python Programming', 'Fall'),
	(5, 1237, 'CSC-225', 'Advanced Python Programming', 'Spring'),
	(6, 1240, 'CSC-236', 'SQL Programming', 'Spring');
    
update students set email = 'test@test.com'
where student_id = 1234;

-- will generate unique constraint error
update students set email = 'test@test.com'
where student_id = 1235;

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`college`.`enrollments`, CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`))
insert into enrollments (enrollment_id, student_id, course_code, course_name, semester)
values (7, 5000, 'CSC-225', 'Advanced Python Programming', 'Spring');


