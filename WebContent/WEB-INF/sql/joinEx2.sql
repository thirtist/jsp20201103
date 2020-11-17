SELECT * FROM employee;
SELECT * FROM salgrade;

SELECT * FROM employee e, salgrade s WHERE e.salary BETWEEN s.losal AND s.hisal;

SELECT d.dname, salary, grade FROM employee e NATURAL JOIN department d, salgrade WHERE e.eno = 7369 AND salary BETWEEN losal and hisal;

SELECT e.ename FROM employee e, salgrade s where e.salary BETWEEN s.losal and s.hisal and s.grade = 1;

SELECT e.ename, e.salary, s.grade, s.losal, s.hisal FROM employee e, salgrade s WHERE e.salary BETWEEN s.losal and s.hisal;

SELECT e.ename, e.salary, s.grade, e.job FROM employee e, salgrade s;
