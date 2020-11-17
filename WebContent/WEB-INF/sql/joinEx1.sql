-- 14��, 8����
SELECT * FROM employee;
-- 4����, 3����
SELECT * FROM department;


SELECT * FROM employee, department;

SELECT eno, ename, dname FROM employee, department;
SELECT eno, ename, employee.dno edno, department.dno ddno, dname FROM employee, department;
SELECT eno, ename, employee.dno edno, department.dno ddno, dname FROM employee, department WHERE eno = 7369 AND employee.dno = department.dno;

--��Ī���� �ڿ�
SELECT d.dname FROM employee e, department d where e.dno = d.dno and e.eno = 7782;
SELECT * FROM department;

--join Ű���� ��� - �÷��� �̸��� ������ ��� ���ƾ���
SELECT * FROM employee natural join department;

--join using - �÷��� �̸��� ������ ��(������ �޶� ��)
SELECT * FROM employee JOIN department USING(dno);
SELECT * FROM employee JOIN department USING(dno) WHERE eno = 7788;

--join on - �÷��� �̸��� ������ ��� �޶� ��
SELECT * FROM employee e JOIN department d ON e.dno = d.dno;
