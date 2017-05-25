SELECT t.name 
FROM towns AS t
ORDER BY t.name ASC;

SELECT d.name
FROM departments AS d
ORDER BY d.name ASC;

SELECT e.first_name, e.last_name, e.job_title, e.salary 
FROM employees AS e
ORDER BY salary DESC;