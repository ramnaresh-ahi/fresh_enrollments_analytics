
WITH fresh_enrollments AS(
    SELECT
        enrollment_id,
        first_name,
        last_name,
        age,
        gender,
        contact_number,
        email,
        city,
        state,
        since_listening_in_years,
        channel_id,
        donation,
        counsellor_id,
        enrollment_date
    FROM
        {{ ref('int_fresh_enrollments')}}
)

SELECT
    *
FROM
    fresh_enrollments