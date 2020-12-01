SELECT sysdate FROM dual;
SELECT sysdate +1 FROM dual;
SELECT sysdate -1 FROM dual;

SELECT ename, hiredate, sysdate - hiredate FROM employee;
SELECT ename, hiredate, ROUND(sysdate - hiredate) FROM employee;

SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'YEAR') FROM dual;
SELECT ROUND(sysdate, 'MONTH') FROM dual;

SELECT TRUNC(sysdate, 'YEAR') FROM dual;
SELECT TRUNC(sysdate, 'MONTH') FROM dual;

select months_between(sysdate,hiredate) from employee;

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2019-10-13','yyyy-mm-dd')) from dual;

SELECT ADD_MONTHS(sysdate, 12) FROM dual;
SELECT ADD_MONTHS(sysdate, 6) FROM dual;
SELECT ADD_MONTHS(sysdate, -12) FROM dual;

SELECT sysdate, next_day(sysdate,'토요일') from dual;
SELECT sysdate, next_day(sysdate,'금요일') from dual;
SELECT sysdate, next_day(sysdate,6) from dual;

select * from employee;

SELECT LAST_DAY(sysdate) FROM dual;
SELECT LAST_DAY(ADD_MONTHS(sysdate, -9)) from dual;

