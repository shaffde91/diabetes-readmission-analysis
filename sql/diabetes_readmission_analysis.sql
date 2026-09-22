-- Diabetes Hospital Readmission Analysis
-- Analyzing observed <30-day readmission rates
-- by hospital stay and prior inpatient utilization

WITH stay_groups AS (
    SELECT
        CASE
            WHEN time_in_hospital BETWEEN 1 AND 3 THEN '1-3 days'
            WHEN time_in_hospital BETWEEN 4 AND 6 THEN '4-6 days'
            WHEN time_in_hospital BETWEEN 7 AND 10 THEN '7-10 days'
            WHEN time_in_hospital BETWEEN 11 AND 14 THEN '11-14 days'
        END AS stay_category,

        CASE
            WHEN number_inpatient = 0 THEN '0 visits'
            WHEN number_inpatient BETWEEN 1 AND 2 THEN '1-2 visits'
            WHEN number_inpatient BETWEEN 3 AND 4 THEN '3-4 visits'
            WHEN number_inpatient >= 5 THEN '5+ visits'
        END AS inpatient_category,

        readmitted

    FROM diabetic_data
),

readmission_analysis AS (
    SELECT
        stay_category,
        inpatient_category,

        COUNT(*) AS total_encounters,

        COUNT(*) FILTER (
            WHERE readmitted = '<30'
        ) AS readmitted_under_30,

        ROUND(
            (
                COUNT(*) FILTER (
                    WHERE readmitted = '<30'
                ) * 100.0 / COUNT(*)
            )::numeric,
            2
        ) AS readmission_rate

    FROM stay_groups

    GROUP BY
        stay_category,
        inpatient_category
),

overall_readmission AS (
    SELECT
        ROUND(
            (
                COUNT(*) FILTER (
                    WHERE readmitted = '<30'
                ) * 100.0 / COUNT(*)
            )::numeric,
            2
        ) AS overall_rate

    FROM diabetic_data
)

SELECT
    r.stay_category,
    r.inpatient_category,
    r.total_encounters,
    r.readmitted_under_30,
    r.readmission_rate,
    o.overall_rate,

    RANK() OVER (
        PARTITION BY r.inpatient_category
        ORDER BY r.readmission_rate DESC
    ) AS readmission_rank,

    r.readmission_rate -
    LAG(r.readmission_rate) OVER (
        PARTITION BY r.inpatient_category
        ORDER BY
            CASE r.stay_category
                WHEN '1-3 days' THEN 1
                WHEN '4-6 days' THEN 4
                WHEN '7-10 days' THEN 7
                WHEN '11-14 days' THEN 11
            END
    ) AS rate_change_from_previous_stay

FROM readmission_analysis AS r

CROSS JOIN overall_readmission AS o

ORDER BY
    r.inpatient_category,
    CASE r.stay_category
        WHEN '1-3 days' THEN 1
        WHEN '4-6 days' THEN 4
        WHEN '7-10 days' THEN 7
        WHEN '11-14 days' THEN 11
    END;
