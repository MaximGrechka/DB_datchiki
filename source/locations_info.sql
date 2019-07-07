DROP TABLE IF EXISTS locations_info;
CREATE TABLE locations_info
(
    id_location serial PRIMARY KEY,
    description varchar NOT NULL
);
