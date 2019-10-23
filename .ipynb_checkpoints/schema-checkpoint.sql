--Clearing Schema
DROP TABLE IF EXISTS departments CASCADE
DROP TABLE IF EXISTS employees CASCADE
DROP TABLE IF EXISTS dept_emp 
DROP TABLE IF EXISTS dept_manager
DROP TABLE IF EXISTS salaries
DROP TABLE IF EXISTS titles

--Creating departments table
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

--Creating employees table
CREATE TABLE employees (
	emp_no BIGINT PRIMARY KEY NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

--The two tables above have primary keys, their CSVs must be imported first

--Creating dept_emp table
CREATE TABLE dept_emp (
	emp_no BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

--Creating dept_manager table
CREATE TABLE dept_manager (
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no),
	emp_no BIGINT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

--Creating salaries table
CREATE TABLE salaries (
	emp_no BIGINT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	salary BIGINT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);

--Creating titles table
CREATE TABLE titles (
	emp_no BIGINT NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
	title VARCHAR(20) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL
);
	
--View tables
SELECT * FROM departments
SELECT * FROM employees
SELECT * FROM dept_emp
SELECT * FROM dept_manager
SELECT * FROM salaries
SELECT * FROM titles