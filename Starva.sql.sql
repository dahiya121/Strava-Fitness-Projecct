cREATE DATABASE Starva2;

use  Starva2;

create table dailyactivity_merged(
Id	int,
ActivityDate Date,
TotalSteps	int,
TotalDistance	float,
TrackerDistance	float,
LoggedActivitiesDistance	int,
VeryActiveDistance	float,
ModeratelyActiveDistance	float,
LightActiveDistance	float,
SedentaryActiveDistance	int,
VeryActiveMinutes	int,
FairlyActiveMinutes	int,
LightlyActiveMinutes	int,
SedentaryMinutes	int,
Calories	int);
select * from dailyactivity_merged;

create table dailyCalories_merged(
Id int,
ActivityDay	date,
Calories int);

select * from dailyCalories_merged;

create table  	dailyintensities_merged(
Id	int,
ActivityDay	date,
SedentaryMinutes	int,
LightlyActiveMinutes	int,
FairlyActiveMinutes	int,
VeryActiveMinutes	int,
SedentaryActiveDistance	int,
LightActiveDistance	float,
ModeratelyActiveDistance	float,
VeryActiveDistance float
);


-- 1)Total steps by User

select * from dailyactivity_merged;

SELECT Id, SUM(TotalSteps) AS TotalSteps
FROM dailyActivity_merged
GROUP BY Id
ORDER BY TotalSteps DESC;

-- 2) Avg. Calories burn by User

select * from dailycalories_merged;

select id, avg(Calories) as avgcalories
from dailycalories_merged
group by id;

-- 3) Active User By minute

select * from dailyintensities_merged;

select id, avg(LightlyActiveMinutes) as Lightly_Active,
avg(FairlyActiveMinutes) as Fairly_Active,
avg(VeryActiveMinutes) as Highly_Active
 from dailyintensities_merged 
 group by Id;

-- 4) Daily steps Trend 

select * from dailysteps_merged;

SELECT  Id , ActivityDay, AVG(StepTotal) AS Avg_Steps
FROM dailysteps_merged
GROUP BY Id, ActivityDay
ORDER BY ActivityDay;

-- 5)  Total calories, total step via USER

select * from hourlycalories_merged;

select * from hourlysteps_merged;

select 
c.Id,
sum(c.Calories) as Total_calories,
sum(s.Steptotal) as Total_step,
AVG(c.Calories) AS AvgCaloriesPerHour,
AVG(s.StepTotal) AS AvgStepsPerHour
from hourlycalories_merged c
join hourlysteps_merged s
on c.Id = s.Id	and c.ActivityHour = s.ActivityHour
group by c.Id;

-- 6) Total intensities  by user ID

select * from minutecaloriesnarrow_merged;

select * from minuteintensitiesnarrow_merged;

	SELECT 
		m.Id,
		sum(i.Intensity) as Total_Intensity,
		sum(m.Calories) as Total_Calories
	FROM minuteintensitiesnarrow_merged i
	JOIN minutecaloriesnarrow_merged m
		ON i.Id = m.Id  and i.ActivityMinute = m. ActivityMinute
group by i.Id;

-- 7)  AVG METs and total_value with user 

select * from minutemetsnarrow_merged;
select * from minutesleep_merged;

SELECT 
    m.Id,
       
    AVG(m.METs) AS avg_mets,
    SUM(s.value) AS total_value
FROM minutemetsnarrow_merged m
JOIN minutesleep_merged s 
    ON m.Id = s.Id and s.date = m.ActivityMinute
GROUP BY m.Id;

-- 8) Total sleep summary by USER

select * from minutesleep_merged;

SELECT Id, SUM(value) AS TotalSleepMinutes, COUNT(logId) AS SleepSessions
FROM minutesleep_merged
GROUP BY Id;

-- 9) Top 10 Active user

select * from dailyIntensities_merged;


SELECT Id, SUM(VeryActiveMinutes + FairlyActiveMinutes) AS ActiveMinutes
FROM dailyIntensities_merged
GROUP BY Id
ORDER BY ActiveMinutes DESC
LIMIT 10;

-- 10) Avg weight by user 

select * from weightloginfo_merged;

select 
Id,
round(avg (WeightKg) ,1 ) as Avg_Weight,
round(avg (BMI),1 ) as Avg_BMI,
round (avg (Fat ),1 )as Avg_Fat
from weightloginfo_merged
group by Id;

-- 11) Sleep Records by User.

select * from sleepday_merged;

select 
Id,
sum(TotalSleepRecords) as Total_Sleep,
sum(TotalMinutesAsleep) as Total_minute_asleep,
sum( TotalTimeInBed) as  Total_time_inBed
from sleepday_merged
group by Id;