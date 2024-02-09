-- materializes all data from 'EMPLOYEETERRITORY' as a table
{{ config (materialized='table')}}

SELECT EmployeeID || '-' || TerritoryID as surrogate_key, *
FROM {{ source('NORTHWINDTRADERS', 'EMPLOYEETERRITORY') }}