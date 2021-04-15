use employees;

-- get the salary history 
set @first_name = 'Georgi', @last_name = 'Facello';
select * from employees e
inner join salaries s on e.emp_no = s.emp_no
where e.first_name = @first_name and e.last_name = @last_name;

alter table employees add index `idx_employees_full_name` (last_name, first_name);
alter table employees drop index `idx_employees_full_name`;

alter table employees add index `idx_employees_last_name` (last_name);
alter table employees drop index `idx_employees_last_name`;

alter table employees add index `idx_employees_first_name` (first_name);
alter table employees drop index `idx_employees_first_name`;

select min(from_date), max(to_date) from salaries where to_date != '9999-01-01';


-- get the salary history from 1988 to 1990
set @first_name = 'Georgi', @last_name = 'Facello';
select * from employees e
inner join salaries s on e.emp_no = s.emp_no
where e.first_name = @first_name and e.last_name = @last_name
and s.from_date >= '1988-01-01' and s.to_date <= '1990-12-31';

alter table salaries add index `idx_salaries_dates` (from_date, to_date);
alter table salaries drop index `idx_salaries_dates`;

-- get all salaries between 1988 and 1990
select * from salaries
where from_date >= '1988-01-01' and to_date <= '1990-12-31';

alter table salaries add index `idx_salaries_from_date` (from_date);
alter table salaries drop index `idx_salaries_from_date`;

alter table salaries add index `idx_salaries_to_date` (to_date);
alter table salaries drop index `idx_salaries_to_date`;

show indexes from salaries;


-- salaries by department
select * from departments;

-- which department has the highest payed employees
select d.dept_name, max(s.salary) from departments d
inner join dept_emp de on d.dept_no = de.dept_no
inner join salaries s on de.emp_no = s.emp_no
group by d.dept_name;

alter table departments add index `idx_departments_dept_name` (dept_name);
alter table departments drop index `idx_departments_dept_name`;

alter table salaries add index `idx_salaries_salary` (salary);
alter table salaries drop index `idx_salaries_salary`;

-- who got the highest raises in 1990?


-- department manager history in Quality Management
select concat(e.last_name, ', ', e.first_name), 
	dm.from_date, dm.to_date from dept_manager dm
inner join employees e on dm.emp_no = e.emp_no
where dm.dept_no = 'd006'
order by dm.to_date desc;


select concat(e.last_name, ', ', e.first_name), 
	dm.from_date, dm.to_date from dept_manager dm
inner join employees e on dm.emp_no = e.emp_no
inner join departments d on dm.dept_no = d.dept_no
where d.dept_name = 'Quality Management'
order by dm.to_date desc;

show indexes from departments;

alter table departments drop index `dept_name`;
alter table departments add unique index `dept_name` (dept_name);


show indexes from titles;

show create table titles;
