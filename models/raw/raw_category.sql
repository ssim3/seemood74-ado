-- materializes all data from 'CATEGORY' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'CATEGORY') }}