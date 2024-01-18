---SQL ASSIGNMENT 2
--- Bhaskar Teja Ulichi [101127292]

use AdventureWorksLT2019;

---Q1
SELECT ProductID, Name, ProductNumber, ListPrice, SellStartDate, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL
ORDER BY SellStartDate;

SELECT ProductID, Name, ProductNumber, ListPrice, SellStartDate, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL
ORDER BY ListPrice DESC, ProductID;

--- Q2
SELECT top (12) ProductID, Name, ProductNumber, ListPrice, SellStartDate, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL
ORDER BY ListPrice DESC, ProductID;

---Q3
SELECT top (12) percent ProductID, Name, ProductNumber, ListPrice, SellStartDate, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL
ORDER BY ListPrice DESC, ProductID;
--- The results are not different from Q2 as 12 percent of total of 98 rows comes as 11.76 which is approximately 12 rows

---Q4
SELECT top (4) with ties ProductID, Name, ProductNumber, ListPrice, SellStartDate, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL
ORDER BY ListPrice DESC;

---Q5
SELECT ProductID, Name, ProductNumber, ListPrice, SellStartDate, SellEndDate
FROM SalesLT.Product
WHERE SellEndDate IS NOT NULL
ORDER BY ListPrice DESC, ProductID
offset 5 rows fetch next 11 rows only; 






