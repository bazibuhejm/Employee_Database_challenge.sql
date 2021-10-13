-- Retrieving the data/Module Challenge
-- -------------------
SELECT emp.emp_no, emp.first_name, emp.last_name, tle.title, tle.from_date, tle.to_date
INTO retirement_titles
FROM employees AS emp
INNER JOIN title AS tle
ON (emp.emp_no = tle.emp_no)
WHERE (emp.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
-- -----------------
SELECT DISTINCT (rt.emp_no), rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;

-- employees by their most recent job title
-- ----------------------------------------
SELECT COUNT(ut.title), ut.title
INTO retiring_titles 
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;

-- employees eligible for mentorship programme
-- ------------------------------------------
SELECT DISTINCT (emp.emp_no), emp.emp_no, emp.first_name, emp.last_name, emp.birth_date, dept.from_date, dept.to_date, tle.title
INTO mentorship_eligibilty
FROM employees AS emp
INNER JOIN dept_emp AS dept
ON (emp.emp_no = dept.emp_no)
INNER JOIN title AS tle
ON (emp.emp_no = tle.emp_no)
WHERE (dept.to_date = '9999-01-01') 
AND (emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp.emp_no;