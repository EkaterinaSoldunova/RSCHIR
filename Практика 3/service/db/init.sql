CREATE DATABASE IF NOT EXISTS productsDB;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'password';
GRANT SELECT,UPDATE,INSERT,DELETE ON productsDB.* TO 'user'@'%';
FLUSH PRIVILEGES;


USE productsDB;

CREATE TABLE IF NOT EXISTS Providers
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    tel VARCHAR(100)
);

INSERT INTO Providers(name, tel)
VALUES ('Provider1', '82345678954'),
       ('Provider2', '88365387468'),
       ('Provider3', '89348937589');

CREATE TABLE IF NOT EXISTS Products
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    providerId INT,
    FOREIGN KEY (providerId) REFERENCES Providers(ID) ON DELETE CASCADE
);

INSERT INTO Products(name, price, providerId)
VALUES ('Product1', 10, (SELECT ID FROM Providers WHERE name='Provider1')),
    ('Product2', 99, (SELECT ID FROM Providers WHERE name='Provider1')),
    ('Product3', 150, (SELECT ID FROM Providers WHERE name='Provider2')),
    ('Product4', 199, (SELECT ID FROM Providers WHERE name='Provider2')),
    ('Product5', 25, (SELECT ID FROM Providers WHERE name='Provider3')),
    ('Product6', 18, (SELECT ID FROM Providers WHERE name='Provider3'));

COMMIT;