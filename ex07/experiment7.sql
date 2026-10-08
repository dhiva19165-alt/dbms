-- Ex No: 7
-- Table Creation

CREATE TABLE Authors (
  AuthorID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50)
);

CREATE TABLE Books (
  BookID INT PRIMARY KEY AUTO_INCREMENT,
  Title VARCHAR(100),
  Genre VARCHAR(50),
  PublicationYear INT
);

CREATE TABLE BookAuthors (
  BookID INT,
  AuthorID INT,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Borrowers (
  BorrowerID INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  MembershipDate DATE
);

CREATE TABLE BorrowedBooks (
  BorrowerID INT,
  BookID INT,
  BorrowedDate DATE,
  ReturnDate DATE,
  PRIMARY KEY (BorrowerID, BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Sample Data

INSERT INTO Authors (FirstName, LastName) VALUES
('George', 'Orwell'),
('J.K.', 'Rowling'),
('Mark', 'Twain');

INSERT INTO Books (Title, Genre, PublicationYear) VALUES
('1984', 'Dystopian', 1949),
('Harry Potter and the Sorcerer''s Stone', 'Fantasy', 1997),
('The Adventures of Tom Sawyer', 'Fiction', 1876);

INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Borrowers (FirstName, LastName, MembershipDate) VALUES
('Alice', 'Johnson', '2022-03-15'),
('Bob', 'Smith', '2023-07-01'),
('Clara', 'Davis', '2021-11-20');

INSERT INTO BorrowedBooks (BorrowerID, BookID, BorrowedDate, ReturnDate) VALUES
(1, 2, '2024-01-10', '2024-01-25'),
(2, 1, '2024-02-05', '2024-02-20'),
(3, 3, '2024-03-01', '2024-03-15');
