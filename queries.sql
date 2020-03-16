-- Database Queries

-- Find all customers with postal code 1010

 SELECT *
 FROM Customers
 WHERE PostalCode = 1010;



CustomerID	CustomerName	ContactName	Address	City	PostalCode	Country
 12	Cactus Comidas para llevar	Patricio Simpson	Cerrito 333	Buenos Aires	1010	Argentina
 54	Océano Atlántico Ltda.	Yvonne Moncada	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	1010	Argentina
 64	Rancho grande	Sergio Gutiérrez	Av. del Libertador 900	Buenos Aires	1010	Argentina


-- Find the phone number for the supplier with the id 11

 SELECT SupplierID, SupplierName, Phone
 FROM Suppliers
 WHERE SupplierID = 11;



	Phone
	(010) 9984510

-- List first 10 orders placed, sorted descending by the order date

SELECT *
FROM [Orders] 
ORDER BY OrderDate DESC
LIMIT 10;

OrderID	CustomerID	EmployeeID	OrderDate	ShipperID
10443	66	8	1997-02-12	1
10442	20	3	1997-02-11	2
10440	71	4	1997-02-10	2
10441	55	3	1997-02-10	2
10439	51	6	1997-02-07	3
10438	79	3	1997-02-06	2
10436	7	3	1997-02-05	2
10437	87	8	1997-02-05	1
10435	16	8	1997-02-04	2
10433	60	3	1997-02-03	3

-- Find all customers that live in London, Madrid, or Brazil

SELECT CustomerName
FROM Customers 
WHERE Country = 'Brazil' or City = 'London' or City = 'Madrid';


Around the Horn
Bólido Comidas preparadas
B's Beverages
Comércio Mineiro
Consolidated Holdings
Eastern Connection
Familia Arquibaldo
FISSA Fabrica Inter. Salchichas S.A.
Gourmet Lanchonetes
Hanari Carnes
North/South
Que Delícia
Queen Cozinha
Ricardo Adocicados
Romero y tomillo
Seven Seas Imports
Tradição Hipermercados
Wellington Importadora



-- Add a customer record for "The Shire", the contact name is "Bilbo Baggins" the address is -"1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth"

-- Update Bilbo Baggins record so that the postal code changes to "11122"

-- (Stretch) Find a query to discover how many different cities are stored in the Customers table. Repeats should not be double counted

-- (Stretch) Find all suppliers who have names longer than 20 characters. You can use `length(SupplierName)` to get the length of the name
