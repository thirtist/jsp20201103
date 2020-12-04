-- KEY
-- : 각 레코드(row)를 유일하게 구분할 수 있는 컬럼(들)

-- PRIMARY KEY
-- 각 레코드를 유일하게 구분하는 컬럼
-- 유의할 점 : 변하지 않는 값을 주로선택해야한다
-- : NOT NULL UNIQUE

CREATE TABLE const05 (
    email VARCHAR(30),
    name VARCHAR(30),
    ssn VARCHAR(30),
    address VARCHAR(30),
    birth DATE
);

SELECT * FROM const05;

CREATE TABLE const06 (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(30)
);

INSERT INTO const06 (id, name) VALUES (1,'a');
INSERT INTO const06 (id, name) VALUES (null,'b'); --x PRIMARY KEY는 NOT NULL포함
INSERT INTO const06 (id, name) VALUES (1,'c'); --x PRIMARY KEY는 UNIQUE포함
INSERT INTO const06 (id, name) VALUES (2,'c');

commit;

--foreign key
CREATE TABLE const07_emp
AS
SELECT * FROM employee;
CREATE TABLE const07_dep
AS
SELECT * FROM department;

SELECT eno, ename, dno FROM const07_emp;
SELECT * FROM const07_dep;
INSERT INTO const07_emp (eno, ename, dno)
VALUES (8787, 'ABC', 50);
commit;

DESC department;
CREATE TABLE const08_dep
(
dno NUMBER(2) PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(12)
);
INSERT INTO const08_dep
SELECT * FROM department;
SELECT * FROM const08_dep;

CREATE TABLE const08_emp (
name VARCHAR2(30),
dno NUMBER(2) REFERENCES const08_dep --여기에 있는 primary key를 참조하여 존재하는 값만 들어갈 수 있음
);
INSERT INTO const08_emp (name, dno)
VALUES ('a', 10);
INSERT INTO const08_emp (name, dno)
VALUES ('b', 50);
INSERT INTO const08_emp (name, dno)
VALUES ('c', null);
commit;
