{{ config (materialized='view')}}

-- View detailed information on shipping details (e.g. Customer shipping, Employee Shipping, etc.)
    
SELECT  
-- RAW_ORDER
o.OrderID,
o.CustomerID,
o.EmployeeID,
o.OrderDate,
o.RequiredDate,
o.ShippedDate,
o.Freight,
o.shipName,
o.shipAddress,
o.shipCity,
o.shipPostalCode,
o.shipCountry,
-- RAW_ORDERDETAIL 
od.ProductID,
od.UnitPrice,
od.Quantity,
od.Discount,
-- RAW_PRODUCT 
p.ProductName,
p.SupplierID,
p.CategoryID,
p.QuantityPerUnit,
p.UnitsInStock,
p.UnitsOnOrder,
p.ReorderLevel,
p.Discontinued,
-- RAW_CATEGORY
cat.CategoryName AS ProductCategory,
cat.Description AS ProductDescription,
-- RAW_SUPPLIER
sp.CompanyName AS SupplierName,
sp.ContactName AS SupplierContactName,
sp.ContactTitle AS SupplierTitle,
sp.Address AS SupplierAddress,
sp.City AS SupplierCity,
sp.PostalCode AS SupplierPostalCode,
sp.Country AS SupplierCountry,
sp.Phone AS SupplierPhone,
sp.HomePage AS SupplierWebsite,
-- RAW_CUSTOMER
c.CompanyName AS CustomerCompanyName,
c.ContactName AS CustomerName,
c.ContactTitle AS CustomerTitle,
c.Address AS CustomerAddress,
c.City AS CustomerCity,
c.PostalCode AS CustomerPostalCode,
c.Country AS CustomerCountry,
c.Phone AS CustomerPhone,
-- RAW_EMPLOYEE
CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
e.Title AS EmployeeTitle,
CASE
    WHEN e.TitleOfCourtesy IN ('Mrs.', 'Ms.') then 'Female'
    else 'Male'
END AS EmployeeGender,
DATEDIFF('year', e.BirthDate, CURRENT_DATE) AS EmployeeAge,
DATEDIFF('year', e.HireDate, CURRENT_DATE) AS EmployeeYearsOfService,
e.Address AS EmployeeAddress,
e.City AS EmployeeCity,
e.PostalCode AS EmployeePostalCode,
e.Country AS EmployeeCountry,
e.Notes AS EmployeeDescription,
e.ReportsTo AS SupervisorID,
e.HomePhone AS EmployeePhone,
-- RAW_EMPLOYEETERRITORY
-- et.TerritoryID
-- RAW_TERRITORY (Added)
-- t.TerritoryDescription,
-- t.RegionID
-- -- RAW_REGION (Added)
-- r.RegionDescription,
-- RAW_SHIPPER
s.ShipperID,
s.CompanyName,
s.Phone
FROM {{ ref ('raw_order') }} AS o
LEFT JOIN {{ ref ('raw_orderdetail') }} AS od
ON o.OrderID = od.OrderID
LEFT JOIN {{ ref ('raw_product') }} AS p
ON od.ProductID = p.ProductID
LEFT JOIN {{ ref ('raw_category') }} AS cat
ON p.CategoryID = cat.CategoryID
LEFT JOIN {{ ref ('raw_supplier') }} AS sp
ON p.SupplierID = sp.SupplierID 
LEFT JOIN {{ ref ('raw_customer') }} AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN {{ ref ('raw_employee') }} AS e
ON o.EmployeeID = e.EmployeeID
-- INNER JOIN {{ ref ('raw_employeeterritory') }} AS et
-- ON o.EmployeeID = et.EmployeeID
-- INNER JOIN {{ ref ('raw_territory') }} AS t
-- ON et.TerritoryID = t.TerritoryID
-- LEFT JOIN {{ ref ('raw_region') }} AS r
-- ON t.RegionID = r.RegionID
LEFT JOIN {{ ref ('raw_shipper') }} AS s
ON o.ShipVia = s.ShipperID