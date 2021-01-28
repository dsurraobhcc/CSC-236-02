use college;

-- populate students table
insert into students 
	values (1234, 'Smith', 'Dave', 'M', '2000-01-01');
insert into students 
	values (1235, 'Kay', 'Mary', 'F', '1995-01-01');

-- populate enrollments table
insert into enrollments
	values (1, 1234, 'CIT-236', 'SQL Programming', 'Spring');
insert into enrollments
	values (2, 1235, 'CIT-129', 'Mobile App Development', 'Spring');
insert into enrollments
	values (2, 1235, 'CIT-236', 'SQL Programming', 'Spring');
    
    