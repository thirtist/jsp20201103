-- 제약사항 Constraint
-- not null : 컬럼의 값이 null은 안됨
-- unique : 유일한 값만 저장
-- check : 지정된 값(범위)만 가능
-- foreign key(외래키, 참조키)
--   : 다른 table에 있는 값만 가능
-- primary key (주요키, 주키, 키)
--   : not null + unique


--not null
CREATE TABLE const01 (
    name VARCHAR2(30) NOT NULL,
    age NUMBER 
);
INSERT INTO const01
VALUES ('abc', 30);
INSERT INTO const01
VALUES (NULL, 40); -- NOT NULL때문에 안들어가짐
INSERT INTO const01
VALUES ('a', NULL);
INSERT INTO const01 (age)
VALUES (50); -- NAME 컬럼에 넣지 않았으니 NULL이 들어가야하는데 NOT NULL로 정의했기 때문에 안들어가짐
INSERT INTO const01 (name, age)
VALUES ('',30); --''는 NULL 취급이므로 안들어가짐 (스페이스하나라도 넣어야됨)

--예제 250페이지
CREATE TABLE customer(
    id varchar(20) not null,
    pwd varchar(20) not null,
    name varchar(20) not null,
    phone varchar(30),
    address varchar(100));

DESC customer;

-- UNIQUE
CREATE TABLE const02
(
    email VARCHAR2(30) UNIQUE,
    name VARCHAR2(30)
);

INSERT INTO const02 (email, name)
VALUES ('a', 'b');
INSERT INTO const02 (email, name)
VALUES ('a', 'c'); --x
INSERT INTO const02 (email, name)
VALUES ('c', 'b');
INSERT INTO const02 (name)
VALUES ('c');
SELECT * FROM const02;

--251페이지 예제
DROP TABLE customer;
CREATE TABLE customer(
    id varchar(20) unique,
    pwd varchar(20) not null,
    name varchar(20) not null,
    phone varchar(30),
    address varchar(100)
);

--CHECK
CREATE TABLE const03
(
name VARCHAR2(30),
age NUMBER CHECK (age>0)
);
INSERT INTO const03 (name, age)
VALUES ('a',30);
INSERT INTO const03 (name, age)
VALUES ('b',0); --x
INSERT INTO const03 (name)
VALUES ('c');
SELECT * FROM const03;

SELECT * FROM emp_pcs;

commit;

-- 제약사항 여러개 사용 가능
CREATE TABLE const04(
email VARCHAR2(30) NOT NULL UNIQUE CHECK(email LIKE '%@%'),
name VARCHAR2(30)
);
INSERT INTO const04 (email,name)
VALUES (null, 'a'); --x not null위배
INSERT INTO const04 (email, name)
VALUES ('a', 'b'); --x CHECK(@) 위배
INSERT INTO const04 (email, name)
VALUES ('a@g', 'c');
INSERT INTO const04 (email, name)
VALUES ('a@g', 'd'); --x UNIQUE 위배