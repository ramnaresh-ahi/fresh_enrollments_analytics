
WITH counsellors AS(
    SELECT
        counsellor_id,
        counsellor_name
    FROM
        {{ ref('stg_counsellors')}}
)

SELECT
    *
FROM
    counsellors