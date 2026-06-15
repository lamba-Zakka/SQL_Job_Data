SELECT job_posted_date 
FROM job_postings_fact
LIMIT 10;

-- converting into DATE
-- (:: DATE) is the way to convert and clean Datetime into only DATE
select 
    job_title_short AS Job_Title,
    job_location AS location,
    job_posted_date:: DATE AS Date
FROM 
    job_postings_fact;

-- AT TIME ZONE 
select 
    job_title_short AS Job_Title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS Date_time
FROM 
    job_postings_fact;

-- EXTRACT 
select 
    job_title_short AS Job_Title,
    job_location AS location,
    job_posted_date  AS Date_time,
    EXTRACT(MONTH from job_posted_date) AS month
FROM 
    job_postings_fact;
