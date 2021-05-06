use world;

drop function if exists udf_calculate_years_of_independence_by_name;

delimiter //

create function udf_calculate_years_of_independence_by_name(country_name char(52))
returns smallint
	reads sql data
begin
	declare v_years smallint;
    
	select year(now()) - IndepYear into v_years from country
    where Name = country_name;
    
    return v_years;
end//

delimiter ;