-- List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary 
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no;

-- List employees who were hired in 1986.
SELECT * FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name,
-- the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no, d.dept_name, d_m.emp_no, e.last_name, e.first_name, d_m.from_date, d_m.to_date
FROM dept_manager d_m
JOIN departments d
ON d_m.dept_no = d.dept_no
JOIN employees e
ON d_m.emp_no = e.emp_no;

-- List the department of each employee with the following information: employee number, last name,
-- first name, and department name.
SELECT d_e.emp_no, e.first_name, e.last_name, d.dept_name
FROM dept_emp d_e
JOIN employees e
ON d_e.emp_no = e.emp_no
JOIN departments d
ON d_e.dept_no = d.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, 
-- and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
JOIN dept_emp d_e
ON e.emp_no = d_e.emp_no
JOIN departments d
on d_e.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, 
-- first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e
JOIN dept_emp d_e
ON e.emp_no = d_e.emp_no
JOIN departments d
on d_e.dept_no = d.dept_no
WHERE dept_name IN ('Sales', 'Development');

-- In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;