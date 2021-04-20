use employees;

-- get the salary history 
set @first_name = 'Georgi', @last_name = 'Facello';

select * from employees e
inner join salaries s on e.emp_no = s.emp_no
where e.first_name = @first_name and e.last_name = @last_name;
-- 0.150 sec / 0.000015 sec

show indexes from employees;
show indexes from salaries;

select * from salaries;

alter table employees add index `idx_employees_full_name` (last_name, first_name);
-- alter table employees drop index `idx_employees_full_name`;

select * from employees e
inner join salaries s on e.emp_no = s.emp_no
where e.first_name = @first_name and e.last_name = @last_name;
-- 0.0013 sec / 0.000018 sec

-- get the salary history from 1988 to 1990
set @first_name = 'Georgi', @last_name = 'Facello';
select * from employees e
inner join salaries s on e.emp_no = s.emp_no
where e.first_name = @first_name and e.last_name = @last_name
and s.from_date >= '1988-01-01' and s.to_date <= '1990-12-31';
-- 0.00065 sec / 0.000013 sec

-- department manager history in Quality Management
select concat(e.last_name, ', ', e.first_name), 
	dm.from_date, dm.to_date from dept_manager dm
inner join employees e on dm.emp_no = e.emp_no
inner join departments d on dm.dept_no = d.dept_no
where d.dept_name = 'Quality Management'
order by dm.to_date desc;
-- 0.0038 sec / 0.0000098 sec

show indexes from departments;

alter table departments drop index `dept_name`;

explain
select concat(e.last_name, ', ', e.first_name), 
	dm.from_date, dm.to_date from dept_manager dm
inner join employees e on dm.emp_no = e.emp_no
inner join departments d on dm.dept_no = d.dept_no
where d.dept_name = 'Quality Management'
order by dm.to_date desc;
-- 0.0016 sec / 0.000010 sec



-- alter table departments add unique index `dept_name` (dept_name);








