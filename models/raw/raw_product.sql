-- materializes all data from 'PRODUCT' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'PRODUCT') }}