create user 'dominic_recipes'@'localhost' identified by 'password';
create user 'dominic_recipes_readonly'@'localhost' identified by 'password';

grant all on RecipesExample.* to 'dominic_recipes'@'localhost';
grant select on RecipesExample.* to 'dominic_recipes_readonly'@'localhost';

GRANT SELECT ON performance_schema.user_variables_by_thread 
	TO 'dominic_recipes'@'localhost'; 
GRANT SELECT ON performance_schema.user_variables_by_thread 
	TO 'dominic_recipes_readonly'@'localhost'; 
