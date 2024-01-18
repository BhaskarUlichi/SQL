---DSCI 723 : Data Management & Warehousing
--- SQL Assignment 6
--- Bhaskar Teja Ulichi [101127292]

use AdventureWorks2019;
Select * from sales.salesorderheader;
select * from Sales.SalesTerritory;

---1

Select st.Name as [Territory Name], CONVERT(nvarchar, AVG(DATEDIFF(day, o.OrderDate, o.ShipDate))) + ' days' as [Avg Order Processing Time] 
from Sales.SalesOrderHeader as o JOIN Sales.SalesTerritory as st
on o.TerritoryID = st.TerritoryID
Group By st.Name
ORDER BY st.Name; 

---2
SELECT DATEPART(year, OrderDate) as [Year], 
	   DATENAME(MONTH, OrderDate) as [Month],
	   format(SUM(SubTotal),'C') as [Monthly Sales]
	   from sales.SalesOrderHeader
GROUP BY DATEPART(year, OrderDate), DATEPART(MONTH, OrderDate), DATENAME(MONTH, OrderDate)
ORDER BY DATEPART(year, OrderDate), DATEPART(MONTH, OrderDate);

---3
SELECT DATEPART(year, OrderDate) as [Year], 
	   Case 
		   When DATEPART(QUARTER, OrderDate) = 1 then 'Q1'
		   When DATEPART(QUARTER, OrderDate) = 2 then 'Q2'
		   When DATEPART(QUARTER, OrderDate) = 3 then 'Q3'
		   else 'Q4'
		end as [Quarter],
	   format(SUM(SubTotal),'C') as [Quarterly Sales]
	   from sales.SalesOrderHeader
GROUP BY DATEPART(year, OrderDate), 
	   Case 
		   When DATEPART(QUARTER, OrderDate) = 1 then 'Q1'
		   When DATEPART(QUARTER, OrderDate) = 2 then 'Q2'
		   When DATEPART(QUARTER, OrderDate) = 3 then 'Q3'
		   else 'Q4'
		end
ORDER BY 1,2;


