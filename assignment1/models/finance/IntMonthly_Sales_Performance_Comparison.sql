 {{ config(
    materialized="table",
    schema= 'finance'
) }}
 
 SELECT 
        mspa.i_category, 
        mspa.i_brand, 
        mspa.cc_name, 
        mspa.d_year, 
        mspa.d_moy,
        mspa.avg_monthly_sales, 
        mspa.sum_sales,
        LAG(mspa.sum_sales) OVER (
            PARTITION BY mspa.i_category, mspa.i_brand, mspa.cc_name 
            ORDER BY mspa.d_year, mspa.d_moy
        ) AS psum,
        LEAD(mspa.sum_sales) OVER (
            PARTITION BY mspa.i_category, mspa.i_brand, mspa.cc_name 
            ORDER BY mspa.d_year, mspa.d_moy
        ) AS nsum
    FROM 
        {{ref ('IntMonthly_Sales_Performance_Analysis')}}  mspa