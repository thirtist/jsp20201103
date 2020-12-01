/*
 1. �����ȣ�� 7788�� �����
 ��� ������ ���� ����� ǥ�� (����̸��� ��� ����)�Ͻÿ�.
 */
SELECT
    ename,
    job
FROM
    employee
WHERE
    job = (
        SELECT
            job
        FROM
            employee
        WHERE
            eno = 7788
    );
    
    
    
/*
2. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ��
(����̸��� ������)�Ͻÿ�.
*/
SELECT
    ename,
    job
FROM
    employee
WHERE
    salary > (
        SELECT
            salary
        FROM
            employee
        WHERE
            eno = 7499
    );

/*
3.�ּұ޿��� �޴� ����� �̸�, ��� ������ �޿���
ǥ���Ͻÿ�(�׷��Լ� ���).
*/
SELECT
    ename,
    job,
    salary
FROM
    employee
WHERE
    salary = (
        SELECT
            MIN(salary)
        FROM
            employee
    );
    
    
/*
4.��� �޿��� ���� ���� ����� ��� ������ ã�� 
���ް� ��� �޿��� ǥ���Ͻÿ�
*/
SELECT
    job,
    round(AVG(salary), 1)
FROM
    employee
GROUP BY
    job
HAVING
    round(AVG(salary), 1) = (
        SELECT
            MIN(round(AVG(salary), 1))
        FROM
            employee
        GROUP BY
            job
    );
    
    
    
/*

5.�� �μ��� �ּ� �޿��� �޴� �����
�̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�
*/

SELECT
    ename,
    salary,
    dno
FROM
    employee
WHERE
    salary IN (
        SELECT
            MIN(salary)
        FROM
            employee
        GROUP BY
            dno
    );

/*

6. �������� �м���(analyst)�� �������
�޿��� �����鼭 ������
�м���(analyst)�� �ƴ� �������
ǥ��(�����ȣ, �̸�, ����, �޿�)�Ͻÿ�
*/
SELECT
    eno,
    ename,
    job,
    salary
FROM
    employee
WHERE
    salary < ANY (
        SELECT
            salary
        FROM
            employee
        WHERE
            job = 'ANALYST'
    )
    AND job <> 'ANALYST';
    
/*
7. ���������� ���� ����� �̸��� ǥ���Ͻÿ�.
*/
SELECT
    ename
FROM
    employee
WHERE
    eno IN (
        SELECT
            eno
        FROM
            employee
        WHERE
            manager IS NULL
    );
    
    
/*
8.���������� �ִ� ����� �̸��� ǥ���Ͻÿ�
*/
SELECT
    ename
FROM
    employee
WHERE
    eno IN (
        SELECT
            eno
        FROM
            employee
        WHERE
            manager IS NOT NULL
    );
    
/*
9. BLAKE�� ������ �μ��� ���� ����� �̸���
�Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
(�� BLAKE�� ����)
*/
SELECT
    ename,
    hiredate
FROM
    employee
WHERE
        dno = (
            SELECT
                dno
            FROM
                employee
            WHERE
                ename = 'BLAKE'
        )
    AND ename <> 'BLAKE';
    
    
/*
10. �޿��� ��� �޿� ���� ���� ������� �����ȣ��
�̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ���������ɷ�
�����Ͻÿ�.
*/

SELECT
    eno,
    ename
FROM
    employee
WHERE
    salary > (
        SELECT
            AVG(salary)
        FROM
            employee
    )
ORDER BY
    salary ASC;
    
/*
11. �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� �����
�����ȣ�� �̸��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�
*/

SELECT
    eno,
    ename
FROM
    employee
WHERE
    dno IN (
        SELECT
            dno
        FROM
            employee
        WHERE
            ename LIKE '%K%'
    );
    
/*
12.�μ� ��ġ�� DALLAS�� ����� �̸���
�μ���ȣ �� �������� ǥ���Ͻÿ�.
*/
SELECT
    ename,
    dno,
    job
FROM
    employee
WHERE
    dno = (
        SELECT
            dno
        FROM
            department
        WHERE
            loc = 'DALLAS'
    );

/*
13. KING���� �����ϴ� �����
�̸��� �޿��� ǥ���Ͻÿ�.
*/
SELECT
    ename,
    salary
FROM
    employee
WHERE
    manager = (
        SELECT
            eno
        FROM
            employee
        WHERE
            ename = 'KING'
    );

/*
14. RESEARCH �μ��� ����� ���� �μ���ȣ,
����̸� �� ������ ǥ���Ͻÿ�.
*/
SELECT
    dno,
    ename,
    job
FROM
    employee
WHERE
    dno = (
        SELECT
            dno
        FROM
            department
        WHERE
            dname = 'RESEARCH'
    );

/*
15. ��� �޿����� ���� �޿��� �ް� �̸��� M�� ���Ե�
����� ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�,
�޿��� ǥ���Ͻÿ�.
*/
SELECT
    eno,
    ename,
    salary
FROM
    employee
WHERE
        salary > (
            SELECT
                AVG(salary)
            FROM
                employee
        )
    AND dno IN (
        SELECT
            dno
        FROM
            employee
        WHERE
            ename LIKE '%M%'
    );
/*
16.��� �޿��� ���� ���� ������ ã���ÿ�
*/
SELECT
    job,
    AVG(salary)
FROM
    employee
GROUP BY
    job
HAVING
    AVG(salary) = (
        SELECT
            MIN(AVG(salary))
        FROM
            employee
        GROUP BY
            job
    );

/*
17. �������� MANAGER�� ����� �Ҽӵ� �μ��� ������ 
�μ��� ����� ǥ���Ͻÿ�.
*/
SELECT
    ename
FROM
    employee
WHERE
    eno IN (
        SELECT
            manager
        FROM
            employee
    );