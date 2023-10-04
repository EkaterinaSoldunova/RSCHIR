CREATE TABLE tovars (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          price DECIMAL(10, 2) NOT NULL
);

INSERT INTO tovars (name, price) VALUES
                                                    ('Вермишель', 100.00),
                                                    ('Молоко', 80.00),
                                                    ('Яйца', 78.00);