-- Чистка таблиц.
TRUNCATE measures, sensor_instances, sensor_modes, sensor_types, locations, employees;

-- Вставка фиктивных данных.
INSERT INTO employees
    (first_name, second_name)
VALUES
    ('Максим', 'Гречка'),
    ('Артём', 'Кучкин'),
    ('Владислав', 'Данилов');


INSERT INTO locations
    (description)
VALUES
    ('Главная труба на районе'),
    ('Тёплое место');


INSERT INTO sensor_types
    (name, description, lifespan, measurement_error)
VALUES
    ('Обычный датчик', 'Обычный датчик, который мы купили у обычной компании', '3 years', 0.1),
    ('Наш датчик', 'Наш нереально крутой датчик, бережно собранный нашими любимыми инженерами', '5 years', 0.01);


INSERT INTO sensor_modes
    (name, measurement_interval)
VALUES
    ('Зимний режим', '5 minutes'),
    ('Летний режим', '20 minutes');


INSERT INTO sensor_instances
    (setup_timestamp, id_type, id_mode, id_location, id_employee)
VALUES
    (
        '2015-06-22 19:10:25-03',
        (SELECT id_type FROM sensor_types WHERE name ILIKE '%наш%'),
        (SELECT id_mode FROM sensor_modes WHERE name ILIKE '%летний%'),
        (SELECT id_location FROM locations WHERE description ILIKE '%главная%'),
        (SELECT id_employee FROM employees WHERE first_name ILIKE '%Максим%')
    ),
    (
        '2015-06-22 19:15:25-03',
        (SELECT id_type FROM sensor_types WHERE name ILIKE '%обычный%'),
        (SELECT id_mode FROM sensor_modes WHERE name ILIKE '%летний%'),
        (SELECT id_location FROM locations WHERE description ILIKE '%главная%'),
        (SELECT id_employee FROM employees WHERE first_name ILIKE '%Артём%')
    ),
    (
        '2015-06-22 20:10:25-03',
        (SELECT id_type FROM sensor_types WHERE name ILIKE '%обычный%'),
        (SELECT id_mode FROM sensor_modes WHERE name ILIKE '%зимний%'),
        (SELECT id_location FROM locations WHERE description ILIKE '%тёплое%'),
        (SELECT id_employee FROM employees WHERE first_name ILIKE '%Владислав%')
    );


INSERT INTO measures
    (id_sensor, receival_timestamp, measured_value)
VALUES
    (
        (SELECT id_sensor FROM sensor_instances WHERE setup_timestamp = '2015-06-22 19:10:25-03'),
        '2019-07-11 12:10:25-03',
        112.1
    ),
    (
        (SELECT id_sensor FROM sensor_instances WHERE setup_timestamp = '2015-06-22 19:10:25-03'),
        '2019-07-11 12:15:25-03',
        700.0
    ),
    (
        (SELECT id_sensor FROM sensor_instances WHERE setup_timestamp = '2015-06-22 19:15:25-03'),
        '2019-07-12 08:10:25-03',
        115.1
    ),
    (
        (SELECT id_sensor FROM sensor_instances WHERE setup_timestamp = '2015-06-22 19:15:25-03'),
        '2019-07-12 09:10:25-03',
        750.0
    ),
    (
        (SELECT id_sensor FROM sensor_instances WHERE setup_timestamp = '2015-06-22 20:10:25-03'),
        '2019-07-12 10:10:25-03',
        -100.0
    );
