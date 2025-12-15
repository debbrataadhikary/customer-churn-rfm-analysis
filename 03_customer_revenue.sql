SELECT
  "CustomerID",
  SUM("Quantity" * "UnitPrice") AS customer_revenue
FROM SALES_DATA
WHERE "Quantity" > 0
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY customer_revenue DESC;

