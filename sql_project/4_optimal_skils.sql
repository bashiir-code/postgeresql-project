/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/


SELECT 
    sd.skills,
    COUNT(s.job_id) AS demand,
    ROUND(AVG(j.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact as j
INNER JOIN skills_job_dim  as s ON j.job_id = s.job_id
INNER JOIN skills_dim as sd ON s.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    sd.skill_id
HAVING
    COUNT(s.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand DESC
LIMIT 25;

/*

Top-Paying Skills:

Django: Highest average salary at $115,320 with a demand of 27, indicating its value in web development frameworks.
Confluence: $114,210, with lower demand (11), suggesting it is highly specialized but well-paid.
Hadoop: $113,193, showing its importance in big data management.

High Demand Skills:

Python: Most in-demand skill with 236 mentions, offering an average salary of $101,397, showcasing its versatility in various domains.
Tableau: High demand (230) with a salary of $99,288, reflecting its critical role in data visualization.
R: Demand of 148 and an average salary of $100,499, highlighting its importance in statistical computing and data analysis.

Cloud and Big Data Technologies:

Snowflake: $112,948 with demand (37), showing its value in modern cloud data warehousing.
Azure: $111,225 and demand (34), emphasizing the growing need for cloud computing expertise.
AWS: $108,377 with demand (32), further underscoring the demand for cloud professionals.
BigQuery: $109,654, demonstrating the significance of Google Cloud in big data.

Data Tools and Analytics:

Looker: $103,795 and demand (49), highlighting its importance in BI and reporting.
NoSQL: $101,414, reflecting the demand for non-relational database skills.
SQL Server: $97,786, maintaining relevance for database management.

Programming Languages:

Java: $106,906 with demand (17), reflecting its continued relevance in software development.
C++: $98,958, showing consistent value for high-performance applications.
JavaScript: $97,587 with demand (20), highlighting its widespread use in web development.

Other Tools:

Jira: $104,918, emphasizing the need for project management and issue tracking skills.
SAS: $98,902 with demand (63), showcasing its significance in statistical analysis.
Redshift: $99,936, valuable for data warehousing.*/