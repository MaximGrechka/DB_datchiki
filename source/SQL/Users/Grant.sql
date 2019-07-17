-- inserter
GRANT INSERT ON measures TO inserter;
GRANT SELECT ON measures_id_measure_seq TO inserter;

-- web_reader
GRANT SELECT ON latest_measures TO web_reader;
GRANT SELECT ON limits_exceeded TO web_reader;
GRANT SELECT ON column_names TO web_reader;
