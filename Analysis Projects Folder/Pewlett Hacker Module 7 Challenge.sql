--Deliverable 1
-- Steps 1-7
SELECT e.emp_no,
    e.first_name,
    e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO ret_emp_titles
FROM employees as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
--Deliverable 1, Steps 8-15
--UPDATED FROM CHALLENGE CODE
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM ret_emp_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--Deliverable 1, Steps 16-22
SELECT COUNT (unique_titles.title), unique_titles.title
--INTO retiring_tiles
FROM unique_titles
--ANSWER 72458
GROUP BY title 
ORDER BY count DESC;

--Deliverable 2, Steps 1-11
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN department_employees as de
ON e.emp_no = de.emp_no 
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE de.to_date = '9999-01-01'
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
