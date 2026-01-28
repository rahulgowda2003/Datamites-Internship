# Datamites-Internship
## PRDA-01 Profit Analysis

### Objective:
Analyze how R&D, Marketing, and Administration spending impact startup profitability and predict profit using regression analysis.

Tools & Technologies:

SQL (Data Extraction)

Microsoft Excel (Multiple Linear Regression)

Power BI / Tableau (Visualization)

### Key Highlights:

Identified R&D spend as the strongest driver of profit

Marketing showed moderate impact, while Administration had low/negative influence

Built interactive dashboards for state-wise profit analysis and KPIs

📁 Files Included:

Power BI Screenshot

Power BI Dashboard


2️⃣ PRSQ-02: IMDB Movies SQL Analysis

Objective:
Perform advanced SQL queries to analyze movies, directors, revenues, ratings, and popularity trends using the IMDB dataset.

Tools & Technologies:

SQL (Joins, Aggregations, Subqueries)

Key Highlights:

Identified top directors, most profitable movies, and most bankable directors

Analyzed movie popularity, revenue trends, and gender distribution of directors

3️⃣ CDACL-006: Market & Customer Behavior Analysis

Objective:
Analyze customer purchasing behavior, reorder patterns, and product performance across aisles and departments.

Tools & Technologies:

SQL (Multi-table joins, aggregations)

Data Analysis & Business Insights

Key Highlights:

Identified top aisles, most reordered products, peak order hours, and high-value users

Analyzed order frequency, reorder rates, and customer buying patterns

Provided recommendations to optimize marketing strategies and improve customer satisfaction

📈 Skills Demonstrated

SQL (Joins, CTEs, Aggregations, Subqueries)

Regression Analysis

Data Cleaning & Analysis

Power BI / Tableau Dashboards

Business Insights & Recommendations

Data-Driven Decision Making

🚀 Key Takeaways

Data-driven budgeting improves profitability

R&D investment consistently outperforms other spend categories

SQL analytics enables deep insights into customer behavior and product performance

BI dashboards support strategic business decisions

### Report Snapshot (Power BI)


![Dashboard_upload](https://github.com/rahulgowda2003/Datamites-Internship/blob/main/Profit%20Analysis%20Screenshot.png)


## PRSQ-01 IMDB Movies

### Project Overview

This project focuses on analyzing IMDB movie and director data using SQL to extract meaningful insights related to movie popularity, revenue, ratings, and director performance. The analysis demonstrates strong proficiency in SQL querying, joins, aggregations, and filtering.

🛠️ Tools & Technologies

SQL (MySQL)

Relational Databases

Data Analysis & Query Optimization

📂 Database Details

Database Name: project_movie_database

Tables Used: movies, directors

Primary Keys: id

Relationship: movies.director_id = directors.id

📊 Key Analysis Performed

Retrieved complete movie and director datasets

Counted total movies in the IMDB database

Identified top directors (James Cameron, Luc Besson, John Woo)

Analyzed most popular and most bankable movies

Determined most awarded movies since 2000

Identified director with highest movie count and revenue

Analyzed female director representation

Extracted movies directed by Brenda Chapman

🔍 SQL Queries
use project_movie_database;
select 
*
from movies;

select
*
from directors;
------------------------------------------------------------------------------------------------------

#a)	Can you get all data about movies? 
select 
*
from movies;

#b)	How do you get all data about directors?
select
*
from directors;

#c)	Check how many movies are present in IMDB.
select
count(*)
from movies;

#d)	Find these 3 directors: James Cameron ; Luc Besson ; John Woo
select
*
from directors
where name in ('James Cameron' , 'Luc Besson' , 'John Woo');

#e)	Find all directors with name starting with S.
select
name
from directors
where name like 's%';

#f)	Count female directors.
select
distinct count(gender) `Total Female directors`
from directors
where gender =  1;

#g)	Find the name of the 10th first women directors?
select
name 
from directors
where gender = 1
order by name
limit 10;
 
#h)	What are the 3 most popular movies?
select
original_title movie,
popularity 
from movies
order by popularity desc
limit 3;

#i)	What are the 3 most bankable movies?
select
original_title movie,
revenue 
from movies
order by revenue desc
limit 3;

#j)	What is the most awarded average vote since the January 1st, 2000?
select
original_title,
vote_average
from movies
where year(release_date) >= '2000'
order by vote_average desc
limit 1;

#k)	Which movie(s) were directed by Brenda Chapman?
select
m.original_title
from movies m
join
directors d
on m.director_id = d.id
where d.name = 'Brenda Chapman';

#l)	Which director made the most movies?
select
d.name,
count(m.uid) movie_count
from movies m
join
directors d
on m.director_id = d.id
group by d.name
order by movie_count desc
limit 1;

#m)	Which director is the most bankable?
select
d.name,
m.revenue
from movies m
join
directors d
on m.director_id = d.id
order by m.revenue desc
limit 1;


📈 Key Insights

A small group of directors dominates both revenue and movie count

Popularity does not always correlate directly with revenue

Female directors remain underrepresented

Post-2000 movies show higher audience engagement


## CDACL-006 Market Analysis

### Project Overview

This project analyzes customer purchasing behavior and product performance using the Instacart dataset. The objective is to uncover ordering patterns, reorder behavior, and product demand across aisles and departments to support data-driven marketing and customer retention strategies.

🛠️ Tools & Technologies

SQL (MySQL)

Power BI

Data Aggregation & Analysis

Relational Database Joins

📂 Dataset Description

The analysis uses multiple relational tables:

Products

Aisles

Departments

Orders

Order Products (Prior)

Primary keys were used to merge datasets accurately and ensure data integrity.

🔍 Key Business Questions Answered

Top aisles and departments by product count

Most ordered and most reordered products

Customer reorder behavior and purchase frequency

Peak ordering hours and days of the week

Average order size and reorder rate per aisle

High-value users with maximum orders

📊 Key Insights

Fresh produce and organic items show the highest reorder rates

Snacks and personal care dominate product variety

Orders peak during mid-day and evening hours

Repeat purchases are driven by daily-use essentials

Certain aisles consistently outperform others in demand

SQL Queries

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

💡 Business Recommendations

Promote high-reorder products through loyalty programs

Focus marketing spend on high-performing aisles

Bundle frequently purchased products

Optimize inventory for peak ordering hours


🚀 Skills Demonstrated

Advanced SQL (Joins, Aggregations, Grouping)

Customer Behavior Analysis

Data Visualization (Power BI)

Business Insight & Recommendation Framing
