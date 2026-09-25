--Incremental model for orders fact table
--Upsert model for orders fact table

{{config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge',
)}}

select
    order_id,
    customer_id,
    order_date,
    order_timestamp,
    shipping_city,
    order_status,
    payment_status

from {{ ref('int_customer_orders') }}

{% if is_incremental() %}
where updated_at >= (
    select max(updated_at)
    from {{ this }}
)
{% endif %}
