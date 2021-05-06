use world;

drop function if exists udf_calculate_years_of_independence;

delimiter //

create function udf_calculate_years_of_independence(country_code char(3))
returns smallint
	reads sql data
begin
	declare v_years smallint;
    
	select year(now()) - IndepYear into v_years from country
    where Code = country_code;
    
    return v_years;
end//

delimiter ;