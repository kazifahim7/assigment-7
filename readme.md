
# PostgreSQL Basics 

## 1️-> What is PostgreSQL ?

PostgreSQL হল একটি ওপেন সোর্স, অবজেক্ট-রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম (ORDBMS)। এটি ডেটা স্টোরেজ এবং রিট্রিভাল ব্যবস্থাপনা করে এবং SQL (Structured Query Language) এর মাধ্যমে ডেটাবেসে ক্রিয়াকলাপ সম্পাদন করতে সাহায্য করে। PostgreSQL শক্তিশালী, স্কেলেবল, এবং ট্রানজেকশন সমর্থনকারী ডেটাবেস সিস্টেম।

## 2️-> What is the purpose of a database schema in PostgreSQL?

PostgreSQL এ স্কিমা হল একটি লজিক্যাল কন্টেইনার যা ডেটাবেসের টেবিল, ভিউ, ইন্ডেক্স, ফাংশন ইত্যাদি গ্রুপ করে। স্কিমা ব্যবহার করে আপনি ডেটাবেসের মধ্যে তথ্যগুলির সংগঠন করতে পারেন এবং অ্যাক্সেস কন্ট্রোল সেট করতে পারেন। একটি ডেটাবেসের মধ্যে একাধিক স্কিমা থাকতে পারে।

## 3️-> Explain the Primary Key and Foreign Key concepts in PostgreSQL ?

- **Primary Key:** 
  - এটি একটি টেবিলের জন্য একটি ইউনিক সনাক্তকারী (identifier) যা প্রতিটি রেকর্ডকে আলাদা করে। Primary Key একাধিক কলাম নিয়ে গঠিত হতে পারে এবং এর মান কখনো NULL হতে পারে না।
  
- **Foreign Key:** 
  - Foreign Key হল একটি কলাম বা গ্রুপের কলাম যা অন্য টেবিলের Primary Key কে রেফারেন্স করে। এটি ডেটাবেসের মধ্যে সম্পর্ক তৈরি করে এবং ডেটার সংহতি রক্ষা করে।

## 4️-> What is the difference between the VARCHAR and CHAR data types ?

- **VARCHAR:** এটি একটি ভ্যারিয়েবল-লেংথ স্ট্রিং ডেটা টাইপ, যেখানে আপনি যতটুকু প্রয়োজন ততটুকু চরিত্র রাখতে পারেন। এটি সঞ্চয়স্থান কম খরচে রাখে।
- **CHAR:** এটি একটি স্থির-লেংথ স্ট্রিং ডেটা টাইপ, যেখানে নির্দিষ্ট আয়তনের চরিত্র ধারণ করতে হয়। উদাহরণস্বরূপ, `CHAR(10)` মানে ১০টি চরিত্র ধারণ করবে এবং বাকি স্থানগুলোতে শূন্য স্থান (spaces) পূর্ণ করবে।

## 5️-> Explain the purpose of the WHERE clause in a SELECT statement ?

WHERE ক্লজ ব্যবহার করা হয় একটি SELECT, UPDATE বা DELETE স্টেটমেন্টে নির্দিষ্ট শর্ত অনুযায়ী ডেটা ফিল্টার করার জন্য। এটি ডেটাবেসের মধ্যে একটি শর্ত পূর্ণ করা রেকর্ডের উপর কাজ করে।

```sql
SELECT * FROM customers WHERE age > 18;
```

## 6️-> What are the LIMIT and OFFSET clauses used for ?

- **LIMIT:** এটি রেকর্ডের সংখ্যা সীমিত করে, যেটি আপনি একটি SELECT স্টেটমেন্টে দেখতে চান।
  
  ```sql
  SELECT * FROM books LIMIT 5;
  ```
  - এটি প্রথম ৫টি রেকর্ড দেখাবে।

- **OFFSET:** এটি নির্দেশ করে যে কতগুলি রেকর্ড ছেড়ে দিয়ে পরবর্তী রেকর্ড থেকে ফলাফল দেখানো হবে।

  ```sql
  SELECT * FROM books LIMIT 5 OFFSET 10;
  ```

## 7️-> How can you modify data using UPDATE statements?

UPDATE স্টেটমেন্ট ব্যবহার করে আপনি ডেটাবেসে থাকা এক বা একাধিক রেকর্ডের মান পরিবর্তন করতে পারেন।

```sql
UPDATE customers SET email = 'newemail@example.com' WHERE id = 1;
```

এটি `id = 1` থাকা গ্রাহকের ইমেল আপডেট করবে।

## 8️-> What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN অপারেশনটি একাধিক টেবিলের মধ্যে সম্পর্ক তৈরি করতে ব্যবহৃত হয়। এটি এক টেবিলের ডেটা অন্য টেবিলের সাথে যুক্ত করে একটি একক ফলাফল তৈরি করতে সাহায্য করে।

- **INNER JOIN:** দুটি টেবিলের মধ্যে মিল থাকা রেকর্ডগুলি দেখায়।
- **LEFT JOIN:** বাম টেবিলের সমস্ত রেকর্ড এবং ডান টেবিলের মিল থাকা রেকর্ড দেখায়।
- **RIGHT JOIN:** ডান টেবিলের সমস্ত রেকর্ড এবং বাম টেবিলের মিল থাকা রেকর্ড দেখায়।

```sql
SELECT * FROM customers INNER JOIN orders ON customers.id = orders.customer_id;
```

## 9️-> Explain the GROUP BY clause and its role in aggregation operations

GROUP BY ক্লজটি এক বা একাধিক কলামের ভিত্তিতে ডেটাকে গ্রুপ করার জন্য ব্যবহৃত হয়। এটি সাধারণত অ্যাগ্রিগেট ফাংশন (যেমন COUNT(), AVG(), SUM()) এর সাথে ব্যবহৃত হয়।

```sql
SELECT department, COUNT(*) FROM employees GROUP BY department;
```

## 10-> How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

- **COUNT():** একটি কলামের মধ্যে মোট রেকর্ডের সংখ্যা নির্ণয় করে।
  
  ```sql
  SELECT COUNT(*) FROM books;
  ```

- **SUM():** একটি কলামের মোট মান যোগফল হিসেব করে।

  ```sql
  SELECT SUM(price) FROM books;
  ```

- **AVG():** একটি কলামের গড় মান হিসেব করে।

  ```sql
  SELECT AVG(price) FROM books;
  ```
