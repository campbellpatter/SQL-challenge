--Lists the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

--Lists employees who were hired in 1986.
SELECT * FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

--Lists the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments 
ON dept_emp.dept_no = departments.dept_no
ORDER BY emp_no

--Lists all employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name
FROM employees
WHERE employees.first_name = 'Hercules'
AND employees.last_name LIKE 'B%'

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments 
LEFT JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE dept_name = 'Sales'
ORDER BY emp_no

--Lists all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT * FROM dept_emp
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
LEFT JOIN employees 
ON dept_emp.emp_no = employees.emp_no
LEFT JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY emp_no


--In descending order, lists the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT DISTINCT employees.last_name, COUNT(employees.last_name) AS "Last Name Count"
FROM employees
GROUP BY employees.last_name
ORDER BY "Last Name Count" DESC;

--Easter Egg
SELECT employees.first_name, employees.last_name
FROM employees
WHERE employees.last_name = 'Foolsday'
