{{ config (materialized='table')}}

SELECT EmployeeID || '-' || TerritoryID as surrogate_key, *
FROM {{ source('NORTHWINDTRADERS', 'EMPLOYEETERRITORY') }}