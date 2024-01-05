{{ config (materialized='table')}}

SELECT *
FROM {{ source('NORTHWINDTRADERS', 'FRESH_ORDERS') }}
