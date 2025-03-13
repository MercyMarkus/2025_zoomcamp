{{
    config(
        materialized='table'
    )
}}

with fhv_taxi_data as (
    select 
        *,
        timestamp_diff(dropOff_datetime, pickup_datetime, second) as trip_duration,
    from {{ ref('dim_fhv_trips') }}),

percentile_calc as (
    select distinct
        pickup_zone,
        dropoff_zone,
        year,
        month,
        percentile_cont(trip_duration, 0.90) over (
            partition by year, month, pickup_locationid, dropoff_locationid
        ) as p90_trip_duration
    from fhv_taxi_data
    where pickup_zone in ('Newark Airport', 'SoHo','Yorkville East') and year = 2019 and month = 11
    order by p90_trip_duration desc
),

ranked_p90 as (
    select *, dense_rank() over (partition by pickup_zone order by p90_trip_duration desc) as rank
    from percentile_calc
)

select *
from ranked_p90
-- where rank = 2
order by rank, pickup_zone