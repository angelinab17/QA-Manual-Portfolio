SELECT employees.first_name, employees.last_name, employeeTerritories.city, salaries.salary FROM employees
JOIN salaries ON salaries.employee_no = employees.employee_no 
JOIN employeeTerritories ON employees.employee_no = employeeTerritories.employee_no
WHERE salaries.to_date = '9999-01-01';

SELECT employees.first_name, employees.last_name, employeeTerritories.city FROM employees
JOIN employeeTerritories ON employees.employee_no = employeeTerritories.employee_no
WHERE employeeTerritories.city = 'London';

SELECT employees.first_name, employees.last_name, titles.title FROM employees
JOIN titles ON employees.employee_no = titles.employee_no
WHERE titles.to_date = '9999-01-01';

SELECT employees.first_name, employees.last_name, employeeTerritories.city, salaries.salary FROM employees
JOIN employeeTerritories ON employees.employee_no = employeeTerritories.employee_no
JOIN salaries ON employees.employee_no = salaries.employee_no
WHERE employeeTerritories.city = 'Kyiv' AND salaries.to_date  = '9999-01-01' AND salaries.salary > '50000';

SELECT COUNT(employee_no), city FROM employeeTerritories 
GROUP BY city 
HAVING COUNT(employee_no) > 5;

SELECT AVG(salaries.salary), titles.title FROM salaries
JOIN titles ON salaries.employee_no = titles.employee_no 
GROUP BY titles.title;

SELECT MIN(salaries.salary), MAX(salaries.salary), employeeTerritories.city FROM salaries
JOIN employeeTerritories ON employeeTerritories.employee_no = salaries.employee_no 
GROUP BY employeeTerritories.city;

SELECT COUNT(salaries.salary) AS salary_changes, employees.first_name, employees.last_name FROM employees
JOIN salaries ON employees.employee_no = salaries.employee_no
GROUP BY employees.first_name, employees.last_name;

SELECT COUNT(titles.title) AS title_changes, employees.first_name, employees.last_name FROM titles
JOIN employees ON titles.employee_no = employees.employee_no
GROUP BY employees.first_name, employees.last_name
HAVING COUNT(titles.title) > 2;

SELECT COUNT(employee_no) AS employees_count, title FROM titles
GROUP BY title
ORDER BY employees_count DESC;

SELECT salaries.salary, employees.first_name, employees.last_name FROM employees
JOIN salaries ON employees.employee_no = salaries.employee_no
WHERE salaries.to_date = '9999-01-01' AND salaries.salary > (SELECT AVG(salaries.salary) FROM salaries)
GROUP BY employees.first_name, employees.last_name;

SELECT salaries.salary, employees.first_name, employees.last_name FROM employees
JOIN salaries ON employees.employee_no = salaries.employee_no 
WHERE salaries.to_date = '9999-01-01' AND salaries.salary = (SELECT MAX(salaries.salary) FROM salaries );

SELECT salaries.salary, employees.first_name, employees.last_name FROM employees
JOIN salaries ON employees.employee_no = salaries.employee_no 
WHERE salaries.to_date = '9999-01-01' AND salaries.salary = (SELECT MIN(salaries.salary) FROM salaries);

SELECT employees.first_name, employees.last_name, employeeTerritories.city FROM employees
JOIN employeeTerritories ON employees.employee_no = employeeTerritories.employee_no
WHERE employeeTerritories.city = (SELECT employeeTerritories.city FROM employeeTerritories WHERE employeeTerritories.employee_no = 10001)
GROUP BY employees.first_name, employees.last_name;

SELECT employees.first_name, employees.last_name, salaries.salary FROM employees
JOIN salaries ON employees.employee_no = salaries.employee_no
WHERE salaries.salary = (SELECT salaries.salary FROM salaries WHERE salaries.employee_no = 10001 AND salaries.to_date = '9999-01-01')
GROUP BY employees.first_name, employees.last_name;

SELECT salaries.salary AS second_max_salary, employees.first_name, employees.last_name FROM employees
JOIN salaries ON employees.employee_no = salaries.employee_no
WHERE salaries.to_date = '9999-01-01' AND salaries.salary < (SELECT MAX(salaries.salary) FROM salaries WHERE salaries.to_date = '9999-01-01')
ORDER BY salaries.salary DESC
LIMIT 1;

SELECT COUNT(employee_no) AS employees_count, city FROM employeeTerritories 
GROUP BY city
ORDER BY employees_count DESC
LIMIT 1;

SELECT employee_no, COUNT(*) AS current_salary_records FROM salaries
WHERE to_date = '9999-01-01'
GROUP BY employee_no
HAVING COUNT(*) > 1;

SELECT employees.first_name, employees.last_name, salaries.salary FROM employees
JOIN salaries ON employees.employee_no = salaries.employee_no
WHERE salaries.to_date = '9999-01-01' AND salaries.salary > (SELECT AVG(salaries.salary) FROM salaries WHERE salaries.to_date = '9999-01-01');

SELECT employee_no, MAX(salary) - MIN(salary) AS salary_growth FROM salaries
GROUP BY employee_no
ORDER BY salary_growth DESC
LIMIT 1;







