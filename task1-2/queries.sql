USE LibraryManagement;
CREATE TABLE authors (
                         author_id INT AUTO_INCREMENT PRIMARY KEY,
                         author_name VARCHAR(255) NOT NULL
);
CREATE TABLE genres (
                        genre_id INT AUTO_INCREMENT PRIMARY KEY,
                        genre_name VARCHAR(255) NOT NULL
);
CREATE TABLE books (
                       book_id INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(255) NOT NULL,
                       publication_year YEAR NOT NULL,
                       author_id INT NOT NULL,
                       genre_id INT NOT NULL,
                       FOREIGN KEY (author_id) REFERENCES authors(author_id),
                       FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(255) NOT NULL,
                       email VARCHAR(255) NOT NULL
);
CREATE TABLE borrowed_books (
                                borrow_id INT AUTO_INCREMENT PRIMARY KEY,
                                book_id INT NOT NULL,
                                user_id INT NOT NULL,
                                borrow_date DATE NOT NULL,
                                return_date DATE,
                                FOREIGN KEY (book_id) REFERENCES books(book_id),
                                FOREIGN KEY (user_id) REFERENCES users(user_id)
);

---- seed
-- authors
INSERT INTO authors (author_name) VALUES
                                      ('George Orwell'),
                                      ('J.K. Rowling');

-- genres
INSERT INTO genres (genre_name) VALUES
                                    ('Dystopian'),
                                    ('Fantasy');

-- books
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
                                                                     ('1984', 1949, 1, 1),
                                                                     ('Harry Potter and the Philosopher\'s Stone', 1997, 2, 2);

-- users
INSERT INTO users (username, email) VALUES
('john_doe', 'john@example.com'),
('jane_doe', 'jane@example.com');

-- borrowed_books
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
(1, 1, '2024-11-01', '2024-11-10'),
(2, 2, '2024-11-05', NULL);

