-- materializes all data from 'ORDERDETAILS' as a table
{{ config (materialized='table')}}

SELECT * 
FROM {{ source('NORTHWINDTRADERS', 'ORDERDETAIL') }}