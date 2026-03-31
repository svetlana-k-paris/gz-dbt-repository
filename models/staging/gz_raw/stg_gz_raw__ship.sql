with 

source as (

    select * from {{ source('gz_raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost as log_cost,
        cast(ship_cost as float64) as ship_cost

    from source

)

select * from renamed