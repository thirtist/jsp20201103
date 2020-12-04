1-- table 만들기
-- CREATE TABLE

CREATE TABLE table1 (
col1 NUMBER(3,1), -- 수 3의 길이고 소수밑 1
col2 VARCHAR2(6), -- 가변길이 문자열 6bytes까지
col3 CHAR(4),     -- 고정길이 문자열 4bytes까지
col4 DATE);       -- 날짜시간
SELECT * FROM department;
SELECT * FROM table1;
DESC table1;

--DATA TYPE
--수,문자열,날짜시간
--수
--NUMBER
--NUMBER(값)
--   ex)값이 3이면 1000이상 표시 못함
--NUMBER (값1, 값2)
--   ex) 값1은 총길이, 값2는 소수점 밑의 길이

--문자열
--VARCHAR2(값) : 가변길이
--값:byte수
--CHAR(값) : 고정 길이 - 나머지가 스페이스로 채워짐
--값:byte수

--날짜시간
--DATE

-- 책 예제 (207쪽)
CREATE TABLE dept(
    dno number(2),
    dname varchar2(14),
    loc varchar2(13)
);

SELECT * FROM dept;
DESC dept;

--이미 있는 테이블 복사
--1.같은 구조의 table
--2.옛table을 select -> 새table에 insert

CREATE TABLE new_table
AS --AS는 생략이 가능
SELECT * FROM old_table;


--207페이지 아래 예제
CREATE TABLE dept_second
AS
SELECT * FROM department;
DESC dept_second;
DESC department;
SELECT * FROM dept_second;

--책 예제 (208쪽)
CREATE TABLE dept20
AS
SELECT eno, ename, salary*12 annsal
FROM employee
WHERE dno=20;
DESC dept20;
DESC employee;

-- 책 예제 (209쪽)
CREATE TABLE dept_forth
AS
SELECT dno, dname
FROM dept
WHERE 0=1;
SELECT * FROM department;
SELECT * FROM dept_forth;