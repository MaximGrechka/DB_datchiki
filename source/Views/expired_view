DROP VIEW IF EXISTS EXPIRED_VIEW;
CREATE VIEW EXPIRED_VIEW AS
(
    SELECT
        public.sensor_instances_info.id_sensor AS id_sensor,
        public.sensor_instances_info.setup_timestamp + public.sensor_instances_info.time_using AS expire_timestamp,
        public. sensor_instances_info.setup_timestamp + public.sensor_instances_info.time_using <= now() AS expired

    FROM public.sensor_instances_info
);