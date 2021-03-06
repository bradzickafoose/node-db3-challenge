-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT P.ProductName, C.CategoryName FROM Product as P
JOIN Category as C
on P.CategoryId = C.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT
    o.id,
    s.CompanyName
FROM [order] as o
JOIN shipper as s
    ON o.ShipVia = s.Id
WHERE o.OrderDate < '2012-08-09';

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT
    P.ProductName,
    od.Quantity
FROM [product] as p
JOIN orderDetail as od
    ON od.productId = p.id
WHERE od.orderId = 10251
ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT
    O.Id,
    C.CompanyName,
    E.LastName
FROM [Order] as O
JOIN
    Customer as C,
    Employee as E
ON  C.Id = O.CustomerId
AND E.Id = O.EmployeeId;
