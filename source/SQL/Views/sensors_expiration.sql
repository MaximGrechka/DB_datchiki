-- Представление для отображения даты окончания срока работы сенсоров.
DROP VIEW IF EXISTS expired_sensors;
CREATE VIEW expired_sensors AS
(
    SELECT
        public.sensor_instances.id_sensor AS id_sensor,
        public.sensor_instances.setup_timestamp + public.sensor_instances.lifespan AS expire_timestamp,
        public.sensor_instances.setup_timestamp + public.sensor_instances.lifespan <= now() AS expired

    FROM
        public.sensor_instances_info
);
