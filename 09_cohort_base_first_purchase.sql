SELECT
  "CustomerID",
  DATE_TRUNC('month', MIN("InvoiceDate")) AS first_purchase_month
FROM SALES_DATA
WHERE "Quantity" > 0
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID";


