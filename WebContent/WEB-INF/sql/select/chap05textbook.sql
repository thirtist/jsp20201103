-- 쟌넨 여기 초반부는 04장 이었읍니다.
-- NVL함수
SELECT ename, salary, commission, NVL(commission, 0),
salary*12 + NVL(commission,0)
from employee order by job;

-- NVL2함수
SELECT ename, salary, commission, NVL2(commission, salary*12+commission, salary*12) FROM employee order by job;

--NULLIF 함수
SELECT NULLIF('A','A'), NULLIF('A','B') from dual;

--COALESCE 함수 (첫번째로 null 아닌것 찾기)
SELECT ename, salary, commission, COALESCE(commission, salary, 0) FROM employee ORDER by job;

--DECODE 함수 (switch문)
SELECT ename, dno, DECODE(dno, 10,'ACCOUNTING',
                               20,'RESEARCH',
                               30,'SALES',
                               40,'OPERATIONS',
                               'DEFAULT') AS DNAME FROM employee ORDER BY dno;

--CASE 함수 (if else)
SELECT ename, dno, CASE WHEN dno=10 THEN 'ACCOUNTING'
                        WHEN dno=20 THEN 'RESERARCH'
                        WHEN dno=30 THEN 'SALES'
                        WHEN dno=40 THEN 'OPERATIONS'
                        ELSE 'DEFAULT'
                   END AS DNAME FROM employee order by dno;

--혼자해보기
--6번
SELECT eno,ename, NVL(manager,0) FROM employee;

--7번
SELECT eno, ename, job, salary, DECODE(job, 'ANAIYST',salary+200, 'SALESMAN',salary+180, 'MANAGER',salary+150, 'CLERK',salary+100, salary ) as UPDATE_SALARY FROM employee;

--05장
--그룹함수 5개 sum avg max min count
SELECT sum(salary) as "급여총액",
        avg(salary) as "급여평균",
        max(salary) as "최대급여",
        min(salary) as "최소급여"
from employee;

SELECT max(hiredate), min(hiredate) from employee;

--1.1 그룹함수와 null값
SELECT sum(commission) as "커미션 총액" FROM employee;

--1.2 로우 개수를 구하는 count 함수
SELECT count(*) as "사원의 수" FROM employee;
SELECT count(commission) as "커미션 받는 사원의 수" from employee;
SELECT count(distinct job) as "직업 종류의 개수" from employee;

SELECT ename, max(salary) from employee; --에러 ename과 그룹함수의 개수가 다르므로

--02 데이터그룹(GROUP BY)

SELECT dno as "부서번호",avg(salary) as "급여 평균" from employee group by dno;
SELECT avg(salary) as "급여 평균" from employee group by dno; --뭐에 정렬되었는지 안나와서 무의미함
SELECT dno, ename, avg(salary) from employee group by dno; --개수 문제로 출력불가
SELECT dno,job,count(*), sum(salary) from employee group by dno,job order by dno,job;

--03 데이터 그룹 제한 (HAVING절)

--부서별 급여 총액이 3000 이상인 부서의 번호와 부서별 급여 총액 구하기
SELECT DNO, MAX(SALARY) FROM EMPLOYEE GROUP BY DNO HAVING MAX(SALARY) >= 3000;

--MANAGER를 제외하고 급여 총액이 5000 이상인 직급별 급여 총액 구하기
SELECT JOB, COUNT(*), SUM(SALARY) FROM employee
WHERE JOB NOT LIKE '%MANAGER%q'
GROUP BY JOB
HAVING SUM(SALARY) >= 5000
ORDER BY SUM(SALARY);

--최고 급여 출력하기
SELECT MAX(AVG(SALARY)) FROM EMPLOYEE GROUP BY DNO;

--혼자해보기
--01
SELECT max(salary) Maximum, min(salary) Minimum, sum(salary) Sum, round(avg(salary)) Average FROM employee;
--02
SELECT job, max(salary) Maximum, min(salary) Minimum, sum(salary) Sum, round(avg(salary)) Average FROM employee Group BY job;
--03
SELECT job, count(*) from employee group by job;
--04
SELECT COUNT(MANAGER) from employee; 
--05
SELECT MAX(salary)-MIN(salary) as DIFFERENCE from employee;
--06
SELECT * from employee;
SELECT job, MIN(salary) from employee group by job having not MIN(salary)<2000 order by MIN(salary) DESC;
--07
SELECT dno, count(*) as "Number of Pepople", round(avg(salary),2) as "Salary" from employee group by dno order by dno;
--08
SELECT CASE WHEN dno=30 THEN 'SALES'
            WHEN dno=20 THEN 'RESEARCH'
            WHEN dno=10 THEN 'ACCOUNTING'
            END as dname
,CASE WHEN dno=30 THEN 'CHICAGO'
      WHEN dno=20 THEN 'DALLAS'
      WHEN dno=10 THEN 'NEW YORK'
      END as Location
, count(*) as "Number of People", round(avg(salary)) as "Salary" from employee group by dno;

--09
SELECT job, dno, decode(dno, 10, sum(salary)) as "부서 10",
                 decode(dno, 20, sum(salary)) as "부서 20",
                 decode(dno, 30, sum(salary)) as "부서 30",
sum(salary) as "총액"
from employee group by job, dno order by dno;