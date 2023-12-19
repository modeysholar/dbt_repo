{{ config(
    materialized="table",
    schema= 'finance'
) }}


SELECT 
    *
FROM 
   {{ref("IntMonthly_Sales_Performance_Comparison")}}
WHERE 
    d_year = 1999 AND
    avg_monthly_sales > 0 AND
    (sum_sales - avg_monthly_sales) / avg_monthly_sales > 0.1