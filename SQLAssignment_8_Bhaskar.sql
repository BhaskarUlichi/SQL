---DSCI 723 - Data Management and Warehousing SQL Assignment 8
---Bhaskar Teja Ulichi [101127292]

use AdventureWorksDW2019;

--- GROUPING SETS (Generates 558 rows)
SELECT c.EnglishProductCategoryName as Category, sc.EnglishProductSubcategoryName as SubCategory,
p.EnglishProductName as Product, Sum(s.SalesAmount) as Sales 
FROM FactInternetSales s INNER JOIN DimProduct p ON s.ProductKey = p.ProductKey
JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN DimProductCategory c ON c.ProductCategoryKey = sc.ProductCategoryKey
GROUP BY grouping sets 
(
	(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName),
	(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName),
	(c.EnglishProductCategoryName, p.EnglishProductName),
	(sc.EnglishProductSubcategoryName, p.EnglishProductName),
	(c.EnglishProductCategoryName), (sc.EnglishProductSubcategoryName), (p.EnglishProductName),
	()
);

--- CUBE (Generates 558 rows)
SELECT c.EnglishProductCategoryName as Category, sc.EnglishProductSubcategoryName as SubCategory,
p.EnglishProductName as Product, Sum(s.SalesAmount) as Sales 
FROM FactInternetSales s INNER JOIN DimProduct p ON s.ProductKey = p.ProductKey
JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN DimProductCategory c ON c.ProductCategoryKey = sc.ProductCategoryKey
GROUP BY cube (c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName);

--- As we can see from the above results, The number of rows returned by Grouping Sets and Cube are the same. This is because
---We have specified all possible combination of groupings in Grouping Sets and Cube returns us all possible combinations among
--- the given 3 columns. 

---ROLL UP (Generates 151 rows)
SELECT c.EnglishProductCategoryName as Category, sc.EnglishProductSubcategoryName as SubCategory,
p.EnglishProductName as Product, Sum(s.SalesAmount) as Sales 
FROM FactInternetSales s INNER JOIN DimProduct p ON s.ProductKey = p.ProductKey
JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey
JOIN DimProductCategory c ON c.ProductCategoryKey = sc.ProductCategoryKey
GROUP BY Rollup (c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName);


---ROLLUP clause Using GROUPING function (Generates 151 rows): 
SELECT 
CASE WHEN GROUPING(c.EnglishProductCategoryName) = 1 THEN 'All Categories' ELSE c.EnglishProductCategoryName END AS Category, 
CASE WHEN GROUPING(sc.EnglishProductSubcategoryName) = 1 THEN 'All Sub-categories' ELSE sc.EnglishProductSubcategoryName END AS Subcategory, 
CASE WHEN GROUPING(p.EnglishProductName) = 1 THEN 'All Products' ELSE p.EnglishProductName END AS Product, 
SUM(s.SalesAmount) AS SalesAmount 
FROM 
FactInternetSales s 
INNER JOIN DimProduct p ON s.ProductKey = p.ProductKey 
INNER JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey 
INNER JOIN DimProductCategory c ON c.ProductCategoryKey = sc.ProductCategoryKey 
GROUP BY ROLLUP(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName); 

  
---ROLLUP clause & GROUPING_ID function (Generates 151 rows): 
SELECT  
	CASE  
		WHEN GROUPING_ID(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName) = 7 THEN 'All Products' 
		ELSE c.EnglishProductCategoryName 
	END AS Category, 
	CASE  
		WHEN GROUPING_ID(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName) = 7 THEN 'All Products' 
		WHEN GROUPING_ID(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName) = 3 THEN 'All Sub-Categories' 
		ELSE sc.EnglishProductSubcategoryName
	END AS SubCategory, 
	CASE  
		WHEN GROUPING_ID(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName) in (1,3,7) THEN 'All Products' 
		ELSE p.EnglishProductName 
	END AS Product, 
	SUM(s.SalesAmount) AS TotalSales 
FROM FactInternetSales s 
INNER JOIN DimProduct p ON s.ProductKey = p.ProductKey 
INNER JOIN DimProductSubcategory sc ON p.ProductSubcategoryKey = sc.ProductSubcategoryKey 
INNER JOIN DimProductCategory c ON c.ProductCategoryKey = sc.ProductCategoryKey 
GROUP BY ROLLUP(c.EnglishProductCategoryName, sc.EnglishProductSubcategoryName, p.EnglishProductName) 

--- As you can see above, All 3 variants of the Roll Up Function returns us with 151 rows. This is significantly different from the 
---first two approaches (Grouping Sets & Cube) because in general, the number of rows returned will be greater for the GROUPING SETS 
---and CUBE clauses, since they generate more subtotals and combinations. 
---The ROLLUP clause and its variants will generate fewer subtotals, since they only generate subtotals for a given set of columns. 

--- The total Sales are $29,358,677.22