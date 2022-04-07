{{ config(materialized='table') }}

with source_data as (

    select *
    from {{ source('ontology', 'person') }}

)

select *
from source_data
