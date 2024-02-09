-- materializes all data from 'FRESH_ORDERDETAIL' as a table.
{{ config (materialized='table')}}

SELECT *
FROM {{ source('NORTHWINDTRADERS', 'FRESH_ORDERDETAIL') }}