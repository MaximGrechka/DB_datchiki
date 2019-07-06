DROP TABLE IF EXISTS Main_sensors_info;
CREATE TABLE SUBJECT Main_sensors_info
(
    id_sensor serial PRIMARY KEY,
    date_setup timestamp NOT NULL,
    time_using interval NOT NULL,
    id_pos integer NOT NULL,
    id_mode integer NOT NULL,
    id_employee integer NOT NULL,
    id_type integer NOT NULL
);
