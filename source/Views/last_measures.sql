DROP VIEW IF EXISTS last_measure;
CREATE VIEW last_measure AS
SELECT inform.setup_timestamp,
    inform.measure,
    inform.id_sensor
   FROM ( SELECT sensor_instances_info.id_type,
            sensor_instances_info.id_sensor,
            sensor_instances_info.setup_timestamp,
            sensor_instances_info.time_using,
            sensor_instances_info.id_location,
            sensor_instances_info.id_mode,
            sensor_instances_info.id_employee,
            measures_info.id_measure,
            measures_info.received_timestamp,
            measures_info.measure,
            measures_info.sos,
            sensor_types_info.name,
            sensor_types_info.description,
            sensor_types_info.error,
            rank() OVER (PARTITION BY sensor_instances_info.id_sensor ORDER BY measures_info.received_timestamp) AS rnk
           FROM sensor_instances_info
             JOIN measures_info USING (id_sensor)
             JOIN sensor_types_info USING (id_type)) inform
  WHERE inform.rnk = 1;