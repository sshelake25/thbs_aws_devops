
create schema if not exists ps_store_schema;

create table ps_store_schema.customers(
 customer_number integer,
 first_name varchar(30),
 last_name varchar(30),
 contact_number varchar(30),
 email varchar(100),
 age integer
);


create table ps_store_schema.orders (
 customer_id integer,
 product_id integer,
 quantity integer,
 purchase_date date not null
);


create table ps_store_schema.products (
 product_id integer,
 product_name varchar(100),
 price decimal(5,2)
);


insert into 
ps_store_schema.customers (customer_number, first_name, last_name, contact_number, email, age) 
values 
(1, 'Leslie', 'Doe', '9821111222', 'leslie.doe@example.com', 63),
(2, 'Jan', 'Doe', '9821212222', 'jan.doe@example.com', 33), 
(3, 'Steph', 'Eloise', '9851555222', 'steph.eloise@example.com', 22), 
(4, 'Taylor', 'Smith', '9861665662', 'taylor.smith@pluralsightfake.com', 21),
 (5, 'Carrie', 'Stark', '9861225332', 'carrie.stark@pluralsightfake.com', 18);


select COUNT(*) from ps_store_schema.customers;

select * from ps_store_schema.customers where age between 20 AND 40

select first_name, last_name from ps_store_schema.customers where age between 20 AND 40

select * from ps_store_schema.customers where email LIKE '%example.com%';

select * from ps_store_schema.customers where last_name='Doe';


{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}

# you will remove all data from table 
TRUNCATE TABLE ps_store_schema.customers;



copy ps_store_schema.customers from 's3://redshift-data-93-ss/customers-data.txt' 
iam_role 'arn:aws:iam::462886535217:role/service-role/AmazonRedshift-CommandsAccessRole-20220302T124404';

copy 
ps_store_schema.products 
from 's3://redshift-data-93-ss/products-data.csv' 
iam_role 'arn:aws:iam::462886535217:role/service-role/AmazonRedshift-CommandsAccessRole-20220302T124404'
format csv 
delimiter ',';

copy ps_store_schema.orders from 's3://redshift-data-93-ss/orders-data.json' 
iam_role 'arn:aws:iam::462886535217:role/service-role/AmazonRedshift-CommandsAccessRole-20220302T124404'
DATEFORMAT 'MM/DD/YYYY'
json as 'auto';


SELECT sum(quantity)
FROM ps_store_schema.orders
WHERE purchase_date = '12/31/2020';


-- Customer info and prod sold on specifi date
select first_name, last_name, email, product_name, quantity, quantity * price as total_price 
from ps_store_schema.customers As c
inner join  ps_store_schema.orders AS s on c.customer_number = s.customer_id
inner join ps_store_schema.products AS p on s.product_id = p.product_id
WHERE purchase_date = '12/31/2020';

--	• Top ten buyers by quantity and items sold.

SELECT first_name, last_name, email, total_quantity 
FROM (SELECT customer_id, sum(quantity) total_quantity
 FROM ps_store_schema.orders
 GROUP BY customer_id
 ORDER BY total_quantity desc limit 10) S, ps_store_schema.customers
WHERE S.customer_id = customer_number
ORDER BY S.total_quantity desc;

SELECT first_name, last_name, email, quantity 
FROM ps_store_schema.customers as c
JOIN ps_store_schema.orders as o
ON c.customer_number = o.customer_id
ORDER BY quantity desc limit 10


SELECT product_name, total_quantity 
FROM (SELECT product_id, sum(quantity) total_quantity
 FROM ps_store_schema.orders
 GROUP BY product_id
 ORDER BY total_quantity desc limit 10) AS S, ps_store_schema.products
WHERE S.product_id = products.product_id
ORDER BY total_quantity desc;
