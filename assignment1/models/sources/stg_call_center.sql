select *
from {{ source('finance_data', 'call_center') }}