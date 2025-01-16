/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/


WITH top_paying_jobs AS(
  SELECT
    job_id,
    job_title,
    salary_year_avg,
    name as company_name
  FROM
    job_postings_fact 
  Left JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
  WHERE
  job_location = 'Anywhere' AND
  salary_year_avg is NOT NULL AND
  job_title_short = 'Data Analyst' 
  ORDER BY salary_year_avg DESC
  LIMIT 10
)

SELECT
  t.*, 
  skills
from  top_paying_jobs as t
INNER JOIN skills_job_dim  as s_j ON  t.job_id = s_j.job_id
INNER JOIN skills_dim as s ON s.skill_id = s_j.skill_id

/* Top Skills for High-Paying Data Analyst Jobs in 2023

-- SQL (8 mentions): Essential for data querying and manipulation.
-- Python (7 mentions): A versatile tool for data analysis, automation, and machine learning.
-- Tableau (6 mentions): Critical for data visualization and storytelling.
-- R (4 mentions): Popular for statistical computing and analytics.
-- Snowflake (3 mentions): Key for scalable, cloud-based data warehousing.
-- Pandas and Excel (3 mentions each): Vital for data manipulation and structuring.
-- Azure and Bitbucket (2 mentions each): Reflecting the demand for cloud services and collaborative development.
-- Go (2 mentions): Rising in popularity for efficient backend systems.
 */
