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
DATEDIFF('year', CURRENT_DATE, e.BirthDate) AS EmployeeAge,
DATEDIFF('year', CURRENT_DATE, e.HireDate) AS EmployeeYearsOfService,
e.Address AS EmployeeAddress,
e.City AS EmployeeCity,
e.PostalCode AS EmployeePostalCode,
e.Country AS EmployeeCountry,
e.Notes AS EmployeeDescription,
-- RAW_SHIPPER
s.ShipperID,
s.CompanyName,
s.Phone
FROM {{ ref ('raw_order') }} AS o
LEFT JOIN {{ ref ('raw_customer') }} AS c
ON o.CustomerID = c.CustomerID
LEFT JOIN {{ ref ('raw_employee') }} AS e
ON o.EmployeeID = e.EmployeeID
LEFT JOIN {{ ref ('raw_shipper') }} AS s
ON o.ShipVia = s.ShipperID