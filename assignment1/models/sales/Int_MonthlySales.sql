{{ config(
    materialized="table",
    schema= 'sales'
) }}

SELECT
    NS.C_NATIONKEY,
    EXTRACT(YEAR FROM NS.O_ORDERDATE) AS SaleYear,
    EXTRACT(MONTH FROM NS.O_ORDERDATE) AS SaleMonth,
    SUM(NS.L_EXTENDEDPRICE * (1 - NS.L_DISCOUNT)) AS TotalSales,
    AVG(NS.L_DISCOUNT) AS AvgDiscount,
    COUNT(DISTINCT NS.O_ORDERKEY) AS OrderCount
  FROM
    {{ref ('Int_NationSales')}} NS
  GROUP BY
    NS.C_NATIONKEY,
    SaleYear,
    SaleMonth