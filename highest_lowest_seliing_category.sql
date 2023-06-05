select product_category_name as "Product Name Portuguese", 
product_category_name_english as "Product Name English",
count(product_category_name) as "Jumlah_Order"
from products_dataset
inner join order_items_dataset using(product_id)
inner join product_category_name_translation using(product_category_name)
group by 1
order by 3 desc
