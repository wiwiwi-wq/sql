USE master;
GO

IF DB_ID('ShopDB') IS NOT NULL
    DROP DATABASE ShopDB;
GO

CREATE DATABASE ShopDB;
GO

USE ShopDB;
GO

CREATE TABLE Employees
(
    EmployeeID int NOT NULL IDENTITY PRIMARY KEY,
    FName nvarchar(15) NOT NULL,
    LName nvarchar(15) NOT NULL,
    MName nvarchar(15) NOT NULL,
    Salary money NOT NULL,
    PriorSalary money NOT NULL,
    HireDate date NOT NULL,
    TerminationDate date NULL,
    ManagerEmpID int NULL,
    FOREIGN KEY (ManagerEmpID) REFERENCES Employees(EmployeeID)
);
GO

CREATE TABLE Customers
(
    CustomerNo int NOT NULL IDENTITY PRIMARY KEY,
    FName nvarchar(15) NOT NULL,
    MName nvarchar(15) NULL,
    LName nvarchar(15) NOT NULL,
    Address1 nvarchar(50) NOT NULL,
    Address2 nvarchar(50) NULL,
    City nchar(10) NOT NULL,
    Phone char(12) NOT NULL UNIQUE,
    DateInSystem date NULL,
    CHECK (Phone LIKE '([0-9][0-9][0-9])[0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);
GO

CREATE TABLE Products
(
    ProdID int NOT NULL IDENTITY PRIMARY KEY,
    Description nchar(50),
    UnitPrice money NOT NULL,
    Weight numeric(18, 0) NULL
);
GO

CREATE TABLE Orders
(
    OrderID int NOT NULL IDENTITY PRIMARY KEY,
    CustomerNo int NOT NULL,
    OrderDate date NOT NULL,
    EmployeeID int NOT NULL,
    FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

CREATE TABLE OrderDetails
(
    OrderID int NOT NULL,
    LineItem int NOT NULL,
    ProdID int NOT NULL,
    Qty int NOT NULL,
    UnitPrice money NOT NULL,
    PRIMARY KEY (OrderID, LineItem),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProdID) REFERENCES Products(ProdID)
);
GO

EXEC sp_tables;
GO