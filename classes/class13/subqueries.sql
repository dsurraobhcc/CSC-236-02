use RecipesExample;

-- EXISTS clause
-- ingredient ids 7 (tomato), 8 (jalapeno)
select * from Recipes
where exists
(select * from Recipe_Ingredients where IngredientID = 7 and RecipeID = Recipes.RecipeID)
and exists
(select * from Recipe_Ingredients where IngredientID = 8 and RecipeID = Recipes.RecipeID);

-- GROUP BY, HAVING
select RecipeID, count(IngredientID) as num_ingr from Recipe_Ingredients
where IngredientID = 7 or IngredientID = 8
group by RecipeID
having num_ingr = 2;

-- GROUP BY multiple columns, HAVING
select Recipes.RecipeID, RecipeTitle, count(IngredientID) as num_ingr from Recipe_Ingredients
inner join Recipes on Recipe_Ingredients.RecipeID = Recipes.RecipeID
where IngredientID = 7 or IngredientID = 8
group by RecipeID, RecipeTitle
having num_ingr = 2;

select igd.IngredientName, count(rcp.RecipeID) from Recipes rcp
inner join Recipe_Ingredients as ri on rcp.RecipeID=ri.RecipeID
inner join Ingredients as igd on ri.IngredientID=igd.IngredientID
inner join Measurements as mm on ri.MeasureAmountID=mm.MeasureAmountID
where igd.IngredientName='Tomato' or igd.IngredientName='Jalapeno' 
group by igd.IngredientName having count(*)>1;




