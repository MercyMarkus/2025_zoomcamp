{{
    config(
        materialized='table'
    )
}}

with taxi_data as (
    select 
        service_type,
        year,
        month,
        fare_amount
    from {{ ref('fact_trips') }}
    where fare_amount > 0 and trip_distance > 0 and payment_type_description in ('Cash', 'Credit card')),
percentile_calc as (
    select 
        service_type,
        year,
        month,
        percentile_cont(fare_amount, 0.97) over (
            partition by service_type, year, month
        ) as p97_fare,
        percentile_cont(fare_amount, 0.95) over (
            partition by service_type, year, month
        ) as p95_fare,
        percentile_cont(fare_amount, 0.90) over (
            partition by service_type, year, month
        ) as p90_fare
    from taxi_data
)
select distinct * from percentile_calc
