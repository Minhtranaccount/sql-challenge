-- List the employee number, last name, first name, sex, and salary of each employee 
SELECT  emp.emp_no
		, emp.last_name
		, emp.first_name
		, emp.sex
		, sal.salary

FROM employees emp
 	INNER JOIN salaries sal ON emp.emp_no = sal.emp_no
;

-- List the first name, last name, and hire date for the employees who were hired in 1986 
SELECT first_name
		, last_name
		, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
;

-- List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name
SELECT 	dmg.dept_no
		, dpm.dept_name
		, emp.emp_no
		, emp.last_name
		, emp.first_name
FROM dept_manager dmg 
	INNER JOIN employees emp ON dmg.emp_no = emp.emp_no
	INNER JOIN departments dpm ON dmg.dept_no = dpm.dept_no
;
-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name

SELECT dee.dept_no
		, emp.emp_no
		, emp.last_name
		, emp.first_name
		, dpm.dept_name
FROM employees emp 
	 LEFT JOIN dept_emp dee ON emp.emp_no = dee.emp_no
	 LEFT JOIN departments dpm ON dee.dept_no = dpm.dept_no 
;

-- List first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B

SELECT first_name
		, last_name
		, sex
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
;

-- List each employee in the Sales department, including 
-- their employee number, last name, and first name 

SELECT emp.emp_no
		, emp.last_name
		, emp.first_name
FROM dept_emp dee 
	INNER JOIN employees emp ON dee.emp_no = emp.emp_no
	INNER JOIN departments dpm ON dee.dept_no = dpm.dept_no
WHERE dpm.dept_name = 'Sales'
;

-- List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name

SELECT emp.emp_no
		, emp.last_name
		, emp.first_name
		, dpm.dept_name
FROM dept_emp dee 
	INNER JOIN employees emp ON dee.emp_no = emp.emp_no
	INNER JOIN departments dpm ON dee.dept_no = dpm.dept_no
WHERE dpm.dept_name = 'Sales'
 	OR dpm.dept_name = 'Development'
;

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)

SELECT last_name
		, count(last_name) as frequency
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC
