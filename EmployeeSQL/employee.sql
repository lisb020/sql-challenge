-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- Create employees table
CREATE TABLE employees (
  	emp_no INT PRIMARY KEY,
  	emp_title_id VARCHAR(5) NOT NULL,
  	birth_date DATE,
  	first_name VARCHAR,
 	last_name VARCHAR NOT NULL,
 	sex VARCHAR(1) NOT NULL,
	hire_date DATE
);

-- Query all fields from the table
SELECT *
FROM employees;

-- Drop table if exists
DROP TABLE IF EXISTS salaries;

-- Create salaries table
CREATE TABLE salaries (
  	emp_no INT PRIMARY KEY,
  	salary INT
);

-- Query all fields from the table
SELECT *
FROM salaries;

-- Drop table if exists
DROP TABLE IF EXISTS titles;

-- Create titles table
CREATE TABLE titles (
  	title_id VARCHAR(5) PRIMARY KEY,
  	title VARCHAR NOT NULL
);

-- Query all fields from the table
SELECT *
FROM titles;

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;

-- Create dept_emp table
CREATE TABLE dept_emp (
  	emp_no INT,
  	dept_no VARCHAR(4),
	PRIMARY KEY(emp_no,dept_no)
);

-- Query all fields from the table
SELECT *
FROM dept_emp;

-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- Create dept_manager table
CREATE TABLE dept_manager (
  	dept_no VARCHAR(4),
  	emp_no INT,
	PRIMARY KEY(dept_no,emp_no)
);

-- Query all fields from the table
SELECT *
FROM dept_manager;

-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- Create departments table
CREATE TABLE departments (
  	dept_no VARCHAR(4) PRIMARY KEY,
  	dept_name VARCHAR NOT NULL
);

-- Query all fields from the table
SELECT *
FROM departments;

-- Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name 
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN departments d ON de.dept_no = d.dept_no
JOIN employees e ON de.emp_no = e.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" 
-- and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d on de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Count of Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Last Name" DESC