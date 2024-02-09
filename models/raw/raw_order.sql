-- materializes all data from 'ORDERS' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'ORDERS') }}