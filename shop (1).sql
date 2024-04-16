-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 16 2024 г., 16:31
-- Версия сервера: 5.7.39
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`id`, `name`) VALUES
(1, 'USD'),
(2, 'EUR'),
(3, 'RUB');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `articul` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `price_old` decimal(10,2) NOT NULL,
  `notice` text,
  `content` text,
  `visible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `position`, `url`, `name`, `articul`, `price`, `currency_id`, `price_old`, `notice`, `content`, `visible`) VALUES
(1, 1, 'product1-url', 'Product 1', 'ART001', '99.99', 1, '129.99', 'Notice for Product 1', 'Content for Product 1', 1),
(2, 2, 'product2-url', 'Product 2', 'ART002', '49.99', 1, '79.99', 'Notice for Product 2', 'Content for Product 2', 1),
(3, 3, 'product3-url', 'Product 3', 'ART003', '199.99', 1, '249.99', 'Notice for Product 3', 'Content for Product 3', 1),
(4, 4, 'product4-url', 'Product 4', 'ART004', '149.99', 1, '199.99', 'Notice for Product 4', 'Content for Product 4', 1),
(5, 5, 'product5-url', 'Product 5', 'ART005', '79.99', 1, '99.99', 'Notice for Product 5', 'Content for Product 5', 1),
(6, 6, 'product6-url', 'Product 6', 'ART006', '299.99', 1, '349.99', 'Notice for Product 6', 'Content for Product 6', 1),
(7, 7, 'product7-url', 'Product 7', 'ART007', '39.99', 1, '59.99', 'Notice for Product 7', 'Content for Product 7', 1),
(8, 8, 'product8-url', 'Product 8', 'ART008', '119.99', 1, '149.99', 'Notice for Product 8', 'Content for Product 8', 1),
(9, 9, 'product9-url', 'Product 9', 'ART009', '89.99', 1, '119.99', 'Notice for Product 9', 'Content for Product 9', 1),
(10, 10, 'product10-url', 'Product 10', 'ART010', '169.99', 1, '199.99', 'Notice for Product 10', 'Content for Product 10', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_assignment`
--

CREATE TABLE `product_assignment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `section_id` int(10) UNSIGNED NOT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_assignment`
--

INSERT INTO `product_assignment` (`id`, `product_id`, `section_id`, `type_id`, `visible`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 1, 1),
(3, 3, 3, 2, 1),
(4, 4, 4, 2, 1),
(5, 6, 2, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_param_name`
--

CREATE TABLE `product_param_name` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT '0',
  `visible` tinyint(1) NOT NULL,
  `name` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_param_name`
--

INSERT INTO `product_param_name` (`id`, `position`, `visible`, `name`) VALUES
(1, 1, 1, 'Param Name 1'),
(2, 2, 1, 'Param Name 2'),
(3, 3, 1, 'Param Name 3'),
(4, 4, 1, 'Param Name 4');

-- --------------------------------------------------------

--
-- Структура таблицы `product_param_variant`
--

CREATE TABLE `product_param_variant` (
  `id` int(10) UNSIGNED NOT NULL,
  `param_id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `position` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_param_variant`
--

INSERT INTO `product_param_variant` (`id`, `param_id`, `name`, `position`) VALUES
(1, 1, 'Variant 1', 1),
(2, 2, 'Variant 2', 1),
(3, 3, 'Variant 3', 1),
(4, 4, 'Variant 4', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_section`
--

CREATE TABLE `product_section` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notice` text,
  `visible` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_section`
--

INSERT INTO `product_section` (`id`, `position`, `url`, `name`, `notice`, `visible`) VALUES
(1, 1, 'section1-url', 'Section 1', 'Notice for Section 1', 1),
(2, 2, 'section2-url', 'Section 2', 'Notice for Section 2', 1),
(3, 3, 'section3-url', 'Section 3', 'Notice for Section 3', 1),
(4, 4, 'section4-url', 'Section 4', 'Notice for Section 4', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_type`
--

CREATE TABLE `product_type` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `notice` text,
  `visible` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_type`
--

INSERT INTO `product_type` (`id`, `position`, `url`, `name`, `notice`, `visible`) VALUES
(1, 1, 'type1-url', 'Type 1', 'Notice for Type 1', 1),
(2, 2, 'type2-url', 'Type 2', 'Notice for Type 2', 1),
(3, 3, 'type3-url', 'Type 3', 'Notice for Type 3', 1),
(4, 4, 'type4-url', 'Type 4', 'Notice for Type 4', 1);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `product_view`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `product_view` (
`id` int(10) unsigned
,`position` int(11)
,`url` varchar(255)
,`name` varchar(255)
,`articul` varchar(255)
,`price` decimal(10,2)
,`currency_id` int(10) unsigned
,`price_old` decimal(10,2)
,`notice` text
,`content` text
,`visible` tinyint(1)
,`section_ids` text
,`type_ids` text
);

-- --------------------------------------------------------

--
-- Дублирующая структура для представления `product_views`
-- (См. Ниже фактическое представление)
--
CREATE TABLE `product_views` (
`id` int(10) unsigned
,`position` int(11)
,`url` varchar(255)
,`name` varchar(255)
,`articul` varchar(255)
,`price` decimal(10,2)
,`currency_id` int(10) unsigned
,`price_old` decimal(10,2)
,`notice` text
,`content` text
,`visible` tinyint(1)
,`section_ids` text
,`type_ids` text
);

-- --------------------------------------------------------

--
-- Структура для представления `product_view`
--
DROP TABLE IF EXISTS `product_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `product_view`  AS SELECT `p`.`id` AS `id`, `p`.`position` AS `position`, `p`.`url` AS `url`, `p`.`name` AS `name`, `p`.`articul` AS `articul`, `p`.`price` AS `price`, `p`.`currency_id` AS `currency_id`, `p`.`price_old` AS `price_old`, `p`.`notice` AS `notice`, `p`.`content` AS `content`, `p`.`visible` AS `visible`, group_concat(`pa`.`section_id` separator ',') AS `section_ids`, group_concat(`pa`.`type_id` separator ',') AS `type_ids` FROM (`product` `p` left join `product_assignment` `pa` on((`p`.`id` = `pa`.`product_id`))) GROUP BY `p`.`id`, `p`.`position`, `p`.`url`, `p`.`name`, `p`.`articul`, `p`.`price`, `p`.`currency_id`, `p`.`price_old`, `p`.`notice`, `p`.`content`, `p`.`visible``visible`  ;

-- --------------------------------------------------------

--
-- Структура для представления `product_views`
--
DROP TABLE IF EXISTS `product_views`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `product_views`  AS SELECT `p`.`id` AS `id`, `p`.`position` AS `position`, `p`.`url` AS `url`, `p`.`name` AS `name`, `p`.`articul` AS `articul`, `p`.`price` AS `price`, `p`.`currency_id` AS `currency_id`, `p`.`price_old` AS `price_old`, `p`.`notice` AS `notice`, `p`.`content` AS `content`, `p`.`visible` AS `visible`, group_concat(`pa`.`section_id` separator ',') AS `section_ids`, group_concat(`pa`.`type_id` separator ',') AS `type_ids` FROM (`product` `p` left join `product_assignment` `pa` on((`p`.`id` = `pa`.`product_id`))) GROUP BY `p`.`id`, `p`.`position`, `p`.`url`, `p`.`name`, `p`.`articul`, `p`.`price`, `p`.`currency_id`, `p`.`price_old`, `p`.`notice`, `p`.`content`, `p`.`visible``visible`  ;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Индексы таблицы `product_assignment`
--
ALTER TABLE `product_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `visible` (`visible`);

--
-- Индексы таблицы `product_param_name`
--
ALTER TABLE `product_param_name`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_param_variant`
--
ALTER TABLE `product_param_variant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`param_id`,`name`(64)),
  ADD KEY `param_id` (`param_id`);

--
-- Индексы таблицы `product_section`
--
ALTER TABLE `product_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url` (`url`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `product_assignment`
--
ALTER TABLE `product_assignment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `product_param_name`
--
ALTER TABLE `product_param_name`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product_param_variant`
--
ALTER TABLE `product_param_variant`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product_section`
--
ALTER TABLE `product_section`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product_assignment`
--
ALTER TABLE `product_assignment`
  ADD CONSTRAINT `fk_product_assignment_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_product_assignment_section_id` FOREIGN KEY (`section_id`) REFERENCES `product_section` (`id`),
  ADD CONSTRAINT `fk_product_assignment_type_id` FOREIGN KEY (`type_id`) REFERENCES `product_type` (`id`);

--
-- Ограничения внешнего ключа таблицы `product_param_variant`
--
ALTER TABLE `product_param_variant`
  ADD CONSTRAINT `fk_product_param_variant_param_id` FOREIGN KEY (`param_id`) REFERENCES `product_param_name` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
