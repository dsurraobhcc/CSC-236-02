use world;

drop table if exists copy_city;
create table copy_city as select * from city;
select * from copy_city;

-- delete all cities in Europe
select distinct CountryCode from copy_city
inner join country on copy_city.CountryCode = country.Code
where country.Continent = 'Europe';

delete from copy_city
where CountryCode IN (
	select distinct CountryCode from copy_city
	inner join country on copy_city.CountryCode = country.Code
	where country.Continent = 'Europe'
);
/* Error Code: 1093. You can't specify target table 'copy_city' 
for update in FROM clause */

/* workaround using temporary tables */
-- create a temp table storing European country codes
create temporary table europe_codes_tmp
select distinct CountryCode from copy_city
inner join country on copy_city.CountryCode = country.Code
where country.Continent = 'Europe';

select CountryCode from europe_codes_tmp;

delete from copy_city
where CountryCode IN (
	select CountryCode from europe_codes_tmp
);

