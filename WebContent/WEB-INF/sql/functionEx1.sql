SELECT sysdate FROM dual; -- 항상 존재함

SELECT LOWER(ename) AS name FROM employee;
SELECT UPPER(ename) AS name FROM employee;
SELECT INITCAP('oracle mania') AS name FROM dual;

SELECT * FROM employee WHERE LOWER(ename) LIKE '%a%';


SELECT ename, LENGTH(ename) length FROM employee;
SELECT LENGTH('웹프로그래밍') FROM dual;

SELECT ename, LENGTHB(ename) len FROM employee;
SELECT LENGTHB('웹프로그래밍') FROM dual;


SELECT CONCAT(ename, job) FROM employee;
SELECT ename || job FROM employee;
SELECT ename || ',' || job FROM employee;

SELECT ename, SUBSTR(ename, 1, 2) FROM employee;
SELECT ename, SUBSTR(ename, -2, 2) FROM employee;

SELECT ename, INSTR(ename, 'AL') FROM employee;
SELECT ename, INSTR(ename, 'T', 2, 2) FROM employee;
SELECT INSTR('Tiger TEa Tire Ton', 'T', 2, 2) FROM dual;

SELECT ename, LPAD(ename, 10, '#') FROM employee;
SELECT ename, RPAD(ename, 10, '#') FROM employee;

SELECT TRIM('     ABC     ') FROM dual;
SELECT LTRIM('     ABC     ') FROM dual;
SELECT RTRIM('     ABC     ') FROM dual;

