SELECT
  "CustomerID",
  COUNT(DISTINCT "InvoiceNo") AS total_orders
FROM SALES_DATA
WHERE "Quantity" > 0
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY total_orders DESC;


