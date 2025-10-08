# SQL PROJECT
# 📊 HR Attrition Analysis for Adviti Pvt. Ltd. (SQL Data Analysis Project)

## Project Overview

This project focuses on leveraging SQL to analyze Human Resources (HR) data for Adviti Pvt. Ltd., a data-driven consulting firm. The primary goal is to transform raw workforce data into actionable business intelligence by identifying the key drivers of employee attrition, measuring employee engagement levels, and evaluating the effectiveness of internal training programs.

**Key Insight:** The analysis revealed a critical systemic issue: **Employees with the Lowest Performance Rating (1) show a 100% Attrition Rate**, indicating a breakdown in the performance management and support system.

## 🎯 Business Objectives Addressed

1.  **Understand Drivers of Attrition:** Identify patterns and root causes behind employee exits.
2.  **Measure Employee Engagement:** Analyze satisfaction and benefit usage to understand how engaged employees feel.
3.  **Analyze Training Outcomes:** Assess if training hours impact satisfaction, promotion, or performance.

## 🛠️ Technology & Methodology

* **Database:** MySQL
* **Artifacts:** Single, comprehensive SQL script (`My_SQL_HR_Attrition.sql`)
* **Methodology:** Used advanced SQL techniques including conditional aggregation (`CASE` statements with `SUM` and `COUNT`), `JOIN` operations, and custom salary/age bucketing to calculate attrition rates, averages, and correlations across all required dimensions.

## 📈 Key Findings Summary

### 1. The Most Critical Attrition Driver

* **Performance Rating:** **100%** of employees with the lowest Performance Rating (1) left the company. This mandates an immediate audit of the Performance Improvement Plan (PIP) process.
* **Peer Relationships:** Dissatisfaction with peer relationships (0) drove an attrition rate of **38.5%**, making it the highest non-performance-related factor driving attrition.
* **Service Years:** Attrition rates for the 1-3 year tenure bracket peaked at **29.1%** (for 2 years of service), highlighting issues with mid-term retention.

### 2. Employee Engagement Insights

* **Compensation:** Satisfied employees (1) had an average engagement score of **4.45**, compared to **3.12** for dissatisfied employees, showing compensation satisfaction is the strongest positive correlation.
* **Absenteeism:** Employees with the lowest engagement scores (1-2) averaged **8.7** absent days per year, versus only **3.2** days for the most engaged (5).

### 3. Training Program Effectiveness

* **Promotion Link:** Promoted employees averaged **48** hours of training, significantly more than the **30** hours completed by non-promoted staff, confirming training is successfully utilized as a precursor to career advancement.
* **Performance Link:** High Performers (Rating 4 & 5) received **42** hours of training on average, compared to **33** hours for low performers (Rating 1 & 2), suggesting training investment is directed toward already high-achieving staff.

## 💡 Recommendations for Adviti Pvt. Ltd.

1.  **Performance Management Audit:** Immediately investigate the 100% attrition rate for Rating 1 employees. Ensure the process is controlled (managed separation) rather than a symptom of a hostile or unsupportive environment.
2.  **Cultural Intervention:** Implement targeted manager training and team-building initiatives to address the high attrition driven by poor peer relationships (38.5%).
3.  **Strategic Training Redistribution:** Shift some training budget away from the highest-performing/engaged employees to focus on upskilling and development for the lowest-engaged cohort to proactively improve retention.
```eof

---
