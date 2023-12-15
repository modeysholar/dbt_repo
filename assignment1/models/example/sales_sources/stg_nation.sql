select *
from {{ source('sales_data', 'nation') }}