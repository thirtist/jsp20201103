-- 14행, 8개열
SELECT * FROM employee;
-- 4개행, 3개열
SELECT * FROM department;


SELECT * FROM employee, department;

SELECT eno, ename, dname FROM employee, department;
SELECT eno, ename, employee.dno edno, department.dno ddno, dname FROM employee, department;
SELECT eno, ename, employee.dno edno, department.dno ddno, dname FROM employee, department WHERE eno = 7369 AND employee.dno = department.dno;

--별칭으로 뒤에
SELECT d.dname FROM employee e, department d where e.dno = d.dno and e.eno = 7782;
SELECT * FROM department;

--join 키워드 사용 - 컬럼의 이름과 형식이 모두 같아야함
SELECT * FROM employee natural join department;

--join using - 컬럼의 이름만 같으면 됨(형식은 달라도 됨)
SELECT * FROM employee JOIN department USING(dno);
SELECT * FROM employee JOIN department USING(dno) WHERE eno = 7788;

--join on - 컬럼의 이름과 형식이 모두 달라도 됨
SELECT * FROM employee e JOIN department d ON e.dno = d.dno;
