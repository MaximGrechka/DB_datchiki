DROP TABLE IF EXISTS sensors_info;
CREATE TABLE sensors_info
(
    id_type serial PRIMARY KEY,
    name varchar,
    description varchar,
    error double
);
