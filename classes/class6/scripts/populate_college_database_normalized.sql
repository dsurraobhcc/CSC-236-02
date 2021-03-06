use college;

-- populate student table
insert into student (student_id, last_name, first_name, gender, date_of_birth)
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
    
-- populating course table
insert into course (course_id, course_code, course_name)
values (10, 'CSC-129', 'Mobile App Development'),
	(20, 'CSC-125', 'Python Programming'),
    (30, 'CSC-225', 'Advanced Python Programming'),
    (40, 'CSC-236', 'SQL Programming');
    
-- populate enrollment table
insert into enrollment (enrollment_id, student_id, course_id, semester)
	values (1, 1234, 40, 'Spring'),
	(2, 1235, 10, 'Spring'),
	(3, 1235, 40, 'Spring'),
	(4, 1237, 20, 'Fall'),
	(5, 1237, 30, 'Spring'),
	(6, 1240, 40, 'Spring');
    

    


