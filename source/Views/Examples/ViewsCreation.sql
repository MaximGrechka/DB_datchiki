-- Удаление views, если они есть.

DROP VIEW IF EXISTS OVERALL_PROGRESS;
DROP VIEW IF EXISTS OVERALL_SUBJECTS_TIME;

-- Создание views

-- Сводная таблица прогресса.
CREATE VIEW OVERALL_PROGRESS AS
(
    SELECT
        public.subject.name AS subject,
        public.subject.semester AS semester,
        public.subject.obligatory AS obligatory,
        public.task.name AS task,
        public.task_type.name AS task_type,
        public.progress.description AS progress

    FROM
        public.subject
        INNER JOIN public.task USING(subject_id)
        INNER JOIN public.task_type USING(task_type_id)
        INNER JOIN public.progress USING(task_id)
);

-- Суммарное время по предметам.
CREATE VIEW OVERALL_SUBJECTS_TIME AS
(
    SELECT
        public.subject.name AS subject,
        public.subject.semester AS semester,
        public.subject.obligatory AS obligatory,
        sum
        (
           (DATE_PART('day', public.progress.finished_timestamp - public.progress.started_timestamp) * 24 +
            DATE_PART('hour', public.progress.finished_timestamp - public.progress.started_timestamp)) * 60 +
            DATE_PART('minute', public.progress.finished_timestamp - public.progress.started_timestamp)
        ) AS total_spent_time --Total spent time in minutes

    FROM
        public.subject
        INNER JOIN public.task USING(subject_id)
        --INNER JOIN public.task_type USING(task_type_id)
        INNER JOIN public.progress USING(task_id)

    GROUP BY
        public.subject.subject_id

    ORDER BY
        public.subject.semester ASC,
        total_spent_time DESC
);
