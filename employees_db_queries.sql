--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT * FROM "Employees";
SELECT * FROM "Salaries";

SELECT e.emp_id, e.last_name, e.first_name, e.gender, s.salary
FROM "Employees" AS e
INNER JOIN "Salaries" AS s
on e.emp_id = s.emp_id;

--List employees who were hired in 1986.
SELECT * FROM "Employees";

SELECT emp_id, first_name, last_name, hire_date
from "Employees"
WHERE hire_date >= '19860101'
	AND hire_date  <= '19861231';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT * FROM "Employees";
SELECT * FROM public."Departments";
SELECT * FROM public."Dept_manager";
SELECT * FROM "Employees_Title";


SELECT dep_man.dept_id, dep.dept_name, empl.emp_id, empl.last_name, empl.first_name, emp_tit.from_date, emp_tit.to_date
FROM "Dept_manager" AS dep_man
INNER JOIN "Departments" AS dep
ON dep_man.dept_id = dep.dept_id
INNER JOIN "Employees" AS empl
ON dep_man.emp_id = empl.emp_id
INNER JOIN "Employees_Title" AS emp_tit
ON empl.emp_id= emp_tit.emp_id
WHERE emp_tit.title_name = 'Manager';

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT * FROM "Employees";
SELECT * FROM public."Departments";
SELECT * FROM public."Dept_emp";


SELECT emp.emp_id, emp.last_name, emp.first_name, dep.dept_name, dep_emp.from_date, dep_emp.to_date
FROM "Dept_emp" AS dep_emp
INNER JOIN "Employees" AS emp
ON dep_emp.emp_id = emp.emp_id
INNER JOIN "Departments"  AS dep
ON dep_emp.dept_id = dep.dept_id
WHERE dep_emp.to_date = '99990101';


--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT emp_id, last_name, first_name
from "Employees"
WHERE last_name LIKE 'B%' AND first_name = 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT * FROM public."Departments";
SELECT * FROM public."Dept_emp";

SELECT emp.emp_id, emp.last_name, emp.first_name, dep.dept_name, dep_emp.from_date, dep_emp.to_date
FROM "Dept_emp" AS dep_emp
INNER JOIN "Employees" AS emp
ON dep_emp.emp_id = emp.emp_id
INNER JOIN "Departments"  AS dep
ON dep_emp.dept_id = dep.dept_id
WHERE dep.dept_name = 'Sales' AND dep_emp.to_date = '99990101';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT *  FROM public."Employees";

SELECT last_name, COUNT(last_name) AS Occurrences
FROM public."Employees"
GROUP BY last_name
ORDER BY Occurrences DESC;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT *  FROM public."Dept_emp";

SELECT *  FROM public."Departments";

SELECT *  FROM public."Employees";


SELECT "Employees".emp_id, first_name, last_name, dept_name
FROM "Employees"
INNER JOIN "Dept_emp"
ON  "Employees".emp_id = "Dept_emp".emp_id
INNER JOIN "Departments"
ON  "Dept_emp".dept_id = "Departments".dept_id
WHERE dept_name = 'Sales' OR dept_name = 'Development';
 


