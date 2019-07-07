DROP TABLE IF EXISTS sensor_instances_info;
CREATE TABLE  sensor_instances_info
(
    id_sensor serial PRIMARY KEY,
    setup_timestamp timestamp NOT NULL,
    time_using interval NOT NULL,
    id_location integer NOT NULL,
    id_mode integer NOT NULL,
    id_employee integer NOT NULL,
    id_type integer NOT NULL,

    CONSTRAINT GEO FOREIGN KEY (id_location)
        REFERENCES locations_info (id_location) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,

    CONSTRAINT MODE FOREIGN KEY (id_mode)
        REFERENCES modes_info (id_mode) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,

    CONSTRAINT SOTR FOREIGN KEY (id_employee)
        REFERENCES employees_info (id_employee) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,

    CONSTRAINT STYPE FOREIGN KEY (id_type)
        REFERENCES sensor_types_info (id_type) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);
