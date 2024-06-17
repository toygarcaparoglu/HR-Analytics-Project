select * from total_time_spent

alter table total_time_spent
add average_hours_worked float

update total_time_spent
set average_hours_worked=round(average_seconds/3600,1)

alter table total_time_spent
add average_standard_comparison float

update total_time_spent
set average_standard_comparison=round(average_hours_worked-8,1)