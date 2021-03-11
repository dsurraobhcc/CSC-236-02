drop schema if exists data_type_tests;
create schema data_type_tests;
use data_type_tests;

/* numeric types test */
create table numeric_test (
	float_val_1 float(5,2),
    decimal_val_1 decimal(5,2),
    float_val_2 float(7,4),
    decimal_val_2 decimal(7,4),
    float_val_3 float(23),
    double_val_3 float(53),
    decimal_val_3 decimal(5,2),
    bool_val boolean,
    bit_val bit(2)
);

insert into numeric_test values (
	100.99, 100.99, 
    999.00009, 999.00009, 
    1/3, 1/3, 1/3,
    true, 
    b'011');

select * from numeric_test;

-- notice that these values are not exact, so there is a small difference
select float_val_3 - double_val_3 from numeric_test;

-- converts binary to the utf8mb4 character set: produces 'Hello'
SELECT CONVERT(b'0100100001100101011011000110110001101111' USING utf8mb4);

-- converts 'Hello' to binary, and then back to utf8mb4 character set
select cast(cast('Hello' as binary) as char character set utf8mb4);

