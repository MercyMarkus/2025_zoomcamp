{{ config(materialized='table') }}

with trips_data as (
    select * from {{ ref('fact_trips') }}
)
    select 
    -- Revenue grouping 
    year_quarter,
    service_type,
    sum(total_amount) as revenue_quarterly_total_amount

    from trips_data
    group by 1,2
    order by 2, 3 desc