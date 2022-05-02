# cleaning process of pie_data

SELECT * FROM pie_data;


ALTER TABLE pie_data
MODIFY COLUMN `order date` date;

ALTER TABLE pie_data
MODIFY COLUMN `month/yr` date;

#Analysis process

# what is the total order
SELECT count(*) AS Total_order 
FROM pie_data;

# What is the total Revenue
SELECT round(sum( quantity * cost),0) 
FROM pie_data;

# What is the average cost of each pie_flavor
SELECT `Pie Flavor`, round(avg(cost),0)
FROM pie_data
group by `pie flavor`;

# What is the total ordered quantity
SELECT sum(quantity) 
FROM pie_data;

# What is the revenue by day of week
SELECT  quantity * cost as Revenue, `day of week` 
FROM pie_data
group by `day of week` order by revenue desc;

# What is the quantity of pie ordered in the day of the week
SELECT  sum(quantity) AS total_order, `day of week`
FROM pie_data
group by `day of week` order by total_order desc;

# What is the revenue by order type
SELECT  round(sum(quantity * cost), 0) as Revenue,
       `Pre-Order/In-Store Purchase`
FROM pie_data
group by `Pre-Order/In-Store Purchase` 
order by revenue desc;

# Revenue from each pie flavor
SELECT  round(sum(quantity * cost), 0) as Revenue,
        `pie flavor` FROM pie_data
group by `pie flavor`
order by revenue desc;

# quantity ordered from each pie flavor
SELECT  sum(quantity ) as quantity_ordered, `pie flavor`
FROM pie_data
group by `pie flavor`
order by quantity_ordered desc;

# how many flavour
SELECT  distinct `pie flavor`
 FROM pie_data
 group by `pie flavor` ;

# Revenue by month
SELECT distinct quantity * cost as Revenue, `month/yr`
FROM pie_data
group by `month/yr` order by revenue desc;

SELECT month(`month/yr` ) FROM pie_data;

# Revenue by month
SELECT distinct monthname(`order date` ) AS Month_name, 
                 round(sum(quantity * cost), 0) AS Revenue 
FROM pie_data
group by Month_name
order by Revenue desc ;

# Revenue by year
SELECT distinct year(`month/yr` ) AS year, round(sum(quantity * cost), 0) AS Revenue 
FROM pie_data
group by year
order by revenue desc;

# revenue by organic
SELECT round(sum(quantity * cost), 0) AS Revenue, `organic?`, sum(quantity)  AS quantity_ordered 
FROM pie_data
group by `organic?`
order by revenue desc, quantity_ordered desc;

# order by organic
SELECT sum(quantity) AS quantity_ordered, `organic?` 
FROM pie_data
group by `organic?`
order by quantity_ordered desc;

# order by slice or whole pie
SELECT sum(quantity) AS quantity_ordered, `slice or whole pie`,round(sum(quantity * cost), 0) AS Revenue,
         round(avg(cost),0) 
FROM pie_data
group by `slice or whole pie`
order by quantity_ordered desc, Revenue desc;

# Revenue by day
SELECT distinct dayname(`order date` ) AS day_of_week, round(sum(quantity * cost), 0) AS Revenue,
                sum(quantity) AS Quantity_ordered
FROM pie_data
group by day_of_week
order by Revenue desc, Quantity_ordered desc ;
