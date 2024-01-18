---DSCI 723 : DATA WAREHOUSING AND MANAGEMENT
--- SQL ASSIGNMENT 5
--- BHASKAR TEJA ULICHI [101127292]


use AdventureWorks2019;

SELECT p.BusinessEntityID, p.Title, p.FirstName, p.MiddleName, p.LastName, p.Suffix, e.JobTitle, pp.PhoneNumber, pnt.Name as PhoneNumberType, 
ea.EmailAddress, p.EmailPromotion, a.AddressLine1, a.AddressLine2, a.City, sp.Name as StateProvinceName, a.PostalCode, cr.Name as CountryRegionName, p.AdditionalContactInfo
FROM Person.Person as p LEFT JOIN Person.PersonPhone pp on p.BusinessEntityID = pp.BusinessEntityID
LEFT JOIN Person.PhoneNumberType as pnt on pp.PhoneNumberTypeID = pnt.PhoneNumberTypeID
LEFT JOIN Person. EmailAddress as ea on p.BusinessEntityID = ea.BusinessEntityID
INNER JOIN HumanResources.Employee as e on p.BusinessEntityID = e.BusinessEntityID
INNER JOIN Person.BusinessEntityAddress as bea on p.BusinessEntityID = bea.BusinessEntityID
INNER JOIN Person.Address as a on bea.AddressID = a.AddressID
INNER JOIN Person.StateProvince as sp on a.StateProvinceID = sp.StateProvinceID
INNER JOIN Person.CountryRegion as cr on sp.CountryRegionCode = cr.CountryRegionCode
ORDER BY p.BusinessEntityID;


