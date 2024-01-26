INSERT INTO RAW_ORDERDETAIL
WITH incremental_orders AS (
    SELECT *
    FROM FRESH_ORDERDETAIL
    WHERE CAST(ORDERID AS BIGINT) > (SELECT MAX(CAST(ORDERID AS BIGINT)) FROM RAW_ORDERDETAIL)
)
SELECT *
FROM incremental_orders;