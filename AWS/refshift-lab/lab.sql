
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

