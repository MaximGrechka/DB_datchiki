DROP VIEW IF EXISTS info_creat;
CREATE VIEW info_creat AS
(
SELECT
public.sensor_instances_info.id_sensor AS id_sensor,
public.employees_info.first_name AS expired_fname,
public.employees_info.second_name AS expired_sname,
public.sensor_instances_info.time_using AS expired_using ,
public.modes_info.name AS expired_name

FROM public.sensor_instances_info ,
public.employees_info,
public.modes_info
);