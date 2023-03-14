USE vk;

-- Создание 2 таблиц: друзья и тип друзей 

CREATE TABLE friends_type
(
	`type_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `friend_group` VARCHAR(45) NOT NULL
);
    
CREATE TABLE friends
(
	`friend_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `friend_name` VARCHAR(45) NOT NULL,
    `friend_group` INT,
    FOREIGN KEY (friend_group) REFERENCES friends_type(type_id)
);

-- Заполнение таблиц friends_type и friends

INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('1', 'classmate');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('2', 'neighbour');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('3', 'coworker');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('4', 'district');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('5', 'familiar');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('6', 'best friend');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('7', 'enemy');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('8', 'family');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('9', 'relatives');
INSERT INTO `vk`.`friends_type` (`type_id`, `friend_group`) VALUES ('10', 'lovers');
   
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('1', 'Nikolai', '10'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('2', 'Petr', '9'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('3', 'Elena', '8'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('4', 'Natalia', '7'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('5', 'Ekaterina', '6'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('6', 'Oleg', '5'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('7', 'Evgeniy', '4'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('8', 'Talgat', '3'); 
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('9', 'Lubov', '2');  
INSERT INTO `vk`.`friends` (`friend_id`, `friend_name`, `friend_group`) VALUES ('10', 'Nikita', '1'); 

-- 4 * Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true).
-- При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false
-- (или 0) (ALTER TABLE + UPDATE)

INSERT INTO `vk`.`profiles` (`user_id`, `birthday`) VALUES ('1', '2000-10-10');
INSERT INTO `vk`.`profiles` (`user_id`, `birthday`) VALUES ('2', '2015-05-06');
INSERT INTO `vk`.`profiles` (`user_id`, `birthday`) VALUES ('3', '2020-01-01');
INSERT INTO `vk`.`profiles` (`user_id`, `birthday`) VALUES ('4', '2005-03-04');

ALTER TABLE `vk`.`profiles` 
ADD COLUMN `is_active` BOOLEAN DEFAULT false NULL AFTER `hometown`; 

UPDATE profiles
SET is_active = '1'
WHERE TIMESTAMPDIFF(MONTH, birthday, CURDATE()) < 216
LIMIT 1000;
-- без LIMIT не работает

-- 5.* Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) (DELETE)

INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`) VALUES ('1', '7', '3');
INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`) VALUES ('2', '8', '2');
INSERT INTO `vk`.`messages` (`id`, `from_user_id`, `to_user_id`) VALUES ('3', '9', '1');

UPDATE `vk`.`messages` SET `created_at` = '2023-04-01 06:48:41' WHERE (`id` = '2');

DELETE FROM messages WHERE created_at > SYSDATE()
LIMIT 10;
-- тут без LIMIT выдает ошибку 1175

