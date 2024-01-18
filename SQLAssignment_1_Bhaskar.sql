/* SQL ASSIGNMENT - 1; DSCI723 DATA MANAGEMENT & WAREHOUSING; BHASKAR TEJA ULICHI [101127292]*/

/use test;

/*Question 1 - Display a list of all customers */
SELECT *
FROM Sales.Customers;

/*Question 2 - List all customers' company names and contact names. Label the output columns "Company Name" and "Contact Name", respectively */

SELECT companyname as 'Company Name', contactname as 'Contact Name'
FROM Sales.Customers;


/*Question 3 - List all customer addresses by concatenating address, city, postalcode, and country columns in a single column in the output. 
Use appropriate delimiters between the values (e.g., a comma). Make sure the column in the output is labeled */

SELECT address + ', ' + city + ', ' + postalcode + ', ' + country + '.' as Address
FROM Sales.Customers;

/*Question 4 - Find all customers located either in Germany or France */
SELECT * 
FROM Sales.Customers
WHERE country = N'Germany' or country = N'France';

/*Question 5 - Find all orders placed in 2016 that were shipped to Canada, Mexico, or USA. List only order ID and order date in the output */
SELECT orderid, orderdate
FROM Sales.Orders
WHERE orderdate between '20160101' and '20161231' AND shipcountry = N'Canada'
or  orderdate between '20160101' and '20161231' AND  shipcountry = N'Mexico' 
or orderdate between '20160101' and '20161231'AND shipcountry = N'USA';

/*Question 6 - Find all customers located in countries starting with letters "A", "B", or "C" */
SELECT * 
FROM Sales.Customers
WHERE country like '[ABC]%';

/*Q7. Find all customers whose company name starts with letter "K". Note that all company names start with the "Customer" prefix followed by the actual company name */
SELECT * 
FROM Sales.Customers
WHERE companyname like 'Customer K%';


