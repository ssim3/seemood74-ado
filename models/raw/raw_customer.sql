-- materializes all data from 'CUSTOMER' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'CUSTOMER') }}