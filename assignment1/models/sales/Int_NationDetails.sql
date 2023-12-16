{{ config(
    materialized="table",
    schema= 'sales'
) }}


SELECT
    N.N_NATIONKEY,
    N.N_NAME,
    R.R_NAME AS RegionName
  FROM
    {{ref ('stg_nation')}} N
    INNER JOIN {{ref ('stg_region')}}  R ON N.N_REGIONKEY = R.R_REGIONKEY

    