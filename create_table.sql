--CREATE


DROP TABLE AuthorsOfBooks CASCADE CONSTRAINTS;
DROP TABLE Phone CASCADE CONSTRAINTS;
DROP TABLE Transactions CASCADE CONSTRAINTS;
DROP TABLE Have CASCADE CONSTRAINTS;
DROP TABLE CopiesOfBook CASCADE CONSTRAINTS;
DROP TABLE Books CASCADE CONSTRAINTS;
DROP TABLE Wrote CASCADE CONSTRAINTS;
DROP TABLE Publisher CASCADE CONSTRAINTS;
DROP TABLE Patrons CASCADE CONSTRAINTS;
DROP TABLE PremiumPatrons CASCADE CONSTRAINTS;
DROP TABLE StandardPatrons CASCADE CONSTRAINTS;

CREATE TABLE AuthorsOfBooks(
    authorID INT PRIMARY KEY CHECK (authorID > 0),
    Aname VARCHAR(70) NOT NULL,
    birthDate DATE NOT NULL,
    nationality VARCHAR(100) NOT NULL
);

CREATE TABLE Patrons(
    patronID INT PRIMARY KEY CHECK (patronID > 0),
    email VARCHAR(255) NOT NULL,
    firstName VARCHAR(35) NOT NULL,
    lastName VARCHAR(35) NOT NULL,
    -- loanPeriod INT NOT NULL CHECK (loanPeriod > 0),
    -- borrowLimit INT NOT NULL CHECK (borrowLimit > 0),
    streetAddress VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    stateOfPatron VARCHAR(100) NOT NULL,
    ZIP INT NOT NULL CHECK (ZIP > 0 AND LENGTH(TO_CHAR(ZIP)) = 5)
);


CREATE TABLE Transactions(
    ID INT PRIMARY KEY CHECK (ID > 0),
    checkOutDateAndTime TIMESTAMP NOT NULL,
    overdueStatus VARCHAR(50) NOT NULL,
    returnDate DATE NOT NULL,
    dueDate DATE NOT NULL,
    patronID INT NOT NULL CHECK (patronID > 0),
    FOREIGN KEY (patronID) REFERENCES Patrons(patronID)
);

CREATE TABLE Books(
    ISBN INT PRIMARY KEY CHECK (ISBN > 0 AND LENGTH(TO_CHAR(ISBN)) = 13),
    category VARCHAR(20) NOT NULL,
    bookTitle VARCHAR(255) NOT NULL,
    price NUMBER(8,2) NOT NULL CHECK (price > 0),
    Edition INT CHECK (Edition > 0)
);

CREATE TABLE CopiesOfBook(
    copyNumber INT CHECK (copyNumber > 0),
    StatusOfCopy VARCHAR(50) NOT NULL,
    ISBN INT CHECK (ISBN > 0 AND LENGTH(TO_CHAR(ISBN)) = 13), 
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    PRIMARY KEY (copyNumber, ISBN)
);

CREATE TABLE Have(
    copyNumber INT CHECK (copyNumber > 0),
    ID INT CHECK (ID > 0),
    ISBN INT CHECK (ISBN > 0 AND LENGTH(TO_CHAR(ISBN)) = 13),
    PRIMARY KEY (copyNumber, ISBN, ID),
    FOREIGN KEY (ID) REFERENCES Transactions(ID),
    FOREIGN KEY (copyNumber, ISBN) REFERENCES CopiesOfBook(copyNumber, ISBN)
);

CREATE TABLE Wrote(
    authorID INT CHECK (authorID > 0), 
    FOREIGN KEY (authorID) REFERENCES AuthorsOfBooks(authorID),
    ISBN INT CHECK (ISBN > 0 AND LENGTH(TO_CHAR(ISBN)) = 13), 
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    PRIMARY KEY (authorID, ISBN)
);

CREATE TABLE Publisher(
    authorID INT PRIMARY KEY CHECK (authorID > 0),
    publisherAssociation VARCHAR(100) NOT NULL,
    FOREIGN KEY (authorID) REFERENCES AuthorsOfBooks(authorID)
);

CREATE TABLE StandardPatrons(
    patronID INT PRIMARY KEY CHECK (patronID > 0),
    email VARCHAR(255) NOT NULL,
    firstName VARCHAR(35) NOT NULL,
    lastName VARCHAR(35) NOT NULL,
    loanPeriod INT NOT NULL CHECK (loanPeriod > 0),
    borrowLimit INT NOT NULL CHECK (borrowLimit > 0),
    streetAddress VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    stateOfPatron VARCHAR(100) NOT NULL,
    ZIP INT NOT NULL CHECK (ZIP > 0 AND LENGTH(TO_CHAR(ZIP)) = 5),
    FOREIGN KEY (patronID) REFERENCES Patrons(patronID)
);

CREATE TABLE PremiumPatrons(
    patronID INT PRIMARY KEY CHECK (patronID > 0),
    email VARCHAR(255) NOT NULL,
    firstName VARCHAR(35) NOT NULL,
    lastName VARCHAR(35) NOT NULL,
    loanPeriod INT NOT NULL CHECK (loanPeriod > 0),
    borrowLimit INT NOT NULL CHECK (borrowLimit > 0),
    streetAddress VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    stateOfPatron VARCHAR(100) NOT NULL,
    ZIP INT NOT NULL CHECK (ZIP > 0 AND LENGTH(TO_CHAR(ZIP)) = 5),
    FOREIGN KEY (patronID) REFERENCES Patrons(patronID)
);

CREATE TABLE Phone(
    patronID INT PRIMARY KEY CHECK (patronID > 0),
    phoneNum INT NOT NULL CHECK (phoneNum > 0),
    FOREIGN KEY (patronID) REFERENCES Patrons(patronID)
);

--INSERT HOWWWWWWWWWWW???
INSERT INTO AuthorsOfBooks(authorID, Aname, birthDate, nationality) 
VALUES (1, 'Vu', DATE '2005-04-10', 'VN');

INSERT INTO Books (ISBN, category, bookTitle, price, Edition) 
VALUES (9780987654321, 'Science Fiction', 'FICTION', 299.99, 1);
INSERT INTO Books (ISBN, category, bookTitle, price, Edition) 
VALUES (9781234567890, 'Graphic Novel', 'zomme', 29.99, 1);
INSERT INTO Books (ISBN, category, bookTitle, price, Edition) 
VALUES (9781234567891, 'HIhihaha', 'zomme', 199.99, 1);

-- INSERT INTO BOOKS (ISBN, category, bookTitle, price, Edition)
-- VALUES(9781234567890, 'Graphic Novel', 'zomme', 29.99, 1);

-- INSERT INTO BOOKS (ISBN, category, bookTitle, price, Edition)
-- VALUES(9781234567891, 'HIhihaha', 'zomme', 199.99, 1);
-- INSERT INTO Books (ISBN, category, bookTitle, price, Edition)
-- VALUES (9780987654321, 'Science Fiction', 'Sci-Fi Book 1', 20.99, 1);

-- INSERT INTO Books (ISBN, category, bookTitle, price, Edition)
-- VALUES (9781234567890, 'Fantasy', 'Fantasy Book 1', 15.99, 1);

-- INSERT INTO Books (ISBN, category, bookTitle, price, Edition)
-- VALUES (9781234567891, 'Mystery', 'Mystery Book 1', 12.99, 1);

INSERT INTO Books (ISBN, category, bookTitle, price, Edition)
VALUES (9781234567897, 'Romance', 'Romance Book 1', 9.99, 1);

INSERT INTO Books (ISBN, category, bookTitle, price, Edition)
VALUES (9789876543210, 'Thriller', 'Thriller Book 1', 18.99, 1);

INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
VALUES (12, 'Available', 9780987654321);
INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
VALUES (18, 'Damaged', 9781234567890);
INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
VALUES (7, 'Damaged', 9781234567891);
INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
VALUES (1, 'Available', 9781234567897);
INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
VALUES (2, 'Available', 9781234567897);
INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
VALUES (3, 'Checked Out', 9781234567897);
INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
VALUES (1, 'Available', 9789876543210);

-- INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
-- VALUES(18, 'OK', 9781234567890);

-- INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
-- VALUES(7, 'Bad', 9781234567891);

INSERT INTO Wrote(authorID, ISBN)
VALUES(1, 9780987654321);

INSERT INTO Patrons (patronID, email, firstName, lastName, streetAddress, city, stateOfPatron, ZIP)
VALUES  (6, 'john.doe@example.com', 'John', 'Doe','123 Elm Street', 'Fairfax', 'Virginia', 22030);
INSERT INTO Patrons (patronID, email, firstName, lastName, streetAddress, city, stateOfPatron, ZIP)
VALUES  (5, 'jane.smith@example.com', 'Jane', 'Smith', '456 Maple Avenue', 'Alexandria', 'Virginia', 22030);
INSERT INTO Patrons (patronID, email, firstName, lastName, streetAddress, city, stateOfPatron, ZIP)
VALUES  (1, 'alice@example.com', 'Alice', 'Johnson', '123 Library St', 'NYC', 'NY', 10001);
INSERT INTO Patrons (patronID, email, firstName, lastName, streetAddress, city, stateOfPatron, ZIP)
VALUES  (2, 'bob@example.com', 'Bob', 'Smith', '456 Reading Rd', 'LA', 'CA', 90001);
INSERT INTO Patrons (patronID, email, firstName, lastName, streetAddress, city, stateOfPatron, ZIP) 
VALUES (3, 'charlie.adams@email.com', 'Charlie', 'Adams', '789 Birch Ln', 'Denver', 'CO', '80202');
INSERT INTO Patrons (patronID, email, firstName, lastName, streetAddress, city, stateOfPatron, ZIP) 
VALUES (4, 'diana.lee@email.com', 'Diana', 'Lee', '321 Pine Rd', 'Seattle', 'WA', '98101');

-- INSERT INTO Patrons (patronID, email, firstName, lastName, streetAddress, city, stateOfPatron, ZIP)
-- VALUES (2, 'jane.smith@example.com', 'Jane', 'Smith', '456 Maple Avenue', 'Alexandria', 'Virginia', 22030);

INSERT INTO StandardPatrons (patronID, email, firstName, lastName, loanPeriod, borrowLimit, streetAddress, city, stateOfPatron, ZIP)
VALUES (6, 'john.doe@example.com', 'John', 'Doe', 14, 5, '123 Elm Street', 'Fairfax', 'Virginia', 22030);

INSERT INTO PREMIUMPATRONS (patronID, email, firstName, lastName, loanPeriod, borrowLimit, streetAddress, city, stateOfPatron, ZIP)
VALUES (5, 'jane.smith@example.com', 'Jane', 'Smith', 30, 10, '456 Maple Avenue', 'Alexandria', 'Virginia', 22030);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID)
VALUES (39, TIMESTAMP '2025-03-27 14:30:00', 'Not Overdue', DATE '2025-04-10', DATE '2025-04-17', 1);
INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID)
VALUES (1, TIMESTAMP '2024-03-01 10:00:00', 'Overdue', DATE '2024-03-10', DATE '2024-03-05', 3);
INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID)
VALUES (2, TIMESTAMP '2024-03-02 14:30:00', 'On Time', DATE '2024-03-05', DATE '2024-03-06', 4);


--7
INSERT INTO Books (ISBN, category, bookTitle, price, Edition) 
VALUES (9781234567807, 'Fiction', 'Kun', 19.99, 1);

INSERT INTO CopiesOfBook (copyNumber, StatusOfCopy, ISBN) 
VALUES (1, 'Available', 9781234567807);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (7, TIMESTAMP '2024-01-10 08:00:00', 'Returned', DATE '2024-01-15', DATE '2024-01-14', 1);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (8, TIMESTAMP '2024-02-05 09:00:00', 'Returned', DATE '2024-02-10', DATE '2024-02-09', 1);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (3, TIMESTAMP '2024-03-01 10:00:00', 'Returned', DATE '2024-03-06', DATE '2024-03-05', 1);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (4, TIMESTAMP '2024-03-10 14:00:00', 'Returned', DATE '2024-03-15', DATE '2024-03-14', 1);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (5, TIMESTAMP '2024-04-01 16:00:00', 'Returned', DATE '2024-04-06', DATE '2024-04-05', 1);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (6, TIMESTAMP '2024-04-15 12:00:00', 'Returned', DATE '2024-04-20', DATE '2024-04-19', 1);

INSERT INTO Have (copyNumber, ID, ISBN) VALUES (1, 1, 9781234567807);
INSERT INTO Have (copyNumber, ID, ISBN) VALUES (1, 2, 9781234567807);
INSERT INTO Have (copyNumber, ID, ISBN) VALUES (1, 3, 9781234567807);
INSERT INTO Have (copyNumber, ID, ISBN) VALUES (1, 4, 9781234567807);
INSERT INTO Have (copyNumber, ID, ISBN) VALUES (1, 5, 9781234567807);
INSERT INTO Have (copyNumber, ID, ISBN) VALUES (1, 6, 9781234567807);

--8
-- INSERT INTO Books (ISBN, category, bookTitle, price, Edition) 
-- VALUES (9780987654321, 'Science Fiction', 'FICTION', 299.99, 1);

-- INSERT INTO CopiesOfBook (copyNumber,StatusOfCopy, ISBN)
-- VALUES (12, 'Available', 9780987654321);

INSERT INTO Books (ISBN, category, bookTitle, price, Edition) 
VALUES (9000000000001, 'Science Fiction', 'Guy', 15.99, 1);

INSERT INTO Books (ISBN, category, bookTitle, price, Edition) 
VALUES (9000000000002, 'Science Fiction', 'Guy2', 17.99, 1);

INSERT INTO CopiesOfBook (copyNumber, StatusOfCopy, ISBN) 
VALUES (1, 'Checked Out', 9000000000001);

INSERT INTO CopiesOfBook (copyNumber, StatusOfCopy, ISBN) 
VALUES (2, 'Checked Out', 9000000000002);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (10, TIMESTAMP '2024-01-10 08:00:00', 'Returned', DATE '2024-01-15', DATE '2024-01-14', 1);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (11, TIMESTAMP '2024-02-05 09:00:00', 'Returned', DATE '2024-02-10', DATE '2024-02-09', 1);

INSERT INTO Transactions (ID, checkOutDateAndTime, overdueStatus, returnDate, dueDate, patronID) 
VALUES (12, TIMESTAMP '2024-02-05 07:00:00', 'Returned', DATE '2024-02-10', DATE '2024-02-09', 1);

INSERT INTO Have (copyNumber, ID, ISBN) 
VALUES (1, 10, 9000000000001);

INSERT INTO Have (copyNumber, ID, ISBN) 
VALUES (2, 11, 9000000000002);

INSERT INTO Have (copyNumber, ID, ISBN) 
VALUES (12, 11, 9780987654321);
--QUERY
--1
SELECT C.copyNumber, TO_CHAR(C.ISBN)
FROM CopiesOfBook C
WHERE StatusOfCopy = 'Available';
--2
SELECT SP.firstName, SP.email
FROM StandardPatrons SP
WHERE ZIP = '22030';
--3
SELECT PP.patronID, PP.email
FROM PremiumPatrons PP
WHERE PP.patronID NOT IN (SELECT T.patronID FROM Transactions T);

-- SELECT A.Aname
-- FROM Books B
-- JOIN Wrote W ON B.ISBN = W.ISBN
-- JOIN AuthorsOfBooks A ON A.authorID = W.authorID
-- WHERE B.category IN ('Science Fiction', 'Graphic Novel');
--4
SELECT A.Aname
FROM Books B, Wrote W, AuthorsOfBooks A
WHERE B.ISBN = W.ISBN AND A.authorID = W.authorID
AND B.category IN ('Science Fiction', 'Graphic Novel');
--5
SELECT COUNT(C.COPYNUMBER), TO_CHAR(C.ISBN)
FROM CopiesOfBook C, Books B
WHERE C.ISBN = B.ISBN AND C.StatusOfCopy = 'Available'
GROUP BY B.ISBN;
--6
SELECT DISTINCT P.patronID
FROM PATRONS P, TRANSACTIONS T
WHERE T.patronID = P.patronID AND (T.DUEDATE < T.CHECKOUTDATEANDTIME OR T.DUEDATE < T.RETURNDATE);
--7
SELECT TO_CHAR(C.ISBN), B.bookTitle
FROM CopiesOfBook C, Books B, Transactions T, Have H
WHERE C.ISBN = B.ISBN AND H.copyNumber = C.copyNumber AND C.ISBN = H.ISBN AND H.ID = T.ID
GROUP BY C.ISBN, B.bookTitle
HAVING COUNT(T.ID) > 5;

-- SELECT TO_CHAR(C.ISBN), B.bookTitle
-- FROM Books B
-- JOIN CopiesOfBook C ON B.ISBN = C.ISBN
-- JOIN Have H ON C.copyNumber = H.copyNumber AND C.ISBN = H.ISBN
-- JOIN Transactions T ON H.ID = T.ID
-- GROUP BY C.ISBN, B.bookTitle
-- HAVING COUNT(T.ID) > 5;


--8
SELECT P.patronID
FROM Patrons P
WHERE NOT EXISTS (
    SELECT B.ISBN
    FROM Books B
    WHERE B.category = 'Science Fiction'
    AND NOT EXISTS (
        SELECT *
        FROM Transactions T, Have H, CopiesOfBook C
        WHERE T.ID = H.ID 
        AND H.copyNumber = C.copyNumber
        AND C.ISBN = B.ISBN
        AND T.patronID = P.patronID
    )
);
