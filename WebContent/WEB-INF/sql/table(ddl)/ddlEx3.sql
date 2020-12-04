-- TABLE 이름 변경
-- RENAME
RENAME dept20 TO emp20;
DESC dept20;
DESC emp20;
SELECT * FROM emp20;

-- TABLE 제거
-- DROP TABLE
-- 책(215쪽)
DROP TABLE emp20;
DESC emp20;

-- 테이블의 데이터만 삭제

--TRUNCATE TABLE
--책 (216쪽)
SELECT * FROM dept_second;
TRUNCATE TABLE dept_second;

--혼자해보기 1~7
--1
DROP TABLE dept;
CREATE TABLE dept (
    dno number(2), dname varchar2(14), loc varchar2(13)
);
DESC dept;

--2
CREATE TABLE emp (
    eno NUMBER(4),
    ename VARCHAR2(10),
    dno NUMBER(2)
);
DESC emp;

--3
ALTER TABLE emp MODIFY(ename varchar2(25));
DESC emp;

--4
CREATE TABLE employee2(emp_id, name, sal, dept_id) AS SELECT  eno, ename, salary, dno FROM employee;
DESC employee2;

--5
DROP TABLE emp;

--6
RENAME employee2 to emp;

--7
SELECT * FROM DEPT;
ALTER TABLE dept DROP COLUMN dname;