select *
from {{ source('sales_data', 'lineitem') }}
