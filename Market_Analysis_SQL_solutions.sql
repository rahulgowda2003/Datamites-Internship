use project_orders;

-----------------------------------------------------------
## 1. What are the top 10 aisles with the highest number of products?
select a.aisle,
count(*) product_count
from aisles a 
join products p 
on a.aisle_id = p.aisle_id
group by aisle
order by product_count desc
limit 10;


## 2. How many unique departments are there in the dataset?
select count(distinct(department)) unique_departments
from departments;


## 3. What is the distribution of products across departments?
select count(product_name) products_distribution,
d.department
from products p 
join departments d
on p.department_id = d.department_id
group by department;


## 4. What are the top 10 products with the highest reorder rates?
select o.reordered,
p.product_name
from products p 
join order_products_train o 
on o.product_id = p.product_id
order by reordered desc
limit 10;


## 5. How many unique users have placed orders in the dataset?
select count(distinct(user_id)) unique_users
from orders;


## 6. What is the average number of days between orders for each user?
select user_id,
truncate(avg(days_since_prior_order) ,0) average_days_orders
from orders
where days_since_prior_order is not null
group by user_id;


## 7. What are the peak hours of order placement during the day?
select order_hour_of_day,
count(*) order_count
from orders
group by order_hour_of_day
order by order_count desc;


## 8. How does order volume vary by day of the week?
select order_dow,
count(*) order_volume
from orders
group by order_dow
order by order_volume desc;


## 9. What are the top 10 most ordered products?
select op.product_id,
product_name,
count(op.product_id) ordered
from products p 
join order_products_train op
on op.product_id = p.product_id
group by product_id
order by ordered desc
limit 10;


##10. How many users have placed orders in each department?
select department_id,
count(distinct(user_id)) user_count
from products p 
join order_products_train opt
on p.product_id = opt.product_id
join orders o 
on o.order_id = opt.order_id
group by department_id
order by user_count desc;


## 11. What is the average number of products per order?
select order_id,
round(avg(product_id), 0) products_count
from order_products_train
group by order_id
order by products_count desc; 


## 12. What are the most reordered products in each department?
select department,
product_name,
count(reordered) times_ordered
from products p 
join order_products_train opt
on p.product_id = opt.product_id
join departments d
on d.department_id = p.department_id
where reordered = 1
group by d.department_id,department,product_name
order by times_ordered desc;
-------------------------------------------------------------------------------------------
select p.department_id, 
opt.product_id, 
sum(opt.reordered) product_reordered
from products p 
join order_products_train opt
on p.product_id = opt.product_id
group by opt.product_id 
order by product_reordered desc;


## 13. How many products have been reordered more than once?
select Count(product_id) products_count
from
(
select product_id,
sum(reordered)
from order_products_train
group by product_id
having sum(reordered) > 1
) subquery;


## 14. What is the average number of products added to the cart per order?
select order_id,
avg(product_id) average_products_added_to_cart
from order_products_train
group by order_id
order by avg(product_id) desc ;


## 15. How does the number of orders vary by hour of the day?
select order_hour_of_day,
count(*) total_orders
from orders
group by order_hour_of_day
order by total_orders desc;


## 16. What is the distribution of order sizes (number of products per order)?
select order_id,
count(product_id) total_product_count
from order_products_train
group by order_id
order by total_product_count desc;


## 17. What is the average reorder rate for products in each aisle?
select aisle,
concat(round(avg(reordered) * 100 , 2), '%') average_reorder_rate
from aisles a 
join products p 
on a.aisle_id = p.aisle_id
join order_products_train opt
on opt.product_id = p.product_id
group by aisle
order by average_reorder_rate desc;


## 18. How does the average order size vary by day of the week?
select order_dow,
avg(order_number) average_order_size
from orders o 
group by order_dow
order by average_order_size desc;


## 19. What are the top 10 users with the highest number of orders?
select user_id,
count(order_id) highest_order
from orders
group by user_id
order by highest_order desc
limit 10;


## 20. How many products belong to each aisle and department?
select aisle,
department,
count(product_id) total_products
from aisles a 
join products p 
on a.aisle_id = p.aisle_id
join departments d
on d.department_id = p.department_id
group by aisle, department
order by total_products desc;
--------------------------------------------------------
select aisle_id,
department_id,
count(*) total_products
from products
group by aisle_id, department_id
order by total_products desc;