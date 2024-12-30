Common Tasks:

View All Books on Loan:
Run the query:

SELECT * FROM BooksOnLoan;
Check Overdue Books:
Add a New Member:
INSERT INTO Members (Name, ContactInfo) VALUES ('John Doe', 'johndoe@example.com');
Loan a Book:
INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate)
VALUES (1, 2, NOW(), DATE_ADD(NOW(), INTERVAL 14 DAY));
Return a Book:
UPDATE Loans
SET ReturnDate = NOW()
WHERE LoanID = 1;