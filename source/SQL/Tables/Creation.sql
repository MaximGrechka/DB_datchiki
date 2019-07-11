-- Удаление имеющихся таблиц.
DROP TABLE IF EXISTS measures;
DROP TABLE IF EXISTS sensor_instances;
DROP TABLE IF EXISTS sensor_modes;
DROP TABLE IF EXISTS sensor_types;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS employees;

-- Таблица сотрудников (заглушка, подразумевается совмещение со существующей БД сотрудников Сибура).
CREATE TABLE employees
(
    id_employee serial PRIMARY KEY,
    first_name varchar NOT NULL,
    second_name varchar NOT NULL
);

-- Таблица местоположений (возможно, следует добавть координаты).
CREATE TABLE locations
(
    id_location serial PRIMARY KEY,
    description varchar NOT NULL
);

-- Таблица типов сенсоров.
CREATE TABLE sensor_types
(
    id_type serial PRIMARY KEY,
    name varchar,
    description varchar,
    measurement_error float
);

-- Таблица режимов работы сенсоров.
CREATE TABLE sensor_modes
(
    id_mode serial PRIMARY KEY,
    name varchar,
    measurement_interval interval NOT NULL
);

-- Таблица экземпляров сенсоров.
CREATE TABLE  sensor_instances
(
    id_sensor serial PRIMARY KEY,
    setup_timestamp timestamp NOT NULL,
    lifespan interval NOT NULL,
    id_location integer NOT NULL,
    id_mode integer NOT NULL,
    id_employee integer NOT NULL,
    id_type integer NOT NULL,

    CONSTRAINT sensor_instances_id_location_fkey FOREIGN KEY (id_location)
        REFERENCES locations_info (id_location) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,

    CONSTRAINT sensor_instances_id_mode_fkey FOREIGN KEY (id_mode)
        REFERENCES modes_info (id_mode) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,

    CONSTRAINT sensor_instances_id_employee_fkey KEY (id_employee)
        REFERENCES employees_info (id_employee) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,

    CONSTRAINT sensor_instances_id_type_fkey FOREIGN KEY (id_type)
        REFERENCES sensor_types_info (id_type) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Таблица измерений.
CREATE TABLE measures
(
    id_measure bigserial PRIMARY KEY,
    id_sensor integer NOT NULL,
    receival_timestamp timestamp NOT NULL,
    measured_value float NOT NULL,
    sos boolean DEFAULT false,

    CONSTRAINT measures_id_sensor_fkey FOREIGN KEY (id_sensor)
        REFERENCES sensor_instances (id_sensor) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);