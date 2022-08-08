with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
)

select 
    o.order_id,
    customer_id,
    coalesce(case when p.status=='success' then amount end, 0) as amount
from orders o
LEFT JOIN payments p
ON o.order_id = p.order_id