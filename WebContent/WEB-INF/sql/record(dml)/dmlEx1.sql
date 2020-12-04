--09장 데이터 조작과 트랜잭션
-- 데이터 (record, row) 추가
-- INSERTn INTO tname (col1, col2) VALUES (val1, val2);
-- 책 (227쪽)
CREATE TABLE dept_copy
AS
SELECT * FROM department WHERE 0=1;
DESC dept_copy;
INSERT INTO dept_copy -- (dno, dname, loc)
VALUES (10, 'ACCOUNTING', 'NEW YORK');

INSERT INTO dept_copy (dno, dname, loc)
VALUES (20, 'DALLAS', 'RESEARCH');

SELECT * FROM dept_copy;

COMMIT;

-- NULL
-- 값을 안넣는 경우
DESC dept_copy;
INSERT INTO dept_copy (dno, dname)
VALUES (30, 'SALES');
SELECT * FROM dept_copy;

INSERT INTO dept_copy -- (dno, dname, loc)
VALUES (40, 'operations', null);

COMMIT;

--Oracle : NULL '' -> 같은 취급
--책 229쪽
DESC dept_copy;
INSERT INTO dept_copy
VALUES (50, 'COMPUTING', '');
SELECT * FROM dept_copy;