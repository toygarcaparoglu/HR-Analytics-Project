--rounding
UPDATE total_data
SET average_seconds = round(average_seconds,0),
TotalWorkingYears = round(TotalWorkingYears,0),
NumCompaniesWorked = round(NumCompaniesWorked,0),
EnvironmentSatisfaction = round(EnvironmentSatisfaction,0),
WorkLifeBalance=round(WorkLifeBalance,0),
JobSatisfaction=round(JobSatisfaction,0)

--correcting categorical variables
ALTER TABLE total_data
ALTER COLUMN Department VARCHAR(50)

ALTER TABLE total_data
ALTER COLUMN EducationField VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN Gender VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN JobRole VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN MaritalStatus VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN BusinessTravel VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN Education VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN JobLevel VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN StockOptionLevel VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN EnvironmentSatisfaction VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN JobInvolvement VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN JobSatisfaction VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN PerformanceRating VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN RelationshipSatisfaction VARCHAR(50) 

ALTER TABLE total_data
ALTER COLUMN WorkLifeBalance VARCHAR(50) 

select * from total_data

UPDATE total_data
SET total_data.BusinessTravel = general_data.BusinessTravel,
total_data.Department = general_data.Department,
total_data.Education = general_data.Education,
total_data.EducationField = general_data.EducationField,
total_data.Gender = general_data.Gender,
total_data.JobRole = general_data.JobRole,
total_data.MaritalStatus = general_data.MaritalStatus
FROM general_data
WHERE total_data.EmployeeID = general_data.EmployeeID;

update total_data
set Education= case
	when Education='1' then 'Below College'
	when Education='2' then 'College'
	when Education='3' then 'Bachelor'
	when Education='4' then 'Master'
	when Education='5' then 'Doctor'
end

update total_data
set EnvironmentSatisfaction= case
	when EnvironmentSatisfaction='1' then 'Low'
	when EnvironmentSatisfaction='2' then 'Medium'
	when EnvironmentSatisfaction='3' then 'High'
	when EnvironmentSatisfaction='4' then 'Very High'
end

update total_data
set JobInvolvement = case
	when JobInvolvement='1' then 'Low'
	when JobInvolvement='2' then 'Medium'
	when JobInvolvement='3' then 'High'
	when JobInvolvement='4' then 'Very High'
end

update total_data
set JobSatisfaction = case
	when JobSatisfaction='1' then 'Low'
	when JobSatisfaction='2' then 'Medium'
	when JobSatisfaction='3' then 'High'
	when JobSatisfaction='4' then 'Very High'
end

update total_data
set PerformanceRating = case
	when PerformanceRating='1' then 'Low'
	when PerformanceRating='2' then 'Good'
	when PerformanceRating='3' then 'Excellent'
	when PerformanceRating='4' then 'Outstanding'
end

update total_data
set WorkLifeBalance = case
	when WorkLifeBalance='1' then 'Bad'
	when WorkLifeBalance='2' then 'Good'
	when WorkLifeBalance='3' then 'Better'
	when WorkLifeBalance='4' then 'Best'
end
