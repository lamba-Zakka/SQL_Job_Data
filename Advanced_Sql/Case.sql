Select 
    COUNT(job_id),
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
From
     job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY 
    location_category;

select 
    job_title_short
from job_postings_fact;