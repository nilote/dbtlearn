WITH src_hosts as (
    SELECT * FROM {{ ref('bronze_host') }}
)
SELECT
    host_id,
    NVL(name,'Anonymous') AS host_name,
    IS_SUPERHOST,
    CREATED_AT,
    updated_at
FROM src_hosts