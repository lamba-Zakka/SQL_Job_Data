Select 
    EXTRACT(YEAR FROM job_posted_date) AS year,
    job_schedule_type AS type,
    avg(salary_year_avg) as average_yearly_salary,
    avg(salary_hour_avg) as average_hourly_salary
from 
    job_postings_fact
group by 
    year,
    job_schedule_type;

-- problem 2
Select 
    EXTRACT(month from job_posted_date  at time zone 'utc' at time zone 'America/New_York' ) as month,
    count(job_id) as job_count
from 
    job_postings_fact
group by 
    month
order by 
    month
LIMIT 10;

-- problem
-- january
create table january_jobs as
    select *
    from job_postings_fact
    where extract(month from job_posted_date) = 1;

-- febuary
create table febuary_jobs as
    select *
    from job_postings_fact
    where extract(month from job_posted_date) = 2;

-- march
create table march_jobs as
    select *
    from job_postings_fact
    where extract(month from job_posted_date) = 3;

-- Case practise Problem
Select
    job_title,
    salary_year_avg,
    Case
        WHEN salary_year_avg >= 500000 THEN 'High Salary'
        WHEN salary_year_avg >= 300000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS Salary_Bucket 
From 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg asc;
