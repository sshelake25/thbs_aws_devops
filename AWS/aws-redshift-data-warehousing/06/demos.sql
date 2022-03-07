-- These next two statements let you see the current queue configuration and status for the cluster
create view WLM_QUEUE_STATE_VW as
select (config.service_class-5) as queue
, trim (class.condition) as description
, config.num_query_tasks as slots
, config.query_working_mem as mem
, config.max_execution_time as max_time
, config.user_group_wild_card as "user_*"
, config.query_group_wild_card as "query_*"
, state.num_queued_queries queued
, state.num_executing_queries executing
, state.num_executed_queries executed
from
STV_WLM_CLASSIFICATION_CONFIG class,
STV_WLM_SERVICE_CLASS_CONFIG config,
STV_WLM_SERVICE_CLASS_STATE state
where
class.action_service_class = config.service_class 
and class.action_service_class = state.service_class 
and config.service_class > 4
order by config.service_class;

select * from wlm_queue_state_vw;

-- These next two statements let you see the status of queries currently executing on the cluster, including what WLM queue they're in
create view WLM_QUERY_STATE_VW as
select query, (service_class-5) as queue, slot_count, trim(wlm_start_time) as start_time, trim(state) as state, trim(queue_time) as queue_time, trim(exec_time) as exec_time
from stv_wlm_query_state;

select * from wlm_query_state_vw;


-- The following commands would be run in the second statement tab
set enable_result_cache_for_session to off;

create table listing(
    listid integer not null distkey,
    sellerid integer not null,
    eventid integer not null,
    dateid smallint not null  sortkey,
    numtickets smallint not null,
    priceperticket decimal(8,2),
    totalprice decimal(8,2),
    listtime timestamp);

create table sales(
    salesid integer not null,
    listid integer not null distkey,
    sellerid integer not null,
    buyerid integer not null,
    eventid integer not null,
    dateid smallint not null sortkey,
    qtysold smallint not null,
    pricepaid decimal(8,2),
    commission decimal(8,2),
    saletime timestamp);

copy listing from 's3://awssampledbuswest2/tickit/listings_pipe.txt' 
credentials 'aws_iam_role=<iam-role-arn-for-your-cluster>' 
delimiter '|' region 'us-west-2';

copy sales from 's3://awssampledbuswest2/tickit/sales_tab.txt'
credentials 'aws_iam_role=<iam-role-arn-for-your-cluster>'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' region 'us-west-2';

select avg(l.priceperticket*s.qtysold) from listing l, sales s where l.listid <40000;

create user poweruserwlm createuser password '123PowerUser';

create group powerusers;
alter group powerusers add user poweruserwlm;

set session authorization 'poweruserwlm';

select avg(l.priceperticket*s.qtysold) from listing l, sales s where l.listid <40000;

set session authorization default;
set query_group to dataload;
select avg(l.priceperticket*s.qtysold) from listing l, sales s where l.listid <40000;

reset query_group;