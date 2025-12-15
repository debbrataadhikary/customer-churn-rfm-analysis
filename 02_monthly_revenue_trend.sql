SELECT
  DATE_TRUNC('month', "InvoiceDate"::timestamp) AS month,
  SUM("Quantity" * "UnitPrice") AS monthly_revenue
FROM SALES_DATA
WHERE "Quantity" > 0
GROUP BY month
ORDER BY month;

