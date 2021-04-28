-- Conditional statements: CASE..WHEN, IF

use world;

select Name, Population from country
order by Population;

-- group countries into bins by population
-- add a group by 'Population Description' using count() 
-- showing number of countries in each bin
select count(Name),
    case 
        when Population < 1000000 then 'Less than one million'
        when Population < 2000000 then 'One to two million'
        when Population < 5000000 then 'Two to five million'
        when Population < 10000000 then 'Five to ten million'
        when Population < 100000000 then 'Ten to hundred million'
        when Population < 1000000000 then 'Hundred million to a billion'
        else 'More than one billion'
    end as 'Population_Description'
From Country
group by Population_Description;
-- Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause 
-- and contains nonaggregated column 'world.Country.Population' 
-- which is not functionally dependent on columns in GROUP BY clause; 
-- this is incompatible with sql_mode=only_full_group_by

-- IF
select avg(LifeExpectancy) from country;

select Name, 
	LifeExpectancy,
	if (LifeExpectancy >= 66.48604, 'Average or above average', 'Below average')
from country;

select Name, 
	LifeExpectancy,
	if (LifeExpectancy >= (select avg(LifeExpectancy) from country), 
		'Average or above average', 'Below average')
from country;

select count(*),
	if (LifeExpectancy >= (select avg(LifeExpectancy) from country), 
		'Average or above average', 'Below average') as LifeExpectancyCategory
from country
group by LifeExpectancyCategory;

select Name, IndepYear from country;

select Name, IndepYear, if(IndepYear > 1900, 
	'Independence in the 20th century',
    'Independence before the 20th century or unknown')
from country;

-- rewrite the above as a CASE statement with 3 categories:
-- 'Independence in the 20th century',
-- 'Independence before the 20th century'
-- 'Unknown'
select Name, IndepYear,
case 
	when IndepYear > 1900 then 'Independent in the 20th century'
    when IndepYear < 1900 then 'Independent before the 20th century'
    else 'Unknown'
    end as 'Description'
from country;

-- IF
select Name, ifnull(IndepYear, 'Independence year unknown') as 'Independence Year'
from country;

