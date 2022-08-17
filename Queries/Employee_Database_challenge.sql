
--Module 7 CHALLENGE
--Retirement Titles table (January 1, 1952 and December 31, 1955).
--Retrieve columns from Employees and Titles tables 
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		t.title,
		t.from_date,
		t.to_date
--Create new table and name it retirement_titles  
INTO retirement_titles
FROM employees AS e
--Join both tables on the primary key 
	INNER JOIN titles AS t
		ON (e.emp_no = t.emp_no)
--Filter data to include only employees born between 52-55
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;

--Unique Titles Table (most recent title)
SELECT * FROM retirement_titles;
--Duplicate entries noted because of title changes 
--Remove duplicates and keep only most recent title 
--Use Distinct On to get first time emp no occurs 
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

DROP TABLE unique_titles CASCADE; 

--
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;
