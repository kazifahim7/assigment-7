-- Active: 1742276232987@@127.0.0.1@5432@bookstore_db@public
CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) not NULL,
    author VARCHAR(50) not NULL,
    price DECIMAL(10,2) CHECK (price>=0),
    stock INT NOT NULL ,
    published_year INT not NULL
)



CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) not NULL,
    email VARCHAR(50) UNIQUE not NULL,
    joined_date DATE DEFAULT CURRENT_DATE
)



CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES customers(id) ON DELETE CASCADE , 
    book_id INTEGER REFERENCES books(id) ON DELETE CASCADE ,
    quantity INT CHECK (quantity>0),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)


