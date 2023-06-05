select count(product_category_name) as "order_density", 
customer_state, customer_city
from order_items_dataset
inner join products_dataset using(product_id)
inner join order_dataset using(order_id)
inner join order_customer_dataset using(customer_id)
group by customer_state
order by 1 desc
