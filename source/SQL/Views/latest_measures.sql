-- Представление для вывода новейших показаний сенсоров.
DROP VIEW IF EXISTS latest_measures;
CREATE VIEW latest_measures AS
(
    SELECT
        setup_timestamp,
        measured_value,
        id_sensor

    FROM
        (
            SELECT
                *,
                rank() OVER (PARTITION BY sensor_instances.id_sensor ORDER BY measures.receival_timestamp DESC) AS timestamp_rank

            FROM
                sensor_instances
                INNER JOIN measures USING (id_sensor)
                INNER JOIN sensor_types USING (id_type)
        ) ranked_table

    WHERE
        ranked_table.timestamp_rank = 1
);
