{{ config (materialized='table')}}

SELECT * 
FROM RAW.NORTHWINDTRADERS.orderdetail