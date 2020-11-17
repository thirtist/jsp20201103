SELECT * FROM employee e, department d;

SELECT * FROM employee e1, employee e2;

SELECT * FROM employee WHERE eno = 7369;
SELECT * FROM employee WHERE eno = 7902;

SELECT * FROM employee e, department d WHERE e.dno = d.dno;

--자기 자신의 테이블로 조건을 걸어서 출력
SELECT e1.eno, e1.ename, e1.manager, e2.eno, e2.ename FROM employee e1, employee e2 WHERE e1.manager = e2.eno;

SELECT e2.ename FROM employee e1, employee e2 WHERE e1.manager = e2.eno AND e1.eno = 7788;

SELECT * FROM employee;
SELECT e1.ename, e1.manager, e2.ename, e2.eno FROM employee e1, employee e2 WHERE e1.manager = e2.eno;

SELECT * FROM employee;
SELECT e1.eno, e1.ename, e1.manager, e2.eno, e2.ename FROM employee e1, employee e2 WHERE e1.manager = e2.eno AND e2.eno = 7698;
