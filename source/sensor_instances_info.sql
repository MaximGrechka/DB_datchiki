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

    CONSTRAINT GEO FOREIGN KEY (id_pos)
        REFERENCES geo_info (id_pos) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
    
    CONSTRAINT MODE FOREIGN KEY (id_mode)
        REFERENCES mode_info (id_mode) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO 
    
    CONSTRAINT SOTR FOREIGN KEY (id_employee)
        REFERENCES sotr_info (id_employee) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
    
    CONSTRAINT TYPE FOREIGN KEY (id_type)
        REFERENCES sensors_info (id_type) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION

        
);
