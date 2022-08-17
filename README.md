## Overview

The "silver tsunami" is looming for Pewlett-Hackard, a company with several thousand employees. "Silver Tsunami" is a term that refers to the large number of employees who will retire in the next few years from the company. With such a large number of retirements looming, Pewlett-Hackard needs to be prepared for the cost of retirement packages as well as open positions and future employee training because so much institutional knowledge will be leaving with these employees.  

### Results: 
- A total of 90,398 employees will be retiring from Pewlett-Hackard in the near future, as determined by their date of birth. 
- The majority of employees that will be retiring soon are in Senior positions. 
- 1,549 employees set to retire are eligible for the mentorship program which is a small number in comparison to the number of employees retiring. 
- Only two managers are retiring, which is helpful because only two leadership positions will need to be filled. 

### Summary: 

**How many roles will need to be filled as the "silver tsunami" begins to make an impact?**

There are 90,3989 employees that are set to retire. This information was queried by joining the employees and titles tables, filtering by date of birth and hiring date. Out of those employees leaving, there are 29,414 Senior Engineers, 28,254 Senior Staff, 14,222 Engineers, 12,243 Staff, 4,502 Technique Leaders, 1,761 Assistant Engineers, and 2 Managers. 
[Retirements by Title: PH ](https://github.com/Lisa-Floading/Pewlett-Hackard-Analysis/blob/2afc96c5d9bf5beb2675ef3b54620c50cae78551/Retirements_by_titlePH.png "Retirements by Title: PH ")


**Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?**

The following table shows how many employees are retiring by department. Development has the highest amount of retirements at 3,613 followed closely by Production at 3,021 and Sales at 2,291. These departments should be the main focus of the mentorship initiative.

[Retirements_by_dept](https://github.com/Lisa-Floading/Pewlett-Hackard-Analysis/blob/1f5b4892a6568106216e33f52274afa0be0f391a/Retirements_by_dept.png 
"Retirements by Department")


*This list was created by joining the employees born between 1985 and 1988 to the employees by department with the following code: 

SELECT DISTINCT ON (emp_no) e.emp_no, d.dept_name, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO employees_leaving_by_dept
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
JOIN titles as t
ON (e.emp_no = t.emp_no)
LEFT JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (de.to_date = '9999-01-01') AND (e.birth_date BETWEEN '1962-01-01' AND '1965-12-31')
	AND (de.from_date BETWEEN '1985-01-01' AND '1988-12-31')
ORDER BY e.emp_no

If Pewlett-Hackard focuses on the employees born between 1963 and 1965, the number of available mentors increases to 38,401, which is roughly a third of the retiring employees. With 90,3989 potential open positions, this would be a more manageable group of mentees for the retiring employees to work with. 

In order to update this query, the following code was used: 

SELECT DISTINCT ON(e.emp_no)e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
	INTO available_mentors
FROM employees AS e
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
			INNER JOIN titles AS t
				ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1963-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
******
### Resources Used for this Project: 
**Provided datasets**
- departments.csv
- dept_emp.csv
- dept_manager.csv
- employees.csv
- salaries.csv
- titles.csv

**Software**
SQL
PostgreSQL
pgAdmin

