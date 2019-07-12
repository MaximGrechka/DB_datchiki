<?php
    // Соединение, выбор базы данных
    $dbconn = pg_connect("host=localhost dbname=sensors_data user=web_reader password=web_reader_p")
        or die('Не удалось соединиться: ' . pg_last_error());

    // Выполнение SQL-запроса
    $query = 'SELECT * FROM latest_measures';
    $result = pg_query($query) or die('Ошибка запроса: ' . pg_last_error());

    // Вывод результатов в HTML
    echo "<table class=\"output_table\">\n";
    while ($line = pg_fetch_array($result, null, PGSQL_ASSOC))
    {
        echo "\t<tr>\n";
        foreach ($line as $col_value)
        {
            echo "\t\t<td>$col_value</td>\n";
        }
        echo "\t</tr>\n";
    }
    echo "</table>\n";

    // Очистка результата
    pg_free_result($result);

    // Закрытие соединения
    pg_close($dbconn);
?>