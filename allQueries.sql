-- //! 1️-> Find books that are out of stock.

SELECT title FROM books WHERE stock = 0 ;


--//! 2️-> Retrieve the most expensive book in the store.
SELECT * FROM books ORDER BY price DESC LIMIT 1 ;

--//! 3️->  Find the total number of orders placed by each customer.
SELECT name,count(orders.id) as total_orders FROM orders
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name;


--//! 4️-> Calculate the total revenue generated from book sales.
SELECT sum(quantity * price ) as total_revenue FROM orders
JOIN books ON orders.book_id = books.id ;


--//! 5️-> List all customers who have placed more than one order.
SELECT name,count(customer_id) as order_count FROM orders
JOIN customers ON orders.customer_id = customers.id
GROUP BY customers.name 
HAVING count(customer_id) > 1 ;


--//! 6️-> Find the average price of books in the store.

SELECT ROUND(avg(price),2) as avg_book_price FROM books



--//! 7️-> Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price= price + (price*0.1)
WHERE published_year < 2000

-- //! see result after update
SELECT * FROM books



-- //! 8️-> Delete customers who haven't placed any orders.
DELETE FROM customers
WHERE id NOT IN(SELECT customer_id FROM orders WHERE customer_id is NOT NULL)

SELECT * FROM customers