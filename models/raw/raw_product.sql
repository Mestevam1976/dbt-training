{{
    config(
        materialized='table'
    )
}}

select *
from RAW.GLOBALMART.PRODUCT