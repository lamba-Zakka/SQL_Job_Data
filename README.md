# Introduction 
Dive into the data job market through this project, which focuses on Data Analyst roles. It explores key insights such as top-paying positions, most in-demand skills, and the intersection between high demand and high salaries in the data analytics field.

If you’re curious about what drives value in today’s data job market, this analysis breaks it down using SQL-driven exploration.

SQL queries used in this project:
Check them out here:[Project_sql folder](/Project_sql/)

# Background
Driven by a desire to better understand and navigate the data analyst job market, this project was created to identify the highest-paying roles and most in-demand skills. The goal is to help streamline the job search process by highlighting the key factors that lead to optimal opportunities in the field of data analytics.

### The questions i wanted to answer through my SQL quries were:
1. what are top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools I Used 
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL:** The chosen database managementsystem, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database mangement and excuting SQL queries.
- **Git & Github:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis 
Each query in this project was designed to investigate specific aspects of the data analyst job market. Below is a breakdown of how each question was approached:

## 1. Top Paying Data Analyst Jobs 
This analysis identifies the highest-paying Data Analyst roles by filtering for data analyst job postings, removing invalid salary entries, and sorting salaries in descending order; the results show that top-paying roles are typically senior-level or specialized positions in large, data-driven organizations and are strongly influenced by experience level, technical skill requirements, and company type.

```sql
select 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT  JOIN
    company_dim on job_postings_fact.company_id=company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND 
    job_location='Anywhere' AND 
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 
    10;
```

# What I learned 
Throughout this project, I have learned the following:

- **Complex Query Crafting:** Mastered the art of advanced SQL, including joining multiple tables efficiently and using WITH clauses for powerful temporary table (CTE) workflows.
- **Data Aggregation:** Became comfortable with GROUP BY and used aggregate functions like COUNT() and AVG() to transform raw data into meaningful summaries.
- **Analytical Thinking:** Improved real-world problem-solving skills by translating business questions into clear, actionable SQL queries that generate insights.

# Conclusions
### Closing Thought 
Overall, this project provided a practical exploration of the data analyst job market, combining SQL techniques with real-world questions to uncover meaningful insights about salaries, skills, and demand. Beyond the technical skills gained, it strengthened my ability to think analytically, structure problems clearly, and translate data into actionable findings that can support better career decisions in the field of data analytics.