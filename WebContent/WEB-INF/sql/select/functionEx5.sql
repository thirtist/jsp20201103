SELECT * FROM employee;

SELECT ename, salary, commission, salary + commission as sum from employee;

--NVL(1,2) 1이 null일 경우 뒤를 반환
SELECT ename, commission, NVL(commission, 0) FROM employee;

--NVL2 (1,2,3) 1이 null일경우 3을 반환 아닐 경우 2를 반환 
SELECT ename, commission, NVL2(commission, ename, 0) FROM employee;

--NULLIF(1,2) 1,2를 비교하여 동일한 경우에는 NULL을 반환 아닐경우 1을 그대로 반환) 
SELECT nullif('a','a') from dual;
SELECT nullif('a','b') from dual;

--COALESCE (1,2,3,4) 1부터 검사하여 null이 아닌 것을 처음 발견했을 때 그 값을 반환
SELECT COALESCE('a', 'b', null, 'c') from dual;
SELECT COALESCE(null, 'b', null, 'c') from dual;
SELECT COALESCE(null, null, 'd', 'c') from dual;

--DECODE(1, 2,3, 4,5, 6) 1을 검사하여 2이면3을 4면5를 둘다 아니면 6을 반환(CASE와 유사)
SELECT ename, dno, DECODE(dno, 10, 'ACC', 20, 'RES', 'DEF') FROM employee;

--CASE-WHEN-THEN-    if (+else if)
--     ELSE          else 와 비슷한 형식
--     END
SELECT ename, salary, CASE WHEN salary >= 3000 THEN 'HIGH'
                           WHEN salary >= 0 THEN 'LOW'
                           ELSE '0'
                      END
FROM employee;