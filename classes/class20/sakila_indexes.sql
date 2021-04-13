use sakila;

select * from actor
where last_name = 'PALTROW';
-- 0.00074 sec / 0.000015 sec

alter table actor drop index `idx_actor_last_name`;

select * from actor
where last_name = 'PALTROW';
-- 0.00048 sec / 0.000011 sec

alter table actor add index `idx_actor_last_name` (last_name);

show indexes from actor;

