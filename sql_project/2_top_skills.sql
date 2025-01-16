/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT skills, count(*) as total
FROM job_postings_fact as j
INNER JOIN skills_job_dim as s  on j.job_id = s.job_id
INNER JOIN skills_dim as sd on sd.skill_id = s.skill_id
where job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY total DESC 
LIMIT 5;

/*
Top 5 In-Demand Skills for Data Analysts in 2023

SQL (92,628 mentions)
SQL is the cornerstone for managing and querying relational databases. Its widespread use across industries makes it the most demanded skill for data analysts.

Excel (67,031 mentions)
Excel remains a versatile tool for data organization, analysis, and visualization, widely used in both technical and non-technical roles.

Python (57,326 mentions)
Python is a powerful programming language essential for data manipulation, automation, and advanced analytics like machine learning.

Tableau (46,554 mentions)
Tableau's data visualization capabilities make it crucial for translating complex data into actionable insights and intuitive dashboards.

Power BI (39,468 mentions)
Power BI is a dynamic business intelligence tool that enables data-driven decision-making, especially in enterprise environments.*/
