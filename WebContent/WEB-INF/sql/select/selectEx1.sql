SELECT * FROM employee;
SELECT * FROM bonus;
SELECT * FROM department;
SELECT * FROM salgrade;

SELECT ename FROM employee;
SELECT eno, ename FROM employee;
SELECT ename, eno FROM employee;
SELECT ename, salary FROM employee;
SELECT ename, salary, salary*12 FROM employee;
SELECT ename, salary/100 FROM employee;
SELECT ename, salary+100 FROM employee;
SELECT ename, salary-100 FROM employee;
SELECT ename, salary, salary*12 AS ���� FROM employee;
SELECT ename, salary, salary*12 ���� FROM employee;
-- ���� �ּ�
/*
������ �ּ�
*/
SELECT * FROM employee;
SELECT ename, salary, commission, salary + commission FROM employee;
SELECT ename, salary, commission, NVL(commission,0) FROM employee;
SELECT ename, salary + NVL(commission,0) �� FROM employee;

--32���������� 37����������
SELECT * FROM employee; --��ü ��� ����ϱ�
SELECT eno,ename FROM employee; --�����ȣ�� ����� ����ϱ�
SELECT ename, salary, salary*12 FROM employee; --�������ϱ�
SELECT ename, salary, salary*12+commission FROM employee;--Ŀ�̼��� ���� ���� ���ϱ�
SELECT ename, salary, salary*12+NVL(commission,0) FROM employee;--NVL�Լ�����ϱ�
SELECT ename, salary, salary*12+NVL(commission,0)���� FROM employee;--��Ī����
SELECT ename, salary, salary*12+NVL(commission,0)as���� FROM employee;--��Ī����as�߰�
SELECT ename, salary, salary*12+NVL(commission,0) "po���ں�wer" FROM employee;--��Ī�� �����̳� Ư�������߰��Ұ��""�� �ο�

SELECT distinct (dno) FROM employee;
SELECT distinct dno FROM employee;
