select * from employee_survey_data

UPDATE employee_survey_data
SET 
    EnvironmentSatisfaction = NULLIF(EnvironmentSatisfaction, 'NA'),
    JobSatisfaction = NULLIF(JobSatisfaction, 'NA'),
    WorkLifeBalance = NULLIF(WorkLifeBalance, 'NA');

