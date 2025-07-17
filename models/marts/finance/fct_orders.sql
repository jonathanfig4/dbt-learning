with order_payments as (

    select * from {{ ref('stg_stripe__payments') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

order_details  as (

    select
        order_payments.payment_id,
        order_payments.order_id,
        orders.customer_id,
        order_payments.amount,
        order_payments.status

    from order_payments
    left join orders on order_payments.order_id = orders.order_id


)

select * from order_details