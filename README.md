# Diabetes Patient Readmission Analysis

## Project Overview

This project analyzes hospital encounters involving patients with diabetes to identify characteristics associated with observed **30-day hospital readmission rates**.

Using PostgreSQL and SQL, I transformed and analyzed 101,766 hospital encounters to examine how readmission rates varied across hospital stay length, prior inpatient utilization, and number of recorded diagnoses.

The project demonstrates how SQL can be used to transform raw healthcare data into structured analysis and actionable insights.

---

## Business Question

**What patient and hospital encounter characteristics are associated with higher observed 30-day readmission rates among patients with diabetes?**

---

## Dataset

**Dataset:** Diabetes 130-US Hospitals for Years 1999–2008

**Records:** 101,766 hospital encounters

The dataset contains information related to:

* Patient age
* Hospital length of stay
* Number of diagnoses
* Prior inpatient visits
* Prior emergency visits
* Prior outpatient visits
* Medication information
* Hospital readmission outcomes

The primary outcome analyzed in this project was:

* `<30` — readmitted within 30 days

---

## Tools

* **PostgreSQL** — Database and SQL analysis
* **pgAdmin** — Database management and query execution
* **SQL** — Data transformation and analysis
* **GitHub** — Version control and project documentation
* **DataSciencePortfol.io** — Portfolio presentation

---

## SQL Skills Demonstrated

* `SELECT`
* `GROUP BY`
* `ORDER BY`
* `COUNT()`
* `CASE` statements
* Conditional aggregation using `FILTER`
* Percentage and rate calculations
* Common Table Expressions (CTEs)
* Multiple CTEs
* `CROSS JOIN`
* Table aliases
* Window functions
* `RANK()`
* `LAG()`
* Calculated fields
* Data categorization

---

## Key Findings

### 1. Overall Readmission Rate

The observed `<30` readmission rate across all 101,766 hospital encounters was:

**11.16%**

This rate was used as the overall benchmark when comparing different encounter groups.

### 2. Prior Inpatient Visits

Prior inpatient utilization showed the clearest observed pattern.

| Prior Inpatient Visits | <30-Day Readmission Rate |
| ---------------------- | -----------------------: |
| 0 visits               |                    8.44% |
| 1–2 visits             |                   14.18% |
| 3–4 visits             |                   21.36% |
| 5+ visits              |                   36.41% |

The observed rate increased by **27.97 percentage points** between encounters with no prior inpatient visits and encounters with 5+ prior inpatient visits.

### 3. Number of Recorded Diagnoses

Observed readmission rates also increased across diagnosis categories.

| Number of Diagnoses | <30-Day Readmission Rate |
| ------------------- | -----------------------: |
| 1–3                 |                    6.97% |
| 4–6                 |                    9.44% |
| 7–9                 |                   12.06% |
| 10+                 |                   14.78% |

The 10+ category contained only 115 encounters, so this result should be interpreted cautiously.

### 4. Hospital Length of Stay

Readmission rates varied across hospital stay categories.

| Hospital Stay | <30-Day Readmission Rate |
| ------------- | -----------------------: |
| 1–3 days      |                    9.69% |
| 4–6 days      |                   12.07% |
| 7–10 days     |                   13.63% |
| 11–14 days    |                   12.10% |

The observed rate increased through the 7–10 day category before declining slightly among encounters lasting 11–14 days.

---

## Advanced SQL Analysis

The final analysis combines hospital stay and prior inpatient utilization to examine how readmission rates vary across both dimensions.

The analysis uses:

* Common Table Expressions
* Conditional categorization with `CASE`
* Conditional aggregation
* `CROSS JOIN`
* `RANK()` window function
* `LAG()` window function
* Calculated percentage-point changes

This allowed the analysis to compare each group against the overall readmission rate while also measuring changes between hospital stay categories.

---

## Limitations

* The dataset contains 101,766 hospital encounters rather than necessarily representing 101,766 unique patients.
* The analysis identifies associations and observed differences in readmission rates but does not establish causation.
* Some categories contain relatively few encounters, which may make their calculated rates less stable.
* The dataset covers hospital encounters from 1999–2008, so the findings may not reflect current healthcare practices or readmission patterns.

---

## Conclusion

This analysis demonstrates how SQL can be used to transform raw healthcare data into meaningful analytical insights.

The strongest observed pattern involved prior inpatient utilization, with readmission rates increasing substantially across the categories of prior inpatient visits. Higher numbers of recorded diagnoses were also associated with higher observed readmission rates, while hospital length of stay showed variation across categories.

Although the analysis does not establish causation and uses historical data, it demonstrates a practical analytical workflow: **organizing raw data, creating meaningful categories, calculating rates, comparing groups, identifying patterns, and communicating findings clearly.**

---

## Project Structure

```text
diabetes-readmission-analysis/
│
├── README.md
│
├── sql/
│   └── diabetes_readmission_analysis.sql
│
└── data/
    └── README.md
```

---

## Skills Highlighted

**SQL | PostgreSQL | Data Analysis | Data Transformation | Healthcare Analytics | CTEs | Window Functions | Data Visualization Ready**
