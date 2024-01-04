{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'EMPLOYEETERRITORY') }}