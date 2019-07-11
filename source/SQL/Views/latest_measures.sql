-- Представление для вывода новейших показаний сенсоров.
DROP VIEW IF EXISTS latest_measures;
CREATE VIEW latest_measures AS
(
    SELECT
        inform.setup_timestamp,
        inform.measure,
        inform.id_sensor

    FROM
        (
            SELECT
                *,
                rank() OVER (PARTITION BY sensor_instances_info.id_sensor ORDER BY measures_info.received_timestamp) AS timestamp_rank

            FROM
                sensor_instances_info
                INNER JOIN measures_info USING (id_sensor)
                INNER JOIN sensor_types_info USING (id_type)
        ) ranked_table

    WHERE
        ranked_table.timestamp_rank = 1;
);
