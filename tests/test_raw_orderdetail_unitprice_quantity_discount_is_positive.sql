SELECT 
OrderID, ProductID, SUM(UNITPRICE) AS total_price, 
SUM(quantity) AS total_quantity, 
SUM(discount) AS total_discount
FROM {{ ref('raw_orderdetail' )}}
GROUP BY OrderID, ProductID
HAVING (total_price < 0) AND (total_quantity < 0) AND (discount < 0)