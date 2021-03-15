--DELIVERABLE #1
-- Steps 1-5
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e, titles as t
WHERE e.emp_no = t.emp_no AND (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Step 6-7 showing the table & export to CSV
select * from retirement_titles;

-- Steps 8 - 12
-- Use Dictinct with Orderby to remove duplicate rows
-- create a new table and order it
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Steps 13-14 show & export unique_titles to CSV
select * from unique_titles;

--Steps 15-18
SELECT COUNT(emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
Order by Count (emp_no)DESC;

-- Steps 19-20 Show & export table to CSV
SELECT * FROM retiring_titles;


--DELIVERABLE #2
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, d.from_date, d.to_date, t.title
INTO mentorship_eligibilty
FROM employees as e, dept_emp as d, titles as t
WHERE e.emp_no = d.emp_no 
	AND e.emp_no = t.emp_no
	AND d.to_date = '9999-01-01'
	AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;