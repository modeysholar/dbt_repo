select *
from {{ source('sales_data', 'orders') }}