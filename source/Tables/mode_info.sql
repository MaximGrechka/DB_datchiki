DROP TABLE IF EXISTS modes_info;
CREATE TABLE modes_info
(
    id_mode serial PRIMARY KEY,
    name varchar,
    measure_interval interval NOT NULL
);
