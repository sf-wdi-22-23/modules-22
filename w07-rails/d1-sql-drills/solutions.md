# Basic Challenges

##### PLEASE DO NOT COPY-PASTE THESE ANSWERS INTO YOUR TERMINAL.

```sql
1.) SELECT SUM(price*quantity) AS total_inventory_cost FROM products;

2.) CREATE TABLE books ( id SERIAL primary key, title VARCHAR(255), publication_year NUMERIC NOT NULL DEFAULT 2015, isbn BIGINT NOT NULL DEFAULT 0, author_id NUMERIC NOT NULL DEFAULT 'NaN');

3 a.) INSERT INTO books (title, publication_year, isbn, author_id) VALUES ('The Jungle Book', 1894, 9788497896698, 1);

3 b.) INSERT INTO books (title, publication_year, isbn, author_id) VALUES ('Alice''s Adventures in Wonderland', 1865, 9781552465707, 2);

# etc

4.) ALTER TABLE books ADD COLUMN book_id NUMERIC NOT NULL DEFAULT 'NaN';

5 a.) INSERT INTO products (name) SELECT (title) FROM books;

5 b.) UPDATE products SET quantity = 4, price = 7.99 WHERE name = 'The Jungle Book' RETURNING *;

# etc

```

# Stretch Challenges

Please write your own solutions