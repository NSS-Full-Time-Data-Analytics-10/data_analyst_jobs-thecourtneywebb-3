--#1
SELECT *
FROM data_analyst_jobs;
--There are 1793 rows.

--#2
SELECT *
FROM data_analyst_jobs
LIMIT 10;
--"Microsoft Office| Microsoft Access"

--#3
SELECT COUNT(title)
FROM data_analyst_jobs
	WHERE location = 'TN';
	
SELECT COUNT(title)
FROM data_analyst_jobs
	WHERE location IN ('TN');	
--21
--You can also use COUNT(*) to count rows.

SELECT COUNT(title)
FROM data_analyst_jobs
	WHERE location IN ('TN','KY');
	
SELECT COUNT(title)
FROM data_analyst_jobs
	WHERE location = 'TN'
	OR location = 'KY';
--27

--#4
SELECT COUNT(title)
FROM data_analyst_jobs
	WHERE location = 'TN' 
	AND star_rating > 4;
--3

--#5	
SELECT COUNT(title)
FROM data_analyst_jobs
	WHERE review_count BETWEEN 500 AND 1000;
--151

--#6
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
	GROUP BY location
	ORDER BY avg_rating DESC;
--NE (Nebraska)
--*extra from class review*
SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
	WHERE location IS NOT NULL 
	AND location != 'USA'
	AND location != 'DC'
	AND location != 'REMOTE'
	GROUP BY location
	ORDER BY avg_rating DESC NULLS LAST;
--NE (Nebraska)

	
--#7
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;
--881

--#8
SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
	WHERE location = 'CA';
--230

--#9
SELECT DISTINCT company, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000;
--41, but row 1 is NULL, so I would do further research/ ask mgr how to proceed--

--#10
SELECT DISTINCT company, star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
ORDER BY star_rating DESC;
--A 6 way tie between AmEx, GM, Kaiser, MS, Nike, Unilever.--

--#11
SELECT title
FROM data_analyst_jobs
	WHERE title ILIKE '%ANALYST%';
--1669

--#12
SELECT title
FROM data_analyst_jobs
	WHERE title NOT ILIKE '%ANALYST%'
	AND title NOT ILIKE '%ANALYTICS%';
--4 listings, Tableau

--BONUS--
SELECT COUNT(domain)
FROM data_analyst_jobs
	WHERE skill ILIKE '%SQL%'
	AND days_since_posting >21;
	
SELECT domain, COUNT(title) AS count_hard_to_fill_jobs
FROM data_analyst_jobs
	WHERE domain IS NOT NULL 
	AND skill ILIKE '%SQL%'
	AND days_since_posting >21
	GROUP BY domain
	ORDER BY count_hard_to_fill_jobs DESC;
	
--Internet and Software				62
--Banks and Financial Services		61
--Consulting and Business Services	57
--Health Care						52
	
	
	

