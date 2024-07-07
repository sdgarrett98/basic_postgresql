-- Create table for departments
CREATE TABLE departments (
    dept_no VARCHAR(5) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create table for titles
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

-- Create table for employees
CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR(5),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(150) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    sex VARCHAR(5),
    hire_date DATE NOT NULL
);

-- Create table for salaries
CREATE TABLE salaries (
    id SERIAL PRIMARY KEY,
    emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    salary FLOAT NOT NULL
);

-- Create table for dept_manager
CREATE TABLE dept_manager (
    id SERIAL PRIMARY KEY,
    dept_no VARCHAR(5),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    emp_no INTEGER REFERENCES employees(emp_no)
);

-- Create table for dept_emp
CREATE TABLE dept_emp (
    id SERIAL PRIMARY KEY,
    emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    dept_no VARCHAR(5),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
