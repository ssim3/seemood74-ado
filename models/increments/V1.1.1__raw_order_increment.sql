WITH incremental_orders AS (
    SELECT *
    FROM {{ ref('fresh_orders') }}
    WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT)) FROM {{ this }})
)

INSERT INTO {{ ref('raw_orders') }}
SELECT *
FROM incremental_orders;