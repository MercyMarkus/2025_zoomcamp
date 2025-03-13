create table `weighty-pixel-448710-u7.module_4_homework.yellow_trips` (
VendorID INT64,
tpep_pickup_datetime STRING,
tpep_dropoff_datetime STRING,
store_and_fwd_flag STRING,
RatecodeID INT64,
PULocationID INT64,
DOLocationID INT64,
passenger_count INT64,
trip_distance NUMERIC,
fare_amount NUMERIC,
extra NUMERIC,
mta_tax NUMERIC,
tip_amount NUMERIC,
tolls_amount NUMERIC,
improvement_surcharge NUMERIC,
total_amount NUMERIC,
payment_type INT64,
congestion_surcharge NUMERIC);


insert into `weighty-pixel-448710-u7.module_4_homework.yellow_trips`
select 
CAST(VendorID AS INT64),
tpep_pickup_datetime STRING,
tpep_dropoff_datetime STRING,
store_and_fwd_flag STRING,
CAST(RatecodeID AS INT64),
CAST(PULocationID AS INT64),
CAST(DOLocationID AS INT64),
CAST(passenger_count AS INT64),
CAST(trip_distance AS NUMERIC),
CAST(fare_amount AS NUMERIC),
CAST(extra AS NUMERIC),
CAST(mta_tax AS NUMERIC),
CAST(tip_amount AS NUMERIC),
CAST(tolls_amount AS NUMERIC),
CAST(improvement_surcharge AS NUMERIC),
CAST(total_amount AS NUMERIC),
CAST(payment_type AS INT64),
CAST(congestion_surcharge AS NUMERIC)
from `weighty-pixel-448710-u7.module_4_homework.yellow`;