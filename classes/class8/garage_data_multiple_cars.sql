use garage;

-- Error Code: 1136. Column count doesn't match value count at row 1

-- populate tables with data
insert into car_owner (owner_id, last_name, first_name)
values (1, 'Jones', 'Bob');
insert into car_owner (owner_id, last_name, first_name)
values (2, 'Roberts', 'Jean');
insert into car_owner (owner_id, last_name, first_name)
values (3, 'So', 'Sally');
insert into car_owner (owner_id, last_name, first_name)
values (4, 'Lin', 'Jerry');

-- truncate table car;

insert into car (car_id, owner_id, make, model, car_year)
values (10, 3, 'Toyota', 'Camry', 2019),
 (20, 2, 'Honda', 'Civic', 2018),
 (30, 1, 'Mazda', 'CX-5', 2020),
 (40, 4, 'Ford', 'Focus', 2017);
 
insert into car (car_id, owner_id, make, model, car_year)
values (50, 1, 'Hyundai', 'Elantra', 2019);

select concat(co.first_name, ' ', co.last_name),
	c.make, c.model, c.car_year
from car_owner co
inner join car c on co.owner_id = c.owner_id;


