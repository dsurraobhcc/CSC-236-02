use RecipesExample;

explain
select * from Ingredients
inner join Recipe_Ingredients using (IngredientID);

-- no full table scans
explain
select * from Ingredients
where IngredientID in (select IngredientID from Recipe_Ingredients);
