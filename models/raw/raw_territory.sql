-- materializes all data from 'TERRITORY' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'TERRITORY') }}