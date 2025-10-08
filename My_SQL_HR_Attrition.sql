USE hr_Analytics ;

SELECT * FROM hr_data_updated;

SELECT COUNT(*) AS total_rows
FROM hr_data_updated;

DESCRIBE  hr_data_updated;

SELECT Employee_ID , count(*)
FROM hr_data_updated
GROUP BY Employee_ID 
HAVING COUNT(*) > 1;

SELECT Position , Age, Salary , Gender , Department 
FROM hr_data_updated
WHERE Age IS NULL OR Salary IS NULL OR Gender IS NULL OR Department IS NULL;

ALTER TABLE hr_data_updated
ADD PRIMARY KEY (Employee_ID);

UPDATE hr_data_updated
SET Department = 'Executive'
WHERE Department IS NULL;

SELECT MAX(CHAR_LENGTH(Employee_ID)) AS max_lenght
FROM hr_data_updated;

ALTER TABLE hr_data_updated
MODIFY COLUMN Employee_ID VARCHAR(10) NOT NULL;

ALTER TABLE hr_data_updated
ADD PRIMARY KEY (Employee_ID);

UPDATE hr_data_updated
SET Department = 'Executive'
WHERE Department IS NULL
LIMIT 10;

SELECT Employee_ID, Age, Gender, Education_Level, Department, Work_Hours, Years_Of_Service, Position, JobSatisfaction_PeerRelationship, JobSatisfaction_WorklifeBalance, JobSatisfaction_Compensation, JobSatisfaction_Management, JobSatisfaction_JobSecurity
FROM hr_data_updated
WHERE Employee_ID IS NULL OR Age IS NULL OR Gender IS NULL OR Education_Level IS NULL OR Department IS NULL OR  Work_Hours  IS NULL OR  Years_Of_Service  IS NULL OR  Position IS NULL OR  JobSatisfaction_PeerRelationship IS NULL OR  JobSatisfaction_WorklifeBalance IS NULL OR  JobSatisfaction_Compensation IS NULL OR  JobSatisfaction_Management  IS NULL OR  JobSatisfaction_JobSecurity ;


SELECT 
  Employee_ID,
  Age,
  Gender,
  Education_Level,
  Department,
  Work_Hours,
  Years_Of_Service,
  Position,
  JobSatisfaction_PeerRelationship,
  JobSatisfaction_WorklifeBalance,
  JobSatisfaction_Compensation,
  JobSatisfaction_Management,
  JobSatisfaction_JobSecurity,

  -- Diagnostic flags:
  CASE WHEN Employee_ID IS NULL THEN 'NULL' ELSE '' END AS emp_id_null,
  CASE WHEN Age IS NULL THEN 'NULL' ELSE '' END AS age_null,
  CASE WHEN Gender IS NULL THEN 'NULL' ELSE '' END AS gender_null,
  CASE WHEN Education_Level IS NULL THEN 'NULL' ELSE '' END AS edu_null,
  CASE WHEN Department IS NULL THEN 'NULL' ELSE '' END AS dept_null,
  CASE WHEN Work_Hours IS NULL THEN 'NULL' ELSE '' END AS hours_null,
  CASE WHEN Years_Of_Service IS NULL THEN 'NULL' ELSE '' END AS service_null,
  CASE WHEN Position IS NULL THEN 'NULL' ELSE '' END AS position_null,
  CASE WHEN JobSatisfaction_PeerRelationship IS NULL THEN 'NULL' ELSE '' END AS js_peer_null,
  CASE WHEN JobSatisfaction_WorklifeBalance IS NULL THEN 'NULL' ELSE '' END AS js_wlb_null,
  CASE WHEN JobSatisfaction_Compensation IS NULL THEN 'NULL' ELSE '' END AS js_comp_null,
  CASE WHEN JobSatisfaction_Management IS NULL THEN 'NULL' ELSE '' END AS js_mgmt_null,
  CASE WHEN JobSatisfaction_JobSecurity IS NULL THEN 'NULL' ELSE '' END AS js_sec_null

FROM hr_data_updated
WHERE 
  Employee_ID IS NULL OR Age IS NULL OR Gender IS NULL OR Education_Level IS NULL OR Department IS NULL OR  
  Work_Hours IS NULL OR Years_Of_Service IS NULL OR Position IS NULL OR  
  JobSatisfaction_PeerRelationship IS NULL OR JobSatisfaction_WorklifeBalance IS NULL OR  
  JobSatisfaction_Compensation IS NULL OR JobSatisfaction_Management IS NULL OR  
  JobSatisfaction_JobSecurity IS NULL;
  
  SELECT
  COUNT(*) AS total_rows,
  SUM(CASE WHEN Work_Hours IS NULL THEN 1 ELSE 0 END) AS null_work_hours,
  SUM(CASE WHEN Position IS NULL THEN 1 ELSE 0 END) AS null_position,
  SUM(CASE WHEN JobSatisfaction_JobSecurity IS NULL THEN 1 ELSE 0 END) AS null_job_security
FROM hr_data_updated;

SET SQL_SAFE_UPDATES = 0;

UPDATE hr_data_updated
SET Gender = 'Male'
WHERE Gender = 'M';

UPDATE hr_data_updated
SET Gender = 'Female'
WHERE Gender = 'F';

SELECT Gender 
FROM hr_data_updated;

SELECT DISTINCT(Department) AS No_Of_Departmentssss
FROM hr_data_updated ;

SELECT DISTINCT Position
FROM hr_data_updated;

UPDATE hr_data_updated
SET Position = 'Account Executive'
WHERE Position = 'Account Exec.' OR Position = 'AccountExecutive';

UPDATE hr_data_updated
SET Position = 'Data Analyst'
WHERE Position = 'DataAnalyst';

SELECT * FROM hr_data_updated ;
DESC hr_data_updated ;

#Objective 1 

#Attrition Rate 
SELECT COUNT(distinct(Employee_ID))
FROM hr_data_updated ;

SELECT Attrition 
FROM hr_data_updated 
WHERE Attrition IS NULL;

SELECT 
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Total_Employees_Left,
    COUNT(DISTINCT Employee_ID) AS Total_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(DISTINCT Employee_ID) * 100) AS Attrition_Rate
FROM hr_data_updated;

#Attrition Rate by Department 
SELECT COUNT(DISTINCT(Department)) AS No_of_Depts FROM hr_data_updated ;

SELECT 
    Department,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Rate_Percentage
FROM hr_data_updated
GROUP BY Department
ORDER BY Attrition_Rate_Percentage DESC;


#Attrition Rate By Gender 
SELECT 
    Gender,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Percentage
FROM hr_data_updated
GROUP BY Gender
ORDER BY Attrition_Percentage DESC;

#Attrition Rate By Years_of_Service
SELECT 
    Years_of_Service,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Percentage
FROM hr_data_updated
GROUP BY Years_of_Service
ORDER BY Attrition_Percentage DESC;

#Attrition Rate by Performance Rating
SELECT 
   Performance_Rating,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Percentage
FROM hr_data_updated
GROUP BY Performance_Rating
ORDER BY Attrition_Percentage DESC;

#Attrition Rate by Promotion Status 
SELECT 
    Promotion,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Percentage
FROM hr_data_updated
GROUP BY Promotion 
ORDER BY Attrition_Percentage DESC;

#Attrition Rate by Education Level 
SELECT 
    Education_Level,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Percentage
FROM hr_data_updated
GROUP BY Education_Level
ORDER BY Attrition_Percentage DESC;

#Attrition Rate by Absenteeism
SELECT 
    Absenteeism,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Percentage
FROM hr_data_updated
GROUP BY Absenteeism 
ORDER BY Attrition_Percentage DESC;

#Attrition by Age Group 
 SELECT MIN(Age) AS Minimum_Age FROM hr_data_updated ;
 SELECT MAX(Age) AS Maximum_Age FROM hr_data_updated ;
 
 #25-30 Age Group
 SELECT 
   COUNT(CASE WHEN Age BETWEEN 25 AND 30 AND Attrition = 'Yes' THEN 1 END) AS TwentyFIve_To_Thirty,
   COUNT(DISTINCT Employee_ID) AS Total_Employees,
   (SUM(CASE WHEN Age BETWEEN 25 AND 30 AND Attrition = 'YES' THEN 1 END) /  COUNT(DISTINCT Employee_ID) * 100) AS Attrition_Rate_TwentyFive_To_Thirty
FROM hr_data_updated ;
 
 #31-34 Age Group
 SELECT 
   COUNT(CASE WHEN Age BETWEEN 31 AND 34 AND Attrition = 'Yes' THEN 1 END) AS ThirtyOne_To_ThirtyFour,
   COUNT(DISTINCT Employee_ID) AS Total_Employees,
   (SUM(CASE WHEN Age BETWEEN 31 AND 34 AND Attrition = 'YES' THEN 1 END) /  COUNT(DISTINCT Employee_ID) * 100) AS Attrition_Rate_ThirtyOne_To_ThirtyFour
FROM hr_data_updated ;

#35-40 Age Group
SELECT 
   COUNT(CASE WHEN Age BETWEEN 35 AND 40 AND Attrition = 'Yes' THEN 1 END) AS ThirtyFive_To_Fourty,
   COUNT(DISTINCT Employee_ID) AS Total_Employees,
   (SUM(CASE WHEN Age BETWEEN 35 AND 40 AND Attrition = 'YES' THEN 1 END) /  COUNT(DISTINCT Employee_ID) * 100) AS Attrition_Rate_Thirty_To_Fourty
FROM hr_data_updated ;

#Attrition By Salary Range
SELECT MIN(Salary) FROM hr_data_updated ;
SELECT MAX(Salary) FROM hr_data_updated ;
SELECT AVG(Salary) FROM hr_data_updated ;

SELECT 
    CASE
        WHEN Salary < 500000 THEN 'Low (<5L)'
        WHEN Salary BETWEEN 500000 AND 1500000 THEN 'Medium (5L-15L)'
        ELSE 'High (>15L)'
    END AS salary_bucket,
    
    COUNT(DISTINCT Employee_ID) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT Employee_ID)) AS attrition_rate
FROM hr_data_updated
GROUP BY salary_bucket
ORDER BY attrition_rate DESC;

#Attrition with Peer Relationship 
SELECT
    COUNT(CASE WHEN JobSatisfaction_PeerRelationship = 1 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_PeerRelationship = 1 THEN 1 END) AS Total_Satisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_PeerRelationship = 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_PeerRelationship = 1 THEN 1 ELSE 0 END)) * 100 AS Peer_Relationship_Attrition_Rate
FROM hr_data_updated;

#Attrition without Peer Relationship 
SELECT
    COUNT(CASE WHEN JobSatisfaction_PeerRelationship = 0 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_PeerRelationship = 0 THEN 1 END) AS Total_Dissatisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_PeerRelationship = 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_PeerRelationship = 0 THEN 1 ELSE 0 END)) * 100 AS dissatisfied_Peer_Relationship_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate with WorkLifeBalance 
SELECT
    COUNT(CASE WHEN JobSatisfaction_WorkLifeBalance = 1 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_WorkLifeBalance = 1 THEN 1 END) AS Total_Satisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_WorkLifeBalance = 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_WorkLifeBalance = 1 THEN 1 ELSE 0 END)) * 100 AS JobSatisfaction_WorklifeBalance_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate without WorkLifeBalance 
SELECT
    COUNT(CASE WHEN JobSatisfaction_WorkLifeBalance = 0 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_WorkLifeBalance = 0 THEN 1 END) AS Total_Unsatisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_WorkLifeBalance = 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_WorkLifeBalance = 0 THEN 1 ELSE 0 END)) * 100 AS JobDissatisfied_WorklifeBalance_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate with JobSatisfaction_Compensation
SELECT
    COUNT(CASE WHEN JobSatisfaction_Compensation = 1 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_Compensation = 1 THEN 1 END) AS Total_Satisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_Compensation= 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_Compensation = 1 THEN 1 ELSE 0 END)) * 100 AS Compensation_Relationship_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate without JobSatisfaction_Compensation
SELECT
    COUNT(CASE WHEN JobSatisfaction_Compensation = 0 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_Compensation = 0 THEN 1 END) AS Total_Unsatisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_Compensation= 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_Compensation = 0 THEN 1 ELSE 0 END)) * 100 AS Dissatisfied_Compensation_Relationship_Attrition_Rate
FROM hr_data_updated;

#Average JobSatisfaction_Compensation 
SELECT
    Department,
    AVG(JobSatisfaction_Compensation) AS Average_JobSatisfaction
FROM
    hr_data_updated
GROUP BY
    Department
ORDER BY
    Average_JobSatisfaction;
    
#Attrition Rate with JobSatisfaction_Management 
SELECT
    COUNT(CASE WHEN JobSatisfaction_Management = 1 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_Management = 1 THEN 1 END) AS Total_Satisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_Management= 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_Management = 1 THEN 1 ELSE 0 END)) * 100 AS JobSatisfaction_Management_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate without JobSatisfaction_Management
 SELECT
    COUNT(CASE WHEN JobSatisfaction_Management = 0 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_Management = 0 THEN 1 END) AS Total_Unsatisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_Management= 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_Management = 0 THEN 1 ELSE 0 END)) * 100 AS JobDissatisfied_Management_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate with JoBSatisfaction_JobSecurity
SELECT
    COUNT(CASE WHEN JobSatisfaction_JobSecurity = 1 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_JobSecurity = 1 THEN 1 END) AS Total_Satisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_JobSecurity= 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_JobSecurity = 1 THEN 1 ELSE 0 END)) * 100 AS JobSatisfaction_JobSecurity_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate without JoBSatisfaction_JobSecurity
SELECT
    COUNT(CASE WHEN JobSatisfaction_JobSecurity = 0 AND Attrition = 'Yes' THEN 1 END) AS Attrition_Count,
    COUNT(CASE WHEN JobSatisfaction_JobSecurity = 0 THEN 1 END) AS Total_Unsatisfied_Employees,
    (SUM(CASE WHEN JobSatisfaction_JobSecurity= 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN JobSatisfaction_JobSecurity = 0 THEN 1 ELSE 0 END)) * 100 AS JobDissatisfaction_JobSecurity_Attrition_Rate
FROM hr_data_updated;

#Attrition Rate by Employee Benefit with HealthInsurance 
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_HealthInsurance = 1 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_HealthInsurance_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_HealthInsurance = 1 THEN 1 END) AS Total_Satisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_HealthInsurance = 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_HealthInsurance = 1 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_HealthInsurance_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition Rate by Employee Benefit without HealthInsurance 
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_HealthInsurance = 0 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_HealthInsurance_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_HealthInsurance = 0 THEN 1 END) AS Total_Unsatisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_HealthInsurance = 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_HealthInsurance = 0 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_Without_HealthInsurance_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition Rate by Employee Benefit with PaidLeave 
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_PaidLeave = 1 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_PaidLeave_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_PaidLeave = 1 THEN 1 END) AS Total_Satisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_PaidLeave = 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_PaidLeave = 1 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_PaidLeave_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition Rate by Employee Benefit without PaidLeave 
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_PaidLeave = 0 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_PaidLeave_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_PaidLeave = 0 THEN 1 END) AS Total_Dissatisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_PaidLeave = 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_PaidLeave = 0 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_Without_PaidLeave_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition Rate by Employee Benefit with Retiement Plan
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_RetirementPlan = 1 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_RetirementPlan_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_RetirementPlan = 1 THEN 1 END) AS Total_Satisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_RetirementPlan = 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_RetirementPlan = 1 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_RetirementPlan_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition Rate by Employee Benefit without Retiement Plan
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_RetirementPlan = 0 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_RetirementPlan_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_RetirementPlan = 0 THEN 1 END) AS Total_Dissatisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_RetirementPlan = 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_RetirementPlan = 0 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_Without_RetirementPlan_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition Rate by Employee Benefit with Gym Memebership 
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_GymMembership = 1 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_GymMembership_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_GymMembership = 1 THEN 1 END) AS Total_Satisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_GymMembership = 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_GymMembership  = 1 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_GymMembership_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition Rate by Employee Benefit without Gym Memebership
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_GymMembership = 0 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_GymMembership_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_GymMembership = 0 THEN 1 END) AS Total_Dissatisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_GymMembership = 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_GymMembership  = 0 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_Without_GymMembership_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition rate by Employee Benefit with Child Care 
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_ChildCare = 1 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_ChildCare_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_ChildCare = 1 THEN 1 END) AS Total_Satisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_ChildCare = 1 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_ChildCare  = 1 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_ChildCare_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition rate by Employee Benefit without Child Care 
SELECT 
       COUNT(CASE WHEN EmployeeBenefit_ChildCare = 0 AND Attrition = 'Yes' THEN 1 END) AS EmployeeBenefit_ChildCare_AttritionCount,
       COUNT(CASE WHEN EmployeeBenefit_ChildCare = 0 THEN 1 END) AS Total_Dissatisfied_Employees,
       (SUM(CASE WHEN EmployeeBenefit_ChildCare = 0 AND Attrition = 'Yes' THEN 1 ELSE 0 END) / SUM(CASE WHEN EmployeeBenefit_ChildCare  = 0 THEN 1 ELSE 0 END)) * 100 AS EmployeeBenefit_Without_ChildCare_AttritionCount_Percentage
FROM hr_data_updated ;

#Attrition rate by Distance_From_Work
SELECT 
    Distance_from_Work,
    COUNT(Employee_ID) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrited_Employees,
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(Employee_ID)) AS Attrition_Rate_Percentage
FROM hr_data_updated
GROUP BY Distance_from_Work
ORDER BY Distance_from_Work DESC;

#Relation Between Jobsatisfaction and Worklife Balance
SELECT ROUND(AVG(JobSatisfaction_WorkLifeBalance)) AS Job_Satisfaction_WorklifeBalance, Distance_From_Work
FROM hr_data_updated
GROUP BY Distance_From_Work
ORDER BY Distance_From_Work DESC ; 


#Objective 2 

#Employee Engagement score 
SELECT 
    Employee_Engagement_Score,
	COUNT(Employee_ID) AS Total_Employees
FROM hr_data_updated
GROUP BY Employee_Engagement_Score ;

#Employee Engagement score with department 
SELECT 
      Employee_Engagement_Score, Department, 
      COUNT(Employee_ID) AS Total_Employees
FROM hr_data_updated
GROUP BY Employee_Engagement_Score, Department ;

#Employee Engagement score with Position
SELECT 
      Employee_Engagement_Score, Position, 
      COUNT(Employee_ID) AS Total_Employees
FROM hr_data_updated
GROUP BY Employee_Engagement_Score, Position ;

#Employee engagement score with Work_Hours 
SELECT 
      Employee_Engagement_Score, Work_Hours, 
      COUNT(Employee_ID) AS Total_Employees
FROM hr_data_updated
GROUP BY Employee_Engagement_Score, Work_Hours ;

#Average Employee engagement score with JobSatisfaction with Work Life Balance
SELECT
    JobSatisfaction_WorkLifeBalance,
    AVG(Employee_Engagement_Score) AS Average_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    JobSatisfaction_WorkLifeBalance;
    
#Average Employee Engagement score with Jobsatisfaction Peer Relationship
SELECT
    JobSatisfaction_PeerRelationship,
    AVG(Employee_Engagement_Score) AS Average_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    JobSatisfaction_PeerRelationship;

#Average Employee Engagement Score with Jobsatisfaction Compensation
SELECT
    JobSatisfaction_Compensation,
    AVG(Employee_Engagement_Score) AS Average_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    JobSatisfaction_Compensation;
    
#Average Employee Engagement Score with Job Satisfaction Management
SELECT
    JobSatisfaction_Management,
    AVG(Employee_Engagement_Score) AS Average_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    JobSatisfaction_Management;
    
#Average Employee Engagement Score with Job Security 
SELECT
    JobSatisfaction_JobSecurity,
    AVG(Employee_Engagement_Score) AS Average_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    JobSatisfaction_JobSecurity;
    
#Average Employee Enagaement score with Health Benefit 
SELECT
    EmployeeBenefit_HealthInsurance,
    AVG(Employee_Engagement_Score) AS Average_Employee_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    EmployeeBenefit_HealthInsurance;

#Average Employee Engagement Score with Paid Leave 
SELECT
    EmployeeBenefit_PaidLeave,
    AVG(Employee_Engagement_Score) AS Average_Employee_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    EmployeeBenefit_PaidLeave;

#Average Employee Engagement Score with RetirementPlan
SELECT
    EmployeeBenefit_RetirementPlan,
    AVG(Employee_Engagement_Score) AS Average_Employee_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    EmployeeBenefit_RetirementPlan;
    
#Average Employee Engagement Score with GymMembership
SELECT
    EmployeeBenefit_GymMembership,
    AVG(Employee_Engagement_Score) AS Average_Employee_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    EmployeeBenefit_GymMembership;
    
#Average Employee Engagement Score with ChildCare
SELECT
    EmployeeBenefit_ChildCare,
    AVG(Employee_Engagement_Score) AS Average_Employee_Engagement_Score
FROM
    hr_data_updated
GROUP BY
    EmployeeBenefit_ChildCare;
    
#Absenteeism
SELECT AVG(Absenteeism) AS Average_Absenti, Employee_Engagement_Score
FROM hr_data_updated
GROUP BY Employee_Engagement_Score
ORDER BY Employee_Engagement_Score DESC;
    
#Objective 3 
#Comparison Between Training  Hours and Perfromance Rating
SELECT
    Performance_Rating,
    FLOOR(AVG(Training_Hours)) AS Avg_Hours,
    ROUND((AVG(Training_Hours) - FLOOR(AVG(Training_Hours))) * 60, 0) AS Avg_Minutes
FROM
    hr_data_updated
GROUP BY
     Performance_Rating
ORDER BY
    Avg_Hours DESC, Avg_Minutes DESC;

#Comparison Between Tarining Hours and Departments 
SELECT
    Department,
    FLOOR(AVG(Training_Hours)) AS Avg_Hours,
    ROUND((AVG(Training_Hours) - FLOOR(AVG(Training_Hours))) * 60, 0) AS Avg_Minutes
FROM
    hr_data_updated
GROUP BY
    Department
ORDER BY
    Avg_Hours DESC, Avg_Minutes DESC;


#Relation between Training and Employee Engagement Score.
SELECT 
    Employee_Engagement_Score,
    FLOOR(AVG(Training_Hours)) AS Avg_Hours,
    ROUND((AVG(Training_Hours) - FLOOR(AVG(Training_Hours))) * 60, 0) AS Avg_Minutes
FROM
    hr_data_updated
GROUP BY
    Employee_Engagement_Score
ORDER BY
    Avg_Hours DESC, Avg_Minutes DESC;

#Relation Between Training, Performance Rating and Engagement Score 
SELECT 
    Employee_Engagement_Score,
    Performance_Rating,
    FLOOR(AVG(Training_Hours)) AS Avg_Hours,
    ROUND((AVG(Training_Hours) - FLOOR(AVG(Training_Hours))) * 60, 0) AS Avg_Minutes
FROM
    hr_data_updated
GROUP BY
    Employee_Engagement_Score, Performance_Rating
ORDER BY
    Avg_Hours DESC, Avg_Minutes DESC;
    
#Relation Between Promotion Status and Training Hours 
SELECT 
    Promotion,
    FLOOR(AVG(Training_Hours)) AS Avg_Hours,
    ROUND((AVG(Training_Hours) - FLOOR(AVG(Training_Hours))) * 60, 0) AS Avg_Minutes
FROM
    hr_data_updated
GROUP BY
    Promotion
ORDER BY
    Avg_Hours DESC, Avg_Minutes DESC;
 




