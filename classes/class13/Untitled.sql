use RecipesExample;

-- Search for all recipes that involve using an oven.
select * from Recipes
where Preparation like '%oven%'
or Notes like '%oven%';

-- EXTRA CHALLENGE!: Get the amount of Guinness that goes into Irish Stew.
