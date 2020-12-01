SELECT ename, job, salary 
FROM employee
WHERE 
salary = (SELECT MIN(salary) FROM employee);

SELECT dno, min(salary) FROM employee GROUP BY dno
HAVING min(salary) > (SELECT MIN(salary) FROM employee WHERE dno=30);

SELECT MIN(salary) FROM employee GROUP BY dno;

SELECT eno,ename FROM employee WHERE salary IN (SELECT MIN(salary) FROM employee GROUP BY dno);

SELECT eno,ename, salary
FROM employee
WHERE (dno, salary) IN (SELECT dno, MIN(salary) FROM employee GROUP BY dno);

-- ANY, SOME
SELECT eno, ename, job, salary FROM employee
WHERE salary < any (1600, 1250, 1250, 1500);

SELECT salary
FROM employee
WHERE job='SALESMAN';

-- ALL
SELECT eno, ename, job, salary
FROM employee
WHERE salary < ALL (1600, 1250, 1250, 1500);

SELECT salary
FROM employee
WHERE job='SALESMAN';