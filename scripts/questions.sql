-- questions for library : 
--    What book is the most popular in circulation?
--    What library is the most frequent lending books?
--    Who is the top 5 borrower?
--    What book is the most requested in holds?
--    What library is having the most book collections?
--    What is the average loan duration for borrowed books?
--    Which genre has the highest circulation rate?
--    How many overdue books does the library system currently have?
--    What is the average number of books borrowed per user?
--    Which library branch has the highest number of active users?
--    What is the most common reason for users placing holds on books?
--    How many books are added to the collection each month?
--    What is the percentage of borrowed books returned on time?
--    How does the circulation rate vary between different days of the week?
--    What is the most common age group of users borrowing books?

-- we will chose 5 most important :

-- 1.	Which book is the most popular in circulation?
select l.book_id, b.title, count(*) as circulation_count
from loans l left join books b on l.book_id = b.book_id  
group by l.book_id, b.title
order by circulation_count desc
limit 1;

--2.	Which library lends books the most frequently?
select l.library_id, lib.name, count(*) as lending_count
from loans l join libraries lib on l.library_id = lib.library_id 
group by l.library_id, lib.name
order by lending_count desc
limit 1;

--3.	Who are the top 5 borrowers?
select l.user_id, u.customer_name, count(*) as borrowed_count
from loans l join users u on l.user_id = u.user_id 
group by l.user_id, u.customer_name 
order by borrowed_count desc
limit 5;

--4.	Which genre has the highest circulation rate?
select c.category_id, c.name, count(*) as circulation_count
from books b
join loans l on b.book_id = l.book_id
join categories c on b.categories = c.category_id 
group by c.category_id 
order by circulation_count desc
limit 1;

--5.	What is the percentage of borrowed books returned on time?
select
    count(case when return_date < due_date then 1 end) as on_time_returns,
    count(*) as total_borrowed,
    (count(case when return_date < due_date then 1 end) * 100.0) / count(*) as percentage
from loans;

--5b. 
select avg(extract(day from return_date)-extract(day from loan_date)) as average_days_borrowed
from loans
where return_date is not null;