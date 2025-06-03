{{
    config(
        materialized='incremental',
        on_schema_change ='fail'
    )
}}

WITH src_reviews AS (
    SELECT * FROM {{ ref('bronze_reviews') }}
)
SELECT * FROM src_reviews
WHERE review_text is not null
{% if is_incremental() %}
    AND review_date > (SELECT MAX(review_date) FROm {{ this }})
{% endif %}