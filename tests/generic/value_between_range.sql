
-- tests/generic/values_between_range.sql

{% test values_between_range(model, column_name, min_value, max_value) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} NOT BETWEEN {{ min_value }} AND {{ max_value }}

{% endtest %}