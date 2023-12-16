{{ config(
    materialized="table",
    schema= 'sales'
) }}

SELECT
  FM.Nation,
  FM.RegionName,
  FM.SaleYear,
  FM.SaleMonth,
  FM.TotalSales,
  FM.AvgDiscount,
  FM.OrderCount
FROM
   {{ref ('Int_FinalMetrics')}} FM