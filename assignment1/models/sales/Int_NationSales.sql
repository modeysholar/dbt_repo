{{ config(
    materialized="table",
    schema= 'sales'
) }}


SELECT
    C.C_NATIONKEY,
    O.O_ORDERDATE,
    L.L_EXTENDEDPRICE,
    L.L_DISCOUNT,
    L.L_QUANTITY,
    O.O_ORDERKEY
  FROM
    {{ref ('stg_orders')}} O
    INNER JOIN {{ref ('stg_lineitem')}} L ON O.O_ORDERKEY = L.L_ORDERKEY
    INNER JOIN {{ref ('stg_customer')}} C ON O.O_CUSTKEY = C.C_CUSTKEY
  WHERE
    O.O_ORDERSTATUS = 'F'