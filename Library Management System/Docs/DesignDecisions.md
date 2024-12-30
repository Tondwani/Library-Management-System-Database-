Description:

The Entity-Relationship Diagram (ERD) illustrates the relationships between tables in the Library Management System. Key tables include:

Books: Tracks book details (BookID, Title, Author, Status).

Members: Stores member information (MemberID, Name, ContactInfo).

Loans: Links members and books with loan details (LoanID, BookID, MemberID, LoanDate, DueDate, ReturnDate).


Key Design Choices:

Normalization:

Ensured the database adheres to 3NF for data consistency.

Separate tables for books, members, and loans to avoid redundancy.

Views for Simplicity:

Created views (e.g., BooksOnLoan, OverdueBooks) for frequently accessed data to improve usability.

Triggers for Automation:

Triggers handle changes to book status automatically upon loan or return events.

Scalability:

Modular SQL structure allows easy addition of features like fines or notifications.

Security Considerations:

Used proper constraints and data validation to ensure integrity.