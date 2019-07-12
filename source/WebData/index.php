<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <title>SensorsData</title>
    </head>
    <body>
        <div class="main_div">
            <div class="logo_div">
                <img src="resources/images/Sibur_logo.png" alt="СИБУР">
            </div>

            <h2 align="center">Веб-интерфейс SensorsData</h1>
            <div class="table_description_div">
                <p>Таблица для отображения актуальных данных, поступающих от сети установленных датчиков температуры.</p>
            </div>
            <div class="table_div">
                <?php
                    require 'php/generate_table.php';
                ?>
            </div>
        </div>
    </body>
</html>
