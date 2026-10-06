-- Digital Banking Clickstream & Customer Journey Analytics
-- SQL examples assume a table named digital_banking_clickstream.

-- 1. Core KPIs
SELECT
    COUNT(DISTINCT session_id) AS sessions,
    COUNT(DISTINCT customer_id) AS users,
    SUM(CASE WHEN event_name = 'application_submitted' THEN 1 ELSE 0 END) AS conversions
FROM digital_banking_clickstream;

-- 2. Funnel
SELECT
    journey_step,
    event_name,
    COUNT(DISTINCT session_id) AS sessions
FROM digital_banking_clickstream
GROUP BY journey_step, event_name
ORDER BY journey_step;

-- 3. Conversion by device
WITH session_level AS (
    SELECT
        session_id,
        MAX(device_type) AS device_type,
        MAX(converted) AS converted
    FROM digital_banking_clickstream
    GROUP BY session_id
)
SELECT
    device_type,
    COUNT(*) AS sessions,
    SUM(converted) AS conversions,
    ROUND(100.0 * SUM(converted) / COUNT(*), 2) AS conversion_rate_pct
FROM session_level
GROUP BY device_type
ORDER BY conversion_rate_pct DESC;

-- 4. Conversion by acquisition channel
WITH session_level AS (
    SELECT session_id, MAX(channel) AS channel, MAX(converted) AS converted
    FROM digital_banking_clickstream
    GROUP BY session_id
)
SELECT channel,
       COUNT(*) AS sessions,
       SUM(converted) AS conversions,
       ROUND(100.0 * SUM(converted) / COUNT(*), 2) AS conversion_rate_pct
FROM session_level
GROUP BY channel
ORDER BY conversion_rate_pct DESC;

-- 5. Product funnel performance
WITH session_level AS (
    SELECT session_id, MAX(product) AS product, MAX(journey_step) AS max_step, MAX(converted) AS converted
    FROM digital_banking_clickstream
    GROUP BY session_id
)
SELECT product,
       COUNT(*) AS sessions,
       AVG(max_step) AS avg_max_journey_step,
       ROUND(100.0 * SUM(converted) / COUNT(*), 2) AS conversion_rate_pct
FROM session_level
GROUP BY product
ORDER BY conversion_rate_pct DESC;
