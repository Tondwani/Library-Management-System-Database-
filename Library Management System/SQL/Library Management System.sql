-- Insert data into Authors table
INSERT INTO Authors (FirstName, LastName, Bio)
VALUES ('Tondwani', 'Craig', 'Author of many popular reality novels.');

-- Insert data into Books table
INSERT INTO Books (Title, AuthorID, Genre, PublishedYear, AvailableCopies)
VALUES ('Jesus Christ is king', 5, 'Reality', 2024, 6);

-- Insert valid data into Loans table
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (13, 11, '2024-05-02', '2024-07-02');


-- Assuming BookID 999 does not exist
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (999, 1, '2024-07-15', '2024-07-22');

-- Insert data into Members table
INSERT INTO Members (FirstName, LastName, Email, JoinDate)
VALUES ('Phillip', 'Hlakhu', 'Hlakhu012@gmail.com', '2022-12-09');

SELECT b.Title, m.FirstName, m.LastName, l.LoanDate, l.DueDate
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
JOIN Members m ON l.MemberID = m.MemberID
LEFT JOIN Returns r ON l.LoanID = r.LoanID
WHERE r.ReturnDate IS NULL AND l.DueDate < CURDATE();

-- Example: Insert data into Returns table
INSERT INTO Returns (LoanID, ReturnDate)
VALUES (101, '2024-07-02'); -- Replace 1 with an actual LoanID from your Loans table


-- Query to retrieve returned books information
SELECT 
    b.Title AS BookTitle, 
    m.FirstName AS MemberFirstName, 
    m.LastName AS MemberLastName, 
    l.LoanDate, 
    r.ReturnDate
FROM 
    Books b
JOIN 
    Loans l ON b.BookID = l.BookID
JOIN 
    Members m ON l.MemberID = m.MemberID
JOIN 
    Returns r ON l.LoanID = r.LoanID;
    
SHOW COLUMNS FROM Members;
SHOW COLUMNS FROM Loans;
SHOW COLUMNS FROM Books;
SHOW COLUMNS FROM Returns;

-- Insert data into Authors table
INSERT INTO Authors (FirstName, LastName, Bio)
VALUES ('Tondwani', 'Craig', 'Author of many popular reality novels.');

-- Insert data into Books table
INSERT INTO Books (Title, AuthorID, Genre, PublishedYear, AvailableCopies)
VALUES ('Jesus Christ is king', 1, 'Reality', 2024, 6);

-- Insert data into Members table
INSERT INTO Members (FirstName, LastName, Email, JoinDate)
VALUES ('Phillip', 'Hlakhu', 'Hlakhu012@gmail.com', '2022-12-09');

-- Insert data into Loans table
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (1, 1, '2024-05-02', '2024-07-02');

-- Insert data into Returns table
INSERT INTO Returns (LoanID, ReturnDate)
VALUES (1, '2024-07-03');

-- Query to retrieve returned books information
SELECT 
    b.Title AS BookTitle, 
    m.FirstName AS MemberFirstName, 
    m.LastName AS MemberLastName, 
    l.LoanDate, 
    r.ReturnDate
FROM 
    Books b
JOIN 
    Loans l ON b.BookID = l.BookID
JOIN 
    Members m ON l.MemberID = m.MemberID
JOIN 
    Returns r ON l.LoanID = r.LoanID
LIMIT 0, 1000;


SELECT Loans.*, Members.*
FROM Loans
LEFT JOIN Members ON Loans.MemberID = Members.MemberID
LIMIT 0, 1000;


SHOW COLUMNS FROM Members;
SHOW COLUMNS FROM Loans;
SHOW CREATE TABLE Loans;
SHOW COLUMNS FROM Books;


SELECT b.Title, COUNT(l.BookID) AS TotalBorrowed
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
GROUP BY b.Title
ORDER BY TotalBorrowed DESC;

SELECT DATE_FORMAT(l.LoanDate, '%Y-%m') AS Month, COUNT(*) AS TotalBorrowed
FROM Loans l
GROUP BY Month
ORDER BY Month;

CALL FindOverdueBooks();

ALTER TABLE Books ADD COLUMN Status VARCHAR(20);

SHOW COLUMNS FROM Books;

SHOW TRIGGERS LIKE 'Loans';

CREATE OR REPLACE VIEW BooksOnLoan AS
SELECT b.BookID, b.Title, b.AuthorID, l.MemberID, l.LoanDate, l.DueDate
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
WHERE l.ReturnDate IS NULL;

INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (17, 15, NOW(), DATE_ADD(NOW(), INTERVAL 14 DAY));

SHOW COLUMNS FROM Loans;

INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (17, 15, '2024-07-17', '2024-07-31');

SELECT BookID, Title, Status
FROM Books
WHERE BookID = 17;

UPDATE Loans
SET ReturnDate = '2024-07-31'
WHERE BookID = 17 AND MemberID = 15;

SELECT BookID, Title, Status
FROM Books
WHERE BookID = 17;

SELECT * FROM BooksOnLoan;

ALTER TABLE Books ADD COLUMN AuthorID INT;

SHOW COLUMNS FROM Loans;

ALTER TABLE Loans ADD COLUMN ReturnDate DATETIME;

CREATE OR REPLACE VIEW BooksOnLoan AS
SELECT b.BookID, b.Title, b.AuthorID, l.MemberID, l.LoanDate, l.DueDate
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
WHERE l.ReturnDate IS NULL;

INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (17, 15, '2024-07-17', '2024-07-31');

SELECT * FROM BooksOnLoan;

UPDATE Loans
SET ReturnDate = '2024-07-31'
WHERE BookID = 17 AND MemberID = 15;



















