
WITH channels AS(
    SELECT
        channel_id,
        channel_name
    FROM
        {{ source('raw', 'channels')}}

)

SELECT
    *
FROM
    channels