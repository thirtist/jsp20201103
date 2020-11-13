
--1. 대소문자 함수
SELECT 'Oracle mania', UPPER('Oracle mania'), LOWER('Oracle mania'), initcap('Oracle mania') FROM dual;
SELECT ename, LOWER(ename), JOB, initcap(JOB) FROM employee;
SELECT eno, ename, dno FROM employee WHERE ename ='scott'; --대소문자 구분때문에 못찾음
SELECT eno, ename, dno FROM employee WHERE LOWER(ename) ='scott'; --소문자로 불러와서 비교함
SELECT eno, ename, dno FROM employee WHERE initcap(ename) ='Scott'; --첫문자만 대문자로 불러와서 비교함

--2. 문자 길이를 반환하는 함수
SELECT LENGTH('OracleMani'), LENGTH('오라클매니아') FROM dual;
SELECT lengthb('OracleMani'), lengthb('오라클매니아') FROM dual;

--3. 문자 조작함수
SELECT 'Oracle', 'mania', CONCAT('Oracle','mania') FROM dual; --concat 문자연결
SELECT substr('Oracle mania', 4, 3), substr('Oracle mania', -4, 3) FROM dual;
SELECT * FROM employee WHERE substr(ename, -1, 1)='N';
SELECT * FROM employee WHERE substr(hiredate, 1, 2)='87';
SELECT * FROM employee WHERE substr(to_char(hiredate, 'YYYY-MM-DD'),1,4)='1987';
SELECT instr('Oracle mania','a') FROM dual;
SELECT instr('Oracle mania','a', 5, 2) FROM dual;
SELECT instr('오라클매니아','클'), instrb('오라클매니아','클') FROM dual;
SELECT * FROM employee WHERE instr(ename, 'R', 3, 1)=3;
SELECT lpad(salary,10,'*') FROM employee;
SELECT rpad(salary,10,'*') FROM employee;
SELECT 'Oracle mania', LTRIM(' Oracle mania '), RTRIM(' Oracle mania ') FROM dual;
SELECT 'Oracle mania', TRIM('a' FROM 'Oracle mania') FROM dual;
SELECT TRIM(' Oracle mania ') FROM dual;

--02 숫자 함수
SELECT 98.7654, round(98.7654), round(98.7654,2), round(98.7654,-1) FROM dual;
SELECT 98.7654, TRUNC(98.7654), TRUNC(98.7654,2), TRUNC(98.7654,-1) FROM dual;
SELECT MOD (31,2), MOD(31,5), MOD(31,8) FROM dual;
SELECT ename, salary, MOD(salary,500) FROM employee;

--03 날짜 함수
SELECT sysdate FROM dual;
SELECT sysdate-1 어제, sysdate 오늘, sysdate+1 내일 FROM dual;
SELECT round(sysdate-hiredate) 근무일수 FROM employee;
SELECT hiredate, TRUNC(hiredate,'month') FROM employee;
SELECT ename, sysdate, hiredate, TRUNC(months_between(sysdate,hiredate)) FROM employee;
SELECT ename, hiredate, ADD_MONTHS(HIREDATE,6) from employee;
SELECT sysdate, next_day(sysdate,'토요일') from dual;
SELECT ename, hiredate, LAST_DAY(HIREDATE) from employee;

--형변환 함수
--TO_CHAR
SELECT ename, hiredate, TO_CHAR(HIREDATE, 'YY-MM'), TO_CHAR(HIREDATE, 'YYYY/MM/DD DAY') FROM employee;
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS') from dual;
SELECT ename, TO_CHAR(salary,'L999,999') FROM employee;
--TO_DATE
SELECT ename, hiredate from employee where hiredate=19810220; --에러(hiredate는 DATE형이기 때문)
SELECT ename, hiredate from employee where hiredate=TO_DATE(19810220,'YYYYMMDD');
--TO_NUMBER
SELECT '100,000' - '50,000' from dual; --에러(문자형식에서 연산)
SELECT TO_NUMBER('100,000','999,999') - TO_NUMBER('50,000','999,999') FROM dual;


--혼자해보기
--01 SUBSTR함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
SELECT SUBSTR(HIREDATE,1,2) 년도, SUBSTR(HIREDATE,4,2) 달 FROM employee;
--02 SUBSTR함수를 사용하여 4월에 입사한 사원을 출력하시오.
SELECT * FROM employee where SUBSTR(hiredate,4,2)=04;
--03 MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오
SELECT * FROM employee where MOD(eno,2)=0;
--04 입사일을 연도는 2자리 (YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 지정하여 출력하시오
SELECT hiredate, TO_CHAR(hiredate, 'YY/MON/DY') FROM employee;
--05 올해 며칠이 지났는지 출력하시오. 현재 날짜에서 올해 1월1일을 뺀 결과를 출력하고 TO_DATE함수를 사용하여 데이터형을 일치 시키시오.
SELECT TRUNC (sysdate - TRUNC(sysdate, 'YY')) FROM dual;