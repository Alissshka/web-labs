-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 22 2024 г., 23:02
-- Версия сервера: 10.4.32-MariaDB
-- Версия PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `выставка`
--

-- --------------------------------------------------------

--
-- Структура таблицы `помещения`
--

CREATE TABLE `помещения` (
  `ID_Помещения` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `помещения`
--

INSERT INTO `помещения` (`ID_Помещения`, `Название`) VALUES
(1, 'Главный зал'),
(2, 'Выставочный павильон 1'),
(3, 'Выставочный павильон 2'),
(4, 'Лекционная аудитория'),
(5, 'Холл'),
(6, 'Малый зал'),
(7, 'Галерея искусств'),
(8, 'Библиотека'),
(9, 'Кафе'),
(10, 'Администрация');

-- --------------------------------------------------------

--
-- Структура таблицы `посетители`
--

CREATE TABLE `посетители` (
  `ID_Посетителя` int(11) NOT NULL,
  `Имя` varchar(100) NOT NULL,
  `Фамилия` varchar(100) NOT NULL,
  `Контакты` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `посетители`
--

INSERT INTO `посетители` (`ID_Посетителя`, `Имя`, `Фамилия`, `Контакты`) VALUES
(1, 'Алексей', 'Иванов', 'ivanov@mail.ru'),
(2, 'Мария', 'Петрова', 'petrova@gmail.com'),
(3, 'Ольга', 'Сидорова', 'sidorova@yandex.ru'),
(4, 'Иван', 'Смирнов', 'smirnov@mail.ru'),
(5, 'Елена', 'Кузнецова', 'kuznecova@gmail.com'),
(6, 'Сергей', 'Попов', 'popov@mail.ru'),
(7, 'Анна', 'Васильева', 'vasileva@gmail.com'),
(8, 'Дмитрий', 'Морозов', 'morozov@yandex.ru'),
(9, 'Наталья', 'Новикова', 'novikova@mail.ru'),
(10, 'Максим', 'Федоров', 'fedorov@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `записи_на_экскурсии`
--

CREATE TABLE `записи_на_экскурсии` (
  `ID_Посетителя` int(11) NOT NULL,
  `ID_Экскурсии` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `записи_на_экскурсии`
--

INSERT INTO `записи_на_экскурсии` (`ID_Посетителя`, `ID_Экскурсии`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `расписание_экскурсии`
--

CREATE TABLE `расписание_экскурсии` (
  `ID_Расписания` int(11) NOT NULL,
  `ID_Экскурсии` int(11) DEFAULT NULL,
  `Дата_и_время` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `расписание_экскурсии`
--

INSERT INTO `расписание_экскурсии` (`ID_Расписания`, `ID_Экскурсии`, `Дата_и_время`) VALUES
(1, 1, '2024-01-15 10:00:00'),
(2, 1, '2024-01-15 12:00:00'),
(3, 2, '2024-01-16 11:00:00'),
(4, 2, '2024-01-16 14:00:00'),
(5, 3, '2024-01-17 10:00:00'),
(6, 3, '2024-01-17 13:00:00'),
(7, 4, '2024-01-18 09:00:00'),
(8, 4, '2024-01-18 15:00:00'),
(9, 5, '2024-01-19 10:00:00'),
(10, 5, '2024-01-19 14:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `стендисты`
--

CREATE TABLE `стендисты` (
  `ID_Стендиста` int(11) NOT NULL,
  `Имя` varchar(100) NOT NULL,
  `Фамилия` varchar(100) NOT NULL,
  `Контакты` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `стендисты`
--

INSERT INTO `стендисты` (`ID_Стендиста`, `Имя`, `Фамилия`, `Контакты`) VALUES
(1, 'Егор', 'Николаев', 'nikolaev@mail.ru'),
(2, 'Ирина', 'Соколова', 'sokolova@gmail.com'),
(3, 'Владимир', 'Зайцев', 'zaytsev@yandex.ru'),
(4, 'Оксана', 'Кравцова', 'kravtsova@mail.ru'),
(5, 'Кирилл', 'Воробьев', 'vorobiev@gmail.com'),
(6, 'Лариса', 'Григорьева', 'grigorieva@mail.ru'),
(7, 'Роман', 'Медведев', 'medvedev@yandex.ru'),
(8, 'Екатерина', 'Павлова', 'pavlova@gmail.com'),
(9, 'Михаил', 'Родионов', 'rodionov@mail.ru'),
(10, 'Татьяна', 'Головина', 'golovina@gmail.com');

-- --------------------------------------------------------

--
-- Структура таблицы `стендисты_стенды`
--

CREATE TABLE `стендисты_стенды` (
  `ID_Стендиста` int(11) NOT NULL,
  `ID_Стенда` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `стендисты_стенды`
--

INSERT INTO `стендисты_стенды` (`ID_Стендиста`, `ID_Стенда`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `стенды`
--

CREATE TABLE `стенды` (
  `ID_Стенда` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL,
  `Описание` text DEFAULT NULL,
  `ID_Помещения` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `стенды`
--

INSERT INTO `стенды` (`ID_Стенда`, `Название`, `Описание`, `ID_Помещения`) VALUES
(1, 'История России', 'Экспозиция о ключевых событиях в истории России.', 1),
(2, 'Древние артефакты', 'Коллекция предметов старины.', 2),
(3, 'Русская живопись', 'Выставка картин русских художников.', 3),
(4, 'Космос', 'Интерактивная выставка о космических исследованиях.', 4),
(5, 'Природа России', 'Фотографии и экспонаты природных заповедников.', 5),
(6, 'Военная история', 'История вооружений и сражений.', 6),
(7, 'Современная культура', 'Экспозиция о современной жизни России.', 7),
(8, 'Литературное наследие', 'Стенды, посвященные русским писателям.', 8),
(9, 'Наука и техника', 'Инновации и изобретения.', 9),
(10, 'Традиции и быт', 'Русские традиции и быт.', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `экскурсии`
--

CREATE TABLE `экскурсии` (
  `ID_Экскурсии` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL,
  `ID_Стенда` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `экскурсии`
--

INSERT INTO `экскурсии` (`ID_Экскурсии`, `Название`, `ID_Стенда`) VALUES
(1, 'Путешествие в историю России', 1),
(2, 'Древности и открытия', 2),
(3, 'Живопись сквозь века', 3),
(4, 'Космос и его тайны', 4),
(5, 'Природные богатства', 5),
(6, 'Победа в Великой Отечественной войне', 6),
(7, 'Современная жизнь', 7),
(8, 'Литературные шедевры', 8),
(9, 'Наука будущего', 9),
(10, 'Русские традиции', 10);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `помещения`
--
ALTER TABLE `помещения`
  ADD PRIMARY KEY (`ID_Помещения`);

--
-- Индексы таблицы `посетители`
--
ALTER TABLE `посетители`
  ADD PRIMARY KEY (`ID_Посетителя`);

--
-- Индексы таблицы `записи_на_экскурсии`
--
ALTER TABLE `записи_на_экскурсии`
  ADD PRIMARY KEY (`ID_Посетителя`,`ID_Экскурсии`),
  ADD KEY `ID_Экскурсии` (`ID_Экскурсии`);

--
-- Индексы таблицы `расписание_экскурсии`
--
ALTER TABLE `расписание_экскурсии`
  ADD PRIMARY KEY (`ID_Расписания`),
  ADD KEY `ID_Экскурсии` (`ID_Экскурсии`);

--
-- Индексы таблицы `стендисты`
--
ALTER TABLE `стендисты`
  ADD PRIMARY KEY (`ID_Стендиста`);

--
-- Индексы таблицы `стендисты_стенды`
--
ALTER TABLE `стендисты_стенды`
  ADD PRIMARY KEY (`ID_Стендиста`,`ID_Стенда`),
  ADD KEY `ID_Стенда` (`ID_Стенда`);

--
-- Индексы таблицы `стенды`
--
ALTER TABLE `стенды`
  ADD PRIMARY KEY (`ID_Стенда`),
  ADD KEY `ID_Помещения` (`ID_Помещения`);

--
-- Индексы таблицы `экскурсии`
--
ALTER TABLE `экскурсии`
  ADD PRIMARY KEY (`ID_Экскурсии`),
  ADD KEY `ID_Стенда` (`ID_Стенда`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `помещения`
--
ALTER TABLE `помещения`
  MODIFY `ID_Помещения` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `посетители`
--
ALTER TABLE `посетители`
  MODIFY `ID_Посетителя` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `расписание_экскурсии`
--
ALTER TABLE `расписание_экскурсии`
  MODIFY `ID_Расписания` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `стендисты`
--
ALTER TABLE `стендисты`
  MODIFY `ID_Стендиста` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `стенды`
--
ALTER TABLE `стенды`
  MODIFY `ID_Стенда` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `экскурсии`
--
ALTER TABLE `экскурсии`
  MODIFY `ID_Экскурсии` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `записи_на_экскурсии`
--
ALTER TABLE `записи_на_экскурсии`
  ADD CONSTRAINT `записи_на_экскурсии_ibfk_1` FOREIGN KEY (`ID_Посетителя`) REFERENCES `посетители` (`ID_Посетителя`),
  ADD CONSTRAINT `записи_на_экскурсии_ibfk_2` FOREIGN KEY (`ID_Экскурсии`) REFERENCES `экскурсии` (`ID_Экскурсии`);

--
-- Ограничения внешнего ключа таблицы `расписание_экскурсии`
--
ALTER TABLE `расписание_экскурсии`
  ADD CONSTRAINT `расписание_экскурсии_ibfk_1` FOREIGN KEY (`ID_Экскурсии`) REFERENCES `экскурсии` (`ID_Экскурсии`);

--
-- Ограничения внешнего ключа таблицы `стендисты_стенды`
--
ALTER TABLE `стендисты_стенды`
  ADD CONSTRAINT `стендисты_стенды_ibfk_1` FOREIGN KEY (`ID_Стендиста`) REFERENCES `стендисты` (`ID_Стендиста`),
  ADD CONSTRAINT `стендисты_стенды_ibfk_2` FOREIGN KEY (`ID_Стенда`) REFERENCES `стенды` (`ID_Стенда`);

--
-- Ограничения внешнего ключа таблицы `стенды`
--
ALTER TABLE `стенды`
  ADD CONSTRAINT `стенды_ibfk_1` FOREIGN KEY (`ID_Помещения`) REFERENCES `помещения` (`ID_Помещения`);

--
-- Ограничения внешнего ключа таблицы `экскурсии`
--
ALTER TABLE `экскурсии`
  ADD CONSTRAINT `экскурсии_ibfk_1` FOREIGN KEY (`ID_Стенда`) REFERENCES `стенды` (`ID_Стенда`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
