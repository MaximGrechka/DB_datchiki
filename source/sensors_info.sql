DROP TABLE IF EXISTS sensors_info;
CREATE TABLE sensors_info
(
    id_sensor serial PRIMARY KEY,
    name varchar,
    description varchar,
    error double
);
