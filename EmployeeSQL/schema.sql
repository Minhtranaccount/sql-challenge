CREATE TABLE departments (
    dept_no VARCHAR(5)  PRIMARY KEY,
    dept_name VARCHAR(50)   NOT NULL
);

CREATE TABLE titles (
    title_id VARCHAR(6) PRIMARY KEY,
    tittle VARCHAR(50)   NOT NULL
);

CREATE TABLE employees (
    emp_no INTEGER PRIMARY KEY,
    emp_title_id VARCHAR(6)   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR(30)   NOT NULL,
    last_name VARCHAR(30)   NOT NULL,
    sex VARCHAR(1)   NOT NULL,
    hire_date DATE   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
    dept_no VARCHAR(5),
    emp_no INTEGER,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_manager (
	emp_no INTEGER,
    dept_no VARCHAR(5),
 	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
    emp_no INTEGER PRIMARY KEY,
    salary INTEGER   NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

