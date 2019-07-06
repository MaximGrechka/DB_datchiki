DROP TABLE IF EXISTS mode_info;
CREATE TABLE mode_info
(
    id_mode serial PRIMARY KEY,
    name varchar,
    measure_interval interval NOT NULL
);
