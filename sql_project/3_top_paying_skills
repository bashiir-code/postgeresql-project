/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact as j
INNER JOIN skills_job_dim  as s ON j.job_id = s.job_id
INNER JOIN skills_dim as sd ON s.skill_id = sd.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True 
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;


/*
Top-Paying Skills:

PySpark: Highest average salary at $208,172, indicating strong demand in data engineering and big data roles.
Bitbucket: Second-highest at $189,155, highlighting the value of version control and team collaboration tools.

Emerging Technologies:

Watson: $160,515, reflecting the growing focus on AI-driven platforms.
DataRobot: $155,486, showcasing the importance of automated machine learning.

Programming Languages:

Swift: $153,750, significant for mobile app development.
Golang: $145,000, valued for high-performance applications.
Scala: $124,903, popular in data-intensive and functional programming projects.

Data Science and Analytics:

Jupyter: $152,777, a critical tool for data exploration and modeling.
Pandas: $151,821, essential for data manipulation and analysis.
NumPy: $143,513, important for numerical computing.
PostgreSQL: $123,879, valued for database management.
Elasticsearch: $145,000, crucial for search and analytics tasks.

Cloud and DevOps:

Kubernetes: $132,500, highlighting demand for container orchestration skills.
GCP: $122,500, reflecting the importance of cloud platform expertise.

Collaboration and Workflow Tools:

GitLab: $154,500, emphasizing the need for proficiency in DevOps and CI/CD workflows.
Atlassian: $131,162, valued for project management and team collaboration.*/