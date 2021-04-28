SELECT @@GLOBAL.sql_mode;
SELECT @@SESSION.sql_mode;

SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select count(Name), Population,
    case 
        when Population < 1000000 then 'Less than one million'
        when Population < 2000000 then 'One to two million'
        when Population < 5000000 then 'Two to five million'
        when Population < 10000000 then 'Five to ten million'
        when Population < 100000000 then 'Ten to hundred million'
        when Population < 1000000000 then 'Hundred million to a billion'
        else 'More than one billion'
    end as 'Population_Description'
From Country
group by Population_Description