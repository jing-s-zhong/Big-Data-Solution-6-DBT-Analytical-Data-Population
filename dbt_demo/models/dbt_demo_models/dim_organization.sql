{{ config(materialized='table') }}

with source_data as (

    select *
    from {{ source('reference', 'organization') }}

)

select *
from source_data
