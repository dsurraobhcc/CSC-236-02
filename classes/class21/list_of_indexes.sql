use sakila;

show indexes from film;

SELECT DISTINCT
    TABLE_NAME,
INDEX_NAME
FROM INFORMATION_SCHEMA.STATISTICS 
WHERE TABLE_SCHEMA = 'sakila';

-- size of databases
SELECT 
    table_schema 'Database Name',
    SUM(data_length + index_length) 'Size in Bytes',
    ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) 'Size in MiB'
FROM information_schema.tables 
GROUP BY table_schema;

select table_schema, sum(data_length), sum(index_length) 
from information_schema.tables 
GROUP BY table_schema
having table_schema = 'sakila';
-- Error Code: 1054. Unknown column 'table_schema' in 'having clause'




