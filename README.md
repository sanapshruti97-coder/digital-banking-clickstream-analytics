# Digital Banking Clickstream & Customer Journey Analytics

## Overview
This portfolio project analyzes a **synthetic digital-banking clickstream dataset** to understand customer journeys, funnel drop-off, conversion behavior, and the factors associated with application completion. It combines Python, SQL, statistical hypothesis testing, machine learning, and BI-ready outputs.

> **Data note:** All customer, session, event, and location records in this repository are synthetic. No real bank or customer data is used.

## Business Problem
A digital banking team wants to understand how users move through online product journeys and where potential friction occurs. The project answers questions such as:

- How many users and sessions enter the digital journey?
- At which funnel steps do sessions drop off?
- How does conversion vary by device, acquisition channel, product, and location?
- Is device type statistically associated with conversion?
- Can journey completion be predicted using session and contextual features?
- Which KPIs should product and digital teams monitor?

## Journey Modeled
`Login → Product View → Application Start → Details Entered → Verification → Application Submitted`

## Dataset
Raw file: `data/raw/digital_banking_clickstream.csv`

The dataset contains event-level clickstream records with:
- customer and session identifiers
- timestamps and journey events
- device type and acquisition channel
- banking product and city
- journey step and conversion outcome

See `DATA_DICTIONARY.md` for field definitions.

## Project Structure
```text
digital-banking-clickstream-analytics/
├── README.md
├── DATA_DICTIONARY.md
├── requirements.txt
├── .gitignore
├── data/
│   ├── raw/
│   │   └── digital_banking_clickstream.csv
│   └── processed/
│       ├── session_level_features.csv
│       ├── funnel_summary.csv
│       └── powerbi_summary.csv
├── notebooks/
│   └── digital_banking_clickstream_analysis.ipynb
├── sql/
│   └── analysis_queries.sql
├── powerbi/
│   └── README.md
├── reports/
│   └── figures/
└── src/
```

## Analysis Workflow
1. Validate and preprocess event-level clickstream data.
2. Build session-level behavioral features.
3. Calculate digital KPIs and customer-journey funnel metrics.
4. Compare conversion across device, channel, product, and location.
5. Apply a chi-square hypothesis test to device type vs conversion.
6. Train classification models:
   - Logistic Regression
   - Random Forest
   - Gradient Boosting
7. Compare models using classification metrics and ROC-AUC.
8. Prepare aggregated output for a Power BI dashboard.
9. Translate findings into testable product and journey-improvement opportunities.

## Core KPIs
- Sessions
- Unique users
- Conversions
- Conversion rate
- Funnel reach/drop-off
- Average session duration
- Average events per session
- Device/channel/product conversion rate

## Statistical Analysis
The notebook includes a chi-square test of independence:

- **H0:** conversion is independent of device type.
- **H1:** conversion is associated with device type.

The result should be interpreted as an association in synthetic observational data, not as proof of causation.

## Machine Learning
The target is `converted`:
- `1` = application journey completed
- `0` = journey not completed

Models:
- Logistic Regression
- Random Forest
- Gradient Boosting

Candidate predictors include:
- device type
- acquisition channel
- product
- city
- events per session
- session duration

Model evaluation includes precision, recall, F1-score, confusion-matrix output, and ROC-AUC.

## SQL
`sql/analysis_queries.sql` contains queries for:
- overall digital KPIs
- funnel analysis
- device conversion
- channel conversion
- product-level journey performance

## Power BI
`data/processed/powerbi_summary.csv` is prepared for dashboard development. Recommended pages:

### Executive Overview
- Sessions
- Users
- Conversions
- Conversion rate
- Average session duration

### Customer Journey
- Funnel by journey step
- Drop-off between steps
- Conversion by product

### Digital Experience
- Conversion by device
- Conversion by channel
- Sessions and conversion over time

## Business Use
The analysis is designed to support product, digital banking, analytics, and engineering teams by identifying measurable journey friction and generating hypotheses that can be tested through product experiments.

## Limitations
- The dataset is synthetic and is intended for portfolio demonstration.
- Relationships in the data are simulated and should not be interpreted as real banking behavior.
- Observational associations do not establish causality.
- A production implementation would require real event instrumentation, governance, privacy controls, monitoring, and model-validation processes.

## Tech Stack
- Python
- Pandas / NumPy
- SciPy
- scikit-learn
- Matplotlib
- SQL
- Power BI-ready CSV outputs
- Jupyter Notebook

## How to Run
```bash
pip install -r requirements.txt
jupyter notebook notebooks/digital_banking_clickstream_analysis.ipynb
```

## Resume-Ready Project Description
**Digital Banking Clickstream & Customer Journey Analytics** — Built an end-to-end analytics workflow on synthetic digital-banking clickstream data using Python and SQL; analyzed conversion funnels and customer journeys, applied hypothesis testing, engineered session-level features, and compared classification models including Logistic Regression, Random Forest, and Gradient Boosting using ROC-AUC and classification metrics. Prepared KPI datasets for Power BI reporting.

## Author
Shruti Sanap
