-- Find the average salary and demand (job counts) for each skill 
-- required in top-paying remote Software Engineer jobs.
WITH top_paying_jobs AS(
SELECT
    j.job_id,
    c.name AS Company_Name,
    j.job_title,
    j.salary_year_avg

FROM
    job_postings_fact j
LEFT JOIN company_dim c ON j.company_id = c.company_id

WHERE
    job_title_short = 'Software Engineer' 
    AND job_location = 'Anywhere' 
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC


)

SELECT s2.skills,COUNT(j.job_id) AS job_per_skills,
AVG(j.salary_year_avg) AS Avg_Salary 
FROM top_paying_jobs j
INNER JOIN skills_job_dim s ON j.job_id = s.job_id
INNER JOIN skills_dim s2 ON s.skill_id = s2.skill_id
GROUP BY s2.skills
ORDER BY Avg_Salary DESC

/*General Statistics

Average salary across skills: ~$117.6K

Median salary: ~$125K

Highest salary: $184K (DynamoDB)

Lowest salary: $28K

Average job count per skill: ~4.5

Most in-demand skill: Python (32 jobs)

💰 Top 10 Highest Paying Skills
Skill	Avg Salary ($)	Jobs
DynamoDB	184,000	3
Couchbase	182,500	1
C	174,500	1
Snowflake	169,000	7
Pandas	168,833	3
ASP.NET	168,750	2
Airflow	165,375	4
React	156,222	9
ASP.NET Core	155,000	1
Neo4j	155,000	2

🔑 Insight: Specialized database skills (DynamoDB, Couchbase, Snowflake, MongoDB, Neo4j) command the highest salaries.

📈 Top 10 Most In-Demand Skills
Skill	Jobs	Avg Salary ($)
Python	32	132,266
SQL	30	112,729
AWS	21	125,143
JavaScript	16	137,000
MongoDB	16	139,500
TypeScript	14	142,143
Docker	13	94,308
GCP	11	128,351
Ruby	10	143,800
GitHub	9	110,889

🔑 Insight: Python, SQL, and AWS dominate demand, while newer languages like TypeScript also show strong salaries.

⚖️ Trade-off Between Pay & Demand

High Salary, Low Demand → DynamoDB, Couchbase, Snowflake (great niche opportunities).

High Demand, Good Salary → Python, AWS, JavaScript, MongoDB, TypeScript (core career skills).

High Demand, Lower Salary → SQL, Docker, GitHub (common skills but less premium).*/

