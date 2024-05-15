# E-Library-System
SQL Database implementation of e-library system

# Database Specification
- [Objectives](#1-objectives) 
- [Business rules](#2-business-rules) 
- [Design requirements](#3-design-requirements) 
- [ERD](#4-ERD) 

# 1. Objectives
The objectives of the system is to :
1. Design and maintain a database of library
2. It also includes the library branches, its books, users, and book lending records
3. Users are allowed to hold unavailable book and the library maintain the hold queue


# 2. Business rules
1. User can borrow books from any library as long as the book is available
2. The loan periods is 2 weeks
3. User can return the book earlier than the due date
4. Books will automatically returned when they exceed the due date
5. Users can borrow at most 2 books at a time
6. Users can place a hold on book that is currently unavailable
7. Library maintain the hold queue. When the book become available, it can be borrowed by the user in front of the queue
8. If the user doesn't borrow the held book within a week, the book is released for other users to borrow
9. Users can hold at most 2 books


# 3. Design requirements

# 4. ERD
