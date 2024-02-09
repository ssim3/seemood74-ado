-- materializes all data from 'SHIPPER' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'SHIPPER') }}