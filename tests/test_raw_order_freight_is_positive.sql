SELECT OrderID, SUM(freight) as total_freight
FROM {{ ref('raw_order' )}}
GROUP BY OrderID
HAVING (total_freight < 0)