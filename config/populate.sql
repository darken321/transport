-- Сначала удаляются подчиненные таблицы, потом таблица связь между ними
DELETE FROM route_stops;
DELETE FROM transport_route;
DELETE FROM stop;
DELETE FROM transport;

--чтоб индексы остановок шли с 1
ALTER SEQUENCE stop_id_seq RESTART WITH 1;
-- Вставка значений в таблицу transport_stop
INSERT INTO stop (stop_name)
VALUES ('Областная больница'),
       ('Тельминский лес'),
       ('Восточный микрорайон'),
       ('Детский городок'),
       ('Парк Воинов-интернац-ов'),
       ('Технический университет'),
       ('Богданчука'),
       ('Завод'),
       ('ЦМТ'),
       ('Зеленая'),
       ('МОПРа'),
       ('Проспект Машерова'),
       ('ЦУМ'),
       ('Ленина'),
       ('Сквер Иконикова'),
       ('Стадион'),
       ('БТИ'),
       ('Крепость'),
       ('Соя'),
       ('Береговая'),
       ('Луговая'),
       ('Варшавское шоссе'),
       ('Махновича'),
       ('Грюнвальдская'),
       ('Благовещенская'),
       ('Мытная'),
       ('Новая'),
       ('Театр'),
       ('Интурист'),
       ('Музей спасенных ценностей');

-- Сброс счетчика последовательности, которая автоматически создается при route_id SERIAL PRIMARY KEY
ALTER SEQUENCE transport_id_seq RESTART WITH 1;
-- Вставка значений в таблицу
INSERT INTO transport (transport_name)
VALUES ('троллейбус 100'),
       ('троллейбус 101'),
       ('троллейбус 102');

-- Вставка значений в таблицу route_stop для дух первых маршрутов
ALTER SEQUENCE transport_route_id_seq RESTART WITH 1;
INSERT INTO transport_route (transport_id, start_stop_id, end_stop_id)
VALUES (1, 1, 8), -- троллейбус 100 туда (от 1 до 8 остановки)
       (1, 8, 1), -- троллейбус 100 обратно (от 8 до 1 остановки)
       (2, 3, 5), -- троллейбус 101 туда
       (2, 5, 3); -- троллейбус 102 обратно

-- Вставка значений в таблицу route_stop
ALTER SEQUENCE route_stops_id_seq RESTART WITH 1;
INSERT INTO route_stops (route_id, stop_id, stop_order)
VALUES (1, 1, 1), -- 1 маршрут, 1 Областная больница, 1 первая остановка
       (1, 2, 2), -- 1 маршрут, 2 Тельминский лес, 2 вторая остановка
       (1, 3, 3),
       (1, 4, 4),
       (1, 5, 5),
       (1, 6, 6),
       (1, 7, 7),
       (1, 8, 8),

       (2, 8, 1), -- 2 маршрут, 8 Завод, 1 первая остановка
       (2, 7, 2), -- 2 маршрут, 7 Богданчука, 2 вторая остановка
       (2, 6, 3),
       (2, 5, 4),
       (2, 4, 5),
       (2, 3, 6),
       (2, 2, 7),
       (2, 1, 8),

       (3, 3, 1), -- 3 маршрут, 3 Восточный микрорайон, 1 первая остановка
       (3, 4, 2), -- 3 маршрут, 4 Детский городок, 2 вторая остановка
       (3, 5, 3); -- 3 маршрут, 5 Парк Воинов-интернац-ов, 3 третья остановка

DELETE FROM user_role;
DELETE FROM users;
ALTER SEQUENCE global_seq RESTART WITH 100;

INSERT INTO users (name, email, password)
VALUES ('User', 'user@yandex.ru', 'password'),
       ('Another_user', 'user1@yandex.ru', 'pass'),
       ('Admin', 'admin@gmail.com', 'admin');

INSERT INTO user_role (role, user_id)
VALUES ('USER', 101),
       ('ADMIN', 100);