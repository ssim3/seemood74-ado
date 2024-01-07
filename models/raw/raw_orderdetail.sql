{{ config(materialized='incremental', unique_key='ORDERID') }}

SELECT EmployeeID || '-' || TerritoryID as surrogate_key, *
FROM {{ ref ('fresh_orderdetail') }}
{% if is_incremental() %}
WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT))  FROM {{this}})
{% endif %}
