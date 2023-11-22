CREATE DATABASE IF NOT EXISTS sweetshop;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'%';
FLUSH PRIVILEGES;
CREATE TABLE cakes (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       price INT NOT NULL,
                       being INT NOT NULL
);
CREATE TABLE basket (
                        id SERIAL PRIMARY KEY,
                        cakeId INT NOT NULL,
                        cakeName VARCHAR(255) NOT NULL,
                        cakePrice INT NOT NULL
);
INSERT INTO cakes (name, price) VALUES
                                    ('Эклеры Ассорти', '800'),
                                    ('Капкейки Тыква-пекан', '900'),
                                    ('Пирожное манго-маракуйя', '400');