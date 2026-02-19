SELECT employee_no, first_name, last_name, hire_date FROM employees 
ORDER BY hire_date ASC;

SELECT first_name, last_name, birth_date FROM employees 
ORDER BY birth_date ASC
Limit 5;

SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%n';

SELECT COUNT(employee_no) AS total_after_1960 FROM employees
WHERE birth_date > '1960-01-01';

SELECT AVG(salary) AS average_salary FROM salaries;

SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM salaries;

SELECT COUNT(employee_no) AS total_employees, title FROM titles
GROUP BY title
ORDER BY title DESC;

SELECT employees.first_name, employees.last_name, salaries.salary FROM employees 
JOIN salaries
WHERE salaries.salary > 70000;

SELECT COUNT(employee_no), city FROM employeeTerritories
GROUP BY city 
HAVING COUNT(employee_no) > 5;

SELECT employee_no, city FROM employeeTerritories 
WHERE city = 'Kyiv' OR city = 'Lviv' OR city = 'Dnipro';

SELECT COUNT(title) AS 'total_engineers' FROM titles
WHERE title = 'Engineer';

SELECT employees.first_name, employees.last_name, titles.title FROM employees 
JOIN titles 
ON employees.employee_no = titles.employee_no;

SELECT employees.first_name, employees.last_name, salaries.salary FROM employees 
JOIN salaries 
ON employees.employee_no = salaries.employee_no
WHERE salaries.salary BETWEEN '50000' AND '60000';


