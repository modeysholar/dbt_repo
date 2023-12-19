
{{ config(
    materialized="table",
    schema= 'finance'
) }}




SELECT 
        i.i_category, 
        i.i_brand, 
        cc.cc_name, 
        d.d_year, 
        d.d_moy,
        SUM(cs.cs_sales_price) AS sum_sales,
        AVG(SUM(cs.cs_sales_price)) OVER (
            PARTITION BY i.i_category, i.i_brand, cc.cc_name, d.d_year
        ) AS avg_monthly_sales,
        RANK() OVER (
            PARTITION BY i.i_category, i.i_brand, cc.cc_name
            ORDER BY d.d_year, d.d_moy
        ) AS rn
    FROM 
        {{ref ('stg_item')}} i
        JOIN {{ref ('stg_catalog_sales')}} cs ON i.i_item_sk = cs.cs_item_sk
        JOIN {{ref ('stg_date_dim')}} d ON cs.cs_sold_date_sk = d.d_date_sk
        JOIN {{ref ('stg_call_center')}} cc ON cs.cs_call_center_sk = cc.cc_call_center_sk
    WHERE 
        (d.d_year = 1999) OR
        (d.d_year = 1998 AND d.d_moy = 12) OR
        (d.d_year = 2000 AND d.d_moy = 1)
    GROUP BY 
        i.i_category, i.i_brand, cc.cc_name, d.d_year, d.d_moy