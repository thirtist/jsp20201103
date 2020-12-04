-- 테이블 변경
-- ALTER TABLE
-- 컬럼 추가, 컬럼 변경, 컬럼 삭제

--컬럼 추가
--ALTER TABLE table_name ADD (new_col DATATYPE,,,);

--책 예제 (210쪽)
DESC dept20;
ALTER TABLE dept20
ADD (birth date);

--컬럼 변경
--ALTER TALBE tname MODIFY (colName type,콤마로구분);
--책 예제 (211)
ALTER TABLE dept20
MODIFY (ename VARCHAR2(5));
--INSERT INTO dept20
--(ename) VALUES ('abcdefghij');
--commit;
select * FROM dept20;
DESC dept20;


-- 컬럼 삭제
-- ALTER TABLE tname DROP COLUMN col_name;
ALTER TABLE dept20
DROP COLUMN ename;
DESC dept20;