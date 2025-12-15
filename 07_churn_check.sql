SELECT
  "CustomerID",
  MAX("InvoiceDate") AS last_purchase_date,
  CASE
    WHEN MAX("InvoiceDate") <
         (SELECT MAX("InvoiceDate") FROM SALES_DATA) - INTERVAL '90 days'
    THEN 'Churned'
    ELSE 'Active'
  END AS churn_status
FROM SALES_DATA
WHERE "Quantity" > 0
  AND "CustomerID" IS NOT NULL
GROUP BY "CustomerID";




