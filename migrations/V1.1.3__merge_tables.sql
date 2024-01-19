CREATE OR REPLACE TABLE RAW_PRODUCT AS
SELECT 
r.ProductID AS ProductID,
r.ProductName AS ProductName,
r.SupplierID AS SupplierID,
r.CategoryID AS CategoryID,
r.QuantityPerUnit AS QuantityPerUnit,
r.UnitPrice AS UnitPrice,
r.UnitsInStock AS UnitsInStock,
r.UnitsOnOrder AS UnitsOnOrder,
r.ReorderLevel AS ReorderLevel,
r.Discontinued AS Discontinued,
f.UnitCost AS UnitCost,
f.CategoryName AS CategoryName,
f.Supplier AS SupplierName
FROM RAW_PRODUCT r INNER JOIN PRODUCT_FRESH f 
ON r.ProductID = f.ProductID;