-- UPDATE
-- 데이터를 변경하는 명령문
-- UPDATE tname SET col1=val1, col2=val2,,,, WHERE (WHERE절이 없으면 모든거에 영향을 미침)

SELECT * FROM dept_copy;

--책(232쪽)
UPDATE dept_copy
SET dname='HR';

--책(233쪽)
UPDATE dept_copy
SET dname='PROGRAMMING', loc = 'SEOUL'
WHERE dno=10;
SELECT * FROM dept_copy;
COMMIT;

UPDATE dept_copy
SET loc=(
        SELECT loc FROM dept_copy WHERE dno=20
)
WHERE dno=10;
SELECT * FROM dept_copy;

-- 책 234쪽
UPDATE dept_copy
SET dname=(SELECT dname
            FROM dept_copy
            WHERE dno=30
), loc=(SELECT loc
        FROM dept_copy
        WHERE dno=30)
WHERE dno=10;

COMMIT;

--혼자해보기 4번부터 7번
--4
DROP TABLE emp_copy;
CREATE TABLE emp_copy AS SELECT * FROM employee;
DESC emp_copy;

--5
SELECT * FROM emp_copy;
SELECT * FROM emp_copy WHERE eno=7788;
UPDATE emp_copy SET dno = 10 WHERE eno = 7788;

--6
UPDATE emp_copy SET (job,salary) = (select job, salary FROM emp_copy WHERE eno=7499) WHERE eno=7788;

--7
UPDATE emp_copy SET dno = (SELECT dno FROM emp_copy WHERE eno=7369)
WHERE job = (SELECT job FROM emp_copy WHERE eno=7369);


--DELETE
--DELETE FROM(FROM생략가능) tname WHERE 조건
SELECT * FROM dept_copy;

DELETE dept_copy
WHERE dno=10;

DELETE dept_copy;

--책 236쪽
DROP TABLE emp_copy;
CREATE TABLE emp_copy
AS
SELECT * FROM employee;
SELECT * FROM emp_copy;

DELETE emp_copy
WHERE dno=(SELECT dno
            FROM department
            WHERE dname='SALES');
            
--혼자해보기 8~10
--8
DROP TABLE dept_copy;
CREATE TABLE dept_copy AS SELECT * FROM department;
--9
DELETE dept_copy WHERE dname = 'RESEARCH';
SELECT * FROM dept_copy;
--10
DELETE dept_copy WHERE dno in(10, 40);