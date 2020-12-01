SELECT * FROM employee WHERE salary >= 1500; --�޿��� 1500�̻��� ��� ����ϱ�
SELECT * FROM employee WHERE dno=10; --�μ���ȣ�� 10�� ��� ���
SELECT * FROM employee WHERE ename=scott; --SCOTT�� Į������ �����ϰ� ������ �߻�
SELECT * FROM employee WHERE ename='SCOTT';--�̸��� SCOTT��� ���
SELECT * FROM employee WHERE hiredate <= '1981/01/01'; --�Ի����� �װ� ������ ��� ���

--�������ڸ� Ȱ���Ͽ� ������ ������ �α�
SELECT * FROM employee WHERE dno=10 AND JOB='MANAGER';
SELECT * FROM employee WHERE dno=10 OR JOB='MANAGER';
SELECT * FROM employee WHERE NOT dno=10;
SELECT * FROM employee WHERE salary>=1000 AND salary<=1500;
SELECT * FROM employee WHERE salary<1000 OR salary>1500;
SELECT * FROM employee WHERE commission=300 OR commission=500 OR commission=1400;

--BETWEEN ������
SELECT * FROM employee WHERE salary BETWEEN 1000 AND 1500;
SELECT * FROM employee WHERE salary >= 1000 AND salary <=1500; --���� ���� ��
SELECT * FROM employee WHERE salary NOT BETWEEN 1000 AND 1500;
SELECT * FROM employee WHERE salary <= 1000 AND salary >=1500;
SELECT * FROM employee WHERE hiredate BETWEEN '1981/01/01' AND '1981/12/31';

--IN ������
SELECT * FROM employee WHERE commission IN(300,500,1400);
SELECT * FROM employee WHERE commission=300 OR commission=500 OR commission=1400;
SELECT * FROM employee WHERE commission<>300 OR commission<>500 OR commission<>1400;
SELECT * FROM employee WHERE commission NOT IN(300,500,1400);

--���ϵ�ī��(%)(_)
SELECT * FROM employee WHERE ename LIKE 'F%';
SELECT * FROM employee WHERE ename = 'F%'; --���� (���ϵ�ī��� LIKE�� ���� �Ƚ���)
SELECT * FROM employee WHERE ename LIKE '%M%';
SELECT * FROM employee WHERE ename LIKE '%N';
SELECT * FROM employee WHERE ename LIKE '_A%';
SELECT * FROM employee WHERE ename LIKE '__A%'; -- __�̰Ŵ� �ڸ����� �������� �˻�
SELECT * FROM employee WHERE ename NOT LIKE '%A%';

--NULL�� ���� ������(IS)
SELECT * FROM employee WHERE commission = NULL; --(x)
SELECT * FROM employee WHERE commission IS NULL; --(o)
SELECT * FROM employee WHERE commission IS NOT NULL; --(o) not ��ġ�� �̰Ÿ� �ٸ�(be����)

--������ ���� ORDER BY��
SELECT * FROM employee ORDER BY salary ASC;
SELECT * FROM employee ORDER BY salary;
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY ename;
SELECT * FROM employee ORDER BY hiredate DESC;
SELECT * FROM employee ORDER BY salary DESC, ename ASC;




--ȥ���غ���
--01
SELECT ename, salary, salary+300 FROM employee;

--02
SELECT ename, salary, salary*12+100 FROM employee
ORDER BY salary*12+100 DESC;  --order by�� ���� desc

--03
SELECT ename, salary FROM employee WHERE salary > 2000 
ORDER BY salary DESC;

--04
SELECT ename, dno FROM employee WHERE eno=7788;

--05
SELECT ename, salary FROM employee WHERE salary NOT BETWEEN 2000 AND 3000;

SELECT * FROM employee;

--06
SELECT ename, JOB, hiredate FROM employee WHERE hiredate BETWEEN '1981/02/20' AND '1981/05/01';

--07
SELECT ename, dno FROM employee WHERE dno IN(20,30)
ORDER BY ename;

--08
SELECT ename, salary, dno
FROM employee
WHERE salary
BETWEEN 2000 AND 3000
AND dno IN(20,30)
ORDER BY ename;

--09
SELECT ename, hiredate FROM employee WHERE hiredate LIKE '81%';

--10
SELECT ename, JOB FROM employee WHERE MANAGER IS NULL;

--11
SELECT ename, salary, commission FROM employee WHERE commission IS NOT NULL ORDER BY salary, commission;

--12
SELECT ename FROM employee WHERE ename LIKE '__R%';

--13
SELECT ename FROM employee WHERE ename LIKE '%A%' AND ename LIKE '%E%';

--14
SELECT ename, job, salary FROM employee where job IN('CLERK','SALESMAN') and salary not in(1600,950,1300);

--15
SELECT ename, salary, commission FROM employee where commission >= 500;