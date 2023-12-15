select *
from {{ source('sales_data', 'customer') }}