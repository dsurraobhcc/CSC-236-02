drop function if exists udf_calculate_square;

delimiter //

create function udf_calculate_square(num int)
returns smallint
	deterministic
begin
    return num*num;
end//

delimiter ;