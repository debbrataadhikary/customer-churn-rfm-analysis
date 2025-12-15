SELECT
  "CustomerID",
  MAX("InvoiceDate") AS last_purchase_date
FROM SALES_DATA
WHERE "Quantity" > 0
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID"
ORDER BY last_purchase_date;


