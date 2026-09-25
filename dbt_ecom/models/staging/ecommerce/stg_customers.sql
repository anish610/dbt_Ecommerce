select customer_id,customer_name,lower(email) as email ,city,state,cast(signup_date as date) as signup_date,customer_status 
from {{ ref('raw_customers') }} 
