WITH src_host as (
    SELECT
        ID as host_id,
        NAME,
        IS_SUPERHOST,
        CREATED_AT,
        updated_at
    FROM AIRBNB.RAW.RAW_HOSTS
)
SELECT * FROM src_host