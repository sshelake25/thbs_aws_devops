create table payments (
    customerName varchar(40),
    orderNumber integer,
    paymentRequested date,
    paymentReceived date
);

insert into payments values 
    ('Globomantics', 1, '2019-04-01', '2019-04-14'),
    ('Globomantics', 2, '2019-05-01', '2019-05-17'),
    ('Carved Rock Fitness', 3, '2019-05-03', '2019-05-06'),
    ('Wired Brain Coffee Company', 4, '2019-05-07', '2019-05-12'),
    ('Carved Rock Fitness', 5, '2019-06-03', '2019-06-04');
    
-- f_days_between must be created before running the next two commands, see f_days_between.sql

select customerName, orderNumber, f_days_between(paymentRequested, paymentReceived) as days from payments;

select customerName, avg(cast(f_days_between(paymentRequested, paymentReceived) as float)) as days from payments group by customerName;

-- f_hash_variable must be created before running the next command, see f_hash_variable.sql

select f_hash_variable(customerName) as customerHash, avg(cast(f_days_between(paymentRequested, paymentReceived) as float)) as days from payments group by customerName;