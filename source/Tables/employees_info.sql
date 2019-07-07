DROP TABLE IF EXISTS employees_info;
CREATE TABLE employees_info
(
    id_employee serial PRIMARY KEY,
    first_name varchar NOT NULL,
    second_name varchar NOT NULL
);
