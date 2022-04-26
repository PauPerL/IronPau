SELECT DISTINCT
    A2 as district, A3 as region
FROM
    district
LIMIT 30;

SELECT 
    type AS type_of_card, issued AS issue_date
FROM
    card AS bc;