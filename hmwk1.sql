-- 1) Создание таблицы hmwk1

CREATE TABLE `myfrstdb`.`hmwk1` (
  `product_name` VARCHAR(45) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `product_count` INT UNSIGNED NULL,
  `price` DOUBLE UNSIGNED NULL);

-- Добавиление поля id_phone

ALTER TABLE `myfrstdb`.`hmwk1` 
ADD COLUMN `id_phone` INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (`id_phone`);
;

-- Заполнение таблицы hmwk1

INSERT INTO `myfrstdb`.`hmwk1` (`id_phone`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('1', 'Galaxy Z Flip4', 'Samsung', '1', '65599');
INSERT INTO `myfrstdb`.`hmwk1` (`id_phone`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('2', 'iPhone 14', 'Apple', '6', '72990');
INSERT INTO `myfrstdb`.`hmwk1` (`id_phone`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('3', 'Redmi Note 11', 'Xiaomi', '7', '15990');
INSERT INTO `myfrstdb`.`hmwk1` (`id_phone`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('4', 'Wildfire E Plus', 'HTC', '2', '5825');
INSERT INTO `myfrstdb`.`hmwk1` (`id_phone`, `product_name`, `manufacturer`, `product_count`, `price`) VALUES ('5', 'Galaxy S23', 'Samsung', '4', '74990');


-- Работа с запросами

-- 2) SELECT-запрос, который выводит название товара, производителя и цену для товаров, количество которых превышает 2

USE myfrstdb; 

SELECT product_name, manufacturer, price 
FROM hmwk1
WHERE product_count > 2;
	
-- 3) SELECT-запрос, который выводит весь ассортимент товаров марки “Samsung”

SELECT * FROM hmwk1
WHERE manufacturer = "Samsung";

