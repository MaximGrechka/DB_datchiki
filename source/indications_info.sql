DROP TABLE IF EXISTS measure_info;
CREATE TABLE measure_info
(
    id_sensor integer NOT NULL,
    received_timestamp timestamp NOT NULL,
    measure double NOT NULL,
    sos boolean DEFAULT false
);
