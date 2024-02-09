-- materializes all data from 'REGION' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'REGION') }}
