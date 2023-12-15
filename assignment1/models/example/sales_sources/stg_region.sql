select *
from {{ source('sales_data', 'region') }}