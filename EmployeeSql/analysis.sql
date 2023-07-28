-- Data Analysis Queries
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no AS employee_number, e.last_name, e.first_name, e.sex, s.salary
FROM "employee" e
JOIN "salaries" s ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "employee"
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31';

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no AS department_number, d.dept_name, dm.emp_no AS manager_employee_number, e.last_name, e.first_name
FROM "departments" d
JOIN "dept_manager" dm ON d.dept_no = dm.dept_no
JOIN "employee" e ON dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee's employee number, last name, first name, and department name.
SELECT de.emp_no AS employee_number, e.last_name, e.first_name, d.dept_name
FROM "dept_emp" de
JOIN "employee" e ON de.emp_no = e.emp_no
JOIN "departments" d ON de.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM "employee"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no AS employee_number, e.last_name, e.first_name
FROM "employee" e
JOIN "dept_emp" de ON e.emp_no = de.emp_no
JOIN "departments" d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no AS employee_number, e.last_name, e.first_name, d.dept_name
FROM "employee" e
JOIN "dept_emp" de ON e.emp_no = de.emp_no
JOIN "departments" d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM "employee"
GROUP BY last_name
ORDER BY frequency DESC;
