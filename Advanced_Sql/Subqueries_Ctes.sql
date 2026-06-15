-- subquery 
-- Subquery a qery within a query 
select 
    company_id,
    name as company_name
from company_dim
WHERE company_id in 
(   Select 
    company_id
    from
     job_postings_fact
    WHERE 
    job_no_degree_mention = true
limit 20)
ORDER BY
    company_id asc;

-- CTEs Common table expression. which is temporary
-- Example 
WITH title_count as (
     select
        job_title_short,
        count(job_id) as job_count
    from 
        job_postings_fact
    GROUP BY
        job_title_short
)
SELECT *
FROM title_count;

