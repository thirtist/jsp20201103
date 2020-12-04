--DML (Data Manipulation Language)
--INSERT,UPDATE,DELETE

CREATE TABLE bank(
name VARCHAR2(255),
money NUMBER);

INSERT INTO bank VALUES ('ironman', 500);
INSERT INTO bank VALUES ('captain', 700);

COMMIT;

-- captain -> ironman 200원 이체
-- 모두 실행해야하는 하나의 묶음 -> 트랜잭션
UPDATE bank
SET money = 500
WHERE name='captain';

------문제 발생....

UPDATE bank
SET money = 700
WHERE name = 'ironman';

--중간에 문제가 발생하면 안되기 때문에 ROLLBACK 키워드가존재
ROLLBACK;

SELECT * FROM bank;



CREATE TABLE emp_pcs AS SELECT * FROM employee WHERE 1=0;
SELECT * FROM emp_pcs;
INSERT INTO emp_pcs VALUES (10,'park','student',30, SYSDATE, 30, 30, 90);
INSERT INTO emp_pcs (eno) VALUES (10);
DESC emp_pcs