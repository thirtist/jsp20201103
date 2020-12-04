CREATE TABLE post
(
title VARCHAR2(255),
body VARCHAR2(255)
);
INSERT INTO post (title, body)
VALUES ('abc', 'def');
INSERT INTO post (title, body)
VALUES ('abc', 'def');
SELECT * FROM post;
DELETE post WHERE title='abc';

ALTER TABLE POST ADD id NUMBER PRIMARY KEY;

SELECT * FROM post;
INSERT INTO post (id, title, body)
VALUES (1,'abc','def');
INSERT INTO post (id, title, body)
VALUES (2,'abc','def');

DELETE post WHERE id=1;

COMMIT;

--
SELECT max(id) FROM post; -- 내가

SELECT max(id) FROM post; -- 다른

INSERT INTO post (id, title, body) VALUES (, 'abc','def'); 

--시퀀스 = 순서대로 증가하는 값을 만드는것

-- SEQUENCE
CREATE SEQUENCE my_seq;  --1부터 1씩 증가

DELETE post;

commit;

INSERT INTO post (id,title,body)
VALUES(my_seq.nextval, 'abc','def');
SELECT * FROM post;
INSERT INTO post (id,title,body)
VALUES(my_seq.nextval, 'abc','def');

--
CREATE SEQUENCE my_seq2 START WITH 100;
CREATE SEQUENCE my_seq3 START WITH 1000 INCREMENT BY 100;


--혼자해보기 1,2번
--1
CREATE SEQUENCE emp_seq START WITH 1 INCREMENT BY 1 MAXVALUE 100000;
SELECT * FROM user_sequences;

--2
SELECT * FROM emp01;

DROP table emp01;
CREATE TABLE emp01
(
    empno number(4) primary key,
    ename VARCHAR2(10),
    hiredate DATE
);

INSERT INTO emp01 VALUES (emp_seq.nextval, 'JULIA', TO_DATE('2011-05-10','YYYY-MM-DD'));

SELECT * FROM user_sequences;
SELECT my_seq.currval FROM dual;

-- 시퀀스 삭제
DROP SEQUENCE my_seq;
DROP SEQUENCE my_seq2;

-- 시퀀스 수정
ALTER SEQUENCE my_seq3
INCREMENT BY 1000;
SELECT my_seq3.currval FROM dual;
SELECT my_seq3.nextval FROM dual;

--오라클 12.c부터 가능한 자동 증가 컬럼
CREATE TABLE t1 (id NUMBER GENERATED ALWAYS as IDENTITY(START WITH 1 INCREMENT by 1),
name VARCHAR2(30)
);

INSERT INTO t1 (name) VALUES ('jane');
INSERT INTO t1 (name) VALUES ('Donald');
SELECT * FROM t1;