
--1. ��ҹ��� �Լ�
SELECT 'Oracle mania', UPPER('Oracle mania'), LOWER('Oracle mania'), initcap('Oracle mania') FROM dual;
SELECT ename, LOWER(ename), JOB, initcap(JOB) FROM employee;
SELECT eno, ename, dno FROM employee WHERE ename ='scott'; --��ҹ��� ���ж����� ��ã��
SELECT eno, ename, dno FROM employee WHERE LOWER(ename) ='scott'; --�ҹ��ڷ� �ҷ��ͼ� ����
SELECT eno, ename, dno FROM employee WHERE initcap(ename) ='Scott'; --ù���ڸ� �빮�ڷ� �ҷ��ͼ� ����

--2. ���� ���̸� ��ȯ�ϴ� �Լ�
SELECT LENGTH('OracleMani'), LENGTH('����Ŭ�ŴϾ�') FROM dual;
SELECT lengthb('OracleMani'), lengthb('����Ŭ�ŴϾ�') FROM dual;

--3. ���� �����Լ�
SELECT 'Oracle', 'mania', CONCAT('Oracle','mania') FROM dual; --concat ���ڿ���
SELECT substr('Oracle mania', 4, 3), substr('Oracle mania', -4, 3) FROM dual;
SELECT * FROM employee WHERE substr(ename, -1, 1)='N';
SELECT * FROM employee WHERE substr(hiredate, 1, 2)='87';
SELECT * FROM employee WHERE substr(to_char(hiredate, 'YYYY-MM-DD'),1,4)='1987';
SELECT instr('Oracle mania','a') FROM dual;
SELECT instr('Oracle mania','a', 5, 2) FROM dual;
SELECT instr('����Ŭ�ŴϾ�','Ŭ'), instrb('����Ŭ�ŴϾ�','Ŭ') FROM dual;
SELECT * FROM employee WHERE instr(ename, 'R', 3, 1)=3;
SELECT lpad(salary,10,'*') FROM employee;
SELECT rpad(salary,10,'*') FROM employee;
SELECT 'Oracle mania', LTRIM(' Oracle mania '), RTRIM(' Oracle mania ') FROM dual;
SELECT 'Oracle mania', TRIM('a' FROM 'Oracle mania') FROM dual;
SELECT TRIM(' Oracle mania ') FROM dual;

--02 ���� �Լ�
SELECT 98.7654, round(98.7654), round(98.7654,2), round(98.7654,-1) FROM dual;
SELECT 98.7654, TRUNC(98.7654), TRUNC(98.7654,2), TRUNC(98.7654,-1) FROM dual;
SELECT MOD (31,2), MOD(31,5), MOD(31,8) FROM dual;
SELECT ename, salary, MOD(salary,500) FROM employee;

--03 ��¥ �Լ�
SELECT sysdate FROM dual;
SELECT sysdate-1 ����, sysdate ����, sysdate+1 ���� FROM dual;
SELECT round(sysdate-hiredate) �ٹ��ϼ� FROM employee;
SELECT hiredate, TRUNC(hiredate,'month') FROM employee;
SELECT ename, sysdate, hiredate, TRUNC(months_between(sysdate,hiredate)) FROM employee;
SELECT ename, hiredate, ADD_MONTHS(HIREDATE,6) from employee;
SELECT sysdate, next_day(sysdate,'�����') from dual;
SELECT ename, hiredate, LAST_DAY(HIREDATE) from employee;

--����ȯ �Լ�
--TO_CHAR
SELECT ename, hiredate, TO_CHAR(HIREDATE, 'YY-MM'), TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') FROM employee;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') from dual;
SELECT ename, TO_CHAR(salary,'L999,999') FROM employee;
--TO_DATE
SELECT ename, hiredate from employee where hiredate=19810220; --����(hiredate�� DATE���̱� ����)
SELECT ename, hiredate from employee where hiredate=TO_DATE(19810220,'YYYYMMDD');
--TO_NUMBER
SELECT '100,000' - '50,000' from dual; --����(�������Ŀ��� ����)
SELECT TO_NUMBER('100,000','999,999') - TO_NUMBER('50,000','999,999') FROM dual;


--ȥ���غ���
--01 SUBSTR�Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����Ͻÿ�.
SELECT SUBSTR(HIREDATE,1,2) �⵵, SUBSTR(HIREDATE,4,2) �� FROM employee;
--02 SUBSTR�Լ��� ����Ͽ� 4���� �Ի��� ����� ����Ͻÿ�.
SELECT * FROM employee where SUBSTR(hiredate,4,2)=04;
--03 MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�
SELECT * FROM employee where MOD(eno,2)=0;
--04 �Ի����� ������ 2�ڸ� (YY), ���� ����(MON)�� ǥ���ϰ� ������ ���(DY)�� �����Ͽ� ����Ͻÿ�
SELECT hiredate, TO_CHAR(hiredate, 'YY/MON/DY') FROM employee;
--05 ���� ��ĥ�� �������� ����Ͻÿ�. ���� ��¥���� ���� 1��1���� �� ����� ����ϰ� TO_DATE�Լ��� ����Ͽ� ���������� ��ġ ��Ű�ÿ�.
SELECT TRUNC (sysdate - TRUNC(sysdate, 'YY')) FROM dual;