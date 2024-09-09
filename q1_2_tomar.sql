DROP DATABASE IF EXISTS FinanceDB;
CREATE DATABASE FinanceDB;
USE FinanceDB;

CREATE TABLE office (
    office_name VARCHAR(50) PRIMARY KEY,
    office_city VARCHAR(50),
    holdings DECIMAL(15, 2)
);

CREATE TABLE client (
    id INT PRIMARY KEY,
    client_name VARCHAR(100),
    client_street VARCHAR(255),
    client_city VARCHAR(50)
);

CREATE TABLE loan (
    loan_number INT PRIMARY KEY,
    office_name VARCHAR(50),
    amount DECIMAL(15, 2),
    FOREIGN KEY (office_name) REFERENCES office(office_name)
);

CREATE TABLE lender (
    id INT,
    loan_number INT,
    FOREIGN KEY (loan_number) REFERENCES loan(loan_number)
);

CREATE TABLE account (
    account_num INT PRIMARY KEY,
    office_name VARCHAR(50),
    balance DECIMAL(15, 2),
    FOREIGN KEY (office_name) REFERENCES office(office_name)
);

CREATE TABLE investor (
    id INT PRIMARY KEY,
    investor_name VARCHAR(100),
    account_num INT,
    FOREIGN KEY (account_num) REFERENCES account(account_num)
);

INSERT INTO office (office_name, office_city, holdings) VALUES
('Boulder', 'Boulder', 500000),
('Delhi', 'Delhi', 750000),
('Mumbai', 'Mumbai', 850000),
('Denver', 'Denver', 650000),
('New York', 'New York', 900000),
('Seattle', 'Seattle', 700000);

INSERT INTO client (id, client_name, client_street, client_city) VALUES
(1, 'Alice Johnson', '123 Main St', 'Boulder'),
(2, 'Bob Smith', '456 Oak St', 'Delhi'),
(3, 'Charlie Brown', '789 Pine St', 'Mumbai'),
(4, 'Diane Adams', '321 Maple St', 'New York'),
(5, 'Emily Davis', '654 Birch St', 'Seattle');

INSERT INTO loan (loan_number, office_name, amount) VALUES
(101, 'Boulder', 20000),
(102, 'Delhi', 30000),
(103, 'Mumbai', 40000),
(104, 'Denver', 50000),
(105, 'New York', 60000);

INSERT INTO lender (id, loan_number) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105);

INSERT INTO account (account_num, office_name, balance) VALUES
(1001, 'Boulder', 6000),
(1002, 'Boulder', 4000),
(1003, 'Delhi', 8000),
(1004, 'Mumbai', 3000),
(1005, 'New York', 7000),
(1006, 'Seattle', 9000);

INSERT INTO investor (id, investor_name, account_num) VALUES
(1, 'Uditanshu', 1001),
(2, 'Rahul', 1002),
(3, 'Gyanig', 1003),
(4, 'Sanskar', 1004),
(5, 'Akshit', 1005),
(6, 'Vikrant', 1006);

SELECT DISTINCT i.id, i.investor_name
FROM investor i
JOIN account a ON i.account_num = a.account_num
WHERE a.office_name = 'Boulder' AND a.balance > 5000;