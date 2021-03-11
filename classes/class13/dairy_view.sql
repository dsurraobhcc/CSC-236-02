use RecipesExample;

create view v_recipes_with_dairy as
SELECT DISTINCT r.RecipeTitle FROM Recipes r INNER JOIN Recipe_Ingredients ri
ON r.RecipeID = ri.RecipeID INNER JOIN Ingredients i
ON ri.IngredientID = i.IngredientID INNER JOIN Ingredient_Classes ic
ON i.IngredientClassID = ic.IngredientClassID WHERE ic.IngredientClassDescription = 'Dairy';
