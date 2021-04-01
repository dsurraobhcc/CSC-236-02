use world;

create table copy_city as select * from city;

select * from copy_city; -- 2314 rows

-- delete cities in Argentina
select distinct CountryCode, country.Name from copy_city
inner join country on copy_city.CountryCode = country.Code;

-- always verify the rows you are going to update or delete!
select * from copy_city
where CountryCode = 'ARG'; -- 57 rows

delete from copy_city
where CountryCode = 'ARG'; -- 57 row(s) affected

-- delete all cities in Europe

-- get all cities in Europe
select distinct CountryCode, 
	country.Name,
    country.Continent
from copy_city
inner join country on copy_city.CountryCode = country.Code;

select distinct CountryCode from city
inner join country on city.CountryCode = country.Code
where country.Continent = 'Europe';

delete from copy_city
where CountryCode IN (
	-- country code is for a European country
	select distinct CountryCode from city
	inner join country on city.CountryCode = country.Code
	where country.Continent = 'Europe'
);
-- 841 row(s) affected

select distinct CountryCode from copy_city
inner join country on copy_city.CountryCode = country.Code
where country.Continent = 'Europe';




