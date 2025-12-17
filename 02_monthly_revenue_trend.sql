SELECT 
    DATE_TRUNC('month', "InvoiceDate"::timestamp) AS month,
    "CustomerID", 
    SUM("Quantity" * "UnitPrice") AS monthly_revenue
FROM SALES_DATA
WHERE "Quantity" > 0 
  AND "CustomerID" IS NOT NULL 
GROUP BY month, "CustomerID" 
ORDER BY month, "CustomerID";



