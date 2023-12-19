select *
from {{ source('finance_data', 'item') }}