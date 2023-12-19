select *
from {{ source('finance_data', 'date_dim') }}