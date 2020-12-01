SELECT ename, dno FROM employee WHERE dno = (SELECT dno FROM employee WHERE ename = 'SCOTT');

SELECT ename, job, salary FROM employee WHERE salary = (SELECT min(salary) FROM employee);

SELECT dno, min(salary) FROM employee GROUP BY DNO HAVING MIN(salary) > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE dno=30);

SELECT ename FROM employee WHERE salary > (SELECT salary FROM employee WHERE eno = 7499);

--���� �� �������� IN ����ϱ�
SELECT eno, ename FROM employee WHERE salary in (SELECT min(salary) FROM employee GROUP BY DNO); --�̰� �ǵ��ʹ� �ٸ��� �Ǿ���(�μ����� �ּҰ��� ���ϱ�������
        --�տ� ������ �׳� salary��
SELECT eno, ename FROM employee WHERE (dno, salary) in (SELECT dno, min(salary) FROM employee GROUP BY DNO);
        --���� �̷��� �ۼ��ؾ� ��


--ȥ���غ���

--01 �����ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ��(����̸��� ������)�Ͻÿ�
SELECT ename, job FROM employee WHERE job = (SELECT job FROM employee WHERE eno = 7788);

--02 �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��(����̸��� ������)�Ͻÿ�.
SELECT ename, job FROM employee WHERE salary > (SELECT salary FROM employee WHERE eno = 7499);

--03 �ּұ޿��� �޴� ����� �̸�, ��� ���� �� �޿��� ǥ���Ͻÿ�(�׷��Լ� ���)
SELECT ename, job, salary FROM employee WHERE salary = (SELECT MIN(salary) FROM employee);

--04 ��ձ޿��� ���� ���� ����� ��� ������ ã�� ���ް� ��� �޿��� ǥ���Ͻÿ�.
SELECT job, avg(salary) FROM employee GROUP BY job having avg(salary) = (SELECT min(avg(salary)) FROM employee GROUP BY job);

--05 �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
SELECT ename, salary, dno FROM employee WHERE (dno, salary)
in (SELECT dno, min(salary) FROM employee GROUP BY dno);
