SELECT commission, nvl(commission,0) from employee;

SELECT SUM(salary) FROM employee;
SELECT AVG(salary) FROM employee;
SELECT MIN(salary) FROM employee;
SELECT MAX(salary) FROM employee;

SELECT COUNT(salary) FROM employee;

SELECT * FROM employee;
SELECT COUNT(*) FROM employee;

SELECT COUNT(commission) from employee;
SELECT SUM(commission) FROM employee;
SELECT avg(commission) FROM employee;
SELECT min(commission) FROM employee;
SELECT MAX(commission) FROM employee;

--���� ����� ���� �Ϻΰ� �� �� ����
SELECT ename FROM employee WHERE salary = (SELECT MAX(salary) FROM employee);