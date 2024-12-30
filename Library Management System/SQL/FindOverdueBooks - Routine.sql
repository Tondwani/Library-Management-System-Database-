CREATE DEFINER=`root`@`localhost` PROCEDURE `FindOverdueBooks`()
BEGIN
    SELECT b.Title, l.DueDate, NOW() AS CurrentDate
    FROM Books b
    JOIN Loans l ON b.BookID = l.BookID
    WHERE l.ReturnDate IS NULL AND l.DueDate < NOW();
END