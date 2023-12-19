select *
from {{ source('finance_data', 'catalog_sales') }}