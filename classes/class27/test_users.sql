use RecipesExample;

select * from Ingredients;

update Ingredients set IngredientName = 'Onions'
where IngredientName = 'Onion';

-- Error Code: 1142. UPDATE command denied to user 
-- 'dominic_recipes_readonly'@'localhost' for table 'ingredients'
