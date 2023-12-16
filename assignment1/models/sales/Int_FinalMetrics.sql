{{ config(
    materialized="table",
    schema= 'sales'
) }}

SELECT
    ND.N_NAME AS Nation,
    ND.RegionName,
    MS.SaleYear,
    MS.SaleMonth,
    MS.TotalSales,
    MS.AvgDiscount,
    MS.OrderCount
  FROM
    {{ref ('Int_MonthlySales')}} MS
    INNER JOIN  {{ref ('Int_NationDetails')}} ND ON MS.C_NATIONKEY = ND.N_NATIONKEY