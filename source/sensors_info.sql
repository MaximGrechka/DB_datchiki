DROP TABLE IF EXISTS sensors_info; 
CREATE TABLE geo_info
(
id_type serial primary key, 
name_sens varchar,
description varchar,
error double
);
