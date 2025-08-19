-- This query retrieves the top 10 highest-paying remote ("Anywhere") Software Engineer jobs.  
-- It selects job details such as ID, company name, job title, location, schedule type, average yearly salary, and posted date.  
-- The results are ordered in descending order of average yearly salary, ensuring the highest salaries appear first.  

SELECT
    j.job_id,
    c.name AS Company_Name,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date

FROM
    job_postings_fact j
LEFT JOIN company_dim c ON j.company_id = c.company_id

WHERE
    job_title_short = 'Software Engineer' 
    AND job_location = 'Anywhere' 
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;

SELECT
    j.job_id,
    c.name AS Company_Name,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date

FROM
    job_postings_fact j
LEFT JOIN company_dim c ON j.company_id = c.company_id

WHERE
    job_title_short = 'Software Engineer' AND job_location = 'Anywhere' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10