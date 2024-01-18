--- DSCI 723 : Data Management and Warehousing
--- SQL HW 7 - Employee Promotion Homework
--- Bhaskar Teja Ulichi [101127292]

Use AdventureWorks2019;

---1) A list of all employees of Adventure Works
SELECT e.BusinessEntityID as EmpID, p.FirstName, p.LastName, e.JobTitle, e.BirthDate, e.Gender, e.MaritalStatus 
FROM HumanResources.Employee as e  
JOIN Person.Person as p  
ON e.BusinessEntityID = p.BusinessEntityID; 

--2) A List of IDs of employees who worked in multiple positions in Adventure Works
SELECT BusinessEntityID 
FROM HumanResources.EmployeeDepartmentHistory 
GROUP BY BusinessEntityID 
HAVING COUNT(DepartmentID) > 1; 

--3) Compensation History for employees in (2) 
SELECT e.BusinessEntityID as EmpID, p.FirstName, p.LastName, e.Gender, e.MaritalStatus, ph.Rate, ph.RateChangeDate 
FROM HumanResources.Employee e 
JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID 
JOIN HumanResources.EmployeePayHistory ph ON e.BusinessEntityID = ph.BusinessEntityID 
WHERE e.BusinessEntityID IN ( 
  SELECT BusinessEntityID 
  FROM HumanResources.EmployeeDepartmentHistory 
  GROUP BY BusinessEntityID 
  HAVING COUNT(DepartmentID) > 1); 


 ---4) Final List
SELECT p.BusinessEntityID as EmpID, p.FirstName, p.LastName, d.Name as Department,D.GroupName, h.StartDate, h.EndDate, ph.Rate as Salary
FROM Person.Person as p JOIN HumanResources.EmployeeDepartmentHistory as h
on p.BusinessEntityID = h.BusinessEntityID
JOIN HumanResources.Department as d ON h.DepartmentID = d.DepartmentID
JOIN HumanResources.EmployeePayHistory as ph ON p.BusinessEntityID = ph.BusinessEntityID
WHERE p.BusinessEntityID in 
(SELECT BusinessEntityID
FROM HumanResources.EmployeeDepartmentHistory
GROUP BY BusinessEntityID
HAVING COUNT(DepartmentID) > 1);



