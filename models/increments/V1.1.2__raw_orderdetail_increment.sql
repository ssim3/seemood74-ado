WITH incremental_orders AS (
    SELECT *
    FROM {{ ref('fresh_orderdetail') }}
    WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT)) FROM {{ this }})
)

INSERT INTO {{ ref('raw_orderdetail') }}
SELECT *
FROM incremental_orders;