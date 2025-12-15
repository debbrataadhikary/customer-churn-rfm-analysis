SELECT
  "CustomerID",
  MAX("InvoiceDate") AS last_purchase_date,
  COUNT(DISTINCT "InvoiceNo") AS frequency,
  SUM("Quantity" * "UnitPrice") AS monetary
FROM SALES_DATA
WHERE "Quantity" > 0
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY monetary DESC;


