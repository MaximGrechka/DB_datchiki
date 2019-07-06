DROP TABLE IF EXISTS Main_sensors_info
CREATE TABLE SUBJECT Main_sensors_info
(
    id_sensor serial PRIMARY KEY,
    date_setup timestamp,
    time_using interval,             
    id_pos integer,
    id_mode integer,
    id_sot integer,
    id_type integer
);
