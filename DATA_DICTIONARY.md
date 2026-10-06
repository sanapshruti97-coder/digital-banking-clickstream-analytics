# Data Dictionary

The raw dataset is **synthetic** and was generated solely for portfolio/learning use. It contains no real customers or bank records.

| Column | Description |
|---|---|
| event_id | Unique event identifier |
| customer_id | Synthetic customer identifier |
| session_id | Synthetic digital session identifier |
| event_timestamp | Timestamp of the clickstream event |
| event_name | Event in the digital banking journey |
| page_name | Page associated with the event |
| journey_step | Ordered funnel step (1-6) |
| device_type | Mobile, Desktop, or Tablet |
| channel | Acquisition/source channel |
| product | Banking product being explored/applied for |
| city | Synthetic user city attribute |
| session_start | Session start timestamp |
| converted | 1 if the session completed the application journey, else 0 |
