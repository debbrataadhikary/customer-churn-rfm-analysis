WITH first_purchase AS (
  SELECT
    "CustomerID",
    DATE_TRUNC(
      'month',
      MIN("InvoiceDate"::timestamp)
    ) AS cohort_month
  FROM SALES_DATA
  WHERE "CustomerID" IS NOT NULL
    AND "Quantity" > 0
  GROUP BY "CustomerID"
),

activity AS (
  SELECT
    "CustomerID",
    DATE_TRUNC(
      'month',
      "InvoiceDate"::timestamp
    ) AS activity_month
  FROM SALES_DATA
  WHERE "CustomerID" IS NOT NULL
    AND "Quantity" > 0
)

SELECT
  fp.cohort_month,
  activity.activity_month,
  COUNT(DISTINCT activity."CustomerID") AS active_customers
FROM first_purchase fp
JOIN activity
  ON fp."CustomerID" = activity."CustomerID"
GROUP BY
  fp.cohort_month,
  activity.activity_month
ORDER BY
  fp.cohort_month,
  activity.activity_month;



