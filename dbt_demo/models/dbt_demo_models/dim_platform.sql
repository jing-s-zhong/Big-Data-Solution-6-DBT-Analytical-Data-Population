{{ config(materialized='table') }}

with source_data as (

    select *
    from {{ source('reference', 'platform') }}

)

select *
from source_data
