--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT "Employees".emp_no, "Employees".last_name,first_name, gender, "Salaries".salary
FROM "Employees"
JOIN "Salaries"
ON ("Employees".emp_no = "Salaries".emp_no);

--2. List employees who were hired in 1986.
SELECT hire_date, first_name, last_name, emp_no
FROM "Employees"
WHERE EXTRACT(YEAR FROM hire_date) = '1986'
ORDER BY hire_date;


/*3. List the manager of each department with the following information: 
department number, department name, the manager's employee number, last name, first name, and start and end employment dates.*/
SELECT "Dept_Manager".emp_no, "Dept_Manager".dept_no, 
	"Employees".last_name, "Employees".first_name, 
	"Departments".dept_name, 
	"Dept_Emp".from_date, "Dept_Emp".to_date 
FROM "Dept_Manager"
JOIN "Employees"
ON ("Dept_Manager".emp_no = "Employees".emp_no)
JOIN "Departments"
ON ("Dept_Manager".dept_no = "Departments".dept_no)
JOIN "Dept_Emp"
ON ("Dept_Emp".emp_no = "Employees".emp_no);


/*4. List the department of each employee with the following information: 
employee number, last name, first name, and department name.*/
SELECT "Departments".dept_name, "Employees".last_name, "Employees".first_name, "Employees".emp_no
FROM "Dept_Emp"
JOIN "Employees"
ON ("Employees".emp_no = "Dept_Emp".emp_no)
JOIN "Departments"
ON ("Dept_Emp".dept_no = "Departments".dept_no);

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * 
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT "Employees".last_name, "Employees".first_name, "Employees".emp_no
FROM "Dept_Emp"
JOIN "Employees"
ON ("Employees".emp_no = "Dept_Emp".emp_no)
JOIN "Departments"
ON ("Dept_Emp".dept_no = "Departments".dept_no)
WHERE "Departments".dept_name = 'Sales';

/*7. List all employees in the Sales and Development departments, including their
employee number, last name, first name, and department name.*/
SELECT "Departments".dept_name, "Employees".last_name, "Employees".first_name, "Employees".emp_no
FROM "Dept_Emp"
JOIN "Employees"
ON ("Employees".emp_no = "Dept_Emp".emp_no)
JOIN "Departments"
ON ("Dept_Emp".dept_no = "Departments".dept_no)
WHERE "Departments".dept_name = 'Sales' OR "Departments".dept_name = 'Development'
ORDER BY "Departments".dept_name;

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_count
FROM "Employees"
GROUP BY last_name
ORDER BY last_name_count DESC;






