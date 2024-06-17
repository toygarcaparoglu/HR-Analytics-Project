--age_groups_broad
ALTER TABLE total_data
ADD age_groups_broad varchar(10)

UPDATE total_data
SET age_groups_broad = CASE
    WHEN Age BETWEEN 20 AND 29 THEN '20s'
    WHEN Age BETWEEN 30 AND 39 THEN '30s'
    WHEN Age BETWEEN 40 AND 49 THEN '40s'
    WHEN Age BETWEEN 50 AND 59 THEN '50s'
    ELSE 'others'
END
----------------------------------------
--age_groups_narrow
ALTER TABLE total_data
ADD age_groups_narrow varchar(10)

UPDATE total_data
SET age_groups_narrow = CASE
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 29 THEN '25-29'
    WHEN Age BETWEEN 30 AND 34 THEN '30-34'
    WHEN Age BETWEEN 35 AND 39 THEN '35-39'
	WHEN Age BETWEEN 40 AND 44 THEN '40-44'
	WHEN Age BETWEEN 45 AND 49 THEN '45-49'
	WHEN Age BETWEEN 50 AND 54 THEN '50-54'
	WHEN Age BETWEEN 55 AND 60 THEN '55-60'
    ELSE 'others'
END
---------------------------------------
--income_groups
select MIN(MonthlyIncome), MAX(MonthlyIncome)
from total_data

ALTER TABLE total_data
ADD monthly_income_groups varchar(20)

UPDATE total_data
SET monthly_income_groups = CASE
    WHEN MonthlyIncome BETWEEN 10000 AND 39999 THEN '10-40k'
    WHEN MonthlyIncome BETWEEN 40000 AND 79999 THEN '40-80k'
    WHEN MonthlyIncome BETWEEN 80000 AND 119999 THEN '80-120k'
	WHEN MonthlyIncome BETWEEN 120000 AND 159999 THEN '120-160k'
    WHEN MonthlyIncome BETWEEN 160000 AND 200000 THEN '160-200k'
END

-------------------------------
--years_with_manager_groups
select MAX(YearsWithCurrManager)
from total_data

ALTER TABLE total_data
ADD years_with_curr_manager_groups varchar(10);

UPDATE total_data
SET years_with_curr_manager_groups= CASE
	WHEN YearsWithCurrManager BETWEEN 0 AND 4 THEN '0-4'
	WHEN YearsWithCurrManager BETWEEN 5 AND 9 THEN '5-9'
	WHEN YearsWithCurrManager BETWEEN 10 AND 14 THEN '10-14'
	WHEN YearsWithCurrManager BETWEEN 15 AND 17 THEN '15-17'
END
------------------------------------
--years_at_company_groups
select MIN(YearsAtCompany), MAX(YearsAtCompany)
from total_data

ALTER TABLE total_data
ADD years_at_company_groups varchar(10)

UPDATE total_data
SET years_at_company_groups = CASE
    WHEN YearsAtCompany BETWEEN 0 AND 9 THEN '0-9'
    WHEN YearsAtCompany BETWEEN 10 AND 19 THEN '10-19'
    WHEN YearsAtCompany BETWEEN 20 AND 29 THEN '20-29'
	WHEN YearsAtCompany BETWEEN 30 AND 40 THEN '30-40'
END
--------------------------------------
-- TotalWorkingYears
select MIN(TotalWorkingYears), MAX(TotalWorkingYears)
from total_data

ALTER TABLE total_data
ADD total_working_years_groups varchar(10)

UPDATE total_data
SET total_working_years_groups = CASE
    WHEN TotalWorkingYears BETWEEN 0 AND 9 THEN '0-9'
    WHEN TotalWorkingYears BETWEEN 10 AND 19 THEN '10-19'
    WHEN TotalWorkingYears BETWEEN 20 AND 29 THEN '20-29'
	WHEN TotalWorkingYears BETWEEN 30 AND 40 THEN '30-40'
END
--------------------------------------
--total_hours_worked
select MIN(total_seconds)/3600, MAX(total_seconds)/3600
from total_data

ALTER TABLE total_data
ADD total_hours_worked int

UPDATE total_data
SET total_hours_worked = round(total_seconds/3600,0)

select * from total_data

--total_hours_groups
select MIN(total_hours_worked), MAX(total_hours_worked), 
(MAX(total_hours_worked)-MIN(total_hours_worked))/5
from total_data

ALTER TABLE total_data
ADD total_hours_worked_groups varchar(20)

UPDATE total_data
SET total_hours_worked_groups = CASE
    WHEN total_hours_worked BETWEEN 1300 AND 1600 THEN '1300-1600'
    WHEN total_hours_worked BETWEEN 1601 AND 1900 THEN '1601-1900'
    WHEN total_hours_worked BETWEEN 1901 AND 2200 THEN '1901-2200'
	WHEN total_hours_worked BETWEEN 2201 AND 2500 THEN '2201-2500'
	WHEN total_hours_worked BETWEEN 2501 AND 2800 THEN '2501-2800'
END
-------------------------------------------
--drop unnecessary columns
alter table total_data
drop column Over18

alter table total_data
drop column EmployeeCount

alter table total_data
drop column StandardHours
--------------------------------------
--average_hours_worked
alter table total_data
add avg_hours_worked float

UPDATE total_data
SET avg_hours_worked = tts.average_hours_worked
FROM total_time_spent tts
WHERE total_data.EmployeeID = tts.ID

--avg_hours_worked_minus_standard
alter table total_data
add avg_hours_worked_minus_standard float

update total_data
set avg_hours_worked_minus_standard=round(avg_hours_worked-8,1)

--avg_hours_worked_minus_standard_groups
select MIN(avg_hours_worked_minus_standard),MAX(avg_hours_worked_minus_standard)
from total_data

alter table total_data
add avg_hours_worked_minus_standard_groups varchar(20)

select CASE
    WHEN avg_hours_worked_minus_standard BETWEEN -3 AND -1.6 THEN '-3 to -1.6'
	WHEN avg_hours_worked_minus_standard BETWEEN -1.5 AND -0.6 THEN '-1.5 to -0.6'
    WHEN avg_hours_worked_minus_standard BETWEEN -0.5 AND 0.5 THEN '-0.5 to 0.5'
    WHEN avg_hours_worked_minus_standard BETWEEN 0.6 AND 1.5 THEN '0.6 to 1.5'
	WHEN avg_hours_worked_minus_standard BETWEEN 1.6 AND 3 THEN '1.6 to 3'
END, count(*) count
from total_data
group by CASE
    WHEN avg_hours_worked_minus_standard BETWEEN -3 AND -1.6 THEN '-3 to -1.6'
	WHEN avg_hours_worked_minus_standard BETWEEN -1.5 AND -0.6 THEN '-1.5 to -0.6'
    WHEN avg_hours_worked_minus_standard BETWEEN -0.5 AND 0.5 THEN '-0.5 to 0.5'
    WHEN avg_hours_worked_minus_standard BETWEEN 0.6 AND 1.5 THEN '0.6 to 1.5'
	WHEN avg_hours_worked_minus_standard BETWEEN 1.6 AND 3 THEN '1.6 to 3'
END

UPDATE total_data
SET avg_hours_worked_minus_standard_groups = CASE
    WHEN avg_hours_worked_minus_standard BETWEEN -3 AND -1.6 THEN '-3 to -1.6'
	WHEN avg_hours_worked_minus_standard BETWEEN -1.5 AND -0.6 THEN '-1.5 to -0.6'
    WHEN avg_hours_worked_minus_standard BETWEEN -0.5 AND 0.5 THEN '-0.5 to +0.5'
    WHEN avg_hours_worked_minus_standard BETWEEN 0.6 AND 1.5 THEN '+0.6 to +1.5'
	WHEN avg_hours_worked_minus_standard BETWEEN 1.6 AND 3 THEN '+1.6 to +3'
END
------------------------------------------------------------
--Ordering for Power BI graphs
--avg_hours_worked_minus_standard_groups_order
alter table total_data
add avg_hours_worked_minus_standard_groups_order tinyint

UPDATE total_data
SET avg_hours_worked_minus_standard_groups_order = CASE
    WHEN avg_hours_worked_minus_standard BETWEEN -3 AND -1.6 THEN '1'
	WHEN avg_hours_worked_minus_standard BETWEEN -1.5 AND -0.6 THEN '2'
    WHEN avg_hours_worked_minus_standard BETWEEN -0.5 AND 0.5 THEN '3'
    WHEN avg_hours_worked_minus_standard BETWEEN 0.6 AND 1.5 THEN '4'
	WHEN avg_hours_worked_minus_standard BETWEEN 1.6 AND 3 THEN '5'
END
--monthly_income_groups_order
ALTER TABLE total_data
ADD monthly_income_groups_order int

UPDATE total_data
SET monthly_income_groups_order = CASE
    WHEN MonthlyIncome BETWEEN 10000 AND 39999 THEN '1'
    WHEN MonthlyIncome BETWEEN 40000 AND 79999 THEN '2'
    WHEN MonthlyIncome BETWEEN 80000 AND 119999 THEN '3'
	WHEN MonthlyIncome BETWEEN 120000 AND 159999 THEN '4'
    WHEN MonthlyIncome BETWEEN 160000 AND 200000 THEN '5'
END
------------------------------------------------
--distance_from_home_groups
select MIN(DistanceFromHome), MAX(DistanceFromHome)
from total_data

ALTER TABLE total_data
ADD distance_from_home_groups varchar(20)

UPDATE total_data
SET distance_from_home_groups = CASE
    WHEN DistanceFromHome BETWEEN 1 AND 6 THEN '1-6'
    WHEN DistanceFromHome BETWEEN 7 AND 12 THEN '7-12'
    WHEN DistanceFromHome BETWEEN 13 AND 18 THEN '13-18'
	WHEN DistanceFromHome BETWEEN 19 AND 24 THEN '19-24'
	WHEN DistanceFromHome BETWEEN 25 AND 29 THEN '25-29'
END
--distance_from_home_groups_order
ALTER TABLE total_data
ADD distance_from_home_groups_order int

UPDATE total_data
SET distance_from_home_groups_order = CASE
    WHEN DistanceFromHome BETWEEN 1 AND 6 THEN 1
    WHEN DistanceFromHome BETWEEN 7 AND 12 THEN 2
    WHEN DistanceFromHome BETWEEN 13 AND 18 THEN 3
	WHEN DistanceFromHome BETWEEN 19 AND 24 THEN 4
	WHEN DistanceFromHome BETWEEN 25 AND 29 THEN 5
END
-------------------------------------------
--percent_salary_hike_groups
ALTER TABLE total_data
ADD education_order tinyint

UPDATE total_data
SET education_order = CASE
    WHEN Education = 'Below College' THEN 1
    WHEN Education = 'College' THEN 2
    WHEN Education = 'Bachelor' THEN 3
	WHEN Education = 'Master' THEN 4
	WHEN Education = 'Doctor' THEN 5
END

select * from total_data

------------------------------------
--percent
select MIN(PercentSalaryHike), MAX(PercentSalaryHike)
from total_data

select COUNT(*), CASE
    WHEN PercentSalaryHike BETWEEN 11 AND 13 THEN '11-13'
    WHEN PercentSalaryHike BETWEEN 14 AND 16 THEN '14-16'
    WHEN PercentSalaryHike BETWEEN 17 AND 19 THEN '17-19'
    WHEN PercentSalaryHike BETWEEN 20 AND 22 THEN '20-22'
	WHEN PercentSalaryHike BETWEEN 23 AND 25 THEN '23-25'
END
from total_data
group by 
CASE
    WHEN PercentSalaryHike BETWEEN 11 AND 13 THEN '11-13'
    WHEN PercentSalaryHike BETWEEN 14 AND 16 THEN '14-16'
    WHEN PercentSalaryHike BETWEEN 17 AND 19 THEN '17-19'
    WHEN PercentSalaryHike BETWEEN 20 AND 22 THEN '20-22'
	WHEN PercentSalaryHike BETWEEN 23 AND 25 THEN '23-25'
END

ALTER TABLE total_data
ADD percent_salary_hike_groups varchar(20)

UPDATE total_data
SET percent_salary_hike_groups = CASE
    WHEN PercentSalaryHike BETWEEN 11 AND 13 THEN '11-13'
    WHEN PercentSalaryHike BETWEEN 14 AND 16 THEN '14-16'
    WHEN PercentSalaryHike BETWEEN 17 AND 19 THEN '17-19'
    WHEN PercentSalaryHike BETWEEN 20 AND 22 THEN '20-22'
	WHEN PercentSalaryHike BETWEEN 23 AND 25 THEN '23-25'
END

----------------------------------------------------
--work_life_balance_order
ALTER TABLE total_data
ADD work_life_balance_order int

UPDATE total_data
SET work_life_balance_order = CASE
    WHEN WorkLifeBalance = 'Bad' THEN 1
    WHEN WorkLifeBalance = 'Good' THEN 2
    WHEN WorkLifeBalance = 'Better' THEN 3
    WHEN WorkLifeBalance = 'Best' THEN 4
END

-----------------------------------------------------
--total_working_years_groups
select MIN(TotalWorkingYears), MAX(TotalWorkingYears)
from total_data

ALTER TABLE total_data
ADD total_working_years_groups varchar(20)

UPDATE total_data
SET work_life_balance_order = CASE
    WHEN PercentSalaryHike BETWEEN 0 AND 10 THEN '0-10'
    WHEN PercentSalaryHike BETWEEN 11 AND 20 THEN '11-20'
    WHEN PercentSalaryHike BETWEEN 21 AND 30 THEN '21-30'
    WHEN PercentSalaryHike BETWEEN 31 AND 40 THEN '31-40'
END