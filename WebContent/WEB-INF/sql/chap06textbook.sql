SELECT* FROM employee, department where employee.dno = department.dno;

SELECT eno, ename, dname from employee, department where employee.dno = department.dno and eno=7788;

SELECT * FROM employee, department;
SELECT eno, ename, dname, dno from employee, department where employee.dno = department.dno and eno=7788; -- ����
SELECT eno, ename, dname, dno from employee, department; --�̰ŵ� �ȵ�
SELECT employee.eno, employee.ename, department.dname, employee.dno from employee, department; -- �ڼ��ϰ� �������ִ°� ����
SELECT employee.eno, employee.ename, department.dname, employee.dno from employee, department where employee.dno = department.dno and employee.eno=7788;
SELECT eno, ename, dname, employee.dno from employee, department where employee.dno = department.dno and eno=7788;--�ߺ����� ���� Į�����̶�� ������� �ʾƵ� ��

--���̺� ��Ī ����ϱ�(�ڿ� ��Ī���� where�� �̿��� �� ����)
SELECT e.eno, e.ename, d.dname, e.dno from employee e, department d where e.dno = d.dno and e.eno = 7788;

--2.4 NATURAL JOIN (�÷� �̸��� ������ ��� ���� ��)
SELECT e.eno, e.ename, d.dname, e.dno from employee e natural join department d where e.eno = 7788; --�����߻�(�������̸��� ������ Į�� ���� = SELECT���� e.dno �� ����������)
SELECT e.eno, e.ename, d.dname, dno from employee e natural join department d where e.eno = 7788; -- �̷��� dno�� e.���� ����SELECT���ؾߵ�

--2.5 JOIN USING (�÷� �̸��� ���ٸ� ok ������ �޶� ��)
SELECT e.eno, e.ename, d.dname, dno from employee e join department d using(dno) where e.eno= 7788;

--2.6 JOIN ON
SELECT e.eno, e.ename, d.dname, e.dno FROM employee e join department d ON e.dno = e.dno where e.eno=7788;

--03 NON-EQUI JOIN (������ ���̺��� �÷����� �ɰ� ���� �����)
SELECT * FROM SALGRADE;
SELECT ename, salary, grade from employee, salgrade where salary between losal and hisal;
--3���� ���̺� �����ϱ�
SELECT e.ename, d.dname, e.salary, s.grade FROM employee e, department d, salgrade s WHERE e.dno = d.dno and salary between losal and hisal;

--04 SELF JOIN
--WHERE ���� ����� SELF JOIN
SELECT employees.ename as "����̸�", manager.ename as "���ӻ���̸�" FROM employee employees, employee manager
WHERE employees.manager = manager.eno;

SELECT employees.ename ||'�� ���� �����'|| manager.ename
FROM employee employees join employee manager on employees.manager = manager.eno;


--05 OUTER JOIN
--(+)��ȣ�� ����� OUTER JOIN
SELECT employees.ename ||'�� ���� �����'|| manager.ename from employee employees join employee manager
on employees.manager = manager.eno(+);

SELECT employees.ename ||'�� ���� �����'|| manager.ename from employee employees left outer join employee manager
on employees.manager = manager.eno;



--ȥ���غ���
--01 EQUI ������ ����Ͽ� SCOT ����� �μ���ȣ�� �μ��̸��� ����Ͻÿ�.
SELECT * FROM EMPLOYEE;
SELECT * FROM DEPARTMENT;

SELECT ENAME, e.DNO, DNAME FROM employee e, department d WHERE e.dno = d.dno and ENAME = 'SCOTT';

--02 INNER JOIN �� ON �����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�.
SELECT ename, dname, loc FROM employee e join department d on e.dno = d.dno order by dname;

--03 INNER JOIN �� USING �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ ������� (�ѹ����� ǥ��)�� �μ��� �������� �����Ͽ� ����Ͻÿ�.
SELECT dno, job, loc from employee join department using(dno) WHERE dno=10;

--04 NATURAL JOIN�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, �������� ����Ͻÿ�.
SELECT ename, dname, loc FROM employee NATURAL JOIN department where commission>0;

--05 EQUI ���ΰ� WILDCARD�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
SELECT ename, dname FROM employee e, department d WHERE e.dno = d.dno and ename like '%A%';

--06 NATURAL JOIN�� ����Ͽ� NEW YORK�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�
SELECT ENAME, JOB, DNO, DNAME FROM employee NATURAL JOIN department WHERE LOC = 'NEW YORK';

--07 SELF JOIN�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����Ͻÿ�, �� �� ���� ��Ī�� ��� ȭ��� ������ �Ͻÿ�.
SELECT * FROM employee;
SELECT e1.ename Employee, e1.manager EMP#, m1.eno, m1.ename Mgr# FROM employee e1, employee m1 WHERE e1.manager = m1.eno order by e1.manager;

--08  OUTER JOIN, SELF JOIN�� ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�
SELECT * FROM employee;
SELECT e1.ename Employee, e1.manager Emp#, m1.eno Manager, m1.ename Mgr# FROM employee e1, employee m1 WHERE e1.manager = m1.eno(+) order by e1.eno desc;

--09 SELF JOIN�� ����Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�. ��, �� ���� ��Ī�� �̸�, �μ���ȣ, ����� �Ͻÿ�.
SELECT * FROM employee;
SELECT e1.ename �̸�, e1.dno �μ���ȣ, e2.ename ���� FROM employee e1, employee e2 WHERE e1.dno = e2.dno AND e1.ename = 'SCOTT' AND e2.ename != 'SCOTT';

--10 SELF JOIN�� ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
SELECT * FROM employee;
SELECT e2.ename ENAME, e2.hiredate HIREDATE FROM employee e1, employee e2 WHERE e2.hiredate > e1.hiredate AND e1.ename='WARD' ORDER BY HIREDATE;

--11 SELF JOIN�� ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�. �� ������ ��Ī�� ��� ȭ��� ������ �Ͻÿ�.
SELECT * FROM employee;
SELECT al.ename ENAME, al.hiredate HIREDATE, manager.ename ENAME, manager.hiredate FROM employee al, employee manager WHERE al.manager = manager.eno AND manager.hiredate >= al.hiredate;


--ȥ���غ��� �ٽ��غ���
--01 SCOTT ����� �μ���ȣ�� �μ��̸��� ����ϱ�
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dno, dname FROM employee natural join department WHERE ename = 'SCOTT';

--02 INNER JOIN�� ON�����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�.
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dname, loc FROM employee e join department d on e.dno = d.dno order by dname;

--03 INNER JOIN�� USING �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� �������� �������(�� ������ ǥ��)�� �μ��� �������� �����Ͽ� ����Ͻÿ�.
SELECT * FROM employee;
SELECT * FROM department;

SELECT dno, job, loc FROM employee e join department d using(dno) WHERE dno = 10;

--04 NATURAL JOIN�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ��̸�, �������� ����Ͻÿ�.
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dname, loc FROM employee e NATURAL JOIN department WHERE e.commission > 0;

--05 EQUI ���ΰ� WildCard�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, dname FROM employee e, department d WHERE e.dno = d.dno AND e.ename LIKE '%A%';

--06 NATURAL JOIN�� ����Ͽ� NEW YORK�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
SELECT * FROM employee;
SELECT * FROM department;

SELECT ename, job, dno, dname FROM employee e NATURAL JOIN department d WHERE d.loc = 'NEW YORK';

--07 SELF JOIN�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����Ͻÿ�. ��, �� ���� ��Ī�� ����� ȭ��� ������ �Ͻÿ�.
SELECT * FROM employee;
SELECT * FROM department;

SELECT e1.ename, e1.eno, m1.ename, m1.eno FROM employee e1, employee m1 WHERE e1.manager = m1.eno;

--08 OUTER JOIN, SELF JOIN�� ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
SELECT e1.ename, e1.eno, m1.ename, m1.eno FROM employee e1, employee m1 WHERE e1.manager = m1.eno(+) ORDER BY e1.eno DESC;

SELECT * FROM employee;
--09 SELF JOIN�� ����Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�. �� ������ ��Ī�� �̸� �μ���ȣ ����� �Ͻÿ�
SELECT e1.ename, e1.dno, e2.ename FROM employee e1, employee e2 WHERE e1.dno=e2.dno AND e1.ename = 'SCOTT' AND e2.ename != 'SCOTT';

--10 SELF JOIN�� ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
SELECT other.ename, other.hiredate FROM employee ward, employee other WHERE ward.hiredate < other.hiredate AND ward.ename = 'WARD' order by other.hiredate;

--11 SELF JOIN�� ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�. ��, �� ���� ��Ī�� ��� ȭ��� ������ �Ͻÿ�.
SELECT e1.ename, e1.hiredate, m1.ename, m1.hiredate FROM employee e1, employee m1 WHERE e1.manager = m1.eno AND e1.hiredate <= m1.hiredate;