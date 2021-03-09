use RecipesExample;

/*
SELECT * FROM Recipes INNER JOIN Recipe_Ingredients
select * from Recipe_Ingredients
*/

/*
SELECT Recipes.RecipeTitle, 
	Recipe_Ingredients.IngredientID,
    Ingredients.IngredientName
FROM Recipes
INNER JOIN Recipe_Ingredients
	ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
inner join Ingredients
	on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
where Ingredients.IngredientName IN ('Onion', 'Beef', 'Garlic');
-- WHERE Recipe_Ingredients.IngredientID IN (1, 9)
*/

SELECT Recipes.RecipeTitle, 
	Recipe_Ingredients.IngredientID,
    Ingredients.IngredientName
FROM Recipes
INNER JOIN Recipe_Ingredients
	ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
inner join Ingredients
	on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
where Ingredients.IngredientName = 'Jalapeno'
or Ingredients.IngredientName = 'Tomato';

-- recipes that use more than one ingredient
SELECT Recipes.RecipeTitle, 
	Recipe_Ingredients.IngredientID,
    Ingredients.IngredientName
FROM Recipes
INNER JOIN Recipe_Ingredients
	ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
inner join Ingredients
	on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
where Recipes.RecipeTitle = 'Machos Nachos';

-- recipes that use both 'Jalapeno' and 'Tomato'
SELECT Recipes.RecipeTitle, 
	Recipe_Ingredients.IngredientID,
    Ingredients.IngredientName
FROM Recipes
INNER JOIN Recipe_Ingredients
	ON Recipes.RecipeID = Recipe_Ingredients.RecipeID
inner join Ingredients
	on Recipe_Ingredients.IngredientID = Ingredients.IngredientID
where Ingredients.IngredientName = ('Jalapeno' and 'Tomato');

select rcp.RecipeID, rcp.RecipeTitle, igd.IngredientName, ri.Amount, mm.MeasurementDescription from Recipes rcp
inner join Recipe_Ingredients as ri on rcp.RecipeID=ri.RecipeID
inner join Ingredients as igd on ri.IngredientID=igd.IngredientID
inner join Measurements as mm on ri.MeasureAmountID=mm.MeasureAmountID
where igd.IngredientName='Tomato' and igd.IngredientName='Jalapeno' ;

select * from Ingredients;

-- EXISTS clause
-- ingredient ids 7 (tomato), 8 (jalapeno)
select * from Recipes
where exists
(
	-- SUBQUERY for tomato
	select * from Recipe_Ingredients
	where IngredientID = 7
    and RecipeID = Recipes.RecipeID
)
and exists
(
	-- SUBQUERY for jalapeno
	select * from Recipe_Ingredients
	where IngredientID = 8
    and RecipeID = Recipes.RecipeID
);


