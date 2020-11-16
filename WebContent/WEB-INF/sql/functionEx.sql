SELECT * FROM employee;

SELECT ename, salary, commission, salary + commission as sum from employee;

SELECT ename, commission, NVL(commission, 0) FROM employee;