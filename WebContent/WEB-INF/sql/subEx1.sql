SELECT manager FROM employee WHERE eno = 7499;

SELECT ename FROM employee WHERE eno = 7698;

SELECT ename FROM employee WHERE eno = (SELECT manager FROM employee WHERE eno = 7499);

-- ���� �� ���� ����
/*
IN          ���� �ϳ��� ������
ANY(SOME)   �ϳ� �̻��� �����ϸ�
ALL         ��� �����ϸ�
*/

SELECT ename, dno FROM employee WHERE dno IN (SELECT dno FROM department WHERE dno <= 20);