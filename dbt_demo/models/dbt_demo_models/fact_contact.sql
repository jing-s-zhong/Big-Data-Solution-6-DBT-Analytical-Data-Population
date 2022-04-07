{{ config(
    materialized='table',
    pre_hook=generate_data_date()
) }}

with source_data as (

    select *
    from {{ source('ontology', 'person_contact') }}

)

select *
from source_data
