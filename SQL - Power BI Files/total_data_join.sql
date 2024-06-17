select * into total_data from (
select g.*,EnvironmentSatisfaction,JobSatisfaction,WorkLifeBalance,JobInvolvement,PerformanceRating
from general_data g
inner join employee_survey_data e on g.EmployeeID=e.EmployeeID
inner join manager_survey_data m on g.EmployeeID=m.EmployeeID) x

update total_data
set Attrition=case
	when Attrition='No' then 0
	when Attrition='Yes' then 1 end

select distinct BusinessTravel from total_data

update total_data
set BusinessTravel=case
	when BusinessTravel='Non-Travel' then 0
	when BusinessTravel='Travel_Rarely' then 1
	when BusinessTravel='Travel_Frequently' then 2 end
