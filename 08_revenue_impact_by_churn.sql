SELECT
  churn_status,
  SUM(monetary) AS revenue_impact
FROM (
  SELECT
    s."CustomerID",
    SUM(s."Quantity" * s."UnitPrice") AS monetary,
    CASE
      WHEN MAX(s."InvoiceDate") <
           (SELECT MAX("InvoiceDate") FROM "SALES_DATA") - INTERVAL '90 days'
      THEN 'Churned'
      ELSE 'Active'
    END AS churn_status
  FROM SALES_DATA s
  WHERE s."Quantity" > 0
    AND s."CustomerID" IS NOT NULL
  GROUP BY s."CustomerID"
) t
GROUP BY churn_status;




