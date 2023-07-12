DROP TABLE IF EXISTS route_stops;
DROP TABLE IF EXISTS transport_route;
DROP TABLE IF EXISTS stop;
DROP TABLE IF EXISTS transport;

-- Создание таблицы названия остановок уникальны
CREATE TABLE stop
(
    id        SERIAL PRIMARY>>> KEY,
    -- уникальное UNIQUE значение названия остановок, при добавлении дубля будет ошибка
    stop_name VARCHAR(255) NOT NULL UNIQUE
);
-- чтоб ускорить поиск по названию остановки, можно создать индекс по transport_stop_description
CREATE INDEX idx_stop_name ON stop (stop_name);

-- Создание таблицы названия транспортов - троллейбус 101...
CREATE TABLE transport
(
    id             SERIAL PRIMARY KEY,
    transport_name VARCHAR(255) NOT NULL UNIQUE
);

-- Таблица содержит названия маршрутов, начальные и конечные остановки
CREATE TABLE transport_route
(
    id            SERIAL PRIMARY KEY,
    transport_id  INT,
    start_stop_id INT,
    end_stop_id   INT,
    CONSTRAINT fk_transport FOREIGN KEY (transport_id) REFERENCES transport (id),
    CONSTRAINT fk_start_stop FOREIGN KEY (start_stop_id) REFERENCES stop (id),
    CONSTRAINT fk_end_stop FOREIGN KEY (end_stop_id) REFERENCES stop (id)
);

CREATE TABLE route_stops
(
    id         SERIAL PRIMARY KEY,
    route_id   INT, -- айдишник маршрута
    stop_id    INT, -- айди остановки
    stop_order INT, -- порядковый номер остановки в маршруте
    CONSTRAINT fk_route FOREIGN KEY (route_id) REFERENCES transport_route (id),
    CONSTRAINT fk_stop FOREIGN KEY (stop_id) REFERENCES stop (id)
);

DROP TABLE IF EXISTS user_role;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START WITH 100;

CREATE TABLE users
(
    id               INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
    name             VARCHAR                           NOT NULL,
    email            VARCHAR                           NOT NULL,
    password         VARCHAR                           NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_role
(
    user_id INTEGER NOT NULL,
    role    VARCHAR NOT NULL,
    CONSTRAINT user_roles_idx UNIQUE (user_id, role),
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);