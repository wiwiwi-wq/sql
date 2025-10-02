SELECT
    p.ProductName,
    SUM(s.Quantity) AS TotalUnitsSold
FROM
    Products p
JOIN
    Sales s ON p.ProductID = s.ProductID
GROUP BY
    p.ProductName
ORDER BY
    TotalUnitsSold DESC;

SELECT
    p.ProductName,
    SUM(s.Amount) AS TotalSalesAmount
FROM
    Products p
JOIN
    Sales s ON p.ProductID = s.ProductID
GROUP BY
    p.ProductName;

SELECT
    e.EmployeeName,
    COUNT(s.SaleID) AS TotalSalesCount
FROM
    Employees e
JOIN
    Sales s ON e.EmployeeID = s.EmployeeID
GROUP BY
    e.EmployeeName;

SELECT
    c.CityName,
    COUNT(s.SaleID) AS TotalSalesCount
FROM
    Cities c
JOIN
    Customers cust ON c.CityID = cust.CityID
JOIN
    Sales s ON cust.CustomerID = s.CustomerID
GROUP BY
    c.CityName;

SELECT
    cust.CustomerName,
    s.SaleDate
FROM
    Customers cust
JOIN
    Sales s ON cust.CustomerID = s.CustomerID
ORDER BY
    cust.CustomerName, s.SaleDate;

SELECT
    e.EmployeeName AS Seller,
    cust.CustomerName AS Buyer
FROM
    Employees e
JOIN
    Sales s ON e.EmployeeID = s.EmployeeID
JOIN
    Customers cust ON s.CustomerID = cust.CustomerID
GROUP BY
    e.EmployeeName, cust.CustomerName;
