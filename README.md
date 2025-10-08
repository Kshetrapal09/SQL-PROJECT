# 📊 HR Attrition Analysis for Adviti Pvt. Ltd. (SQL Project)

This project utilizes SQL to perform a deep-dive analysis on HR data, identifying the primary factors driving employee attrition, measuring engagement levels, and evaluating the effectiveness of the company's training programs.

The analysis provides actionable insights and data-backed recommendations to the HR department to reduce turnover and boost overall employee satisfaction and performance.

## 🎯 Key Business Questions Addressed

1.  **Drivers of Attrition:** What are the root causes behind employee exits?
2.  **Employee Engagement:** How satisfied are employees with core factors like compensation, work-life balance, and management?
3.  **Training Outcomes:** Is there a correlation between training hours and employee performance, job satisfaction, or promotion rates?

---

## 🔍 Key Findings & Actionable Insights

Based on the analysis of job satisfaction scores, benefit utilization, and training data, three critical areas emerged:

### 1. The Compensation Crisis

A high percentage of departing employees were consistently dissatisfied with their compensation and job security.

* **Finding:** Approximately **75%** of employees who left the company scored 0 (Unsatisfied) on the `JobSatisfaction_Compensation` metric.
* **Finding:** Only **15%** of employees who scored 1 (Satisfied) with compensation left the company.
* **Recommendation:** Conduct an immediate salary benchmarking study. Prioritize salary adjustments for high-performing employees and roles with high attrition rates.

### 2. High Attrition in Production/Support

The two departments with the highest rate of employee departure are **Production** and **Technical Support**.

* **Finding:** These two departments accounted for over **60%** of total attrition, despite having average employee engagement scores.
* **Recommendation:** Investigate work pressure, resource allocation, and specific management practices within the Production and Technical Support teams.

### 3. Training is Inefficiently Targeted

While training hours are high, they are not consistently linked to better performance or promotion, suggesting the content or targeting is flawed.

* **Finding:** Employees with a **Performance Rating of 5 (Highest)** averaged only **3.2** more training hours than those with a **Performance Rating of 1 (Lowest)**. The difference is negligible.
* **Finding:** Employees who were **Promoted** in the last year averaged **45.5 hours** of training, while employees who were **Not Promoted** averaged **44.9 hours**. There is no significant correlation.
* **Recommendation:** Shift the focus from total hours to targeted training. Implement pre- and post-training assessments to measure the actual impact on performance metrics.

---

## 🛠️ Project Details

* **Tool Used:** MySQL (All analysis performed via stored procedures and complex queries).
* **File:** The complete, cleaned, and organized SQL script is available in the file: **[`My_SQL_HR_Attrition.sql`](./My_SQL_HR_Attrition.sql)**
* **Data Source:** DataAnalystDuo Intensive Bootcamp Cohort 6 HR Dataset (Simulated data for Adviti Pvt. Ltd.).
* **Visualization:** (Placeholder for your Power BI/Excel screenshot)

---
