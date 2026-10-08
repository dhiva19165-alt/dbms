-- DBMS Mini Project: Railway Reservation System

CREATE DATABASE Railway_Reservation;
USE Railway_Reservation;

CREATE TABLE Train (
    Train_ID INT PRIMARY KEY,
    Train_Name VARCHAR(50),
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Available_Seats INT
);

CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY,
    Passenger_Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Phone VARCHAR(15)
);

CREATE TABLE Reservation (
    Reservation_ID INT PRIMARY KEY,
    Passenger_ID INT,
    Train_ID INT,
    Journey_Date DATE,
    Seat_No INT,
    Status VARCHAR(20),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Train_ID) REFERENCES Train(Train_ID)
);

-- Insert Values

INSERT INTO Train VALUES
(101, 'Chennai Express', 'Chennai', 'Bangalore', 100),
(102, 'Coimbatore Express', 'Chennai', 'Coimbatore', 80),
(103, 'Salem Express', 'Chennai', 'Salem', 60);

INSERT INTO Passenger VALUES
(201, 'Ravi', 25, 'Male', '9000000001'),
(202, 'Anitha', 22, 'Female', '9000000002'),
(203, 'Kumar', 35, 'Male', '9000000003');

INSERT INTO Reservation VALUES
(301, 201, 101, '2026-10-15', 25, 'Confirmed'),
(302, 202, 102, '2026-10-16', 30, 'Confirmed'),
(303, 203, 103, '2026-10-17', 15, 'Pending');

-- Display All Trains
SELECT * FROM Train;

-- Display Passenger Details
SELECT * FROM Passenger;

-- Display Reservation Details
SELECT P.Passenger_Name, T.Train_Name,
       T.Source, T.Destination,
       R.Journey_Date, R.Seat_No, R.Status
FROM Reservation R
JOIN Passenger P ON R.Passenger_ID = P.Passenger_ID
JOIN Train T ON R.Train_ID = T.Train_ID;

-- Check Available Seats
SELECT Train_Name, Available_Seats
FROM Train
WHERE Available_Seats > 0;

-- Update Reservation Status
UPDATE Reservation
SET Status = 'Confirmed'
WHERE Reservation_ID = 303;

-- Cancel Reservation
UPDATE Reservation
SET Status = 'Cancelled'
WHERE Reservation_ID = 303;

-- Sample Output:
-- Passenger_Name  Train_Name          Source   Destination  Journey_Date  Seat_No  Status
-- Ravi            Chennai Express    Chennai  Bangalore    2026-10-15    25       Confirmed
