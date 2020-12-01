SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate,'yyyy') FROM dual;
SELECT TO_CHAR(sysdate,'yy') FROM dual;
SELECT TO_CHAR(sysdate,'mm') FROM dual;
SELECT TO_CHAR(sysdate,'dd') FROM dual;
SELECT TO_CHAR(sysdate,'MON') FROM dual;
SELECT TO_CHAR(sysdate,'YYYY-MM-DD') FROM dual;

SELECT TO_CHAR(sysdate,'HH') FROM dual;
SELECT TO_CHAR(sysdate,'HH24') FROM dual;
SELECT TO_CHAR(sysdate,'MI') FROM dual;
SELECT TO_CHAR(sysdate,'SS') FROM dual;
SELECT TO_CHAR(sysdate,'HH:MI:SS') FROM dual;

SELECT TO_CHAR(sysdate,'YYYY-MM-DD HH:MI:SS') FROM dual;

-- number to char
SELECT TO_CHAR(56789) From dual;
SELECT TO_CHAR(123123, '999,999') From dual;
SELECT TO_CHAR(12312313, '000,000,000') From dual; --다 안채워진거 채워짐
SELECT TO_CHAR(12312313, 'L00,000,000') From dual; --L은 통화기호

-- TO_DATE 함수

SELECT TO_DATE('2020-11-13', 'YYYY-MM-DD') FROM dual;
SELECT TO_DATE('20201113', 'YYYYMMDD') FROM dual;
SELECT TO_DATE('2020/11/13', 'YYYY-MM-DD') FROM dual;
SELECT TO_CHAR(TO_DATE('2020-11-13 01:30:20', 'YYYY-MM-DD HH:MI:SS'), 'YYYY-MM-DD HH:MI:SS') FROM dual;

-- char to number
SELECT TO_NUMBER('200000') FROM dual;
SELECT TO_NUMBER('200,000', '999,999') FROM dual;