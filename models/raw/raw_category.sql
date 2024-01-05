{{ config (materialized='table')}}

SELECT * 
--FROM {{ source('NORTHWINDTRADERS', 'CATEGORY') }}
FROM RAW.NORTHWINDTRADERS.SHIPPER