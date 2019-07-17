-- Представление для вывода датчиков, у которых последнее показание вышло за пределы допустимых значений.
DROP VIEW IF EXISTS limits_exceeded;
CREATE VIEW limits_exceeded AS
(
    SELECT
        id_sensor,
        receival_timestamp,
        measured_value,
        min_value,
        max_value

    FROM
        latest_measures
        INNER JOIN sensor_instances USING (id_sensor)
        INNER JOIN locations USING (id_location)

    WHERE
        measured_value < min_value
        OR measured_value > max_value
);
