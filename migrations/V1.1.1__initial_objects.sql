-- Create PRODUCT_FRESH Table
CREATE TABLE PRODUCT_FRESH
(
   ProductID INT PRIMARY KEY,
   ProductName VARCHAR(40),
   ListPrice DECIMAL(10, 4),
   UnitCost DECIMAL(10, 4),
   Discontinued BOOLEAN,
   CategoryName VARCHAR(15),
   Supplier VARCHAR(40)
);
