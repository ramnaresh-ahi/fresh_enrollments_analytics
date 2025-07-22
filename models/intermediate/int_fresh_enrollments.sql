
{{ config(
    materialized = 'incremental',
    unique_key = 'enrollment_id'
)}}

WITH fresh_enrollments AS(
    SELECT
        f.enrollment_id,
        f.first_name,
        f.last_name,
        f.age,
        f.gender,
        f.contact_number,
        f.email,
        f.city,
        f.state,
        f.since_listening_in_years,
        ch.channel_id,
        f.donation,
        c.counsellor_id,
        f.enrollment_date
    FROM
        {{ ref('stg_channels')}} ch
        JOIN 
        {{ ref('stg_fresh_enrollments')}} f USING(channel_id)
        JOIN 
        {{ ref('stg_counsellors')}} c USING (counsellor_id)
    
    {% if is_incremental()%}
    WHERE
        f.enrollment_date > (SELECT MAX(enrollment_date) from {{ this }})
    {% endif %}
)

SELECT
    *
FROM
    fresh_enrollments