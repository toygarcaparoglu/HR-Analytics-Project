--DEPARTMENT
--Employee Survey
SELECT Department, 
    COUNT(CASE WHEN EnvironmentSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY Department
ORDER BY Department

SELECT Department, 
    COUNT(CASE WHEN JobSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY Department
ORDER BY Department

SELECT Department, 
    COUNT(CASE WHEN WorkLifeBalance IN ('Better', 'Best') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY Department
ORDER BY Department

--Manager Survey
SELECT Department, 
    COUNT(CASE WHEN JobInvolvement IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY Department
ORDER BY Department

SELECT Department, 
    COUNT(CASE WHEN PerformanceRating IN ('Outstanding') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY Department
ORDER BY Department

----------------------------------------------------------------------------------
--DAILY WORK
--Employee Survey
SELECT avg_hours_worked_minus_standard_groups, 
    COUNT(CASE WHEN EnvironmentSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY avg_hours_worked_minus_standard_groups
ORDER BY avg_hours_worked_minus_standard_groups

SELECT avg_hours_worked_minus_standard_groups, 
    COUNT(CASE WHEN JobSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY avg_hours_worked_minus_standard_groups
ORDER BY avg_hours_worked_minus_standard_groups

SELECT avg_hours_worked_minus_standard_groups, 
    COUNT(CASE WHEN WorkLifeBalance IN ('Better', 'Best') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY avg_hours_worked_minus_standard_groups
ORDER BY avg_hours_worked_minus_standard_groups

--Manager Survey
SELECT avg_hours_worked_minus_standard_groups, 
    COUNT(CASE WHEN JobInvolvement IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY avg_hours_worked_minus_standard_groups
ORDER BY avg_hours_worked_minus_standard_groups

SELECT avg_hours_worked_minus_standard_groups, 
    COUNT(CASE WHEN PerformanceRating IN ('Outstanding') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY avg_hours_worked_minus_standard_groups
ORDER BY avg_hours_worked_minus_standard_groups

-------------------------------------------------------------------------
--DEPARTMENT
--Employee Survey
SELECT JobRole, 
    COUNT(CASE WHEN EnvironmentSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY JobRole
ORDER BY JobRole

SELECT JobRole, 
    COUNT(CASE WHEN JobSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY JobRole
ORDER BY JobRole

SELECT JobRole, 
    COUNT(CASE WHEN WorkLifeBalance IN ('Better', 'Best') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY JobRole
ORDER BY JobRole

--Manager Survey
SELECT JobRole, 
    COUNT(CASE WHEN JobInvolvement IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY JobRole
ORDER BY JobRole

SELECT JobRole, 
    COUNT(CASE WHEN PerformanceRating IN ('Outstanding') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY JobRole
ORDER BY JobRole

----------------------------------------------------------------------------------
--AGE GROUPS
--Employee Survey
SELECT age_groups_narrow, 
    COUNT(CASE WHEN EnvironmentSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY age_groups_narrow
ORDER BY age_groups_narrow

SELECT age_groups_narrow, 
    COUNT(CASE WHEN JobSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY age_groups_narrow
ORDER BY age_groups_narrow

SELECT age_groups_narrow, 
    COUNT(CASE WHEN WorkLifeBalance IN ('Better', 'Best') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY age_groups_narrow
ORDER BY age_groups_narrow

--Manager Survey
SELECT age_groups_narrow, 
    COUNT(CASE WHEN JobInvolvement IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY age_groups_narrow
ORDER BY age_groups_narrow

SELECT age_groups_narrow, 
    COUNT(CASE WHEN PerformanceRating IN ('Outstanding') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY age_groups_narrow
ORDER BY age_groups_narrow
----------------------------------------------------------------------------------
--INCOME
--Employee Survey
SELECT monthly_income_groups, 
    COUNT(CASE WHEN EnvironmentSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY monthly_income_groups
ORDER BY monthly_income_groups

SELECT monthly_income_groups, 
    COUNT(CASE WHEN JobSatisfaction IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY monthly_income_groups
ORDER BY monthly_income_groups

SELECT monthly_income_groups, 
    COUNT(CASE WHEN WorkLifeBalance IN ('Better', 'Best') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY monthly_income_groups
ORDER BY monthly_income_groups

--Manager Survey
SELECT monthly_income_groups, 
    COUNT(CASE WHEN JobInvolvement IN ('High', 'Very High') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY monthly_income_groups
ORDER BY monthly_income_groups

SELECT monthly_income_groups, 
    COUNT(CASE WHEN PerformanceRating IN ('Outstanding') THEN 1 END) * 100.0 / COUNT(*) AS High_VeryHigh_Percentage
FROM total_data
GROUP BY monthly_income_groups
ORDER BY monthly_income_groups