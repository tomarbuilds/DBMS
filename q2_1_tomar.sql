DROP DATABASE IF EXISTS VendorsDB;
CREATE DATABASE VendorsDB;
USE VendorsDB;

CREATE TABLE Vendors (
    vid INT PRIMARY KEY,
    vname VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE Parts (
    pid INT PRIMARY KEY,
    pname VARCHAR(100),
    type VARCHAR(50)
);

CREATE TABLE Inventory (
    vid INT,
    pid INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (vid) REFERENCES Vendors(vid),
    FOREIGN KEY (pid) REFERENCES Parts(pid)
);


INSERT INTO Vendors (vid, vname, address) VALUES
(1, 'Amit', 'Glenlake'),
(2, 'Arun', 'Glenwood'),
(3, 'Vikas', 'Athens'),
(4, 'Udit', 'Corona'),
(5, 'Aditya', 'Newton');


INSERT INTO Parts (pid, pname, type) VALUES
(1, 'Phone Battery', 'phone'),
(2, 'Laptop Screen', 'laptop'),
(3, 'Keyboard', 'computer'),
(4, 'Phone Charger', 'phone'),
(5, 'Laptop Charger', 'laptop'),
(6, 'Washing Machine Motor', 'washing machine'),
(7, 'Microwave Door', 'microwave'),
(8, 'Washing Machine Drum', 'washing machine'),
(9, 'Microwave Magnetron', 'microwave');


INSERT INTO Inventory (vid, pid, price) VALUES
(1, 1, 100.50),  
(1, 3, 50.00),  
(2, 2, 200.00), 
(2, 4, 25.00),   
(3, 5, 30.00),   
(4, 6, 150.00), 
(4, 7, 75.00), 
(5, 8, 250.00),
(5, 9, 120.00);

SELECT DISTINCT v.vname
FROM Vendors v
JOIN Inventory i ON v.vid = i.vid
JOIN Parts p ON i.pid = p.pid
WHERE p.type IN ('phone', 'laptop');