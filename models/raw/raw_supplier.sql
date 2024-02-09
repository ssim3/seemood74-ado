-- materializes all data from 'SUPPLIER' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'SUPPLIER') }}