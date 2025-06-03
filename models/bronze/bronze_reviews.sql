WITH src_reviews as(
    SELECT 
        listing_id,
        date as review_date,
        reviewer_name,
        comments as review_text,
        sentiment as review_sentiment
    FROM AIRBNB.RAW.RAW_REVIEWS
)
SELECT * FROM src_reviews