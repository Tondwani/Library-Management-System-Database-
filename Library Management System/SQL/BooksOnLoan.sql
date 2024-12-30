CREATE VIEW BooksOnLoan AS
SELECT b.BookID, b.Title, b.AuthorID, l.MemberID, l.LoanDate, l.DueDate
FROM Books b
JOIN Loans l ON b.BookID = l.BookID
WHERE l.ReturnDate IS NULL;
