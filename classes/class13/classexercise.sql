use RecipesExample;

-- Search for all recipes that involve using an oven.
select * from Recipes
where Preparation like '%oven%'
or Notes like '%oven%';

-- EXTRA CHALLENGE!: Get the amount of Guinness that goes into Irish Stew.
select concat(ri.Amount, ' ', m.MeasurementDescription) as amount from Recipes r
inner join Recipe_Ingredients ri on r.RecipeID = ri.RecipeID
inner join Ingredients i on ri.IngredientID = i.IngredientID
inner join Measurements m on ri.MeasureAmountID = m.MeasureAmountID
where r.RecipeTitle = 'Irish Stew'
and i.IngredientName = 'Guinness Beer';

