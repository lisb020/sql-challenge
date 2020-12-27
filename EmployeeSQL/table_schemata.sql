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