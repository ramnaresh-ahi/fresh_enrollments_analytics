-- tests/is_valid_contact_number.sql

SELECT *
FROM {{ ref('stg_fresh_enrollments') }}
WHERE NOT REGEXP_LIKE(contact_number, '^[6-9]\\d{9}$')
