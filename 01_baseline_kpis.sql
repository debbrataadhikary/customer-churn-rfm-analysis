SELECT
  COUNT(DISTINCT "InvoiceNo") AS total_orders,
  COUNT(DISTINCT "CustomerID") AS total_customers,
  SUM("Quantity" * "UnitPrice") AS total_revenue
FROM SALES_DATA
WHERE "Quantity" > 0
  AND "CustomerID" IS NOT NULL;
