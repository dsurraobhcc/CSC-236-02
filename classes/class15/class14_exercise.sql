use world;

/*
Use a subquery to get the country with the largest population
Confirm the result using SELECT, ORDER BY, and LIMIT
*/
-- subquery
select Name as country, Population from country
where Population = (select MAX(Population) from country);

-- confirmation
select country.Name, country.Population from country
order by country.Population desc limit 1;

-- Get the country with the lowest population
select Name as country, Population from country
where Population = (
	select min(Population) from country where Population != 0
);

select country.Name, country.Population from country
where Population != 0
order by country.Population asc limit 1;

-- List continents and the largest population in each, use GROUP BY and MAX()
select Continent, max(Population) from country c
group by Continent;

-- spot checking the results
select * from country order by Continent, Population desc;

-- Use the above in a correlated subquery to list the countries 
-- with the largest population in their continent.
-- for each row in the outer query, is its population equal to 
-- the max population for that continent?
select Name, Continent, Population from country c_outer 
where Population = (
	select max(Population) from country c_inner
    where c_inner.Continent = c_outer.Continent -- correlation
	group by Continent
)
and Population != 0;

-- Use a correlated subquery to get countries with the largest surface area 
-- in each continent.
select Name, continent, SurfaceArea from country c_outer 
where SurfaceArea = (
	select max(SurfaceArea) as largestsurface from country c_inner
	where c_inner.continent = c_outer.continent -- corrlation
	group by Continent
);

select Name, continent, SurfaceArea from country c_outer;
/*
'Aruba','North America','193.00'
select max(SurfaceArea) as largestsurface from country c_inner
where c_inner.continent = 'North America'
group by Continent; -- returns 9970610.00
    
'Afghanistan','Asia','652090.00'
select max(SurfaceArea) as largestsurface from country c_inner
where c_inner.continent = 'Asia'
group by Continent; -- returns 9572900.00

'China','Asia','9572900.00' -SELECTED!
select max(SurfaceArea) as largestsurface from country c_inner
where c_inner.continent = 'Asia'
group by Continent; -- returns 9572900.00

'Sudan','Africa','2505813.00' -SELECTED!
select max(SurfaceArea) as largestsurface from country c_inner
where c_inner.continent = 'Africa'
group by Continent; -- returns 2505813.00
*/

-- spot check 
select Name, Continent, SurfaceArea from country 
order by Continent, SurfaceArea desc;

-- Use a correlated subquery to get countries with the smallest surface area 
-- in each continent.
select Name, continent, SurfaceArea from country c_outer 
where SurfaceArea = (
	select min(SurfaceArea) as largestsurface from country c_inner
	where c_inner.continent = c_outer.continent -- corrlation
	group by Continent
);

-- Use a correlated subquery to get countries with above average surface area 
-- in each continent.
select Name, continent, SurfaceArea from country c_outer 
where SurfaceArea > (
	select avg(SurfaceArea) as largestsurface from country c_inner
	where c_inner.continent = c_outer.continent -- corrlation
	group by Continent
);

-- countries with above average surface area, for all countries and continents
select Name, continent, SurfaceArea from country 
where SurfaceArea > (
	select avg(SurfaceArea) from country
);


