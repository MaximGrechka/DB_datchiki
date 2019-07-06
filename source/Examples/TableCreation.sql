-- Удаление таблиц, если они существуют.

DROP TABLE IF EXISTS PROGRESS;
DROP TABLE IF EXISTS TASK;
DROP TABLE IF EXISTS TASK_TYPE;
DROP TABLE IF EXISTS SUBJECT;

-- Создание таблиц.

-- Таблица предметов (Пример: матанализ, физика, ...)
CREATE TABLE SUBJECT
(
    subject_id serial PRIMARY KEY,  -- ID.
    name varchar NOT NULL,          -- Название.
    semester integer,               -- Семестр.
    obligatory boolean DEFAULT TRUE -- Обязательность предмета (да/нет).
);

-- Таблица видов заданий (Пример: Д/З, проект, подготовка к контрольной, ...)
CREATE TABLE TASK_TYPE
(
    task_type_id serial PRIMARY KEY, -- ID.
    name varchar NOT NULL            -- Название вид задания.
);

-- Таблица заданий (Пример: сделать номера 13, 14 стр. 111, прочитать главу 18, ...)
CREATE TABLE TASK
(
    task_id serial PRIMARY KEY,    -- ID.
    subject_id integer NOT NULL,   -- Ссылка на ID соответствующего предмета.
    task_type_id integer NOT NULL, -- Ссылка на ID соответствующего вида задания.
    name varchar NOT NULL,         -- Название задания.

    -- Ограничение-связь между ID предмета.
    CONSTRAINT TASK_subject_id_fkey FOREIGN KEY (subject_id)
        REFERENCES SUBJECT (subject_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,

    -- Ограничение-связь между ID вида задания.
    CONSTRAINT TASK_task_type_id_fkey FOREIGN KEY (task_type_id)
        REFERENCES TASK_TYPE (task_type_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- Таблица хода выполнения заданий (Пример: сделан номер 13, номер 14 сделан частично).
CREATE TABLE PROGRESS
(
    progress_id serial PRIMARY KEY,        -- ID.
    task_id integer NOT NULL,              -- ID соответвтующего задания.
    description varchar NOT NULL,          -- Описание прогресса.
    started_timestamp timestamp NOT NULL,  -- Дата и время начала выполнения.
    finished_timestamp timestamp NOT NULL, -- Дата и время конца выполнения.

    -- Ограничение-связь между ID задания.
    CONSTRAINT PROGRESS_task_id_fkey FOREIGN KEY (task_id)
        REFERENCES TASK (task_id) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION
);
