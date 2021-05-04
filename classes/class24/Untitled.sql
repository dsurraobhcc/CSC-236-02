use world;

select * from country;

select Code, year(now()) - IndepYear from country
where Code = 'AFG';


