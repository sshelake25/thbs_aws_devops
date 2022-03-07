set enable_result_cache_for_session to off;

create table tax_returns(
    return_id integer,
    filing_type varchar(10),
    ein integer,
    tax_period integer,
    submission_date date,
    taxpayer_name varchar(100),
    return_type varchar(10),
    dln varchar(20),
    object_id varchar(20)
);

copy tax_returns from 's3://irs-form-990/index_2013.csv' 
credentials 'aws_iam_role=arn:aws:iam::818675077966:role/myRedshiftRole' 
ignoreheader 1 delimiter ',' dateformat 'auto' region 'us-east-1';

select filing_type, submission_date, count(*) from tax_returns group by submission_date, filing_type;

create table tax_returns_bad(
    return_id integer,
    filing_type varchar(10),
    ein integer,
    tax_period integer,
    submission_date date,
    taxpayer_name varchar(100),
    return_type varchar(10) distkey,
    dln varchar(20),
    object_id varchar(20)
);

copy tax_returns_bad from 's3://irs-form-990/index_2013.csv' 
credentials 'aws_iam_role=arn:aws:iam::818675077966:role/myRedshiftRole' 
ignoreheader 1 delimiter ',' dateformat 'auto' region 'us-east-1';

select filing_type, submission_date, count(*) from tax_returns_bad group by submission_date, filing_type;

select return_type, count(*) from tax_returns group by return_type order by count desc;