DROP TABLE IF EXISTS measure_info;
CREATE TABLE measure_info
(
    id_indication bigserial PRIMARY KEY,
    id_sensor integer NOT NULL,
    received_timestamp timestamp NOT NULL,
    measure double NOT NULL,
    sos boolean DEFAULT false

    CONSTRAINT MI_id_sensor_fkey FOREIGN KEY (id_sensor)
        REFERENCES sensor_instances_info (id_sensor) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
        
);
