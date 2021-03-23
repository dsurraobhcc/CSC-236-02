use RecipesExample;

-- 1: Exists - Get all recipes that DO NOT use onions
-- using a common table expression Onion_Recipes
with Onion_Recipes as (
		select Recipes.* from Recipes
		inner join Recipe_Ingredients 
			on Recipes.RecipeID = Recipe_Ingredients.RecipeID
		inner join Ingredients 
			on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
		where Ingredients.IngredientName = 'Onion'
	)
select * from Recipes
where not exists (
	select * from Onion_Recipes
    where Onion_Recipes.RecipeID = Recipes.RecipeID
);

-- 2: Get all recipes that use spices
with Spice_Ingredients as (
	select Ingredients.* from Ingredients
    inner join Ingredient_Classes 
		on Ingredients.IngredientClassID = Ingredient_Classes.IngredientClassID
	where Ingredient_Classes.IngredientClassDescription = 'Spice'
)
select * from Recipes
where exists (
	select * from Recipe_Ingredients
    inner join Spice_Ingredients 
		on Recipe_Ingredients.IngredientID = Spice_Ingredients.IngredientID
	where Recipe_Ingredients.RecipeID = Recipes.RecipeID
);

-- 2: Get all recipes that do not use spices
-- do as an exercise

