DROP TABLE IF EXISTS book_reviews;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS publishers;

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    country VARCHAR(100)
);

CREATE TABLE publishers (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(100),
    founded_year INT
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT NOT NULL,
    publisher_id INT NOT NULL,
    genre VARCHAR(100),
    publication_date DATE,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

CREATE TABLE book_reviews (
    review_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    review_text TEXT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    review_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

INSERT INTO authors (name, birth_date, country) VALUES
('J.K. Rowling', '1965-07-31', 'United Kingdom'),
('George Orwell', '1903-06-25', 'United Kingdom'),
('Ernest Hemingway', '1899-07-21', 'United States'),
('Haruki Murakami', '1949-01-12', 'Japan'),
('Gabriel Garcia Marquez', '1927-03-06', 'Colombia');

INSERT INTO publishers (name, city, founded_year) VALUES
('Bloomsbury', 'London', 1986),
('Penguin Random House', 'New York', 1927),
('HarperCollins', 'New York', 1989),
('Kodansha', 'Tokyo', 1909),
('Alfaguara', 'Madrid', 1964);

INSERT INTO books (title, author_id, publisher_id, genre, publication_date, price) VALUES
('Harry Potter and the Sorcerers Stone', 1, 1, 'Fantasy', '1997-06-26', 19.99),
('1984', 2, 2, 'Dystopian', '1949-06-08', 14.99),
('The Old Man and the Sea', 3, 3, 'Literary Fiction', '1952-09-01', 9.99),
('Norwegian Wood', 4, 4, 'Romance', '1987-09-04', 15.99),
('One Hundred Years of Solitude', 5, 5, 'Magical Realism', '1967-05-30', 17.99),
('Harry Potter and the Chamber of Secrets', 1, 1, 'Fantasy', '1998-07-02', 20.99),
('Animal Farm', 2, 2, 'Satire', '1945-08-17', 10.99),
('For Whom the Bell Tolls', 3, 3, 'War', '1940-10-21', 12.99),
('Kafka on the Shore', 4, 4, 'Fantasy', '2002-09-12', 18.99),
('Love in the Time of Cholera', 5, 5, 'Romance', '1985-03-05', 16.99);

INSERT INTO book_reviews (book_id, review_text, rating, review_date) VALUES
(1, 'Amazing fantasy book!', 5, '2000-01-15'),
(2, 'Very thought-provoking.', 4, '2001-03-22'),
(3, 'A classic tale of struggle.', 5, '2002-06-10'),
(4, 'Beautiful and melancholic.', 4, '2003-08-30'),
(5, 'Masterpiece of magical realism.', 5, '2004-12-25');

SELECT title AS "Book Title", genre AS "Genre", price AS "Price in USD" FROM books;
SELECT name AS "Author Name", birth_date AS "Date of Birth" FROM authors;
SELECT name AS "Publisher Name", city AS "City" FROM publishers;
SELECT review_text AS "Review", rating AS "Rating" FROM book_reviews;

SELECT * FROM books ORDER BY price DESC;
SELECT * FROM authors ORDER BY name ASC;

SELECT * FROM books WHERE genre = 'Fantasy';
SELECT * FROM authors WHERE country = 'United Kingdom';

SELECT * FROM books LIMIT 3;
SELECT * FROM authors FETCH FIRST 2 ROWS ONLY;

SELECT * FROM books WHERE genre IN ('Fantasy', 'Dystopian', 'Romance');
SELECT * FROM authors WHERE country IN ('United Kingdom', 'United States');

SELECT * FROM books WHERE price BETWEEN 10 AND 20;
SELECT * FROM publishers WHERE founded_year BETWEEN 1900 AND 2000;

SELECT * FROM books WHERE title LIKE 'Harry Potter%';
SELECT * FROM authors WHERE name LIKE '%George%';

SELECT * FROM book_reviews WHERE review_text IS NULL;
SELECT * FROM books WHERE publication_date IS NULL;

SELECT genre, COUNT(*) AS "Number of Books" FROM books GROUP BY genre;
SELECT country, COUNT(*) AS "Number of Authors" FROM authors GROUP BY country;

SELECT * FROM book_reviews;
SELECT * FROM books;
SELECT * FROM authors;
SELECT * FROM publishers;
