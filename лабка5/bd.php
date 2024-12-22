


<?php

$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "выставка";

// Подключаемся к базе данных
$conn = new mysqli($servername, $username, $password, $dbname);

// Проверяем соединение
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Инициализируем массив
$ar_result = [];

// Получаем данные из формы
$id_search = isset($_POST['id_search']) ? trim($_POST['id_search']) : '';
$name_search = isset($_POST['name_search']) ? trim($_POST['name_search']) : '';

if (!empty($id_search) && !empty($name_search)) {
    // Если оба поля заполнены, ничего не выводим
    echo "Ошибка: заполните только одно поле.";
} else {
    // Обнуляем массив перед новым запросом
    $ar_result = [];
    
    if (empty($id_search) && empty($name_search)) {
        // Базовый запрос, если оба поля пустые
        $sql = "SELECT ID_Экскурсии, Название FROM экскурсии";
    } elseif (!empty($id_search)) {
        // Запрос с фильтром по ID
        $sql = "SELECT ID_Экскурсии, Название FROM экскурсии WHERE ID_Экскурсии = ?";
    } else {
        // Запрос с фильтром по имени
        $sql = "SELECT ID_Экскурсии, Название FROM экскурсии WHERE Название LIKE ?";
    }

    // Подготовка и выполнение запроса
    $stmt = $conn->prepare($sql);

    if (!empty($id_search)) {
        $stmt->bind_param("i", $id_search); // Привязываем ID (целое число)
    } elseif (!empty($name_search)) {
        $name_search = '%' . $name_search . '%'; // Добавляем символы для поиска
        $stmt->bind_param("s", $name_search); // Привязываем имя (строка)
    }

    // Выполняем запрос
    $stmt->execute();
    $result = $stmt->get_result();

    // Обрабатываем результат
    if ($result && $result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $ar_result[] = $row;
        }
    } else {
        echo "Нет результатов.";
    }

    // Закрываем подготовленный запрос
    $stmt->close();
}

// Закрываем соединение
$conn->close();

// Для проверки можно вывести массив
// print_r($ar_result);
?>




<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Третьяковская галерея</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="bars.css">
</head>
<body>
    <!-- Верхняя шапка -->
    <header class="bg-white border-bottom">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center py-2">
                <!-- Левый блок -->
                <div>
                    <span class="fs-6 fw-bold">Третьяковская галерея</span>
                </div>
                <!-- Правый блок -->
                <div class="d-flex align-items-center">
                    <a href="#" class="text-dark me-3">Купить билет</a>
                    <a href="#" class="text-dark me-3">Стать другом</a>
                    <a href="#" class="text-dark me-3">Интернет-магазин</a>
                    <a href="#" class="text-dark me-3"><i class="bi bi-bell"></i></a>
                    <a href="#" class="text-dark me-3"><i class="bi bi-search"></i></a>
                    <a href="#" class="text-dark">RU</a>
                </div>
            </div>
        </div>
    </header>



<form method="POST">
  <div class="container text-center"> 
    <div class="row align-items-center">
      <div class="col">
        <input class="form-control form-control-sm" type="text" name="id_search" placeholder="Поиск по ID" aria-label=".form-control-sm example">
      </div>
      <div class="col">
        <input class="form-control form-control-sm" type="text" name="name_search" placeholder="Поиск по имени" aria-label=".form-control-sm example">
      </div>
      <div class="col">
        <button type="submit" class="btn btn-warning">Найти</button>
      </div>
    </div>
  </div>
</form>

<div class="container center">

<table border="1">
        <tr>
            <th>ID    </th>
            <th>Название</th>
        </tr>
  
  
        <?php

  //  var_dump($ar_result);
//
      foreach ($ar_result as $value){
      echo '<tr>';
      echo '<td>' . $value['ID_Экскурсии'] . '</td>';
      echo '<td>' . $value['Название'] . '</td>';
      echo '<tr>';
      }
    
        ?>
    </table>
 </div>





    <!-- Нижняя шапка -->
    <header class="bg-white border-bottom">
        <div class="container">
            <div class="row align-items-center py-2">
                <!-- Логотип -->
                <div class="col-auto">
                    <a href="#" class="d-flex align-items-center text-dark text-decoration-none">
                    </a>
                </div>
                <!-- Меню навигации -->
                <div class="col">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item"><a href="#" class="nav-link">Посетителям</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">Выставки</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">События</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">Кино</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">Программы и абонементы</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">Коллекция</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">Поддержать музей</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">Третьяковка онлайн</a></li>
                                <li class="nav-item"><a href="#" class="nav-link">О музее</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>

   

        <!-- Нижнее меню -->
        <div class="card text-bg-dark mb-3">
            <div class="d-grid gap-2 d-xxl-block">
                <div class="row align-items-start">
                    <!-- Первая колонка -->
                    <div class="col-12 col-md">
                        <h3>О музее</h3>
                        <h4>⠀</h4>
                        <a href="#"><h5>Ответы на частые вопросы</h5></a>
                        <a href="#"><h5>История</h5></a>
                        <a href="#"><h5>Проекты</h5></a>
                        <a href="#"><h5>Попечительский совет</h5></a>
                        <a href="#"><h5>Фонд поддержки</h5></a>
                        <a href="#"><h5>Контакты</h5></a>
                        <a href="#"><h5>Карта сайта</h5></a>
                        <a href="#"><h5>Студии и творческие мастерские</h5></a>
                    </div>

                    <!-- Вторая колонка -->
                    <div class="col-12 col-md">
                        <h3>Выставки</h3>
                        <h4>⠀</h4>
                        <a href="#"><h5>Текущие выставки</h5></a>
                        <a href="#"><h5>Будущие выставки</h5></a>
                        <a href="#"><h5>Внешние выставки</h5></a>
                        <a href="#"><h5>Постоянные экспозиции</h5></a>
                        <h4>⠀</h4>
                        <a href="#"><h3>Наука в музее</h3></a>
                        <a href="#"><h5>Научные отделы</h5></a>
                    </div>

                    <!-- Третья колонка -->
                    <div class="col-12 col-md">
                        <h3>Посетителям</h3>
                        <h4>⠀</h4>
                        <a href="#"><h5>Здания и часы работы</h5></a>
                        <a href="#"><h5>Билеты, льготы и бесплатные дни</h5></a>
                        <a href="#"><h5>Экскурсии</h5></a>
                        <a href="#"><h5>Контакты и отзывы</h5></a>
                        <a href="#"><h5>Доступный музей</h5></a>
                        <h4>⠀</h4>
                        <h3>Билеты</h3>
                        <a href="#"><h5>Купить билет</h5></a>
                        <a href="#"><h5>Возвраты</h5></a>
                    </div>
                </div>
            </div>

            <h1>⠀</h1>

            <div class="container text-center">
                <div class="row align-items-start">
                    <div class="col-12 col-md">
                        <a href="#">Условия использования материалов сайта</a><br>
                        <a href="#">Политика конфиденциальности</a>
                    </div>
                    <div class="col-12 col-md">
                        2024 © Государственная Третьяковская галерея
                    </div>
                    <div class="col-12 col-md">
                        Разработка сайта - Infospice
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


