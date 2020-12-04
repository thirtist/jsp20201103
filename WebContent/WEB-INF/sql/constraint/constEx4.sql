SELECT * FROM user_constraints;

-- 책 (252쪽)

DROP TABLE customer;
CREATE TABLE customer(
    ID VARCHAR2(20) CONSTRAINT customer_id_uk UNIQUE,
    pwd VARCHAR2(20) CONSTRAINT customer_pwd_nn NOT NULL,
    NAME VARCHAR2(20) CONSTRAINT customer_name_nn NOT NULL,
    phone VARCHAR2(30),
    address VARCHAR2(100)
);

SELECT * FROM user_constraints WHERE constraint_name LIKE 'CUSTOMER%';

--책 (253쪽)

CREATE TABLE customer(
    ID VARCHAR2(20),
    pwd VARCHAR2(20) CONSTRAINT customer_pwd NOT NULL,
    NAME VARCHAR2(20) CONSTRAINT customer_name_nn NOT NULL,
    phone VARCHAR2(30),
    address VARCHAR2(100),
    CONSTRAINT customer_id_pk PRIMARY KEY (ID)
);

--책 (255쪽)
CREATE TABLE emp_second(
    eno NUMBER(4) CONSTRAINT emp_second_eno_pk PRIMARY KEY,
    ename VARCHAR2(10),
    JOB VARCHAR2(9),
    dno NUMBER(2) CONSTRAINT emp_seconde_dno_fk REFERENCES department
);

--책 (256쪽)

DROP TABLE emp_second;
CREATE TABLE emp_second (
    eno NUMBER(4) CONSTRAINT emp_seconde_eno_pk PRIMARY KEY,
    ename VARCHAR2(10),
    salary NUMBER(7,2) CONSTRAINT emp_second_salary_min CHECK (salary>0)
);