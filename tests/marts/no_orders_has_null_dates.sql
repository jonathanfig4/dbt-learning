-- Customers with 0 orders should have null first_order_date and most_recent_order_date
-- Return records where this business rule is violated to make the test fail
select
    customer_id,
    number_of_orders,
    first_order_date,
    most_recent_order_date
from {{ ref('dim_customers') }}
where number_of_orders = 0
  and (first_order_date is not null 
       or most_recent_order_date is not null)