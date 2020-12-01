SELECT e1.eno, e1.manager, e2.eno, e2.ename FROM employee e1, employee e2 WHERE e1.manager = e2.eno;

-- LEFT OUTER JOIN
SELECT e1.eno, e1.manager, e2.eno FROM employee e1 LEFT OUTER JOIN employee e2 ON e1.manager = e2.eno;
-- LEFT OUTER JOIN (+기호를 오른쪽에)
SELECT e1.eno, e1.ename, e1.manager, e2.eno, e2.ename FROM employee e1, employee e2 WHERE e1.manager = e2.eno(+);

SELECT e1.eno, e1.ename, e1.manager, e2.eno, e2.ename FROM employee e1 JOIN employee e2 ON e1.manager = e2.eno;

SELECT m1.eno Manager, m1.ename Mname, e1.ename emp FROM employee e1, employee m1 WHERE e1.manager = m1.eno AND m1.eno = 7566;