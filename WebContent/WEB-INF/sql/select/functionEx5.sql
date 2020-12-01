SELECT * FROM employee;

SELECT ename, salary, commission, salary + commission as sum from employee;

--NVL(1,2) 1�� null�� ��� �ڸ� ��ȯ
SELECT ename, commission, NVL(commission, 0) FROM employee;

--NVL2 (1,2,3) 1�� null�ϰ�� 3�� ��ȯ �ƴ� ��� 2�� ��ȯ 
SELECT ename, commission, NVL2(commission, ename, 0) FROM employee;

--NULLIF(1,2) 1,2�� ���Ͽ� ������ ��쿡�� NULL�� ��ȯ �ƴҰ�� 1�� �״�� ��ȯ) 
SELECT nullif('a','a') from dual;
SELECT nullif('a','b') from dual;

--COALESCE (1,2,3,4) 1���� �˻��Ͽ� null�� �ƴ� ���� ó�� �߰����� �� �� ���� ��ȯ
SELECT COALESCE('a', 'b', null, 'c') from dual;
SELECT COALESCE(null, 'b', null, 'c') from dual;
SELECT COALESCE(null, null, 'd', 'c') from dual;

--DECODE(1, 2,3, 4,5, 6) 1�� �˻��Ͽ� 2�̸�3�� 4��5�� �Ѵ� �ƴϸ� 6�� ��ȯ(CASE�� ����)
SELECT ename, dno, DECODE(dno, 10, 'ACC', 20, 'RES', 'DEF') FROM employee;

--CASE-WHEN-THEN-    if (+else if)
--     ELSE          else �� ����� ����
--     END
SELECT ename, salary, CASE WHEN salary >= 3000 THEN 'HIGH'
                           WHEN salary >= 0 THEN 'LOW'
                           ELSE '0'
                      END
FROM employee;