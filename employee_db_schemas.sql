-- Data Engineering --

-- Drop tables if they exist already 
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

-- Departments table 
CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR
);

-- Create employees table
CREATE TABLE employees(
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title VARCHAR,
	birth_date DATE,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date DATE
);

-- Create department manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL
);

-- Create department employees table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL
);

-- Create salaries table 
CREATE TABLE salaries(
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT
);

-- Create titles table
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR
);

-- Add foreign key constraints
ALTER TABLE dept_manager
ADD CONSTRAINT dept_manager_dept_no
FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager 
ADD CONSTRAINT fk_dept_manager_emp_no 
FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_emp_no
FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_dept_no
FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);

ALTER TABLE salaries
ADD CONSTRAINT fk_salaries_emp_no
FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_emp_title
FOREIGN KEY (emp_title)
REFERENCES titles (title_id);

-- Select the data from the created tables  
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;