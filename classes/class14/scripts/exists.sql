use RecipesExample;

-- 1: Get all recipes that use onions
select * from Recipes
inner join Recipe_Ingredients 
	on Recipes.RecipeID = Recipe_Ingredients.RecipeID
inner join Ingredients 
	on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
where Ingredients.IngredientName = 'Onion';

-- 2: Exists - Get all recipes that use onions
-- This query produces same result as #2
-- Note the filter clause in the inner subquery
--   and Recipe_Ingredients.RecipeID = Recipes.RecipeID
select * from Recipes 
where exists (
	select * from Recipe_Ingredients 
	inner join Ingredients 
		on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
	where Ingredients.IngredientName = 'Onion'
    and Recipe_Ingredients.RecipeID = Recipes.RecipeID
);

-- 3: Not Exists - Get all recipes that DO NOT use onions
-- Notice that it does not include any results from #2
select * from Recipes 
where not exists (
	select * from Recipe_Ingredients 
	inner join Ingredients 
		on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
	where Ingredients.IngredientName = 'Onion'
    and Recipe_Ingredients.RecipeID = Recipes.RecipeID
);

-- 4: Get all recipes that use ingredients other than onions
-- THIS IS NOT THE SAME AS #3!!!
select distinct Recipes.* from Recipes
inner join Recipe_Ingredients 
	on Recipes.RecipeID = Recipe_Ingredients.RecipeID
inner join Ingredients 
	on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
where Ingredients.IngredientName <> 'Onion';


