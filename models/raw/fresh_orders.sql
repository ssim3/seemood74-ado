-- materializes all data from 'FRESH_ORDERS' as a table.
{{ config (materialized='table')}}

SELECT *
FROM {{ source('NORTHWINDTRADERS', 'FRESH_ORDERS') }}
