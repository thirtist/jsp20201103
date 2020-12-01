-- ��� ���� �ʹݺδ� 04�� �̾����ϴ�.
-- NVL�Լ�
SELECT ename, salary, commission, NVL(commission, 0),
salary*12 + NVL(commission,0)
from employee order by job;

-- NVL2�Լ�
SELECT ename, salary, commission, NVL2(commission, salary*12+commission, salary*12) FROM employee order by job;

--NULLIF �Լ�
SELECT NULLIF('A','A'), NULLIF('A','B') from dual;

--COALESCE �Լ� (ù��°�� null �ƴѰ� ã��)
SELECT ename, salary, commission, COALESCE(commission, salary, 0) FROM employee ORDER by job;

--DECODE �Լ� (switch��)
SELECT ename, dno, DECODE(dno, 10,'ACCOUNTING',
                               20,'RESEARCH',
                               30,'SALES',
                               40,'OPERATIONS',
                               'DEFAULT') AS DNAME FROM employee ORDER BY dno;

--CASE �Լ� (if else)
SELECT ename, dno, CASE WHEN dno=10 THEN 'ACCOUNTING'
                        WHEN dno=20 THEN 'RESERARCH'
                        WHEN dno=30 THEN 'SALES'
                        WHEN dno=40 THEN 'OPERATIONS'
                        ELSE 'DEFAULT'
                   END AS DNAME FROM employee order by dno;

--ȥ���غ���
--6��
SELECT eno,ename, NVL(manager,0) FROM employee;

--7��
SELECT eno, ename, job, salary, DECODE(job, 'ANAIYST',salary+200, 'SALESMAN',salary+180, 'MANAGER',salary+150, 'CLERK',salary+100, salary ) as UPDATE_SALARY FROM employee;

--05��
--�׷��Լ� 5�� sum avg max min count
SELECT sum(salary) as "�޿��Ѿ�",
        avg(salary) as "�޿����",
        max(salary) as "�ִ�޿�",
        min(salary) as "�ּұ޿�"
from employee;

SELECT max(hiredate), min(hiredate) from employee;

--1.1 �׷��Լ��� null��
SELECT sum(commission) as "Ŀ�̼� �Ѿ�" FROM employee;

--1.2 �ο� ������ ���ϴ� count �Լ�
SELECT count(*) as "����� ��" FROM employee;
SELECT count(commission) as "Ŀ�̼� �޴� ����� ��" from employee;
SELECT count(distinct job) as "���� ������ ����" from employee;

SELECT ename, max(salary) from employee; --���� ename�� �׷��Լ��� ������ �ٸ��Ƿ�

--02 �����ͱ׷�(GROUP BY)

SELECT dno as "�μ���ȣ",avg(salary) as "�޿� ���" from employee group by dno;
SELECT avg(salary) as "�޿� ���" from employee group by dno; --���� ���ĵǾ����� �ȳ��ͼ� ���ǹ���
SELECT dno, ename, avg(salary) from employee group by dno; --���� ������ ��ºҰ�
SELECT dno,job,count(*), sum(salary) from employee group by dno,job order by dno,job;

--03 ������ �׷� ���� (HAVING��)

--�μ��� �޿� �Ѿ��� 3000 �̻��� �μ��� ��ȣ�� �μ��� �޿� �Ѿ� ���ϱ�
SELECT DNO, MAX(SALARY) FROM EMPLOYEE GROUP BY DNO HAVING MAX(SALARY) >= 3000;

--MANAGER�� �����ϰ� �޿� �Ѿ��� 5000 �̻��� ���޺� �޿� �Ѿ� ���ϱ�
SELECT JOB, COUNT(*), SUM(SALARY) FROM employee
WHERE JOB NOT LIKE '%MANAGER%q'
GROUP BY JOB
HAVING SUM(SALARY) >= 5000
ORDER BY SUM(SALARY);

--�ְ� �޿� ����ϱ�
SELECT MAX(AVG(SALARY)) FROM EMPLOYEE GROUP BY DNO;

--ȥ���غ���
--01
SELECT max(salary) Maximum, min(salary) Minimum, sum(salary) Sum, round(avg(salary)) Average FROM employee;
--02
SELECT job, max(salary) Maximum, min(salary) Minimum, sum(salary) Sum, round(avg(salary)) Average FROM employee Group BY job;
--03
SELECT job, count(*) from employee group by job;
--04
SELECT COUNT(MANAGER) from employee; 
--05
SELECT MAX(salary)-MIN(salary) as DIFFERENCE from employee;
--06
SELECT * from employee;
SELECT job, MIN(salary) from employee group by job having not MIN(salary)<2000 order by MIN(salary) DESC;
--07
SELECT dno, count(*) as "Number of Pepople", round(avg(salary),2) as "Salary" from employee group by dno order by dno;
--08
SELECT CASE WHEN dno=30 THEN 'SALES'
            WHEN dno=20 THEN 'RESEARCH'
            WHEN dno=10 THEN 'ACCOUNTING'
            END as dname
,CASE WHEN dno=30 THEN 'CHICAGO'
      WHEN dno=20 THEN 'DALLAS'
      WHEN dno=10 THEN 'NEW YORK'
      END as Location
, count(*) as "Number of People", round(avg(salary)) as "Salary" from employee group by dno;

--09
SELECT job, dno, decode(dno, 10, sum(salary)) as "�μ� 10",
                 decode(dno, 20, sum(salary)) as "�μ� 20",
                 decode(dno, 30, sum(salary)) as "�μ� 30",
sum(salary) as "�Ѿ�"
from employee group by job, dno order by dno;