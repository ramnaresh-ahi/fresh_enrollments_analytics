
WITH fresh_enrollments AS(
    SELECT
        enrollment_id,
        first_name,
        COALESCE(last_name, 'N/A') as last_name,
        CAST(age as INTEGER) as age,
        CASE 
            WHEN LOWER(gender) IN ('female', 'f') THEN 'Female'
            WHEN LOWER(gender) IN ('male', 'm') THEN 'Male'
            ELSE 'Unknown'
        END as gender,
        contact_number,
        COALESCE(email, 'N/A') as email,
        since_listening as since_listening_in_years,
        CAST(channel as INTEGER) as channel_id,
        donation,
        counsellor_id,
        CAST(registered_date as DATE) as enrollment_date
    FROM 
        {{ source('raw', 'fresh_enrollments')}}
    WHERE
        age BETWEEN 13 AND 75

)

SELECT
    *
FROM 
    fresh_enrollments