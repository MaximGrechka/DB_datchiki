DROP VIEW IF EXISTS BROKEN_VIEW;
CREATE VIEW BROKEN_VIEW AS
(
    SELECT
        public.sensor_instances_info.id_sensor AS id_sensor,
        public.sensor_instances_info.setup_timestamp + public.sensor_instances_info.time_using AS expire_timestamp,
        public. sensor_instances_info.setup_timestamp + public.sensor_instances_info.time_using <= now() AS expired

    FROM public.sensor_instances_info
);