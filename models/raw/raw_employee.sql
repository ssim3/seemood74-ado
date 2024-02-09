-- materializes all data from 'EMPLOYEE' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'EMPLOYEE') }}