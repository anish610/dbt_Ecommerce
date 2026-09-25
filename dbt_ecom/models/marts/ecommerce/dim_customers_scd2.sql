select
    customer_id,
    customer_name,
    email,
    city,
    state,
    signup_date,
    customer_status,
    signup_date as valid_from,
    cast(null as date) as valid_to,
    true as is_current
from {{ ref('stg_customers') }}

