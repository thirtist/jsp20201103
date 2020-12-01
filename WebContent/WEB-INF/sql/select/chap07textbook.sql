SELECT ename, dno FROM employee WHERE dno = (SELECT dno FROM employee WHERE ename = 'SCOTT');

SELECT ename, job, salary FROM employee WHERE salary = (SELECT min(salary) FROM employee);

SELECT dno, min(salary) FROM employee GROUP BY DNO HAVING MIN(salary) > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE dno=30);

SELECT ename FROM employee WHERE salary > (SELECT salary FROM employee WHERE eno = 7499);

--다중 행 연산자인 IN 사용하기
SELECT eno, ename FROM employee WHERE salary in (SELECT min(salary) FROM employee GROUP BY DNO); --이거 의도와는 다르게 되었음(부서별로 최소값은 구하긴했지만
        --앞에 적용이 그냥 salary임
SELECT eno, ename FROM employee WHERE (dno, salary) in (SELECT dno, min(salary) FROM employee GROUP BY DNO);
        --따라서 이렇게 작성해야 함


--혼자해보기

--01 사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원이름과 담당업무)하시오
SELECT ename, job FROM employee WHERE job = (SELECT job FROM employee WHERE eno = 7788);

--02 사원번호가 7499인 사원보다 급여가 많은 사원을 표시(사원이름과 담당업무)하시오.
SELECT ename, job FROM employee WHERE salary > (SELECT salary FROM employee WHERE eno = 7499);

--03 최소급여를 받는 사원의 이름, 담당 업무 및 급여를 표시하시오(그룹함수 사용)
SELECT ename, job, salary FROM employee WHERE salary = (SELECT MIN(salary) FROM employee);

--04 평균급여가 가장 적은 사원의 담당 업무를 찾아 직급과 평균 급여를 표시하시오.
SELECT job, avg(salary) FROM employee GROUP BY job having avg(salary) = (SELECT min(avg(salary)) FROM employee GROUP BY job);

--05 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
SELECT ename, salary, dno FROM employee WHERE (dno, salary)
in (SELECT dno, min(salary) FROM employee GROUP BY dno);
