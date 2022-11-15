--List the employee number, last name, first name, sex, and salary of each employee.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
FROM employees AS emp
LEFT JOIN salaries AS sal 
ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY hire_date;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, dept.dept_name, dm.emp_no, emp.emp_no, emp.last_name, emp.first_name 
FROM department_managers as dm
INNER JOIN departments AS dept
ON dm.dept_no = dept.dept_no
INNER JOIN employees AS emp
ON dm.emp_no = emp.emp_no
ORDER BY dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept.dept_no, emp.emp_no, emp.last_name, emp.first_name, dept.dept_name 
FROM employees AS emp
INNER JOIN department_employees AS de
ON emp.emp_no = de.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no
ORDER BY dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY last_name;

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp.emp_no, emp.last_name, emp.first_name
FROM employees AS emp
INNER JOIN department_employees AS de
ON emp.emp_no = de.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales'
ORDER BY emp_no;

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT emp.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM employees AS emp
INNER JOIN department_employees AS de
ON emp.emp_no = de.emp_no
INNER JOIN departments AS dept
ON de.dept_no = dept.dept_no
WHERE dept.dept_name IN ('Sales', 'Development')
ORDER BY emp_no;

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS "total"
FROM employees
GROUP BY last_name
ORDER BY "total" DESC;
				  



