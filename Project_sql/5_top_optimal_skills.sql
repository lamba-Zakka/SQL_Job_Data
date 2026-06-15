/*
Question: What are th most optimal skill to learn(aka in high-demand and high-paying skill)?
- identify skills in high demand and associated with high average salaries for data analyst roles
- Concentrate on remote position with specified salaries 
- Why? Target skills that offer job security(High demand) and financial benefits (high salaries),
    offering strategic insight for center development in data analysis.
*/

WITH skills_demands AS(
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) as demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short='Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_dim.skill_id
),  average_salary AS (
    SELECT
        skills_job_dim.skill_id,
        ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
    FROM
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short='Data Analyst'  
        AND salary_year_avg IS NOT NULL
        AND job_work_from_home = True
    GROUP BY
        skills_job_dim.skill_id
)

SELECT 
    skills_demands.skill_id,
    skills_demands.skills,
    demand_count,
    avg_salary
FROM skills_demands
INNER JOIN average_salary ON skills_demands.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY 
    demand_count desc,
    average_salary DESC
limit 25