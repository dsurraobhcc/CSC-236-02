use world;

select * from country;

select Code, year(now()) - IndepYear from country
where Code = 'AFG';

select udf_calculate_years_of_independence('USA');

select Code, Name, IndepYear, 
	udf_calculate_years_of_independence(Name) as YearsSinceIndep
from country
where IndepYear is not null;

select udf_calculate_years_of_independence_by_name('United States');

select udf_calculate_square(3);

