DROP TABLE IF EXISTS sensor_types_info;
CREATE TABLE sensor_types_info
(
    id_type serial PRIMARY KEY,
    name varchar,
    description varchar,
    error double
);
