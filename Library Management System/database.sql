-- SQL Library Management Project 

-- Create schema:
CREATE SCHEMA library_management_project;

USE library_management_project;

-- Creating the reqired Tables:

-- Create table "Branch"
CREATE TABLE branch
(
            branch_id VARCHAR(10) PRIMARY KEY,
            manager_id VARCHAR(10),
            branch_address VARCHAR(30),
            contact_no VARCHAR(15)
);

-- Create table "Employee"
CREATE TABLE employees
(
            emp_id VARCHAR(10) PRIMARY KEY,
            emp_name VARCHAR(30),
            position VARCHAR(30),
            salary DECIMAL(10,2),
            branch_id VARCHAR(10),
            FOREIGN KEY (branch_id) REFERENCES  branch(branch_id)
);

-- Create table "Members"
CREATE TABLE members
(
            member_id VARCHAR(10) PRIMARY KEY,
            member_name VARCHAR(30),
            member_address VARCHAR(30),
            reg_date DATE
);

-- Create table "Books"
CREATE TABLE books
(
            isbn VARCHAR(50) PRIMARY KEY,
            book_title VARCHAR(80),
            category VARCHAR(30),
            rental_price DECIMAL(10,2),
            status VARCHAR(10),
            author VARCHAR(30),
            publisher VARCHAR(30)
);

-- Create table "IssueStatus"
CREATE TABLE issued_status
(
            issued_id VARCHAR(10) PRIMARY KEY,
            issued_member_id VARCHAR(30),
            issued_book_name VARCHAR(80),
            issued_date DATE,
            issued_book_isbn VARCHAR(50),
            issued_emp_id VARCHAR(10),
            FOREIGN KEY (issued_member_id) REFERENCES members(member_id),
            FOREIGN KEY (issued_emp_id) REFERENCES employees(emp_id),
            FOREIGN KEY (issued_book_isbn) REFERENCES books(isbn) 
);

-- Create table "ReturnStatus"
CREATE TABLE return_status
(
            return_id VARCHAR(10) PRIMARY KEY,
            issued_id VARCHAR(30),
            return_book_name VARCHAR(80),
            return_date DATE,
            return_book_isbn VARCHAR(50),
            FOREIGN KEY (return_book_isbn) REFERENCES books(isbn)
);

-- Inserting Data in the tables:

-- 1. Members table

INSERT INTO members(member_id, member_name, member_address, reg_date) 
VALUES
('C101', 'Alice Johnson', '123 Main St', '2021-05-15'),
('C102', 'Bob Smith', '456 Elm St', '2021-06-20'),
('C103', 'Carol Davis', '789 Oak St', '2021-07-10'),
('C104', 'Dave Wilson', '567 Pine St', '2021-08-05'),
('C105', 'Eve Brown', '890 Maple St', '2021-09-25'),
('C106', 'Frank Thomas', '234 Cedar St', '2021-10-15'),
('C107', 'Grace Taylor', '345 Walnut St', '2021-11-20'),
('C108', 'Henry Anderson', '456 Birch St', '2021-12-10'),
('C109', 'Ivy Martinez', '567 Oak St', '2022-01-05'),
('C110', 'Jack Wilson', '678 Pine St', '2022-02-25'),
('C118', 'Sam', '133 Pine St', '2024-06-01'),    
('C119', 'John', '143 Main St', '2024-05-01'),
('C120', 'Karan Mehta', '789 Elm St', '2024-04-15'),
('C121', 'Linda Scott', '321 Maple Ave', '2024-03-22'),
('C122', 'Ravi Patel', '210 Oak Ln', '2024-02-10'),
('C123', 'Sophia Gomez', '101 Cedar Rd', '2024-01-18'),
('C124', 'Bruce Wayne', '1007 Mountain Dr', '2023-12-12');
SELECT * FROM members;


-- 2. Branch table
INSERT INTO branch(branch_id, manager_id, branch_address, contact_no) 
VALUES
('B001', 'E109', '123 Main St', '+919099988676'),
('B002', 'E109', '456 Elm St', '+919099988677'),
('B003', 'E109', '789 Oak St', '+919099988678'),
('B004', 'E110', '567 Pine St', '+919099988679'),
('B005', 'E110', '890 Maple St', '+919099988680'),
('B006', 'E111', '321 Cedar St', '+919099988681'),
('B007', 'E112', '654 Birch St', '+919099988682'),
('B008', 'E113', '987 Walnut St', '+919099988683');
SELECT * FROM branch;


-- 3. Employees table
INSERT INTO employees(emp_id, emp_name, position, salary, branch_id) 
VALUES
('E101', 'John Doe', 'Clerk', 60000.00, 'B001'),
('E102', 'Jane Smith', 'Clerk', 45000.00, 'B002'),
('E103', 'Mike Johnson', 'Librarian', 55000.00, 'B001'),
('E104', 'Emily Davis', 'Assistant', 40000.00, 'B001'),
('E105', 'Sarah Brown', 'Assistant', 42000.00, 'B001'),
('E106', 'Michelle Ramirez', 'Assistant', 43000.00, 'B001'),
('E107', 'Michael Thompson', 'Clerk', 62000.00, 'B005'),
('E108', 'Jessica Taylor', 'Clerk', 46000.00, 'B004'),
('E109', 'Daniel Anderson', 'Manager', 57000.00, 'B003'),
('E110', 'Laura Martinez', 'Manager', 41000.00, 'B005'),
('E111', 'Christopher Lee', 'Assistant', 65000.00, 'B005'),
('E112', 'Natalie Walker', 'Librarian', 54000.00, 'B006'),
('E113', 'David Kim', 'Clerk', 48000.00, 'B007'),
('E114', 'Priya Mehra', 'Assistant', 39000.00, 'B008');
SELECT * FROM employees;


-- 4. Books table 
INSERT INTO books(isbn, book_title, category, rental_price, status, author, publisher) 
VALUES
('978-0-553-29698-2', 'The Catcher in the Rye', 'Classic', 7.00, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('978-0-330-25864-8', 'Animal Farm', 'Classic', 5.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-118776-1', 'One Hundred Years of Solitude', 'Literary Fiction', 6.50, 'yes', 'Gabriel Garcia Marquez', 'Penguin Books'),
('978-0-525-47535-5', 'The Great Gatsby', 'Classic', 8.00, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-141-44171-6', 'Jane Eyre', 'Classic', 4.00, 'yes', 'Charlotte Bronte', 'Penguin Classics'),
('978-0-307-37840-1', 'The Alchemist', 'Fiction', 2.50, 'yes', 'Paulo Coelho', 'HarperOne'),
('978-0-679-76489-8', 'Harry Potter and the Sorcerers Stone', 'Fantasy', 7.00, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-7432-4722-4', 'The Da Vinci Code', 'Mystery', 8.00, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-09-957807-9', 'A Game of Thrones', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam'),
('978-0-393-05081-8', 'A Peoples History of the United States', 'History', 9.00, 'yes', 'Howard Zinn', 'Harper Perennial'),
('978-0-19-280551-1', 'The Guns of August', 'History', 7.00, 'yes', 'Barbara W. Tuchman', 'Oxford University Press'),
('978-0-307-58837-1', 'Sapiens: A Brief History of Humankind', 'History', 8.00, 'no', 'Yuval Noah Harari', 'Harper Perennial'),
('978-0-375-41398-8', 'The Diary of a Young Girl', 'History', 6.50, 'no', 'Anne Frank', 'Bantam'),
('978-0-14-044930-3', 'The Histories', 'History', 5.50, 'yes', 'Herodotus', 'Penguin Classics'),
('978-0-393-91257-8', 'Guns, Germs, and Steel: The Fates of Human Societies', 'History', 7.00, 'yes', 'Jared Diamond', 'W. W. Norton & Company'),
('978-0-7432-7357-1', '1491: New Revelations of the Americas Before Columbus', 'History', 6.50, 'no', 'Charles C. Mann', 'Vintage Books'),
('978-0-679-64115-3', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-14-143951-8', 'Pride and Prejudice', 'Classic', 5.00, 'yes', 'Jane Austen', 'Penguin Classics'),
('978-0-452-28240-7', 'Brave New World', 'Dystopian', 6.50, 'yes', 'Aldous Huxley', 'Harper Perennial'),
('978-0-670-81302-4', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Knopf'),
('978-0-385-33312-0', 'The Shining', 'Horror', 6.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52993-5', 'Fahrenheit 451', 'Dystopian', 5.50, 'yes', 'Ray Bradbury', 'Ballantine Books'),
('978-0-345-39180-3', 'Dune', 'Science Fiction', 8.50, 'yes', 'Frank Herbert', 'Ace'),
('978-0-375-50167-0', 'The Road', 'Dystopian', 7.00, 'yes', 'Cormac McCarthy', 'Vintage'),
('978-0-06-025492-6', 'Where the Wild Things Are', 'Children', 3.50, 'yes', 'Maurice Sendak', 'HarperCollins'),
('978-0-06-112241-5', 'The Kite Runner', 'Fiction', 5.50, 'yes', 'Khaled Hosseini', 'Riverhead Books'),
('978-0-06-440055-8', 'Charlotte''s Web', 'Children', 4.00, 'yes', 'E.B. White', 'Harper & Row'),
('978-0-679-77644-3', 'Beloved', 'Fiction', 6.50, 'yes', 'Toni Morrison', 'Knopf'),
('978-0-14-027526-3', 'A Tale of Two Cities', 'Classic', 4.50, 'yes', 'Charles Dickens', 'Penguin Books'),
('978-0-7434-7679-3', 'The Stand', 'Horror', 7.00, 'yes', 'Stephen King', 'Doubleday'),
('978-0-451-52994-2', 'Moby Dick', 'Classic', 6.50, 'yes', 'Herman Melville', 'Penguin Books'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Classic', 5.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-0-553-57340-1', '1984', 'Dystopian', 6.50, 'yes', 'George Orwell', 'Penguin Books'),
('978-0-7432-4722-5', 'Angels & Demons', 'Mystery', 7.50, 'yes', 'Dan Brown', 'Doubleday'),
('978-0-7432-7356-4', 'The Hobbit', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin Harcourt'),
('978-0-553-80147-3', 'A Clash of Kings', 'Fantasy', 7.50, 'yes', 'George R.R. Martin', 'Bantam Spectra'),
('978-0-553-89785-8', 'A Storm of Swords', 'Fantasy', 8.00, 'yes', 'George R.R. Martin', 'Bantam Spectra'),
('978-0-439-06486-6', 'Harry Potter and the Chamber of Secrets', 'Fantasy', 6.50, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-439-13635-8', 'Harry Potter and the Prisoner of Azkaban', 'Fantasy', 6.50, 'yes', 'J.K. Rowling', 'Scholastic'),
('978-0-618-26030-0', 'The Fellowship of the Ring', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin'),
('978-0-618-26031-7', 'The Two Towers', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin'),
('978-0-618-26032-4', 'The Return of the King', 'Fantasy', 7.00, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin'),
('978-0-553-28377-4', 'Dune Messiah', 'Science Fiction', 8.00, 'yes', 'Frank Herbert', 'Ace'),
('978-0-440-17464-1', 'Children of Dune', 'Science Fiction', 8.00, 'yes', 'Frank Herbert', 'Ace'),
('978-0-7653-2635-5', 'Foundation', 'Science Fiction', 6.50, 'yes', 'Isaac Asimov', 'Spectra');

SELECT * FROM books;

-- 5. Issued Status table
INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102'),
('IS141', 'C109', 'Pride and Prejudice', '2024-04-14', '978-0-14-143951-8', 'E107'),
('IS142', 'C108', 'The Hobbit', '2024-04-15', '978-0-7432-7356-4', 'E109'),
('IS143', 'C109', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-04-16', '978-0-393-91257-8', 'E102'),
('IS144', 'C104', 'The Stand', '2024-04-17', '978-0-7434-7679-3', 'E106'),
('IS145', 'C107', 'The Kite Runner', '2024-04-18', '978-0-06-112241-5', 'E106'),
('IS146', 'C107', 'To Kill a Mockingbird', '2024-04-19', '978-0-06-112008-4', 'E102'),
('IS147', 'C105', 'A Tale of Two Cities', '2024-04-20', '978-0-14-027526-3', 'E109'),
('IS148', 'C108', 'Dune', '2024-04-21', '978-0-345-39180-3', 'E103'),
('IS149', 'C101', 'A Tale of Two Cities', '2024-04-22', '978-0-14-027526-3', 'E103'),
('IS150', 'C109', 'The Stand', '2024-04-23', '978-0-7434-7679-3', 'E103');

SELECT * FROM issued_status;

-- 6. Return Status table
DROP TABLE RETURN_STATUS;
INSERT INTO return_status(return_id, issued_id, return_book_name, return_date, return_book_isbn)
VALUES
('R101', 'IS106', 'Animal Farm', '2024-03-17', '978-0-330-25864-8'),
('R102', 'IS107', 'One Hundred Years of Solitude', '2024-03-18', '978-0-14-118776-1'),
('R103', 'IS108', 'The Great Gatsby', '2024-03-20', '978-0-525-47535-5'),
('R104', 'IS109', 'Jane Eyre', '2024-03-21', '978-0-141-44171-6'),
('R105', 'IS110', 'The Alchemist', '2024-03-23', '978-0-307-37840-1'),
('R106', 'IS111', 'Harry Potter and the Sorcerers Stone', '2024-03-25', '978-0-679-76489-8'),
('R107', 'IS112', 'A Game of Thrones', '2024-03-26', '978-0-09-957807-9'),
('R108', 'IS113', 'A Peoples History of the United States', '2024-03-28', '978-0-393-05081-8'),
('R109', 'IS114', 'The Guns of August', '2024-03-30', '978-0-19-280551-1'),
('R110', 'IS115', 'The Histories', '2024-04-01', '978-0-14-044930-3'),
('R111', 'IS116', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-04-03', '978-0-393-91257-8'),
('R112', 'IS117', '1984', '2024-04-05', '978-0-679-64115-3'),
('R113', 'IS118', 'Pride and Prejudice', '2024-04-07', '978-0-14-143951-8'),
('R114', 'IS119', 'Brave New World', '2024-04-08', '978-0-452-28240-7'),
('R115', 'IS120', 'The Road', '2024-04-10', '978-0-670-81302-4'),
('R116', 'IS121', 'The Shining', '2024-04-11', '978-0-385-33312-0'),
('R117', 'IS122', 'Fahrenheit 451', '2024-04-13', '978-0-451-52993-5'),
('R118', 'IS123', 'Dune', '2024-04-15', '978-0-345-39180-3'),
('R119', 'IS124', 'Where the Wild Things Are', '2024-04-17', '978-0-06-025492-6'),
('R120', 'IS125', 'The Kite Runner', '2024-04-19', '978-0-06-112241-5'),
('R121', 'IS126', 'Charlotte''s Web', '2024-04-21', '978-0-06-440055-8'),
('R122', 'IS127', 'Beloved', '2024-04-23', '978-0-679-77644-3'),
('R123', 'IS128', 'A Tale of Two Cities', '2024-04-25', '978-0-14-027526-3'),
('R124', 'IS129', 'The Stand', '2024-04-27', '978-0-7434-7679-3'),
('R125', 'IS130', 'Moby Dick', '2024-04-29', '978-0-451-52994-2'),
('R126', 'IS131', 'To Kill a Mockingbird', '2024-04-30', '978-0-06-112008-4'),
('R127', 'IS132', 'The Hobbit', '2024-05-01', '978-0-7432-7356-4'),
('R128', 'IS133', 'Angels & Demons', '2024-05-02', '978-0-7432-4722-5'),
('R129', 'IS134', 'The Diary of a Young Girl', '2024-05-03', '978-0-375-41398-8'),
('R130', 'IS135', 'Sapiens: A Brief History of Humankind', '2024-05-04', '978-0-307-58837-1'),
('R131', 'IS136', '1491: New Revelations of the Americas Before Columbus', '2024-05-05', '978-0-7432-7357-1'),
('R132', 'IS137', 'The Catcher in the Rye', '2024-05-06', '978-0-553-29698-2'),
('R133', 'IS138', 'The Great Gatsby', '2024-05-07', '978-0-525-47535-5'),
('R134', 'IS139', 'Harry Potter and the Sorcerers Stone', '2024-05-08', '978-0-679-76489-8'),
('R135', 'IS140', 'Animal Farm', '2024-05-09', '978-0-330-25864-8');

SELECT * FROM return_status;
