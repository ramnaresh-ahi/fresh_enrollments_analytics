
WITH counsellors AS(
    SELECT
        counsellor_id,
        counsellor_name
    FROM
        {{ source('raw', 'counsellors')}}
)

SELECT
    *
FROM
    counsellors