WITH l AS (
    SELECT 
        *
    FROM
    {{ ref('silver_listings') }}
),
h AS (
    SELECT
        *
    FROM
    {{ ref('silver_host') }}
)

SELECT 
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    l.host_id,
    h.host_name,
    h.IS_SUPERHOST as host_is_superhost,
    l.CREATED_AT,
    GREATEST(l.updated_at,h.updated_at) as updated_at
FROM l
LEFT JOIN h ON (h.host_id = l.host_id)