USE ShopDB
GO

CREATE TABLE Employees (
    EmployeeID int PRIMARY KEY,
    FName nvarchar(15) NOT NULL,
    LName nvarchar(15) NOT NULL,
    MName nvarchar(15),
    Salary money,
    PriorSalary money,
    HireDate date,
    TerminationDate date NULL,
    ManagerEmpID int NULL
);
GO

CREATE TABLE Customers (
    CustomerNo int PRIMARY KEY,
    FName nvarchar(15) NOT NULL,
    LName nvarchar(15) NOT NULL,
    MName nvarchar(15),
    Address1 nvarchar(50) NOT NULL,
    Address2 nvarchar(50),
    City nchar(10) NOT NULL,
    Phone char(12) NOT NULL,
    DateInSystem date NOT NULL
);
GO

CREATE TABLE Orders (
    OrderID int PRIMARY KEY,
    CustomerNo int NOT NULL,
    OrderDate date NOT NULL,
    EmployeeID int NOT NULL,
    FOREIGN KEY (CustomerNo) REFERENCES Customers(CustomerNo),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
GO

SELECT * FROM Employees;
SELECT * FROM Customers;
SELECT * FROM Orders;


DROP TABLE Orders;
DROP TABLE Customers;
DROP TABLE Employees;
GO
