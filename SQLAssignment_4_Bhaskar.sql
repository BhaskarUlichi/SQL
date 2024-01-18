--- DSCI 723 Data Management and Warehousing Assignment 4
--- Bhaskar Teja Ulichi [101127292]
use AdventureWorks2019;


---Q1
SELECT p.ProductID, p.Name, p.Color, p.Size, m.CatalogDescription
FROM Production.Product as p
LEFT Join
Production.ProductModel as m
on p.ProductModelID = m.ProductModelID
order by p.ProductID;

---Q2
SELECT p.ProductID, p.Name, o.SalesOrderID
FROM Production.Product as p
LEFT JOIN SALES.SalesOrderDetail as o
ON p.ProductID = o.SalesOrderDetailID 
ORDER BY p.ProductID;

---Q3
SELECT s.BusinessEntityID,p.ProductID
FROM SALES.SalesPerson as s
CROSS JOIN
Production.Product as p
order by s.BusinessEntityID;

---Q4
SELECT p.ProductID, p.Name, o.SalesOrderID
FROM Production.Product as p
FULL JOIN SALES.SalesOrderDetail as o
ON p.ProductID = o.SalesOrderDetailID 
Order By p.ProductID;
