select product_id,
    product_name,
    category,
    subcategory,
    unit_price,
    stock_quantity from {{ ref('stg_products') }}