DROP TABLE emp_copy;

CREATE TABLE emp_copy
AS
SELECT * FROM employee;

SELECT * FROm emp_copy;

SELECT * FROM user_constraints
WHERE table_name='EMPLOYEE';

SELECT * FROM user_constraints
WHERE table_name='EMP_COPY';

ALTER TABLE emp_copy
ADD PRIMARY KEY (eno);

DROP TABLE dept_copy;

CREATE TABLE dept_copy
AS
SELECT * FROM department;

ALTER TABLE dept_copy
ADD CONSTRAINT dept_copy_dno_pk PRIMARY KEY (dno);

ALTER TABLE emp_copy
ADD CONSTRAINT emp_copy_dno_fk FOREIGN KEY(dno) references dept_copy(dno);

--책 (260쪽)
ALTER TABLE emp_copy
modify ename CONSTRAINT emp_copy_ename_nn NOT NULL;

-- 제약사항 삭제
ALTER TABLE emp_copy
DROP CONSTRAINT emp_copy_ename_nn;

SELECT * FROM user_constraints
WHERE table_name = 'EMP_COPY';

ALTER TABLE emp_copy
DROP CONSTRAINT SYS_C007431;

-- dept_copy primary key 제약사항 삭제

SELECT * FROM user_constraints WHERE table_name ='DEPT_COPY';


ALTER TABLE dept_copy
DROP CONSTRAINT DEPT_COPY_DNO_PK;

ALTER TABLE emp_copy
DROP CONSTRAINT EMP_COPY_DNO_FK;

ALTER TABLE dept_copy
DROP PRIMARY KEY CASCADE;

--265페이지 혼자해보기1~4
--1
DROP TABLE emp_sample;
CREATE TABLE emp_sample AS SELECT * FROM employee WHERE 1=0;

ALTER TABLE emp_sample ADD CONSTRAINT my_emp_pk PRIMARY KEY (eno);
SELECT table_name, constraint_name FROM user_constraints WHERE table_name = 'EMP_SAMPLE';

--2
drop table dept_sample;
CREATE TABLE dept_sample AS SELECT * FROM department WHERE 1=0;
ALTER TABLE dept_sample ADD CONSTRAINT my_dept_pk PRIMARY KEY (dno);

--3
ALTER TABLE emp_sample ADD CONSTRAINT my_emp_dept_fk FOREIGN KEY (dno) REFERENCES department(dno);
SELECT table_name, constraint_name FROM user_constraints WHERE table_name = 'EMP_SAMPLE';

--4
ALTER TABLE emp_sample ADD CONSTRAINT emp_commission_min CHECK (commission>0);